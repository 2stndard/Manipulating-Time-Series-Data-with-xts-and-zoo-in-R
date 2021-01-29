# Exercise
# Time via index()
# For this multiple choice question, you will use the pre-loaded temps data to help you find the correct answer.
# 
# Which of the following statements is false?
#   
#   Instructions
# 50 XP
# Possible Answers
# 
# Using the tclass() function on temps returns the same output as does indexClass().
# 
# indexFormat(temps) <- "%b %d, %Y" changes the index of the first entry of the data to Jul 01, 2016.
# 
# Typing help(OlsonNames) into the console will provide R documentation for time zones.
# 
# The time zone of the temps data set is set to "America/New_York".   <- answer


# Exercise
# Class attributes - tclass, tzone, and tformat
# xts objects are somewhat tricky when it comes to time. Internally, we have now seen that the index attribute is really a vector of numeric values corresponding to the seconds since the UNIX epoch (1970-01-01).
# 
# How these values are displayed on printing and how they are returned to the user when using the index() function is dependent on a few key internal attributes.
# 
# The information that controls this behavior can be viewed and even changed through a set of accessor functions detailed here:
#   
#   The index class using indexClass() (e.g. from Date to chron)
# The time zone using indexTZ() (e.g. from America/Chicago to Europe/London)
# The time format to be displayed via indexFormat() (e.g. YYYY-MM-DD)
# In this exercise, you will practice each of these functions and view the results of your changes. To do so, you'll once again use the temps data that has been pre-loaded into your workspace.
# 
# Instructions
# 100 XP
# Instructions
# 100 XP
# View the first three rows of the index in the current temps data.
# Find the index class of temps using the most relevant command above.
# Find the time zone of temps, again using the most relevant command above.
# Change the index format of temps to "%b-%d-%Y".
# View the new index format using head().

# View the first three indexes of temps
index(temps)[1:3]

# Get the index class of temps
indexClass(temps)

# Get the timezone of temps
indexTZ(temps) <- 'America/New_York'

# Change the format of the time display
indexFormat(temps) <- "%b-%d-%Y"

# View the new format
head(temps)



# Exercise
# Time Zones (and why you should care!)
# One of the trickiest parts to working with time series in general is dealing with time zones. xts provides a simple way to leverage time zones on a per-series basis. While R provides time zone support in native classes POSIXct and POSIXlt, xts extends this power to the entire object, allowing you to have multiple time zones across various objects.
# 
# Some internal operation system functions require a time zone to do date math. If a time zone isn't explicitly set, one is chosen for you! Be careful to always set a time zone in your environment to prevent errors when working with dates and times.
# 
# xts provides the function tzone(), which allows you to extract or set time zones.
# 
# tzone(x) <- "Time_Zone"
# In this exercise you will work with an object called times to practice constructing your own xts objects with custom time zones.
# 
# Instructions
# 100 XP
# Instructions
# 100 XP
# Construct an xts time series of the numbers 1 through 10 called times_xts, with tzone set to "America/Chicago", and indexed by the times object.
# Modify times_xts to show time in "Asia/Hong_Kong".
# Extract the current time zone as a string.

times <- as.POSIXct(c("2021-01-29 06:34:41 GMT","2021-01-29 06:36:21 GMT", "2021-01-29 06:38:01 GMT","2021-01-29 06:39:41 GMT",  "2021-01-29 06:41:21 GMT", "2021-01-29 06:43:01 GMT", "2021-01-29 06:44:41 GMT", "2021-01-29 06:46:21 GMT", "2021-01-29 06:48:01 GMT", "2021-01-29 06:49:41 GMT"))

# Construct times_xts with tzone set to America/Chicago
times_xts <- xts(1:10, order.by = times, tzone = "America/Chicago")

# Change the time zone of times_xts to Asia/Hong_Kong
tzone(times_xts) <- "Asia/Hong_Kong"

# Extract the current time zone of times_xts
indexTZ(times_xts)



# Exercise
# Determining periodicity
# The idea of periodicity is pretty simple: With what regularity does your data repeat? For stock market data, you might have hourly prices or maybe daily open-high-low-close bars. For macroeconomic series, it might be monthly or weekly survey numbers.
# 
# xts provides a handy tool to discover this regularity in your data by estimating the frequency of the observations - what we are referring to as periodicity - using the [periodicity()](https://www.rdocumentation.org/packages/xts/topics periodicity) command
# 
# In this exercise, you'll try this out on a few sample data sets. In real life you might find yourself doing this as a first step to understanding your data before diving in for further analysis.
# 
# Instructions
# 100 XP
# Calculate the periodicity of the temps data set.
# Calculate the periodicity of the edhec data set.
# Convert the edhec data to yearly periodicity using to.yearly(). Call this edhec_yearly.
# Calculate the periodicity of edhec_yearly.


# Calculate the periodicity of temps
periodicity(temps)

# Calculate the periodicity of edhec
periodicity(edhec)

# Convert edhec to yearly
edhec_yearly <- to.yearly(edhec)

# Calculate the periodicity of edhec_yearly
periodicity(edhec_yearly)



# Exercise
# Find the number of periods in your data
# Often it is handy to know not just the range of your time series index, but also how many discrete irregular periods your time series data covers. You shouldn't be surprised to learn that xts provides a set of functions to do just that!
# 
# If you have a time series, it is now easy to see how many days, weeks or years your data contains. To do so, simply use the function ndays() and its shortcut functions nmonths(), nquarters(), and so forth, making counting irregular periods easy.
# 
# Instructions
# 100 XP
# Count the months in edhec.
# Count the quarters in edhec.
# Count the years in edhec.


# Count the months
nmonths(edhec)

# Count the quarters
nquarters(edhec)

# Count the years
nyears(edhec)



# Exercise
# Secret index tools
# xts uses a very special attribute called index to provide time support to your objects. For performance and design reasons, the index is stored in a special way. This means that regardless of the class of your index (e.g. Date or yearmon) everything internally looks the same to xts. The raw index is actually a simple vector of fractional seconds since the UNIX epoch.
# 
# Normally you want to access the times you stored. index() does this magically for you by using your indexClass. To get to the raw vector of the index, you can use .index(). Note the critical dot before the function name.
# 
# More useful than extracting raw seconds is the ability to extract time components similar to the POSIXlt class, which closely mirrors the underlying POSIX internal compiled structure tm. This functionality is provided by a handful of commands such as .indexday(), .indexmon(), .indexyear(), and more.
# 
# In this exercise, you'll take a look at the weekend weather in our pre-loaded temps data using the .indexwday() command. Note that the values range from 0-6, with Sunday equal to 0. Recall that you can use a logical vector to extract elements of an xts object.
# 
# Instructions
# 100 XP
# Instructions
# 100 XP
# Practice extracting the underlying units of your index in the temps data. Use .index() to see the number of seconds, and .indexwday() to see the day of the week of your observations.
# Create index using the which() function to extract weekend observations in temps.
# Select the indexed values from temps.


# Explore underlying units of temps in two commands: .index() and .indexwday()
.index(temps)
.indexwday(temps)


# Create an index of weekend days using which()
index <- which(.indexwday(temps) == 0 | .indexwday(temps) == 6)

# Select the index
temps[index]



# Exercise
# Modifying timestamps
# Most time series we've seen have been daily or lower frequency. Depending on your field, you might encounter higher frequency data - think intraday trading intervals, or sensor data from medical equipment.
# 
# In these situations, there are two functions in xts that are handy to know.
# 
# If you find that you have observations with identical timestamps, it might be useful to perturb or remove these times to allow for uniqueness. xts provides the function make.index.unique() for just this purpose. The eps argument, short for epsilon or small change, controls how much identical times should be perturbed, and drop = TRUE lets you just remove duplicate observations entirely.
# 
# On other occasions you might find your timestamps a bit too precise. In these instances it might be better to round up to some fixed interval, for example an observation may occur at any point in an hour, but you want to record the latest as of the beginning of the next hour. For this situation, the align.time() command will do what you need, setting the n argument to the number of seconds you'd like to round to.
# 
# make.index.unique(x, eps = 1e-4)  # Perturb
# make.index.unique(x, drop = TRUE) # Drop duplicates
# align.time(x, n = 60) # Round to the minute
# In this exercise, you'll try the three use cases on an xts object called z.
# 
# Instructions
# 100 XP
# Convert the z series times to a unique series using make.index.unique(), where eps = 1e-4. Save this to z_unique.
# Remove duplicate times in z. Save this to z_dup.
# Align z to the nearest hour using align.time(). Save this to z_round.

z <- xts(read.zoo('z.csv', header = F, index.column = c(1, 2)))

# Make z have unique timestamps
z_unique <- make.index.unique(z, eps = 1e-4)

# Remove duplicate times in z
z_dup <- make.index.unique(z, drop = TRUE)

# Round observations in z to the next hour
z_round <- align.time(z, n = 3600)
