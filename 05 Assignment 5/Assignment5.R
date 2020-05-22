#Write a R program and find X Y Z
#x + y - z = -2
#2x - y + z = 5
#-x + 2y + 2z = 1

A = matrix(c(1,2,-1,1,-1,2,-1,1,2), ncol = 3)
A

B = matrix(c(-2,5,1))
B
x = solve(A) %*% B
x
