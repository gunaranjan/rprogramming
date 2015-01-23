#Hospital coursera assignment
rankhospital <- function(state, outcome,num=NA) 
{
	state<-toupper(state)
	repcode<-function(x) 
		{
		data[,x]<-as.numeric(data[,x])
		check<-data[complete.cases(data[,x]),]
		check1<-cbind(check[order(check[,x],check[,2]),],rank=1:nrow(check))
		if(num=="worst")
			{
			return(as.character(tail(check1,1)[2]))
			}
		else 
			{
			if(num<max(check1$rank))
				{
				return(check1[check1$rank==num,2])
				}
			else 
				{
				return(NA)
				}
			}
		}
	if(num=="best") {num<-1}
	out <- read.csv("ProgAssignment3\\outcome-of-care-measures.csv", colClasses = "character")
	if((state %in% out[,7])==FALSE)
		{
		stop(print("invalid state"))
		}
	if((outcome %in% c("heart attack", "heart failure", "pneumonia"))==FALSE)
		{
		stop(print("invalid outcome"))
		}
	data<-out[out[,7]==state,]
	if(outcome=="heart attack")
		{
		return(repcode(11))
		}
	if(outcome=="heart failure")
		{
		return(repcode(17))
		}
	if(outcome=="pneumonia")
		{
		return(repcode(23))
		}
}