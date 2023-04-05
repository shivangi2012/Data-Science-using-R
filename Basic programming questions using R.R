# print numbers 1 to 10(using for loop)

for(i in 1:10){
  cat("t=",i,"\n")
}

#print numbers 1 to 10(using while loop)

i=1
while(i<=10)
{
  cat("t=",i,"\n")
  i=i+1
}

#print numbers 1 to 10(using repeat loop)

i=1
repeat{
  cat("t=",i,"\n")
  i=i+1
  if(i>10){
    break
  }
}

#print numbers 5 to 1(using for loop)

for(i in 10:1){
  cat("t=",i,"\n")
}

#print numbers 5 to 1(using for loop)

i=10
while(i>=1){
  cat("t=",i,"\n")
  i=i-1
}

#print numbers 5 to 1(using repeat loop) - Demo of break statement

i=10
repeat{
  cat("t=",i,"\n")
  i=i-1
  if(i<1){
    break
  }
}

#Demo of next statement
for(i in 1:10){
  if(i==3){
    next
  }
  cat("t=",i,"\n")
}

# Print all even numbers between 1 and 30(using for loop)

for(i in 1:30){
  if(i%%2==0){
    print(i)
  }
}

# Print all even numbers between 1 and 30(using while loop)

i=1
while(i<=30){
  if(i%%2==0){
    print(i)
  }
  i=i+1
}

#Print all even numbers between 1 and 30(using repeat loop)

i=1
repeat{
  if(i%%2==0){
    print(i)
  }
  i=i+1
  if(i>30){
    break
  }
}

#5.4 Print all odd numbers between 1 and 30(using for loop)

for(i in 1:30){
  if(i%%2!=0){
    print(i)
  }
}

#Print all odd numbers between 1 and 30(using while loop)

i=1
while(i<=30){
  if(i%%2!=0){
    print(i)
  }
  i=i+1
}

#Print all odd numbers between 1 and 30(using repeat loop)

i=1
repeat{
  if(i%%2!=0){
    print(i)
  }
  i=i+1
  if(i>30){
    break
  }
}

#Printing no.s between 1 and 100 which are completely divisible by 3 and 5

for(i in 1:100){
  if(i%%3==0 && i%%5==0){
    print(i)
  }
}

#Print numbers 10 20 30..100 

for(i in 1:10){
  i=i*10
  print(i)
}

#Generation of table of any given number

b<-readline(prompt="Enter a no \n")
b<-as.integer(b)
for(i in 1:10){
  t=b*i
  print(t)
}

#Display 11,22,33,...,99 

b<-readline(prompt="Enter a no\n")

b<-as.integer(b)
for(i in 1:10){
  t=b*i
  cat(t,collapse=",",sep="")
}

#Maximum of n no.s

b<-readline(prompt="Enter how many no.s \n")
b<-as.integer(b)

t<-as.vector(c())

for(i in 1:b){
  t[i]<-as.integer(readline("Enter no. \n"))
}
t

max<-t[1]
for(i in t){
  if(i>max){
    max<-i
  }
}
print(max)

#To reverse a number

n<-as.integer(readline(prompt="Enter no. \n"))

rev=0
while(n!=0){
  r=n%%10
  rev=rev*10+r
  n=n%/%10
}

print(rev)

#To check whether no. is palindrome or not

n<-as.integer(readline(prompt="Enter no. \n"))
b<-n
rev=0
while(n!=0){
  r=n%%10
  rev=rev*10+r
  n=n%/%10
}
print(rev)
if(b==rev){
  print("Number is palindrome")
} else {
  print("Number is not palindrome")
}

# To find no. of digits in a given no.

n<-as.integer(readline(prompt="Enter no. \n"))
rev=0
c=0
while(n!=0){
  r=n%%10
  c=c+1
  n=n%/%10
}
print(c)

#To check whether no. is armstrong or not

n<-as.integer(readline(prompt="Enter no. \n"))
b<-n
c=0
while(n!=0){
  r=n%%10
  c=c+r*r*r
  n=n%/%10
}
print(c)
if(b==c){
  print("Number is armstrong")
} else {
  print("Number is not armstrong")
}

#Print all armstrong no.s between 1 and 10000

for(n in 1:10000){
  b<-n
  c=0
  while(b!=0){
    r=b%%10
    c=c+r*r*r
    b=b%/%10
  }
  if(n==c){
    print(c)
  }
}

#To find square of each digit of 4 digit number eg. square of 1234=01040916

n<-as.integer(readline(prompt="Enter 4 digit number"))

c=3
b<-n
while(b>0){
  f=10^c
  r=b%/%f
  s=r*r
  b=b%%f
  c=c-1
  
  if(s<=9){
    cat("0",s,sep="")
  }else{
    cat(s)
  }
}

#To find square of each digit of n digit number eg. square of 1234=01040916

n<-as.integer(readline(prompt="Enter 4 digit number"))

c=0
b<-n
while(b>0){
  b=b%/%10
  c=c+1
}
c

i<-n
while(i>0){
  f=10^c
  r=i%/%f
  s=r*r
  i=i%%f
  c=c-1
  
  if(s<=9){
    cat("0",s,sep="")
  }else{
    cat(s)
  }
}



#Arrays

#1 Input 5 element array and display it

a<-vector()
n<-as.integer(readline(prompt="Enter 5 digit number "))
for(i in 1:n){
  a[i]<-readline(prompt="Enter a number: ")
}

cat("Array elements are","\n")
print(a)

# Initialization of array

a<-c(1,2,3,4,5,6)
print(a)

# Counting no. of +ve, -ve and 0 elements in array

a<-list(1,2,3,-5,-3,0,2,3,0,0,2)
pos=0
neg=0
zero=0

for(i in 1:length(a)){
  if(a[i]>0){
    pos=pos+1
  }else if(a[i]<0){
    neg=neg+1
  }else{
    zero=zero+1
  }
}

print(pos)
print(neg)
print(zero)

# Display even and odd numbers of array separately

n<-readline(prompt="Enter how many numbers: ")

a<-vector()
for(i in 1:n){
  a[i]<-as.integer(readline(prompt="Enter a number "))
}

cat("Even numbers are:","\n")

for(i in 1:length(a)){
  if(a[i]%%2==0){
    print(a[i])
  }
}

cat("Odd numbers are:")
for(i in 1:length(a)){
  if((a[i]%%2)!=0){
    print(a[i])
  }
}

