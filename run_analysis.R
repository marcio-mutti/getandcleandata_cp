unzip("UCI_Dataset.zip")
setwd("UCI HAR Dataset")
x_train<-read.table("train/X_train.txt")
y_train<-read.table("train/y_train.txt")
subjects_train<-read.table("train/subject_train.txt")
nomes<-read.table("features.txt")
x_test<-read.table("test/X_test.txt")
y_test<-read.table("test/y_test.txt")
subjects_test<-read.table("test/subject_test.txt")
labels<-read.table("activity_labels.txt")
consolidado_total<-rbind(x_train,x_test)
rm(x_train)
rm(x_test)
y.consolidado<-rbind(y_train,y_test)
rm(y_train)
rm(y_test)
names(consolidado_total)<-nomes[,2]
subjects<-rbind(subjects_train,subjects_test)
rm(subjects_train)
rm(subjects_test)
consolidado_extract_mean<-consolidado_total[,grepl("mean()",names(consolidado_total))]
consolidado_extract_mean<-consolidado_extract_mean[,!grepl("meanFreq()",names(consolidado_extract_mean))]
consolidado_extract_std<-consolidado_total[,grepl("std()",names(consolidado_total))]
consolidado_extract<-cbind(consolidado_extract_mean,consolidado_extract_std)
rm(consolidado_total)
rm(consolidado_extract_mean)
rm(consolidado_extract_std)
y.consolidado<-merge(y.consolidado,labels,by.x="V1", by.y="V1", all.x=TRUE)
consolidado_extract<-cbind(consolidado_extract,y.consolidado[,2])
colnames(consolidado_extract)[67]<-"Activity"
consolidado_extract<-cbind(subjects,consolidado_extract)
colnames(consolidado_extract)[1]<-"Subjects"
rm(subjects)
rm(y.consolidado)
consolidado_extract<-consolidado_extract[,c(68,1:67)]
tidy<-melt(data=consolidado_extract, id.vars = c(2,1))
tidy<-dcast(data = tidy, formula = Subjects + Activity ~ variable, fun.aggregate=mean)
write.table(tidy, file="result.txt", row.names=FALSE)
setwd("..")
