pollutantmean <- function(directory, pollutant, id=1:332) {
list.files(directory) 
filetest<-c()
id<-formatC(id, width=3, flag=0)
for ( i in id ) {
filetest<-rbind(filetest,read.csv(paste(directory,"\\",i,".csv", sep=""))) }
return(round(mean(filetest[,pollutant],na.rm=TRUE), digits = 3))
}