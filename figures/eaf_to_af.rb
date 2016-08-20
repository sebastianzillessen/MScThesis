def to_dung_framework(subset, x, fw)
 raise ArgumentError, "#{subset.map(&:to_s).join(",")} is not a subset of #{fw.arguments.map(&:to_s).join(",")}" unless subset.subseteq?(fw.arguments)
 attacks = fw.attacks.reject { |a| !a.succeeds_wrt(subset, fw) }
 attacks_on_attacks = fw.attacks_on_attacks.clone
 colors = {}
 attacks.select { |a| a.target == x }.each { |a| colors[a] = BLUE }
 change_in_attack_color = false
 begin
   change_in_attack_color = false
   # lines 5-7 in original code
   fw.arguments.select { |y|
     fw.attacks(y).select { |e| e.target == x && e.succeeds_wrt(subset, fw) }.any? ||
         fw.attacks_on_attacks(y).select { |yuv| colors[yuv] == BLUE }.any?
   }.each do |y|
     subset.map { |z| fw.attacks(z).select { |a| a.target == y } }.flatten.each do |edge|
       if (colors[edge] != RED)
         colors[edge] = RED
         change_in_attack_color = true
       end
     end
   end
   # lines 8-10 in original code
   colors.select { |e, v| v == RED }.each do |e, v|
     fw.attacks_on_attacks.select { |a| a.target == e }.each do |aoa|
       if (colors[aoa] != BLUE)
         colors[aoa] = BLUE
         change_in_attack_color = true
       end
     end
   end
 end while change_in_attack_color
 change_in_d = false
 begin
   change_in_d = false
   # line 13 in original code
   colors.select { |e, v| v == BLUE }.select { |e, v| colors.select { |e2, v| v==RED && e2.target == e.source && e2.succeeds_wrt(subset, fw) }.empty? }.each do |edge, v|
     # edge is <y, <v,w>>
     attacks -= [edge.target]
     if attacks_on_attacks.delete(edge)
       change_in_d = true
     end
   end
   # line 17 in original code
   subset.each do |z|
     # (<z,y> is RED with <y,<u,v>> is BLUE)
     fw.attacks(z).each do |zy|
       y = zy.target
       if (colors[zy] == RED)
         fw.attacks_on_attacks(y).select { |yuv| colors[yuv] == BLUE }.each do |yuv|
           # and there is no <p,<z,y>> in D}
           if (attacks_on_attacks.select { |aoa| aoa.target == zy }.empty?)
             if (attacks_on_attacks.delete(yuv))
               change_in_d = true
             end
           end
         end
       end
     end
   end
 end while change_in_d

 # remove from attacks on attacks all edges that point on a not existing terminal edge
 remove_all_non_terminal_edges(attacks, attacks_on_attacks)
 [attacks, attacks_on_attacks]
end
