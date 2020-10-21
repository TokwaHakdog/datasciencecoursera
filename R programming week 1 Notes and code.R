#################
x<-c(0.5,0.6)     ##Numeric
x
x<-c(TRUE,FALSE)  ##Logical
x
x<-c(T,F)         ##Logical
x
x<-c("a","b","c") ##Character
x
x<-9:29           ##integer (more like a sequence)
x
x<-c(1+0i, 2+4i)  ## Complex numbers
x
#################
x<-vector("numeric",length=10)
x
#################
y<-c(1.7,"b") # 1.7 is a numeric, but coerced into character vector
y<-c(TRUE,2)  #logical is coerced into numeric [TRUE=1 , FALSE =0 ]
y<-c("a",TRUE)#logical coerced into character vector
y
#coercion happens when every element in the vector is of the same class

#Explicit Coerciosn
x<- 0:10
class(x)
as.numeric(x)
as.logical(x)
as.character(x)
as.complex(x)
#nonsensical coercion results in NA
x<-c("a","b","c")
as.numeric(x)


#Lists
  #special type of vector, can contain multiple elements of different classes
x<-list(1,"a",TRUE,1+4i)
x  #look how it looks like when called, index is surrounded by double brackets
   #idk why but it's surrounded by double brackets.
   #and single brackets are used to specify the element number within lists
x<-list(1,(list(1,3)),4)
x
#matrices, vectors with a dimension attribute
m<-matrix(nrow=5,ncol=5)
m
dim(m) #shows how many rows columns a matrix has.
attributes(m) #almost same as above 

#matrices are constructed column-wise, 1st column, then 2nd then etc.
m<-matrix(1:25,nrow=5, ncol=5,byrow=TRUE)
m
#you can also create matrices by specifying a dimension attribute
m<-1:40
m
dim(m)<-c(8,5)
#cbind-ing and rbind-ing (another way to make a matrix)
x<-1:10
y<-10:19
cbind(x,y)
rbind(x,y)

##factors are labels (integer's have labels I guess),can be ordered or unordered
## good for readability.

x<-factor(c("True","false","yes","no","True","false","yes","no","True"))
x
table(x) #shows frequency of element in list.
unclass(x) #shows how each element is assigned a integer as a label
attr(x,"levels") #like table, but without frequencies (shows categories)
x<-factor(c("yes","no","maybe","yes","yes","no","maybe","no","maybe"),
            levels=c("no","maybe","yes"))
x #levels specify the order to which we assign levels (see unclass to verify)


##Missing Values
#NaN means mathematically undefined. NA means missing values
#is.NA(), is.NaN() used to check for NAs and NaNs
#NaN is also NA, but an NA is not a NaN.



