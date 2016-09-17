# Mixed effects logistic regression
# created by jdegen on Sep 17, 2016

setwd("/Users/titlis/cogsci/teaching/_2016/mem_tutorial/")
library(lme4)
library(languageR)
data(lexdec)

# What's the distribution of correct/incorrect responses?
table(lexdec$Correct)
prop.table(table(lexdec$Correct))

# Recall that R by default interprets factor levels in alphanumeric order:
contrasts(lexdec$Correct)

# Let's re-order levels to be predicting the log odds of a correct over an incorrect response
lexdec$Correct = factor(lexdec$Correct, levels=c("incorrect", "correct"))
contrasts(lexdec$Correct)

# We start with a simple model
m = glmer(Correct ~ Frequency + (1|Subject) + (1|Word), family="binomial", data=lexdec)
summary(m)

# 1. What is the interpretation of the coefficients?

# If we want to instead get the intercept for the grand mean, we need to center frequency first:
centered = cbind(lexdec,myCenter(lexdec[,c("Frequency","NativeLanguage","FamilySize")]))

m = glmer(Correct ~ cFrequency + (1|Subject) + (1|Word), family="binomial", data=centered)
summary(m)

# We can add additional predictors just as in the linear model
m = glmer(Correct ~ Frequency * NativeLanguage + FamilySize + (1|Subject) + (1|Word), family="binomial", data=lexdec)
summary(m)

m = glmer(Correct ~ cFrequency * cNativeLanguage + cFamilySize + (1|Subject) + (1|Word), family="binomial", data=centered)
summary(m)

