library(AppliedPredictiveModeling)
transparentTheme(trans = .4)
library(caret)

dyn.load(paste("RPluMA", .Platform$dynlib.ext, sep=""))
source("RPluMA.R")


input <- function(inputfile) {
	pfix = prefix()
  parameters <<- read.table(inputfile, as.is=T);
  rownames(parameters) <<- parameters[,1];
   # Need to get the three files
   myData <<- readRDS(paste(pfix, parameters["train", 2], sep="/"))
   testing <<- read.csv(paste(pfix, parameters["test", 2], sep="/"))
}

run <- function() {}

output <- function(outputfile) {
	results <- predict(myData, testing, type="prob")
write.csv(results, outputfile)
}
