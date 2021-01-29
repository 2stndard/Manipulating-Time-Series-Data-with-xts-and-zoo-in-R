# The ISO-8601 standard
# The ISO-8601 standard is the internationally recognized and accepted way to represent dates and times. The standard allows for a common format to not only describe dates, but also to represent ranges and repeating intervals.
# 
# xts makes use of this standard for all extract and replace operations. This makes code both easy to write and easy to maintain. It also makes for very concise expression of date ranges and intervals.
# 
# For xts to work correctly, it is very important to follow the standard exactly. Details can be found in xts subset and .parseISO8601 documentation.
# 
# Which is a valid ISO-8601 string acceptable by xts?
#   
#   Instructions
# 50 XP
# Possible Answers
# 
# "2005-01-02"
# 
# "200501"
# 
# "2010/02/22"    
# 
# (1) and (2) only   <- answer



# Exercise
# Querying for dates
# One of the most powerful aspects of working with time series in xts is the ability to quickly and efficiently specify dates and time ranges for subsetting.
# 
# Date ranges can be extracted from xts objects by simply specifying the period(s) you want using special character strings in your subset.
# 
# A["20090825"]       ## Aug 25, 2009
# A["201203/201212"]  ## Mar to Dec 2012
# A["/201601"]        ## Up to and including January 2016
# For this exercise you will create a simple but very common query. Extract a range of dates using the ISO-8601 feature of xts. After successfully extracting a full year, you will then create a subset of your new object with specific start and end dates using this same notation.
# 
# Let's find some time!
# 
# Instructions
# 100 XP
# Using xts-style time subsetting, select only the year 2016 from the x time series, and call this x_2016.
# Using an explicit start and end date string, get all data from January 1, 2016 through March 22, 2016. Call this jan_march.
# To ensure that you subset all 82 rows, use the length function.

x <- c(-1.2722,0.0402,-0.2771,0.7793,0.6814,-1.3172,-0.5762,0.4719,1.1769,-0.8311,-0.3612,0.2638,0.2647,1.5329,0.4953,-1.8848,1.0209,-0.245,-0.8658,0.8386,0.3332,-1.4262,1.1097,2.0067,0.9152,-0.4766,-1.1928,-1.5512,0.6542,-0.6278,-0.2096,-0.0664,1.1579,1.6151,0.9434,1.5296,-0.9412,-0.192,-1.4044,0.8381,0.3328,1.901,0.841,1.3482,-1.454,-0.0492,-0.4085,-0.4515,1.0825,-0.0128,-0.4043,1.5428,-0.7099,0.7866,-1.2175,-0.8735,-0.296,0.6007,0.064,-0.1231,1.0385,1.5118,-0.4232,-2.181,-0.9313,1.0957,-0.2674,-1.7058,-0.6994,0.9542,-0.3013,0.6253,-0.0413,2.9007,-0.8573,-0.3057,0.7327,-0.5637,0.7956,0.3419,-0.2802,-0.6607,1.1971,-0.2855,0.3509,0.0807,-0.6099,-0.8166,-0.1872,1.3573,-0.0684,1.231,0.9812,-0.9463,1.7996,1.7758,-0.3775,-0.2684,-1.0615,0.8434,1.0408,-0.1246,0.1971,-1.4582,0.3209,-1.2709,1.3389,1.507,0.0847,-0.4126,-0.7799,0.5131,1.2639,0.1666,-1.5222,0.3939,-0.3199,3.2267,0.127,-0.0638,0.6532,-1.5705,-0.0613,0.552,0.5999,0.7486,-1.3367,-0.1969,0.1748,0.3882,-0.2436,2.2401,0.4145,0.5484,-1.5352,0.249,-0.8674,-0.4173,0.6557,1.189,2.0796,0.319,0.1119,0.2381,0.6747,1.0217,0.2524,1.2363,-2.0311,-0.2899,0.012,-0.8315,-0.0515,0.2238,-0.1052,0.5158,0.6469,-0.9675,0.2479,-0.2779,-0.9175,-1.8948,0.0227,-1.6378,0.6034,-1.9985,-0.0146,-0.7408,-0.0718,0.14,1.1308,0.4945,0.7214,-1.6899,-1.6459,1.2874,0.8295,0.2506,-1.8771,1.1319,0.5331,0.4273,-1.4192,0.139,0.4163,-0.305,-0.9018,-0.202,1.5873,-0.0147,0.8667,0.6027,-1.1912,-0.3486,0.0151,1.2293,2.6327,-3.7736,0.2604,-1.0458,-0.2078,-2.0524,0.1349,0.3081,-0.4476,-0.5725,1.1818,0.4153,1.1728,0.4606,2.6494,0.7261,-0.9295,0.5852,0.6105,-0.6426,-0.1386,0.2418,0.9751,-1.4261,0.3127,-0.7843,0.4354,-1.351,-0.414,-1.091,-0.1054,1.021,-0.4749,-0.163,2.3877,-1.7895,-0.8843,0.3817,1.5927,1.0064,-0.3578,-0.0372,-0.6114,2.2127,0.1604,-2.0336,1.1233,-0.2173,0.1082,-0.5833,1.579,-1.3848,-0.51,-0.275,1.5013,-1.8891,-1.2169,-0.8331,0.1216,2.1737,1.0373,1.1901,0.669,1.0062,1.2959,0.6143,-1.0355,2.1741,-0.2702,0.8706,-1.4515,-0.003,0.9719,-0.6056,-0.34,1.0143,0.3553,-0.9035,0.703,-0.096,-0.7906,0.9098,-0.0917,-0.1658,0.4816,1.5607,-0.3844,-1.5651,0.8347,-1.1282,-0.4047,-1.0554,0.421,0.9934,-1.1058,1.4442,-1.247,0.2517,0.6711,1.2324,-0.571,-0.0288,-0.9648,1.0532,-0.6185,0.5602,1.5598,1.5258,0.0197,-0.6179)
index <- as.Date(c('2015-06-01','2015-06-02','2015-06-03','2015-06-04','2015-06-05','2015-06-06','2015-06-07','2015-06-08','2015-06-09','2015-06-10','2015-06-11','2015-06-12','2015-06-13','2015-06-14','2015-06-15','2015-06-16','2015-06-17','2015-06-18','2015-06-19','2015-06-20','2015-06-21','2015-06-22','2015-06-23','2015-06-24','2015-06-25','2015-06-26','2015-06-27','2015-06-28','2015-06-29','2015-06-30','2015-07-01','2015-07-02','2015-07-03','2015-07-04','2015-07-05','2015-07-06','2015-07-07','2015-07-08','2015-07-09','2015-07-10','2015-07-11','2015-07-12','2015-07-13','2015-07-14','2015-07-15','2015-07-16','2015-07-17','2015-07-18','2015-07-19','2015-07-20','2015-07-21','2015-07-22','2015-07-23','2015-07-24','2015-07-25','2015-07-26','2015-07-27','2015-07-28','2015-07-29','2015-07-30','2015-07-31','2015-08-01','2015-08-02','2015-08-03','2015-08-04','2015-08-05','2015-08-06','2015-08-07','2015-08-08','2015-08-09','2015-08-10','2015-08-11','2015-08-12','2015-08-13','2015-08-14','2015-08-15','2015-08-16','2015-08-17','2015-08-18','2015-08-19','2015-08-20','2015-08-21','2015-08-22','2015-08-23','2015-08-24','2015-08-25','2015-08-26','2015-08-27','2015-08-28','2015-08-29','2015-08-30','2015-08-31','2015-09-01','2015-09-02','2015-09-03','2015-09-04','2015-09-05','2015-09-06','2015-09-07','2015-09-08','2015-09-09','2015-09-10','2015-09-11','2015-09-12','2015-09-13','2015-09-14','2015-09-15','2015-09-16','2015-09-17','2015-09-18','2015-09-19','2015-09-20','2015-09-21','2015-09-22','2015-09-23','2015-09-24','2015-09-25','2015-09-26','2015-09-27','2015-09-28','2015-09-29','2015-09-30','2015-10-01','2015-10-02','2015-10-03','2015-10-04','2015-10-05','2015-10-06','2015-10-07','2015-10-08','2015-10-09','2015-10-10','2015-10-11','2015-10-12','2015-10-13','2015-10-14','2015-10-15','2015-10-16','2015-10-17','2015-10-18','2015-10-19','2015-10-20','2015-10-21','2015-10-22','2015-10-23','2015-10-24','2015-10-25','2015-10-26','2015-10-27','2015-10-28','2015-10-29','2015-10-30','2015-10-31','2015-11-01','2015-11-02','2015-11-03','2015-11-04','2015-11-05','2015-11-06','2015-11-07','2015-11-08','2015-11-09','2015-11-10','2015-11-11','2015-11-12','2015-11-13','2015-11-14','2015-11-15','2015-11-16','2015-11-17','2015-11-18','2015-11-19','2015-11-20','2015-11-21','2015-11-22','2015-11-23','2015-11-24','2015-11-25','2015-11-26','2015-11-27','2015-11-28','2015-11-29','2015-11-30','2015-12-01','2015-12-02','2015-12-03','2015-12-04','2015-12-05','2015-12-06','2015-12-07','2015-12-08','2015-12-09','2015-12-10','2015-12-11','2015-12-12','2015-12-13','2015-12-14','2015-12-15','2015-12-16','2015-12-17','2015-12-18','2015-12-19','2015-12-20','2015-12-21','2015-12-22','2015-12-23','2015-12-24','2015-12-25','2015-12-26','2015-12-27','2015-12-28','2015-12-29','2015-12-30','2015-12-31','2016-01-01','2016-01-02','2016-01-03','2016-01-04','2016-01-05','2016-01-06','2016-01-07','2016-01-08','2016-01-09','2016-01-10','2016-01-11','2016-01-12','2016-01-13','2016-01-14','2016-01-15','2016-01-16','2016-01-17','2016-01-18','2016-01-19','2016-01-20','2016-01-21','2016-01-22','2016-01-23','2016-01-24','2016-01-25','2016-01-26','2016-01-27','2016-01-28','2016-01-29','2016-01-30','2016-01-31','2016-02-01','2016-02-02','2016-02-03','2016-02-04','2016-02-05','2016-02-06','2016-02-07','2016-02-08','2016-02-09','2016-02-10','2016-02-11','2016-02-12','2016-02-13','2016-02-14','2016-02-15','2016-02-16','2016-02-17','2016-02-18','2016-02-19','2016-02-20','2016-02-21','2016-02-22','2016-02-23','2016-02-24','2016-02-25','2016-02-26','2016-02-27','2016-02-28','2016-02-29','2016-03-01','2016-03-02','2016-03-03','2016-03-04','2016-03-05','2016-03-06','2016-03-07','2016-03-08','2016-03-09','2016-03-10','2016-03-11','2016-03-12','2016-03-13','2016-03-14','2016-03-15','2016-03-16','2016-03-17','2016-03-18','2016-03-19','2016-03-20','2016-03-21','2016-03-22','2016-03-23','2016-03-24','2016-03-25','2016-03-26','2016-03-27','2016-03-28','2016-03-29','2016-03-30','2016-03-31','2016-04-01'))  

x <- as.xts(x, order.by = index)
class(x)
# Select all of 2016 from x
x_2016 <- x["2016/"]

# Select January 1, 2016 to March 22, 2016
jan_march <- x["2016/2016-03-22"]

# Verify that jan_march contains 82 rows
82 == length(jan_march)



# Exercise
# Extracting recurring intraday intervals
# The most common time series data "in the wild" is daily. On occasion, you may find yourself working with intraday data, which contains both dates and times. In this case it is sometimes necessary to view only a subset of time for each day over multiple days. Using xts, you can slice days easily by using special notation in the i = argument to the single bracket extraction (i.e. [i, j]).
# 
# As you learned in the previous exercise, the trick to this is to not specify explicit dates, but rather to use the special T/T notation designed for intraday repeating intervals.
# 
# # Intraday times for all days
# NYSE["T09:30/T16:00"] 
# In this exercise, you will extract recurring morning hours from the time series irreg, which holds irregular data from the month of January 2010. Remember, you can always use the R console to experiment with irreg or to view the help pages with ?xts.
# 
# Instructions
# 100 XP
# Using the irregular time series irreg, assign all observations between 8AM and 10AM to morn_2010.
# Using morn_2010, extract only those observations from the morning of January 13th, 2010.

index <- as.POSIXct(c('2010-01-05 02:30:00','2010-01-05 10:32:00','2010-01-05 12:03:00','2010-01-06 06:01:00','2010-01-06 17:55:00','2010-01-06 23:42:00','2010-01-07 01:14:00','2010-01-07 05:00:00','2010-01-07 09:40:00','2010-01-07 13:14:00','2010-01-07 13:22:00','2010-01-07 16:12:00','2010-01-07 20:10:00','2010-01-07 21:52:00','2010-01-07 22:22:00','2010-01-08 02:35:00','2010-01-08 03:29:00','2010-01-08 05:06:00','2010-01-08 07:48:00','2010-01-08 08:16:00','2010-01-08 10:06:00','2010-01-08 11:29:00','2010-01-08 14:49:00','2010-01-10 00:11:00','2010-01-10 07:39:00','2010-01-10 12:09:00','2010-01-10 13:39:00','2010-01-10 15:41:00','2010-01-10 18:33:00','2010-01-10 23:46:00','2010-01-11 01:43:00','2010-01-11 16:50:00','2010-01-11 19:43:00','2010-01-11 20:17:00','2010-01-11 20:33:00','2010-01-12 00:59:00','2010-01-12 02:13:00','2010-01-12 07:46:00','2010-01-12 10:14:00','2010-01-12 15:00:00','2010-01-13 08:07:00','2010-01-13 09:28:00','2010-01-13 20:37:00','2010-01-13 21:40:00','2010-01-14 03:06:00','2010-01-14 04:51:00','2010-01-14 11:14:00','2010-01-15 01:04:00','2010-01-15 03:36:00','2010-01-15 21:18:00'))

irreg <- 1:length(index)

irreg <- xts(irreg, order.by = index)

# Extract all data from irreg between 8AM and 10AM
morn_2010 <- irreg['T08:00/T10:00']

# Extract the observations in morn_2010 for January 13th, 2010
morn_2010["2010-01-13"]



# Exercise
# Row selection with time objects
# Often you may need to subset an existing time series with a set of Dates, or time-based objects. These might be from as.Date(), as.POSIXct(), or a variety of other classes. In this exercise you'll explore how, given an xts object x, it is possible to extract relevant observations using a vector of dates in brackets.
# 
# The objects x and dates have been pre-loaded in your workspace.
# 
# Instructions
# 100 XP
# Use the vector dates to subset the object x.
# Subset x using dates that are first converted to POSIXct.



# Subset x using the vector dates
x[dates]

# Subset x using dates as POSIXct
x[as.POSIXct(dates)]



# Exercise
# Update and replace elements
# Replacing values in xts objects is just as easy as extracting them. You can use either ISO-8601 strings, date objects, logicals, or integers to locate the rows you want to replace. One reason you may want to do this would be to replace known intervals or observations with NA, say due to a malfunctioning sensor on a particular day or a set of outliers given a holiday.
# 
# For individual observations located sporadically throughout your data dates, integers or logical vectors are a great choice. For continuous blocks of time, ISO-8601 is the preferred method.
# 
# In this exercise, you'll continue using the vector dates from the previous exercise to modify your x object. Both are already loaded in your workspace.
# 
# Instructions
# 70 XP
# Use the vector dates to replace values in x with NA values.
# Replace all values in x for dates (not referring to the vector) from June 9, 2016 onward with 0. Use ISO-8601 style replacement.
# Use the console to look at the value for June 11, 2016 to show that your hard work has paid off!


# Replace the values in x contained in the dates vector with NA
x[dates] <- NA

# Replace all values in x for dates starting June 9, 2016 with 0
x['2016-03-09/'] <- 0

# Verify that the value in x for June 11, 2016 is now indeed 0
x['2016-03-11']



# Exercise
# Find the first or last period of time
# Sometimes you need to locate data by relative time. Something that is easier said than put into code. This is equivalent to requesting the head or tail of a series, but instead of using an absolute offset, you describe a relative position in time. A simple example would be something like the last 3 weeks of a series, or the first day of current month.
# 
# Without a time aware object, this gets quite complicated very quickly. Luckily, xts has the necessary prerequisites built in for you to use with very little learning required. Using the first() and last() functions it is actually quite easy!
#   
#   For this exercise, you'll extract relative observations from a data set called temps, a time series of summer temperature data from Chicago, IL, USA.
# 
# Instructions
# 100 XP
# Create a new variable lastweek by extracting the last 1 week from temps.
# Using your newly created data, extract the last 2 observations without respect to time.
# Now extract every day from lastweek except the first two days (this is tricky!).

temps <- read.zoo('temps.csv', sep = ',', header = T)
class(temps)

# Create lastweek using the last 1 week of temps
lastweek <- last(temps, "1 week")

# Print the last 2 observations in lastweek
last(lastweek, n = 2)

# Extract all but the first two days of lastweek
first(lastweek, "-2 day")



# Exercise
# Combining first and last
# Now that you have seen how to extract the first or last chunk of a time series using natural looking language, it is only a matter of time before you need to get a bit more complex.
# 
# In this exercise, you'll extract a very specific subset of observations by linking together multiple calls to first() and last().
# 
# # Last 3 days of first week
# last(first(Temps, '1 week'), '3 days') 
# You will reconfigure the example above using the temps data from the previous exercise. The trick to using such a complex command is to work from the inside function, out.
# 
# Instructions
# 100 XP
# Find the first three days of the second week of the temps data set. Use combinations of first() and last() to do this.



# Extract the first three days of the second week of temps
first(last(first(temps, "2 weeks"), "1 week"), "3 day")



# Exercise
# Matrix arithmetic - add, subtract, multiply, and divide in time!
#   xts objects respect time. By design when you perform any binary operation using two xts objects, these objects are first aligned using the intersection of the indexes. This may be surprising when first encountered.
# 
# The reason for this is that you want to preserve the point-in-time aspect of your data, assuring that you don't introduce accidental look ahead (or look behind!) bias into your calculations.
# 
# What this means in practice is that you will sometimes be tasked with handling this behavior if you want to preserve the dimensions of your data.
# 
# Your options include:
# 
# Use coredata() or as.numeric() (drop one to a matrix or vector).
# Manually shift index values - i.e. use lag().
# Reindex your data (before or after the calculation).
# In this exercise, you'll look at the normal behavior, as well as an example using the first option. For now you will use two small objects a and b. Examine these objects in the console before you start.
# 
# Instructions
# 100 XP
# Instructions
# 100 XP
# Add a and b. Notice the behavior of the dates, which ones remain?
#   Add a with the numeric value of b. b will need to be converted to a numeric for this to work.

a <- xts(c(1, 1, 1), order.by = as.Date(c('2015-01-24', '2015-01-24', '2015-01-24')))
colnames(a) <- c('a')

b <- xts(c(2), order.by = as.Date(c('2015-01-24')))
colnames(b) <- c('b')


# Add a and b
a + b

# Add a with the numeric value of b
a + as.numeric(b)




# Exercise
# Math with non-overlapping indexes
# The previous exercise illustrated the ins and outs of doing basic math with xts objects. At this point you are aware that xts respects time and will only return the intersection of times when doing various mathematical operations.
# 
# We alluded to another way to handle this behavior in the last exercise. Namely, re-indexing your data before an operation. This makes it possible to preserve the dimensions of your data by leveraging the same mechanism that xts uses internally in its own Ops method (the code dispatched when you call + or similar).
# 
# The third way involves modifying the two series you want by assuring you have some union of dates - the dates you require in your final output. To do this you will need a few functions that won't be dealt with in depth until Chapter 3, but are very useful here.
# 
# merge(b, index(a))
# Don't worry if you aren't yet familiar with merge(). This exercise may be easier if you just follow along with the instructions.
# 
# Instructions
# 100 XP
# Instructions
# 100 XP
# Using a and b from the previous exercise, get the value of a + b for each date in a. If no b is available on a given date, the answer should be a on that date.
# Now add a to b, but this time make sure all values of a are added to the last known value of b in time.


# Add a to b, and fill all missing rows of b with 0
a + merge(b, index(a), fill = 0)

# Add a to b and fill NAs with the last observation
a + merge(b, index(a), fill = na.locf)


