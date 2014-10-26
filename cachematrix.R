#function creates a special "matrix" object that can cache its inverse:
makeCacheMatrix<-function(x=matrix()){
#set to empty matrix
Inverse_x<-NULL
#function to set the matrix x to a new matrix, and sets Inverse matrix to empty matrix:
set<-function(y){
x<<-y
Inverse_x<<-NULL
}
# function return matrix x:
get<-function() x
# function sets the Inverse matrix
setmatrix<-function(solve) Inverse_x<<-solve
# function returns the Inverse matrix
getInv<-function() Inverse_x
# returning a list with 4 functions just defined
list (set=set,get=get,setmatrix=setmatrix,getInv=getInv)
}

cacheSolve<-function(x=matrix(),...){
Inverse_x<-x$getInv()
#if Inverse matrix is found in global environment, then cached value is returned:
if(!is.null(Inverse_x)){
message("getting cached data")
return(Inverse_x)
}
#otherwise calculate inverse matrix 
data<-x$get()
Inverse_x<-solve(data)
# set inverse matrix into cache
x$setmatrix(Inverse_x)
Inverse_x
}