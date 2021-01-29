# Exercise
# More than a matrix
# It is best to think of xts objects as normal R matrices, but with special powers. These powers let you manipulate your data as a function of time, as your data is now self-aware of when it exists in time. Before we can start to exploit these powers, it will be helpful to see how xts objects relate to their base-R relatives.
# 
# In this exercise, you will get a feel for xts and how it behaves like a matrix object. The xts object ex_matrix and matrix object core have been pre-loaded for you.
# 
# Instructions
# 100 XP
# Load the xts package using the library() function.
# Look at the structure of the sample xts called ex_matrix using str().
# Given that ex_matrix is a matrix, extract the 3rd row and 2nd column.
# Now take the matrix core and extract the 3rd row and 2nd column. Notice the difference.


# Load xts
library(xts)

# View the structure of ex_matrix
str(ex_matrix)

# Extract the 3rd observation of the 2nd column of ex_matrix
ex_matrix[3, 2]

# Extract the 3rd observation of the 2nd column of core 
core[3, 2]


# Exercise
# Your first xts object
# xts objects are simple. Think of them as a matrix of observations combined with an index of corresponding dates and times.
# 
# xts = matrix + times
# The main xts constructor takes a number of arguments, but the two most important are x for the data and order.by for the index. x must be a vector or matrix. order.by is a vector which must be the same length or number of rows as x, be a proper time or date object (very important!), and be in increasing order.
# 
# xts also allows you to bind arbitrary key-value attributes to your data. This lets you keep metadata about your object inside your object. To add these at creation, you simply pass additional name = value arguments to the xts() function.
# 
# Since we are focusing here on the mechanics, we'll use random numbers as our data so we can focus on creating the object rather than worry about its contents.
# 
# Instructions
# 100 XP
# Instructions
# 100 XP
# Create an object called data that contains five random numbers using rnorm().
# Create a Date class index from "2016-01-01" of length five called dates.
# Use the xts constructor to create an object called smith using data and dates as the index.
# Create an object called bday which contains a POSIXct date object containing the date "1899-05-08".
# Create an xts object called hayek using data, dates, and a new attribute called born, which should contain the birthday object you just created.


# Create the object data using 5 random numbers
data <- rnorm(5)

# Create dates as a Date class object starting from 2016-01-01
dates <- seq(as.Date("2016-01-01"), length = 5, by = "days")

# Use xts() to create smith
smith <- xts(x = data, order.by = dates)

# Create bday (1899-05-08) using a POSIXct date class object
bday <- as.POSIXct("1899-05-08")

# Create hayek and add a new attribute called born
hayek <- xts(x = data, order.by = dates, born = bday)



# Exercise
# Deconstructing xts
# Now that you can create xts objects, your next task is to examine an xts object from the inside.
# 
# At the core of both xts and zoo is a simple R matrix with a few additional attributes. The most important of these attributes is the index. The index holds all the information we need for xts to treat our data as a time series.
# 
# When working with time series, it will sometimes be necessary to separate your time series into its core data and index attributes for additional analysis and manipulation. The core data is the matrix portion of xts. You can separate this from the xts object using coredata(). The index portion of the xts object is available using the index() function. Note that both of these functions are methods from the zoo class, which xts extends.
# 
# In this exercise you will use these built-in functions to extract both the internal matrix data and internal index from your sample xts object. You will use the hayek time series you created in the last exercise to practice these new functions.
# 
# Instructions
# 100 XP
# Instructions
# 100 XP
# Extract the core data of hayek using coredata() and call this hayek_core.
# View the class of hayek_core using the class() function.
# Extract the date index of hayek using index() and call this hayek_index.
# View the class of hayek_index.


# Extract the core data of hayek
hayek_core <- coredata(hayek)

# View the class of hayek_core
class(hayek_core)

# Extract the index of hayek
hayek_index <- index(hayek)

# View the class of hayek_index
class(hayek_index)



# Exercise
# Time based indices
# xts objects get their power from the index attribute that holds the time dimension. One major difference between xts and most other time series objects in R is the ability to use any one of various classes that are used to represent time. Whether POSIXct, Date, or some other class, xts will convert this into an internal form to make subsetting as natural to the user as possible.
# 
# a <- xts(x = 1:2, as.Date("2012-01-01") + 0:1)
# a[index(a)]
# We'll get into more detail on subsetting xts objects in a later chapter. For now you can simply use date objects to index appropriate rows from your time series. You can think of this as effectively matching the rownames you see in the object. This works as anticipated for time objects because the rownames are really dates!
# 
# For this exercise you'll create two time series using two different time classes. You will then subset each object using the other object's index.
# 
# Instructions
# 100 XP
# Instructions
# 100 XP
# Create an object of 5 dates called dates starting at "2016-01-01".
# Create a time series ts_a using the numbers 1 through 5 as your data, and dates as your order.by index.
# Create a time series ts_b using the numbers 1 through 5 as your data, and the same dates, but as POSIXct objects.
# Use the index from ts_b to extract the dates from ts_a.
# Now do the reverse, indexing ts_b using the times from ts_a.


# Create dates
dates <- as.Date("2016-01-01") + 0:4

# Create ts_a
ts_a <- xts(x = 1:5, order.by = dates)

# Create ts_b
ts_b <- xts(x = 1:5, order.by = as.POSIXct(dates))

# Extract the rows of ts_a using the index of ts_b
ts_a[index(ts_b)]

# Extract the rows of ts_b using the index of ts_a
ts_b[index(ts_a)]



# Exercise
# Converting xts objects
# It is often necessary to convert between classes when working with time series data in R. Conversion can be required for many reasons, but typically you'll be looking to use a function that may not be time series aware or you may want to use a particular aspect of xts with something that doesn't necessarily need to be a full time series.
# 
# Luckily, it is quite easy to convert back and forth using the standard as.* style functionality provided in R (for example, as.POSIXct() or as.matrix()).
# 
# xts provides methods to convert all of the major objects you are likely to come across. Suitable native R types like matrix, data.frame, and ts are supported, as well as contributed ones such as timeSeries, fts and of course zoo. as.xts() is the workhorse function to do the conversions to xts, and similar functions will provide the reverse behavior.
# 
# To get a feel for moving data between classes, let's try a few examples using the Australian population ts object from R named austres.
# 
# Instructions
# 100 XP
# Instructions
# 100 XP
# Convert the ts class austres data set to an xts and call it au.
# Then convert the new au xts object into a matrix, am.
# Inspect the first few entries of this new matrix by using the head() function.
# Convert the original austres directly into a matrix called am2.
# Now inspect the first few entries of this new matrix by using the same function. Notice how this time, the conversion didn't preserve the time information?


# Convert austres to an xts object called au
au <- as.xts(austres)

# Then convert your xts object (au) into a matrix am
am <- as.matrix(au)

# Inspect the head of am
head(am)

# Convert the original austres into a matrix am2
am2 <- as.matrix(austres)

# Inspect the head of am2
head(am2)



# Exercise
# Importing data
# You can now convert data to xts using as.xts(). However, in most real world applications you will often need to read raw data from files on disk or the web. This can be challenging without knowing the right commands.
# 
# In the first part of this exercise, you will start by reading a csv file from disk using the base-R read.csv. After you read the data, the next step is to convert it to xts. Here you will be required to use the xts() constructor as well as deal with converting non-standard dates into something that xts understands.
# 
# In part two of this exercise, you will read the same data into a zoo object using read.zoo and then convert the zoo object into an xts object.
# 
# The data in this exercise are quite simple, but will require some effort to properly import and clean. The full name of the file you will be working with has been saved as the value of tmp_file. On disk, the data look like:
#   
#   a,b
# 1/02/2015, 1, 3
# 2/03/2015, 2, 4
# Instructions
# 100 XP
# Instructions
# 100 XP
# Read the data located at the value of tmp_file using read.csv() to a new variable called dat.
# Convert dat into an xts object using the xts() constructor. Use as.Date() with rownames(dat) as the first argument.
# Create dat_zoo by using read.zoo() to read in the same tmp_file, and set the argument format equal to "%m/%d/%Y".
# Create dat_xts by converting dat_zoo to xts by using as.xts().


# Create dat by reading tmp_file
dat <- read.csv(file = 'tmp_file.csv')

# Convert dat into xts
xts(dat, order.by = as.Date(dat$X, "%m/%d/%Y"))

# Read tmp_file using read.zoo
dat_zoo <- read.zoo('tmp_file.csv', index.column = 'date', sep = ",", format = "%m/%d/%Y", header = TRUE)

# Convert dat_zoo to xts
dat_xts <- as.xts(dat_zoo)



# Exercise
# Exporting xts objects
# Now that you can read raw data into xts and zoo objects, it is only natural that you learn how to reverse the process.
# 
# There are two main use cases for exporting xts objects. First, you may require an object to persist across sessions for use in later analysis. In this case, it is almost always best to use saveRDS() and readRDS() to serialize single R objects.
# 
# Alternatively, you may find yourself needing to share the results of your analysis with others, often expecting the data to be consumed by processes unaware of both R and xts. Most of us would prefer not to think of this horrible fate for our data, but the real world mandates that we at least understand how this works.
# 
# One of the best ways to write an xts object from R is to use the zoo function write.zoo(). In this exercise you'll take your temporary data and write it to disk using write.zoo().
# 
# Instructions
# 100 XP
# Instructions
# 100 XP
# Convert sunspots to xts and save it as sunspots_xts.
# The temporary file name will be loaded for you.
# Using write.zoo(), save the sunspots_xts data to the tmp file.
# Read the tmp file back into R using read.zoo(). Call this sun.
# Convert sun to xts using the as.xts() function. Call this sun_xts.


# Convert sunspots to xts using as.xts().
sunspots_xts <- as.xts(sunspots)

# Get the temporary file name
tmp <- 'tempfile.csv'

# Write the xts object using zoo to tmp 
write.zoo(sunspots_xts, sep = ",", file = tmp)

# Read the tmp file. FUN = as.yearmon converts strings such as Jan 1749 into a proper time class
sun <- read.zoo(tmp, sep = ",", FUN = as.yearmon, format = "%m %Y")

# Convert sun into xts. Save this as sun_xts
sun_xts <- as.xts(sun)
head(sun_xts, 20)



