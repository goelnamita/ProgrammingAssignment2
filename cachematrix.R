##This R script to cache the inverse of a matrix
## 

## It takes as input a square invertible matrix, set the values of the matrix, get the values of the matrix, 
## finds its inverse using function solve, set that value and cache it in the memory

makeCacheMatrix <- function(x = matrix()) {
  I <- NULL
  set <- function(y) {
    x <<- y
    I <<- NULL
  }
  get <- function() x
  setI <- function(solve) I <<- solve
  getI <- function() I
  list(set = set, get = get,
       setI = setI,
       getI = getI)
}


## This function calculates the inverse of the special "matrix" created with the above function.
## It first checks if the inverse of this matrix already exists in the cache. If so it gets the inverse from cache using getI function
## Else it calculates the inverse of matrix and sets the values of inverse matrix in the cache using setI function

cacheSolve <- function(x, ...) {
## Return a matrix that is the inverse of 'x'
  I <- x$getI()
  if(!is.null(I)) {
    message("getting cached data")
    return(I)
  }
  data <- x$get()
  I <- solve(data, ...)
  x$setI(I)
  I
  
  
}
