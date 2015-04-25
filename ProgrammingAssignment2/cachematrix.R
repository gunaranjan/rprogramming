#This is a function to cache the given matrix and cache the inverse of the given matrix
makeCacheMatrix<-function(x) 
							{ 
							print("This is makeCacheMatrix") ; 
							cachematrix<<- x ;  #This step is caching the matrix provided
							inv<<-solve(x) ;   #This step saves the inverse matrix for future use
							return(inv) 
							}

#This is a function to check previous used matrix is same as the given one and respond accordingly
cachesolve<-function(x) 
						{
						if(!exists('cachematrix') || !identical(x,cachematrix)) 
							{ 
							makeCacheMatrix(x); #Since the cachematrix was removed or did not exists or the input matrix was changed
							return(inv)         
							} 
						else if (identical(x,cachematrix)) 
							{
							print("already solved"); 
							return(inv)         #Since the input matrix did not change and we have already saved the inverse matrix 
							} 
						}