## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
    im <- NULL
    set <- function(y) {
        x <<- y
        im <<- NULL
    }
    get <- function() x
    setInverse <- function(inverse) im <<- inverse
    getInverse <- function() im
    list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    im <- x$getInverse()
    if(!is.null(im)) {
        print('getting cached inverse matrix')
        return(im)
    }
    data <- x$get()
    im <- solve(data, ...)
    x$setInverse(im)
    im
}

B <- matrix(c(1,2,3,4),2,2)
B1 <- makeCacheMatrix(B)
cacheSolve(B1)
cacheSolve(B1)
