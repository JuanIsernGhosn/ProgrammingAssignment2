## Programming Assignment 2: Lexical Scoping

## Matrix object constructor function and function for the 
## calculation and caching of the inverse of the matrix object.


## Constructor function of the matrix object with getter and
## setter for the data and the inverse matrix property

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        i <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) i <<- inverse
    getinverse <- function() i
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


## Function for inverse matrix calculation, caching and loading
## if it is already calculate

cacheSolve <- function(x, ...) {
    i <- x$getinverse()
    if(!is.null(i)) {
        message("getting cached data")
        return(i)
    }
    data <- x$get()
    i <- solve(data)
    x$setinverse(i)
    i
}
