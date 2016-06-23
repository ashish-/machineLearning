# KAGGLE COMPETITION - GETTING STARTED

# This script file is intended to help you get started on the Kaggle platform, and to show you how to make a submission to the competition.


# Let's start by reading the data into R
# Make sure you have downloaded these files from the Kaggle website, and have navigated to the directory where you saved the files on your computer

train = read.csv("train2016.csv")

test = read.csv("test2016.csv")

# We will just create a simple logistic regression model, to predict Party using all other variables in the dataset, except for the user ID:

SimpleMod = glm(Party ~ . -USER_ID, data=train, family=binomial)

# And then make predictions on the test set:

PredTest = predict(SimpleMod, newdata=test, type="response")
	
threshold = 0.48



PredTestLabels = as.factor(ifelse(PredTest<threshold, "Democrat", "Republican"))

# table(test$Party , PredTestLabels)

# However, you can submit the file on Kaggle to see how well the model performs. You can make up to 5 submissions per day, so don't hesitate to just upload a solution to see how you did.

# Let's prepare a submission file for Kaggle (for more about this, see the "Evaluation" page on the competition site):

MySubmission = data.frame(USER_ID = test$USER_ID, PREDICTION = PredTestLabels)

write.csv(MySubmission, "SubmissionSimpleLog.csv", row.names=FALSE)

# You should upload the submission "SubmissionSimpleLog.csv" on the Kaggle website to use this as a submission to the competition

# This model was just designed to help you get started - to do well in the competition, you will need to build better models!

election = read.csv("train2016.csv")
library(caTools)
set.seed(1000)
split = sample.split(election$Party , SplitRatio=0.65)
train = subset(election, split == TRUE)
test = subset(election, split == FALSE)

SimpleMod = glm(Party ~ . -USER_ID, data=train, family=binomial)
PredTest = predict(SimpleMod, newdata = test, type = "response")
PredTestLables = as.factor(ifelse(PredTest < 0.48,"Democrat", "Republican"))
table(test$Party , PredTestLables)



