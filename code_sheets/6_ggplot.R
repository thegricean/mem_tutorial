# Using ggplot to visualize data
# created by jdegen on Sep 17, 2016

setwd("/Users/titlis/cogsci/teaching/_2016/mem_tutorial/")
source("code_sheets/helpers.R")
library(ggplot2)
library(languageR)
library(dplyr)
library(magrittr)
library(tidyr)
data(lexdec)

# Set the background to be white instead of gray.
theme_set(theme_bw())

# Histogram. It's always good to start out by visualizing your response distribution. 
ggplot(lexdec, aes(x=RT)) +
  geom_histogram() +
  xlab("Log-transformed lexical decision times") +
  ylab("Number of cases")

# To save a plot, use ggsave
ggsave(file="graphs/rt_histogram.pdf",width=5,height=4)

# Scatterplot with an added line. Empirical observations against model predictions.
m = lmer(RT ~ Frequency*NativeLanguage + FamilySize + (1+Frequency+FamilySize|Subject) + (1+NativeLanguage|Word),data=lexdec)
lexdec$PredictedRT = fitted(m)

ggplot(lexdec, aes(x=PredictedRT,y=RT)) +
  geom_point(size=.5) + 
  geom_abline(intercept=0,slope=1,color="red") +
  xlab("Model predicted log response times") +
  ylab("Empirical log response times") +

# Scatterplot with a linear smoother. RT as a function of frequency.
ggplot(lexdec, aes(x=Frequency,y=RT)) +
  geom_point() +
  geom_smooth(method="lm") +
  xlab("Log-transformed lemma frequency") +
  ylab("Log-transformed response time")

# Scatterplot with a linear smoothers plotted separately for each level of a variable, in manually adjusted colors. RT as a function of frequency, by native language.
ggplot(lexdec, aes(x=Frequency,y=RT,color=NativeLanguage)) +
  geom_point() +
  geom_smooth(method="lm") +
  scale_color_manual(values=c("orange","purple")) +
  xlab("Log-transformed lemma frequency") +
  ylab("Log-transformed response time")
  
# Barplot with error bars and overlaid jittered points using a second dataset. Mean untransformed RT by native language and individual RTs.
lexdec$rawRT = exp(lexdec$RT)
agr = lexdec %>%
  group_by(NativeLanguage) %>%
  summarise(MeanRT = mean(rawRT), CI.Low = ci.low(rawRT), CI.High = ci.high(rawRT)) %>%
  mutate(YMin = MeanRT - CI.Low, YMax = MeanRT + CI.High)

ggplot(agr, aes(x=NativeLanguage,y=MeanRT)) +
  geom_bar(stat="identity",fill="gray80",color="black") +
  geom_jitter(data=lexdec,aes(y=rawRT),alpha=.4,color="lightblue") +
  geom_errorbar(aes(ymin=YMin,ymax=YMax), width=.25) +
  xlab("Participants' native language") +
  ylab("Mean response time in ms")

# Faceted scatterplot. Log RT as a function of frequency by subject (individual variability in sensitivity to frequency).   
ggplot(lexdec, aes(x=Frequency,y=RT)) +
  geom_point() +
  geom_smooth(method="lm") +
  xlab("Log-transformed lemma frequency") +
  ylab("Log-transformed response time") +
  facet_wrap(~Subject) 

