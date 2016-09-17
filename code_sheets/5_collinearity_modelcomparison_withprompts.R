# Collinearity & model evaluation
# created by jdegen on Sep 17, 2016

setwd("/Users/titlis/cogsci/teaching/_2016/mem_tutorial/")
library(lme4)
library(languageR)
library(lmerTest)
data(lexdec)

# No significant effect of meanSize on RTs
m = lmer(RT ~ meanSize + (1|Word) + (1|Subject), data=lexdec)
summary(m)

# No significant effect of meanWeight on RTs either
m = lmer(RT ~ meanWeight + (1|Word) + (1|Subject), data=lexdec)
summary(m)

# The two predictors are highly correlated!
cor(lexdec$meanWeight,lexdec$meanSize)

# If both are included in the model, there are large and highly significant counter-directed effects of the two predictors:
m = lmer(RT ~ meanWeight + meanSize + (1|Word) + (1|Subject), data=lexdec)
summary(m)

# If we also include frequency, the effect disappears entirely
m = lmer(RT ~ meanWeight + meanSize + Frequency + (1|Word) + (1|Subject), data=lexdec)
summary(m)

# Hm... let's investigate.
pairscor.fnc(lexdec[,c("RT","meanWeight","meanSize","Frequency")])

# Model validation
lexdec$Fitted = fitted(m)
(cor(lexdec$RT,lexdec$Fitted))^2

# Goodness-of-fit-measures
m = glmer(Correct ~ Frequency * NativeLanguage + FamilySize + (1|Subject) + (1|Word), family="binomial", data=lexdec)
summary(m)

# Model comparison -- should we include random by-subject slopes for frequency?
m.1 = lmer(RT ~ Frequency + NativeLanguage + (1|Subject), data=lexdec)
summary(m.1)

m.2 = lmer(RT ~ Frequency + NativeLanguage + (1|Subject) + (1|Word), data=lexdec)
summary(m.2)

anova(m.1,m.2)

m.3 = lmer(RT ~ Frequency + NativeLanguage + (1+Frequency|Subject) + (1|Word), data=lexdec)
summary(m.3)

anova(m.2,m.3)

# Model comparison for dealing with collinearity
# Do model comparison for the models with meanWeight, meanSize, and Frequency (and sub-models), to determine which model is best.
...