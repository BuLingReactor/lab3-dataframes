### -------------------- Lab 3 --------------------
### This lab is designed to prepare you for PS3

## Create a vector of the number of points the Seahawks scored in the
## first (at least) 5 games
## Hint: google "Seahawks scores", or check the football database:
## http://www.footballdb.com/teams/nfl/seattle-seahawks/results
## here 'Final' displays scores
## Use an appropriate variable name for the scores
## 
## Hint: feel free to invent if you cannot figure this out
pointsSeahawks <- c(17, 7, 23, 48, 32)


## Create a vector of the number of points the opponent
## scored against Seahawks in the first 5 games
## use an appropriate variable name
pointsOpponent <- c(16, 27, 27, 45, 39)


## Combine your two vectors into a dataframe
results <- data.frame(pointsSeahawks, pointsOpponent)

## Create a new column "diff" that is the difference in points
## (in favor of Hawks)
results$diff <- results$pointsSeahawks - results$pointsOpponent
print(results)


## Create a new column "won" which is TRUE if the Seahawks won,
## ie if Seahawks scored more than the opponent scored against them
results$won <- results$diff > 0
print(results)

## Create a vector of the opponents name (such as "Denver Broncos")
opponentsName <- c("Denver", "San Francisco", "Atlanta", "Detroit", "New Orleans")


## Add the vector of opponents into the data frame
results$opponents <- opponentsName

## Compute the average score of Seahawks
averageScoreSeahawks <- mean(results$pointsSeahawks)
print(averageScoreSeahawks)

## Compute how many games did Seahawks won
## (use the 'won' variable to compute it)
print(sum(results$won))


## What was the largest difference in scores (in favor of Seahawks)?
print(max(abs(results$diff)))

## How many different opponents did Seahawks have in these games?
## Hint: use `unique()` and `length()`
print(length(unique(results$opponents)))

## Print the variable names in your data frame
print(names(results))

## Write a loop over all variables in your data frame
## print the variable name inside the loop
for (i in names(results)) {
    print(i)
}

## Write a loop over all variables in your data frame
## print the variable name inside the loop,
## and true/false, depending if the variable is numeric
## check out 'is.numeric()'
for (i in names(results)) {
    print(is.numeric(results[[i]]))
}


## Write a loop over all variables in your data frame
## print the variable name inside the loop,
## and the average value of the variable
## if the variable is numeric
for (i in names(results)) {
    print(i)
    if (is.numeric(results[[i]])) {
        print(mean(results[[i]]))
    }
}


##
## HR data
## You are working in HR for a large firm with 100 employees.
## You are analyzing their salaries.

## Create a vector of 100 employees ("Employee 1", "Employee 2", ... "Employee
## 100")
## Hint: use 'paste()` or `str_c`
employees <- c()
for (i in 1:100) {
    employees <- append(employees, paste("Employee", toString(i)))
}
print(employees)

## Create a random vector of their 2021 salaries.
## Hint: you may use the runif function to create uniform random numbers,
## e.g. 'runif(100, 60, 120)' creates 100 random numbers between 60 and 120
salaries2021 <- runif(100, 6000, 12000)
print(salaries2021)

## Create a random vector of 2022 salaries that are typically
## higher than the 2014 salaires (use runif again).
## For instance, if you create random numbers between 65 and 130, then 2022
## salaries tend to be larger than 2021 salaries.
salaries2022 <- runif(100, 6500, 13500)
print(salaries2022)

## Create a data.frame 'salaries' by combining the vectors you just made
salaries <- data.frame(employees, salaries2021, salaries2022)
print(salaries)

## Create a column 'raise' that stores the size of the
## raise between 2021 and 2022
salaries$raise <- salaries$salaries2022 - salaries$salaries2021
print(salaries)

## Retrieve values from your data frame to answer the following questions:
##
## What was the 2015 salary of employee 57
print(salaries$salaries2022[57])

## Now round the answer down to two digits after comma
## check out 'round()' function
print(round(salaries$salaries2022[57], 2))

## How many employees got a raise?
print(sum(salaries$raise > 0))

## What was the value of the highest raise?
## Round the number to two digits!
print(round(max(salaries$raise), 2))


## What was the name of the employee who recieved the highest raise?


## What was the average salary increase?
## Round the number!
print(round(mean(salaries$raise), 2))

## For people who did not get a raise, how much money did they lose?
## Round the number!
print(round(mean(salaries$raise * salaries$raise <= 0), 2))
