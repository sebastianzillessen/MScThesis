#no censoring = 0, mild censoring < 0.7, heavy censoring >= 0.7
censoring.prop<-(nrow(tabular_data)-sum(tabular_data$os.censor))/nrow(tabular_data)
