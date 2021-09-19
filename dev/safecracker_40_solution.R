# Post (and blog) by Tyler Rinker
# title : TRinker's R Blog - Cracking Safe Cracker with R
# post : https://trinkerrstuff.wordpress.com/2015/05/30/1646/amp/

L1 <- list(#outer
    a = c(2, 15, 23, 19, 3, 2, 3, 27, 20, 11, 27, 10, 19, 10, 13, 10),
    b = c(22, 9, 5, 10, 5, 1, 24, 2, 10, 9, 7, 3, 12, 24, 10, 9)
)
L2 <- list(
    b_i = c(16, NA, 17, NA, 2, NA, 2, NA, 10, NA, 15, NA, 6, NA, 9, NA),
    c = c(11, 27, 14, 5, 5, 7, 8, 24, 8, 3, 6, 15, 22, 6, 1, 1)
)
L3 <- list(
    c_j = c(10, NA, 2,  NA, 22, NA, 2,  NA, 17, NA, 15, NA, 14, NA, 5, NA),
    d = c( 1,  6,  10, 6,  10, 2,  6,  10, 4,  1,  5,  5,  4,  8,  6,  3) #inner wheel
)
L4 <- list(#inner wheel
    d_k = c(6, NA, 13, NA, 3, NA, 3, NA, 6, NA, 10, NA, 10, NA, 10, NA)
)

shift <- function(x, n){
    if (n == 0) return(x)
    c(x[(n+1):length(x)], x[1:n])
}

dat <- NULL
m <- FALSE

for (i in 0:15){ 
    for (j in 0:15){
        for (k in 0:15){

            # Column 1
            c1 <- L1[[1]]  

            # Column 2
            c2 <- L1[[2]]  
            c2b <- shift(L2[[1]], i)
            c2[!is.na(c2b)]<- na.omit(c2b)

            # Column 3
            c3 <- shift(L2[[2]], i)
            c3b <- shift(L3[[1]], j)
            c3[!is.na(c3b)]<- na.omit(c3b)

            # Column 4
            c4 <- shift(L3[[2]], j)
            c4b <- shift(L4[[1]], k)
            c4[!is.na(c4b)]<- na.omit(c4b)

            ## Check and see if all rows add up to 40
            m <- all(rowSums(data.frame(c1, c2, c3, c4)) %in% 40)

            ## If all rows are 40 print the solution and assign to dat
            if (m){
                assign("dat", data.frame(c1, c2, c3, c4), envir=.GlobalEnv)
                print(data.frame(c1, c2, c3, c4))
                break
            }
            if (m) break
        }    
        if (m) break
    }
    if (m) break
}

rowSums(dat)
 
 