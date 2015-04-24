## These two functions will inverse Matrix and Cache them



## makeCacheMatrix makes a list of functions
## The list of functions includes 
## 1. Set an invertible Matrix
## 2. get an invertible Matrix
## 3. Set the inversed Matrix
## 4. get the inversed Matrix

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setsolve <- function(solve) m <<- solve
    getsolve <- function() m
    list(set = set, get = get,
         setsolve = setsolve,
         getsolve = getsolve)
}


## cacheSolve fuction will inverse the Matrix based on the fuction above
## If the inversed Matrix is available, it will skip the calculations

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    m <- x$getsolve()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setsolve(m)
    m
}
