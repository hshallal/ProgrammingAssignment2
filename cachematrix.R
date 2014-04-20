## Matrix inversion is usually a costly computation and their may be some benefit to caching the inverse of a matrix 
## rather than computing it repeatedly. 

## This R script will have two functions; makeMatrix function and cacheSolve function.


## makeMatrix function creates a special "matrix" object that can cache its inverse.

makeMatrix <- function(x = matrix()) {
        ## ix is the inverse matrix of x
        ix <- NULL
        ## Set the value of a special matrix
        set <- function(y) {
                x <<- y
                ix <<- NULL
        }
        ## Get the value of a special matrix
        get <- function() x
        ## Set the value of the inverse matrix of the special matrix 
        setinversematrix <- function(solve) ix <<- inversematrix 
        ## Get the value of the inverse matrix of the special matrix
        getinversematrix <- function() ix
        list(set = set, get = get,
             setinversematrix = setinversematrix,
             getinversematrix = getinversematrix)
}

## cacheSolve function computes the inverse of the special "matrix" returned by makeCacheMatrix function.
## If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return the inverse matrix 'ix'
        ix <- x$getinversematrix()
        ## If the inverse matrix has been calculated, the function retrieves it from cache
        if(!is.null(ix)) {
                message("getting cached data")
                return(ix)
        }
        ## Otherwise, it calculates the inverse matrix of the data and sets the value of the inverse matrix in the 
        ## cache via the setinversemean function.
        data <- x$get()
        ix <- solve(data, ...)
        x$setinversematrix(ix)
        m
}
