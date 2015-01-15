###complete <- function(directory, id = 1:332) {
###    nobs <- function(id) {
###        path <- file.path(directory, paste(sprintf("%03d", as.numeric(id)), ".csv", sep=""))
###        return (sum(complete.cases(read.csv(path))))
###    }
###    return (data.frame(id=id, nobs=sapply(id, nobs)))
###}



###complete<- function(directory, id=1:332) 
###{
###		filetest<-c()
###		id<-formatC(id, width=3, flag=0)
###		compc<-function(i)
###		{
###			filetest<-read.csv(paste(directory,"\\",i,".csv", sep="")) 
###			x<-sum(complete.cases(filetest))
###			return(x)
###		}
###		c<-data.frame(cbind(id=id, nobs=sapply(id,compc)))
###		return(c)

###}



complete<- function(directory, id=1:332, param=TRUE, tresh=0) 
{
		c<-c()
		id<-formatC(id, width=3, flag=0)
		compc<-function(i)
		{
			filetest<-read.csv(paste(directory,"\\",i,".csv", sep="")) 
			z<-filetest[complete.cases(filetest),]
			x<-nrow(z)
			if (param==TRUE) 
			{
			x<-nrow(z)
			return(x)
			}
			if (param==FALSE & x> tresh)
			{
			return(cor(z$nitrate, z$sulfate))
			}
		}
		if (param == TRUE) {
		c<-data.frame(cbind(id=id, nobs=sapply(id,compc)))
		k<-as.character(c[,2])
		l<-as.numeric(k)
		m<-as.character(c[,1])
		n<-as.numeric(m)
		return(as.data.frame(cbind(n,l)))
		}
		if (param == FALSE) 
		{
		for ( i in id) 
		{
		#c<-c(c,sapply(i,compc))
		c<-c(c,compc(i))
		}
		return(c)
		}		
}