def find_pref(labelling, cand =[])
  # check if candidate labelling exists where current labelling is a subset of
  return cand if cand.select { |l| labelling.arg_in.subseteq?(l.arg_in) }.any?
  # if labelling does not have an argument illegally labelled in then Remove from Cand all  subsets of the current labelling
  if (labelling.illegally_labelled_ins.empty?)
    cand.reject! { |l| l.arg_in.subseteq?(labelling.arg_in) }
    cand << labelling
  else
    if x = labelling.super_illegally_labelled_in.first
      cand = find_pref(labelling.step(x), cand)
    else
      labelling.illegally_labelled_ins.each do |x|
        cand = find_pref(labelling.step(x), cand)
      end
    end
  end
  cand
end
