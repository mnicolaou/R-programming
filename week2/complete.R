# Write a function that reads a directory full of files and reports the number of completely
# observed cases in each data file. The function should return a data frame where the first
# column is the name of the file and the second column is the number of complete cases.

complete <- function (directory, id = 1:332) {
  filelist <- list.files(path = directory, pattern = ".csv", full.names = TRUE)
  nobs <- numeric()
  for (i in id) {
    cases <- sum(complete.cases(read.csv(filelist[i])))
    nobs <- c(nobs, cases)
  }
  data.frame(id, nobs)
}