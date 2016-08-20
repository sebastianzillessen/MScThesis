library("survival")
m=1
tabular_data.survfit<-survfit(Surv(tabular_data$futime, tabular_data$fustat==1)~tabular_data$rx,data=tabular_data)
n=tabular_data.survfit$strata[1]
temp<-tabular_data.survfit$time[m:n]
cloglog=log(-log(tabular_data.survfit$surv[m:n]))
png(file = fileName, type="cairo")
plot(log(temp), cloglog, type ="o")
m=n+1
n=n+tabular_data.survfit$strata[2]
temp=tabular_data.survfit$time[m:n]
cloglog=log(-log(tabular_data.survfit$surv[m:n]))
lines(log(temp),cloglog,type="o",col=2)
dev.off()
