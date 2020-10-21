#how to read and write data on R
#principal functions to use.
#Read.table(), Read.csv() <- for tabular data
#readLines <- for reading lines of a text file.
#source<- for reading R code files (inverse of dump)
#dget <- for reading R code files (inverse of dput)
#load <- for reading in saved workspaces
#unserialize <- for reading single R objects (binary in form)

# For writing data
## write.table, Write.lines, dump, dput, save, serialize (check descriptions ab
##-ove. These ^^^ are  their inverses

#read.table (below are arguments, but you could just use help function I think)

##file <- name of the file/connection
##header <- logical w/c indicates if it has a header
##sep <- string indicating how columns are separated.
##colClasses <- character vector indicating class of each column in data set.
##nrows <- the number of rows in the data set.
##comment.char <- character string indicating the comment character.
##skip <- number of lines to skip at beginning
#stringsAsFactors <- are these strings coded as factors?
##getwd() <- to check directory.
help("read.csv")
y<-read.csv("hw1_data.csv")
##for small/moderate data sets, you can use read.table without specifying any
##other arguments
##read.csv is similar to read.table but the separators are commas

#reading large tables
## read help page for read.table #it's really helpful.
## you usually want to know how much ram data set consumes.
## set comment.char = "" (if there are no commented files in your file)
## ^for optimising
## colClasses <- specifying this helps speed up the process since R does not
# have to check for the class of each column.
initial <- read.table("")
classes<-sapply(initial,class)
tabAll<-read.table("",
                 colClasses =  classes)
##^^ trick to know the classes of the data within a table.

#Calculate memory requirements
##rows*columns*bytes(used per class)
## convert to desired unit (mb, gb, etc.)

#Textual formats
##dumping and dputing <- resulting text format is editable, and if corrupted
##possibly recoverable.

##they preserve meta data too! (readability suffers a bit but hey, atleast!)
##good with git and subversion as they track meaningful changes in txt files
##longer-lived and adheres to unix philosophy.
##not that space efficient tho.

#dput-ing R Objects?
##deparse an R object, and read back using dget.
y<-data.frame(a=1,b="a")
dput(y)
structure(list(a=1,b=structure(1L,.label="a",class="factor")),
          .names=c("a","b"),row.names=c(NA,-1L),
          class="data.frame")
dput(y,file="y.R")
new.y<-dget("y.R")
new.y

#Dumping R objects
##multiple objects can be de-parsed using dump, and read back using source

x<- "foo"
y<- data.frame(a=1,b="a")
dump(c("x","y"),file="data.R")
source("data.R")
y
x

#Connections (interfacing with the outside world)
##most common is to a file can also be gzfile, bzfile, url

#File connections
str(file)
function(description="",open="",blocking=TRUE,encoding=getOption("encoding"))
#Connections 
##tool to navigate files and other external objects. 
con<-file("foo.txt","r")
data<-read.csv(con)
close(con)
#^^ same as data<-read.csv("foo.txt")

#con is useful sometimes when you want to read specific lines
con<-gzfile("words.gz") #open a connection to compressed file
x<-readLines(con,10)    #read the 1st 10 lines of con assigned attribute.
x                       # call em!

##writelines takes a character vector and writes each element a line at a time
    ##to a text file
##readlines can be useful forreading lines of webpages
##takes a bit of time
con<-url("http://www.wikipedia.org","r")
x<-readLines(con)
head(x)


