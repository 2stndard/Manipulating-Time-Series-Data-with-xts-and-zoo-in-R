# Exercise
# Find intervals by time in xts
# One of the benefits to working with time series objects is how easy it is to apply functions by time.
# 
# The main function in xts to facilitate this is endpoints(). It takes a time series (or a vector of times) and returns the locations of the last observations in each interval.
# 
# For example, the code below locates the last observation of each year for the AirPass data set.
# 
# endpoints(AirPass, on = "years")
# [1] 0 12 24 36 48 60 72 84 96 108 120 132 144
# The argument on supports a variety of periods, including "years", "quarters", "months", as well as intraday intervals such as "hours", and "minutes". What is returned is a vector starting with 0 and ending with the extent (last row) of your data.
# 
# In addition to each period, you can find the  period by utilizing the k argument. For example, setting the arguments of your endpoints() call to on = "weeks", k = 2, would generate the final day of every other week in your data. Note that the last value returned will always be the length of your input data, even if it doesn't correspond to a skipped interval.
# 
# In this exercise you'll use endpoints() to find two sets of endpoints for the daily temps data.
# 
# Instructions
# 100 XP
# Use endpoints() to locate the end of week in your temps data.
# Use endpoints() to locate the end of every second week in your temps data. Remember to use the k argument.

temps <- xts(read.zoo('temps.csv', sep = ',', header = T))

# Locate the weeks
endpoints(temps, on = "weeks")

# Locate every two weeks
endpoints(temps, on = "weeks", k = 2)



# Exercise
# Apply a function by time period(s)
# At this point you know how to locate the end of periods using endpoints(). You may be wondering what it is you do with these values.
# 
# In the most simple case you can subset your object to get the last values. In certain cases this may be useful. For example, to identify the last known value of a sensor during the hour or get the value of the USD/JPY exchange rate at the start of the day. For most series, you will want to apply a function to the values between endpoints. In essence, use the base function apply(), but used on a window of time.
# 
# To do this easily, xts provides the period.apply() command, which takes a time series, an index of endpoints, and a function.
# 
# period.apply(x, INDEX, FUN, ...)
# In this exercise you'll practice using period.apply() by taking the weekly mean of your temps data. You'll also look at one of the shortcut functions that does the same thing with slightly different syntax.
# 
# Instructions
# 100 XP
# Calculate the weekly endpoints of the temps series and assign to ep.
# Using period.apply(), calculate the weekly mean of the Temp.Mean column of your temps data. Remember that your endpoints were calculated weekly.


# Calculate the weekly endpoints
ep <- endpoints(temps, on = "weeks")

# Now calculate the weekly mean and display the results
period.apply(temps[, "Temp.Mean"], INDEX = ep, FUN = mean)



# Exercise
# Using lapply() and split() to apply functions on intervals
# Along the same lines as the previous exercise, xts gives you an additional mechanism to dive into periods of your data. Often it is useful to physically split your data into disjoint chunks by time and perform some calculation on these periods.
# 
# For this exercise you'll make use of the xts split() command to chunk your data by time. The split() function creates a list containing an element for each split. The f argument in split() is a character string describing the period to split by (i.e. "months", "years", etc.).
# 
# Here you will follow the same process you followed in the previous exercise. However, this time you will manually split your data first, and then apply the mean() function to each chunk. The function lapply() is used for the most efficient calculations. In cases where you don't want to return a time series, this proves to be very intuitive and effective.
# 
# Instructions
# 100 XP
# Use split() to split your temps data by weeks. Call this temps_weekly
# Use lapply() to get the weekly mean of temps_weekly. Call this temps_avg. Print this list.

# Split temps by week
temps_weekly <- split(temps, f = "weeks")

# Create a list of weekly means, temps_avg, and print this list
temps_avg <- lapply(X = temps_weekly, FUN = mean)
temps_avg



# Exercise
# Selection by endpoints vs. split-lapply-rbind
# By now you have seen that even in xts there is more than one way to accomplish a task. In this exercise we'll highlight this explicitly by tackling the same challenge using two different methods. When you are on your own, you will likely find situations where one or the other will be more intuitive, but for now you should make sure you are able to do both.
# 
# Starting with the same daily series temps, the challenge will be to find the last observation in each week.
# 
# Note that these functions will always find the dates that are in the closed interval [start of period, end of period] even if there is no observation at the exact start or end. xts represents irregular time series, so it is perfectly valid to have holes in the data where one might expect an observation.
# 
# Using the slides and video examples as a reference, find the last observation for each week in our temps data.
# 
# Instructions
# 100 XP
# Use the split()-lapply()-rbind() paradigm, given for you in the script, to find the last observation in each week in temps. It is stored in temps_1.
# Use endpoints() to find the last days of the week in temps. Store the resulting vector in last_day_of_weeks.
# Create temps_2 by subsetting temps using last_day_of_weeks.


# Use the proper combination of split, lapply and rbind
temps_1 <- do.call(rbind, lapply(split(temps, "weeks"), function(w) last(w, n = "1 day")))

# Create last_day_of_weeks using endpoints()
last_day_of_weeks <- endpoints(temps, 'weeks')

# Subset temps using last_day_of_weeks 
temps_2 <- temps[last_day_of_weeks, ]


# Exercise
# Convert univariate series to OHLC data
# Aggregating time series can be a frustrating task. For example, in financial series it is common to find Open-High-Low-Close data (or OHLC) calculated over some repeating and regular interval.
# 
# Also known as range bars, aggregating a series based on some regular window can make analysis easier amongst series that have varying frequencies. A weekly economic series and a daily stock series can be compared more easily if the daily is converted to weekly.
# 
# In this exercise, you'll convert from a univariate series into OHLC series, and then convert your final OHLC series back into a univariate series using the xts function to.period(). This function takes a time-series, x, and a string for the period (i.e. months, days, etc.), in addition to a number of other optional arguments.
# 
# to.period(x,
#           period = "months", 
#           k = 1, 
#           indexAt, 
#           name=NULL,
#           OHLC = TRUE,
#           ...)
# You will use a new data set for this exercise, usd_eur, a daily USD/EUR exchange rate from 1999 to August 2016, which has been loaded into your workspace.
# 
# Instructions
# 100 XP
# Instructions
# 100 XP
# Convert usd_eur into a weekly OHLC series using to.period(). Call this new series usd_eur_weekly. Note that by default OHLC = TRUE.
# Convert usd_eur into a monthly OHLC series. Call this series usd_eur_monthly.
# Convert usd_eur into a yearly univariate (no OHLC bars) series. Call this series usd_eur_yearly.

usd_eur <- xts(read.zoo('USDEUR.csv', sep = ',', index.column = 1, header = TRUE))
head(usd_eur)
# Convert usd_eur to weekly and assign to usd_eur_weekly
usd_eur_weekly <- to.period(usd_eur, period = "weeks")

# Convert usd_eur to monthly and assign to usd_eur_monthly
usd_eur_monthly <- to.period(usd_eur, period = "month")

# Convert usd_eur to yearly univariate and assign to usd_eur_yearly
usd_eur_yearly <- to.period(usd_eur, period = "year", OHLC = FALSE)


# Exercise
# Convert a series to a lower frequency
# Besides converting univariate time series to OHLC series, to.period() also lets you convert OHLC to lower regularized frequency - something like subsampling your data.
# 
# Depending on the chosen frequency, the index class of your data may be coerced to something more appropriate to the new data. For example, when using the shortcut function to.quarterly(), xts will convert your index to the yearqtr class to make periods more obvious.
# 
# We can override this behavior by using the indexAt argument. Specifically, using firstof would give you the time from the beginning of the period. In addition, you can change the base name of each column by supplying a string to the argument name.
# 
# For this exercise we'll introduce a new dataset, the edhec hedge fund index data from the PerformanceAnalytics package.
# 
# In this exercise you will use the Equity Market Neutral time series from the edhec data, which we've assigned to eq_mkt.
# 
# Instructions
# 100 XP
# Convert eq_mkt to quarterly OHLC using the base to.period(). Call this mkt_quarterly.
# Convert the original eq_mkt again, this time using to.quarterly() directly. Change the base name of each OHLC column to edhec_equity and change the index to "firstof". Call this mkt_quarterly2.

eq_mkt <- xts(read.zoo('eq_mkt.csv', sep = ',', head = TRUE, index.column = 1))
colnames(eq_mkt) <- c('Equity Market Neutral')

# Convert eq_mkt to quarterly OHLC
mkt_quarterly <- to.period(eq_mkt, period = 'quarter')

# Convert eq_mkt to quarterly using shortcut function
mkt_quarterly2 <- to.quarterly( eq_mkt, name = 'edhec_equity', indexAt = 'firstof') 



# Exercise
# Calculate basic rolling value of series by month
# One common aggregation you may want to apply involves doing a calculation within the context of a period, but returning the interim results for each observation of the period.
# 
# For example, you may want to calculate a running month-to-date cumulative sum of a series. This would be relevant when looking at monthly performance of a mutual fund you are interested in investing in.
# 
# For this exercise, you'll calculate the cumulative annual return using the edhec fund data from the last exercise. To do this, you'll follow the split()-lapply()-rbind() pattern demonstrated below:
#   
#   x_split <- split(x, f = "months")
# x_list <- lapply(x_split, cummax)
# x_list_rbind <- do.call(rbind, x_list)
# Note the last call uses R's somewhat strange do.call(rbind, ...) syntax, which allows you to pass a list to rbind instead of passing each object one at a time. This is a handy shortcut for your R toolkit.
# 
# Instructions
# 100 XP
# Using split(), break up the edhec data into years. Assign this to edhec_years.
# Use lapply() to find the cumsum() of the returns per year on edhec_years. Assign this to edhec_ytd.
# Use do.call() with rbind to convert your previous list output to a single xts object. Assign this to edhec_xts.

edhec <- xts(read.zoo('edhec.csv', sep = ',', head = TRUE, index.column = 1))

# Split edhec into years
edhec_years <- split(edhec, f = "year")

# Use lapply to calculate the cumsum for each year in edhec_years
edhec_ytd <- lapply(edhec_years, FUN = cumsum)

# Use do.call to rbind the results
edhec_xts <- do.call(rbind, edhec_ytd)



# Exercise
# Calculate the rolling standard deviation of a time series
# Another common requirement when working with time series data is to apply a function on a rolling window of data. xts provides this facility through the intuitively named zoo function rollapply().
# 
# This function takes a time series object x, a window size width, and a function FUN to apply to each rolling period. The width argument can be tricky; a number supplied to the width argument specifies the number of observations in a window. For instance, to take the rolling 10-day max of a series, you would type the following:
#   
#   rollapply(x, width = 10, FUN = max, na.rm = TRUE)
# Note that the above would only take the 10-day max of a series with daily observations. If the series had monthly observations, it would take the 10-month max. Also note that you can pass additional arguments (i.e. na.rm to the max function) just like you would with apply().
# 
# Instructions
# 100 XP
# Using rollapply(), calculate the 3-month standard deviation of the eq_mkt series. Note that eq_mkt has monthly observations. Call your 3-month rolling standard deviation eq_sd.


# Use rollapply to calculate the rolling 3 period sd of eq_mkt
eq_sd <- rollapply(eq_mkt, width = 3, FUN = sd)



