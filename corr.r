###corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0

        ## Return a numeric vector of correlations
###}

corr<- function(directory, threshold = 0) 
{		
		data<-complete(directory)
		data<-complete(directory,data[,1],FALSE,threshold)
		return(data) 
}



#corr<- function(directory, threshold = 0) 
#{		
		#data<-complete(directory)
		#data<-as.data.frame(sapply(data,as.numeric))
		#for (i in id)
		#{
		#if ()
		#id<-data[data[,2]>threshold,1]
		#}
		#if(length(id)==0){ return(c(NULL)) }
		#else {
		#data<-complete(directory,id,FALSE)
		#return(data) }
#}


#corr <- function(directory, threshold = 0) {
## 'directory' is a character vector of length 1 indicating
## the location of the CSV files
## 'threshold' is a numeric vector of length 1 indicating the
## number of completely observed observations (on all
## variables) required to compute the correlation between
## nitrate and sulfate; the default is 0
## Return a numeric vector of correlations
#files <- list.files( path = directory )
#cr <- c()
#for(f in 1:length(files)){
#data <- read.csv( paste(directory, "/", files[f], sep="") )
#data <- data[complete.cases(data),]
#if ( nrow(data) > threshold ) {
#cr <- c(cr, cor(data$sulfate, data$nitrate) ) # append corralations
#}
#}
#return( cr )
#}


