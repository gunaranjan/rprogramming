#Hospital coursera assignment
#------------------------------------------------
rankall <- function(outcome, num = "best") {
out <- read.csv("ProgAssignment3\\outcome-of-care-measures.csv", colClasses = "character")
column<-if(outcome=="heart attack") {"Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"} else if (outcome=="heart failure") {"Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"} else if (outcome=="pneumonia") {"Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"} else {stop(print("invalid outcome"))}
if(num=="best") {num<-1}
out<-out[,c(2,7,11,17,23)]
out[,column]<-as.numeric(out[,column])
sp<-split(out,out$State)
result<-as.data.frame(do.call(rbind,lapply(1:54, function(x) {y<-sp[[x]][c("Hospital.Name","State",column)]; z<-y[order(y[,column], y[,1]),]; z<-z[complete.cases(z[,column]),]; a<-cbind(z,rank=1:nrow(z)) ; if(num=="worst") {num<-nrow(a)} ;return(as.character(a[num,]))})))
colnames(result)<-c("hospital", "state", "Outcomerate", "rank")
u<-unique(out$State)
result$state<-u[order(unique(out$State))]
rownames(result)<-result$state
result<-result[,c(1,2)]
return(result)
}
#------------------------------------------------