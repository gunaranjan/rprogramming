#Hospital coursera assignment
best <- function(state, outcome) {
#outcome<-tolower(outcome)
state<-toupper(state)
## Read outcome data
## Check that state and outcome are valid
## Return hospital name in that state with lowest 30-day death
## rate
out <- read.csv("ProgAssignment3\\outcome-of-care-measures.csv", colClasses = "character")
if((state %in% out[,7])==FALSE)
{
stop(print("invalid state"))
}
if((outcome %in% c("heart attack", "heart failure", "pneumonia"))==FALSE)
{
stop(print("invalid outcome"))
}
data<<-out[out[,7]==state,]
print(state)
print(outcome)
if(outcome=="heart attack")
{
print("heart attack")
data[,11]<-as.numeric(data[,11])
checklen<-data[which(data[,11]==min(data[,11], na.rm = TRUE)),2]
}
if(outcome=="heart failure")
{
print("heart failure")
data[,17]<-as.numeric(data[,17])
checklen<-data[which(data[,17]==min(data[,17], na.rm = TRUE)),2]
}
if(outcome=="pneumonia")
{
print("pneumonia")
data[,23]<-as.numeric(data[,23])
checklen<-data[which(data[,23]==min(data[,23], na.rm = TRUE)),2]
}
if(length(checklen)>1)
{
return(sort(checklen)[1])
}
else
{
return(checklen)
}
#[7] "State" 
#[11] "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack" 
#[17] "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure" 
#[23] "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia" 
}