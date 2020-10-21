#Notes on Subsetting
## Basics
  #operators to use for subsetting.
#[ ]  <- always returns same class as original (subset vector get vector etc.)
#can select more than one element

#[[]] <- extract single element from list or data frame, class of the returned
#object isn't necessarily a list or data frame 

#$ <- like [[]] but for semantics, that means it can be called as a named object

x<- c("a","b","c","c","d","a")
x[1]
x[2] #extract a numeric index
x[1:4] #we can extract a sequence
x[x>"a"] #this is extracting by logical (lexographical ordering)
u<-x>"a" #logical which is a true or false thing
u
x[u] #we call the true and false thing same as line 16

##subsetting lists
x<- list(foo=1:4,bar=0.6)
x[1] #extracts 1st element of list (you got the list)
x[[1]] #extracts 1st element of lists too! (you got the sequence itself)
x$bar #extracts the value of the named variable like the [[]], you get the value
x["bar"] #same as $bar? idk. we get the list's name

x<-list(foo=1:4,bar=0.6, baz="hello")
x[c(1,3)] #we extract the 1st and 3rd elements as lists, not values

#[[ ]] <- can be used with computed indices. $ can only be used for with literal
  #names
x<-list(foo=1:5, bar=0.6,baz="hello")
name<-"foo"
x[[name]] #computed index for 'foo' (wow you're actually searching foo's value)
x$name ## element 'name doesn't exist
x$foo #this one does

#Subsetting Nested Elements of a List
#[[]] <- can take an integer sequence
x<-list(a=list(10,12,14),b=c(3.14,2.81))
x[[c(1,3)]] #search the 1st element (coicidentlly a list), and get the 3rd 
#element
x[[1]][[3]] #same as above actually just written more concisely.
x[[2]][[1]] #lol same way to write = x[[c(2,1)] maybe for readability? idk.

#subsetting Matrices.
#i,j  indices
x<-matrix(1:6,2,3) #make a matrix containing # sequence, specify col, specify 
#row
x
x[1,2] #like a cartesian plane. get, row 1 column 2 value.
x[1,] #if not specified, returns the while row or column
x[,2]   

#single elements of a matrix is usually retrieved, as vector length 1.
#you can turn this off by specifying drop=FALSE

x<-matrix(1:6,2,3)
x[1,2] #returns vector value
x[1,2,drop=FALSE] #returns a 1x1 matrix
#usually when you specify a row or column, see lines 53 and 54, you get a 
#vector with 3 elements rather than a 1x3 matrix which you could get by
#setting drop=FALSE

#partial matching
##saves you typing, it's like wildcard in sql. works with [[]] and $
x<-list(aardvark=1:5)
x$a           #returns the list element "Aardvark without typing it out.
              #Looks for element names
x[["a"]]      #doesn't return anything since there's no element "a"
x[["a",exact=FALSE]] # returns Aardvark since it's like a fuzzy search.

#Subsetting removing NA values.
## remove missing values (NAs)
x<- c(1,2,NA,4,NA,5) #just your average list.
x
bad<-is.na(x)        #assign the NA values to variable "bad"   
bad
x[!bad]              # ! removes the bad from list x (use "bad" as a subset)


#Removing NA Values.
## what if there are multiple things and you want to take the subset with no NAs
x<-c(1,2,NA,4,NA,5)
y<-c("a","b",NA,"d",NA,"f")
good <- complete.cases(x,y)
good
x[good]
y[good]









