# Exercise
# Combining xts by column with merge
# xts makes it easy to join data by column and row using a few different functions. All results will be correctly ordered in time, regardless of original frequencies or date class. One of the most important functions to accomplish this is merge(). It takes one or more series and joins them by column. It's also possible to combine a series with a vector of dates. This is especially useful for normalizing observations to a fixed calendar.
# 
# merge() takes three key arguments which we will emphasize here. First is the ..., which lets you pass in an arbitrary number of objects to combine. The second argument is join, which specifies how to join the series - accepting arguments such as inner or left. This is similar to a relational database join, only here, the index is what we join on. The final argument for this exercise is fill. This keyword specifies what to do with the new values in a series if there is missingness introduced as a result of the merge.
# 
# # Basic argument use
# merge(a, b, join = "right", fill = 9999)
# For this exercise, you will explore some of the different join types to get a feel for using merge(). The objects a and b have been pre-loaded into your workspace.
# 
# Instructions
# 100 XP
# Merge a and b using merge() (or cbind()), with the argument join set to "inner".
# Perform a left-join of a and b. Use merge() and set the argument join to the correct value. Fill all missing values with zero (use the fill argument).


# Perform an inner join of a and b
merge(a, b, join = "inner")

# Perform a left-join of a and b, fill missing values with 0
merge(a, b, join = "left", fill = 0)



# Exercise
# Combining xts by row with rbind
# Now that you have merged data by column, you will be happy to know it's just as easy to add new rows to your data.
# 
# xts provides its own S3 method to the base rbind() generic function. The xts rbind function is much simpler than merge(). The only argument that matters is ..., which takes an arbitrary number of objects to bind. What is different is that rbind requires a time series, since we need to have timestamps for R to know where to insert new data.
# 
# For this exercise you will update your temps data with three new observations. One will be before the series started and two will be after. Pay attention to your function call, does order matter?
# 
# In your workspace, the objects temps, temps_june30, temps_july17 and temps_july18 are already loaded.
# 
# Instructions
# 100 XP
# Bind the row from June 30th (temps_june30) to temps, and call this temps2.
# Bind the rows from July 17th and 18th to temps2. Call this temps3.

temps <- as.xts(temps)

temps_june30 <- cbind(temp_max = as.xts(c(75), order.by = as.Date(c('2016-06-30'))), temp_mean = as.xts(c(73), order.by = as.Date(c('2016-06-30'))), temp_min = as.xts(c(63), order.by = as.Date(c('2016-06-30'))))

temps_july17 <- cbind(temp_max = as.xts(c(79), order.by = as.Date(c('2016-07-17'))), temp_mean = as.xts(c(70), order.by = as.Date(c('2016-07-17'))), temp_min = as.xts(c(68), order.by = as.Date(c('2016-07-17'))))

temps_july18 <- cbind(temp_max = as.xts(c(75), order.by = as.Date(c('2016-07-18'))), temp_mean = as.xts(c(70), order.by = as.Date(c('2016-07-18'))), temp_min = as.xts(c(65), order.by = as.Date(c('2016-07-18'))))

# Row bind temps_june30 to temps, assign this to temps2
temps2 <- rbind(temps, temps_june30)

# Row bind temps_july17 and temps_july18 to temps2, call this temps3
temps3 <- rbind(temps2, temps_july17, temps_july18)



# Exercise
# What types of data can be combined using merge?
#   Although xts is very flexible when it comes to binding new columns to existing objects, there are still some exceptions. Which of the following is not able to be successfully merged with the xts object a?
#   
#   Before you answer, try each possibility in the console to your right to see how they behave. We've provided two time series, a and b for you to work with.
# 
# Instructions
# 50 XP
# Possible Answers
# 
# xts objects of identical type (e.g. integer + integer).
# 
# data.frames with various column types.   <- answer
# 
# POSIXct dates vector.
# 
# Atomic vectors of the same type (e.g. numeric).
# 
# A single NA.


# Exercise
# Fill missing values using last or previous observation
# As you've encountered already, it's not uncommon to find yourself with missing values (i.e. NAs) in your time series. This may be the result of a data omission or some mathematical or merge operation you do on your data.
# 
# The xts package leverages the power of zoo for help with this. zoo provides a variety of missing data handling functions which are usable by xts.
# 
# In this exercise you will use the most basic of these, na.locf(). This function takes the last observation carried forward approach. In most circumstances this is the correct thing to do. It both preserves the last known value and prevents any look-ahead bias from entering into the data.
# 
# You can also apply next observation carried backward by setting fromLast = TRUE.
# 
# # Last obs. carried forward
# na.locf(x)                
# 
# # Next obs. carried backward
# na.locf(x, fromLast = TRUE) 
# Instructions
# 100 XP
# Instructions
# 100 XP
# Using a subset of temps, fill missing NA observations with the last observation known. Store them in temps_last.
# Using another subset of temps, backfill missing NA observations with the next observation. Store them in temps_next.

temps <- read.zoo('Temps_na.csv', header = TRUE, sep = ',')

# Fill missing values in temps using the last observation
temps_last <- na.locf(temps)

# Fill missing values in temps using the next observation
temps_next <- na.locf(temps, fromLast = TRUE)



# Exercise
# NA interpolation using na.approx()
# On occasion, a simple carry forward approach to missingness isn't appropriate. It may be that a series is missing an observation due to a higher frequency sampling than the generating process. You might also encounter an observation that is in error, yet expected to be somewhere between the values of its neighboring observations.
# 
# These are scenarios where interpolation is useful. zoo provides a powerful tool to do this. Based on simple linear interpolation between points, implemented with na.approx() the data points are approximated using the distance between the index values. In other words, the estimated value is linear in time.
# 
# For this exercise, you'll use a smaller xts version of the Box and Jenkin's AirPassengers data set that ships with R. We've removed a few months of data to illustrate various fill techniques.
# 
# One takeaway, aside from getting a feel for the functions, is to see how various fill techniques impact your data, and especially how it will impact your understanding of it.
# 
# Caveat Emptor!
#   
#   The AirPassengers data set is available in your workspace as AirPass.
# 
# Instructions
# 100 XP
# Fill in missing months in AirPass with linear interpolation using na.approx().

AirPass <- as.xts(AirPassengers)
AirPass <- cbind(missing = AirPass['1960'], original = AirPass['1960'])
AirPass$missing['1960-03/1960-05'] <- NA

# Interpolate NAs using linear approximation
na.approx(AirPass)



# Exercise
# Combine a leading and lagging time series
# Another common modification for time series is the ability to lag a series. Also known as a backshift operation, it's typically shown in literature using  notation, indicating a transformation in time . This lets you see observations like yesterday's value in the context of today.
# 
# Both zoo and xts implement this behavior, and in fact extend it from the ts original in R. There are two major differences between xts and zoo implementations that you need to be aware of. One is the direction of the lag for a given k. The second is how missingness is handled afterwards.
# 
# For historical reasons in R, zoo uses a convention for the sign of k in which negative values indicate lags and positive values indicate leads. That is, in zoo lag(x, k = 1) will shift future values one step back in time. This is inconsistent with the vast majority of the time series literature, but is consistent with behavior in base R. xts implements the exact opposite, namely for a positive k, the series will shift the last value in time one period forward; this is consistent with intuition, but quite different than zoo.
# 
# In this exercise, you will construct a single xts object with three columns. The first column is data one day ahead, the second column is the original data, and the third column is the one day behind - all using xts. A simple xts object, x, has been loaded into your workspace.
# 
# # Your final object
# cbind(lead_x, x, lag_x)
# Instructions
# 100 XP
# Create a one period lead of x called lead_x.
# Create a one period lag of x called lag_x.
# Using the merge() function, combine lead + x + lag into a new object z.

x <- xts(5:9, order.by = seq(as.Date('2021-01-24'), length = 5, by = 'days'))
colnames(x) <- c('x')

# Create a leading object called lead_x
lead_x <- lag(x, k = -1)

# Create a lagging object called lag_x
lag_x <- lag(x, k = 1)

# Merge your three series together and assign to z
z <- merge(lead_x, x, lag_x)



# Exercise
# Calculate a difference of a series using diff()
# Another common operation on time series, typically on those that are non-stationary, is to take a difference of the series. The number of differences to take of a series is an application of recursively calling the difference function n times.
# 
# A simple way to view a single (or "first order") difference is to see it as x(t) - x(t-k) where k is the number of lags to go back. Higher order differences are simply the reapplication of a difference to each prior result.
# 
# In R, the difference operator for xts is made available using the diff() command. This function takes two arguments of note. The first is the lag, which is the number of periods, and the second is differences, which is the order of the difference (e.g. how many times diff() is called).
# 
# # These are the same
# diff(x, differences = 2)
# diff(diff(x))
# In this exercise, you will reuse the AirPass data from earlier in this chapter, though this time you will use the full series from 1948 to 1960.
# 
# Instructions
# 100 XP
# Construct a first order difference of AirPass by hand, using lag() and subtraction. Save this as diff_by_hand.
# To verify that your result is identical to using diff(AirPass), combine and inspect the first few rows of both in your console. Use merge() and head() for this.
# Get the first order 12 month difference of series AirPass. Be sure to specify both the lag and differences arguments in diff().

AirPass <- as.xts(AirPassengers)
# Calculate the first difference of AirPass and assign to diff_by_hand
diff_by_hand <- AirPass - lag(AirPass)

# Use merge to compare the first parts of diff_by_hand and diff(AirPass)
merge(head(diff_by_hand), head(diff(AirPass)))

# Calculate the first order 12 month difference of AirPass
diff(AirPass, difference = 1, lag = 12)



# Exercise
# What is the key difference in lag between xts and zoo
# As you've seen, generating lags and leads are an important tool in your arsenal for handling time series data in R. However, because xts employs slightly different procedures for generating lags and leads compared with zoo of base-R, you have to be very precise in your calls to lag().
# 
# Which of the following is FALSE?
# 
# Instructions
# 50 XP
# Possible Answers
# 
# The NA observations in xts resulting from lag() are preserved.
# 
# The NA observations in zoo resulting from lag() are dropped.
# 
# The k argument in zoo uses positive values for shifting past observations forward.   <- answer
# 
# The k argument in xts uses positive values for shifting past observations forward.