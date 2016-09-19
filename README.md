# Rutgers Statistics Workshop: Mixed Effects Models for Linguists
Materials created by Judith Degen, drawing on materials by Florian Jaeger, Maureen Gillespie, Peter Graff, Dave Kleinschmidt, Roger Levy, and Victor Kuperman

# Lecturer

[Judith Degen](https://sites.google.com/site/judithdegen/) -- *jdegen@stanford.edu*

# Description

The workshop is geared towards linguists interested in analyzing data from various types of experiments (truth-value judgments, Likert scale judgments, response times, reading times, etc). We'll be focusing on regression methods, in particular mixed effects models, which have proven to be a powerful tool for analyzing linguistic data (see also Harald Baayen's book "Analyzing Linguistic Data", linked below). To get the most out of it in the short amount of time, the workshop contains a large hands-on component in which participants will have the opportunity to analyze existing datasets and bring their own.

# Preparation

We will be using R in this course. To get the most out of it, please bring your laptop and come with [R](https://www.r-project.org/) and [RStudio](https://www.rstudio.com/) installed.

If you have never used R before, I recommend working through chapters 1, 2, 4, and 5 of the Introduction to R on https://www.datacamp.com/home -- it sounds like a lot, but each "chapter" is actually just a few short exercises, and it'll get you used to writing basic R code. 

# Schedule 

Apart from the very first session (and food sessions...) the workshop will consist of a mix of lectures on my part interwoven with practical exercises so everyone can get their hands dirty with data after the introduction of any new concept. On the first day we'll be focusing on the general concept of regression and its simplest instantiation, (mixed effects) linear regression for continuous data (e.g., response times, reading times, slider ratings). On the second day we'll turn to logistic regression for binary data (e.g., truth-value judgment data or any other binary choice) and ordinal regression ...for ordinal data (e.g., Likert scale ratings). I also want to spend a significant amount of time on data visualization with ggplot.

I'll be adding code sheets here for participants to follow along with as I finalize them.

When       | What               | Where | Slides / Readings / Resources
---------- | ------------------ | ----- | -----------------------------
Fri 9:30-10 | Breakfast | Linguistics Department porch or hallway |
Fri 10 - 10:30 | Workshop overview | Room 108 | [slides](slides/1_overview.pdf)
Fri 11 - 12 | R basics and linear regression | Room 108 | [slides](slides/2_linear_regression.pdf) / [code](code_sheets/1_linear_regression_withprompts.R) / [solutions](http://rpubs.com/thegricean/209611)
Fri 12 - 1 | Lunch | Linguistics Department  |
Fri 1 - 3 | Mixed effects linear regression | Language Lab next door to Linguistics Department | [slides](slides/3_mixed_effects_lm.pdf) / [code](code_sheets/2_mixed_effects_linear_regression.R)
Fri 3 - 5:30 | Individual meetings / bring your own dataset! | Language Lab or Department Basement |
Fri 5:30 - 8 | Dinner | Linguistics Department Basement |
Sat 9:30 - 10 | Breakfast | Linguistics Department porch or hallway |
Sat 10 - 11 | Data wrangling in R | Room 108 | [code](code_sheets/3_reformatting_data.R)
Sat 11 - 12 | Mixed effects logistic regression  | Room 108 | [slides](slides/4_mixed_effects_logistic_regression.pdf) / [code](code_sheets/4_mixed_effects_logistic_regression.R )
Sat 12 - 1 | Lunch | Linguistics Department |
Sat 1 - 2 | Common issues in MEMs & solutions | Room 108 | [code](code_sheets/5_collinearity_modelcomparison.R)
Sat 2 - 3 | Visualizing your data: mastering ggplot | Room 108 | [slides](slides/6_visualization_ggplot.pdf) / [code](code_sheets/6_ggplot.R)

# Resources

## Books

- The Bible of mixed effects models: Gelman, A., & Hill, J. (2007). Data analysis using regression and multilevel/hierarchical models. Cambridge University Press.

- Baayen, R. H. (2008). [Analyzing linguistic data: A practical introduction to statistics using R](http://www.sfs.uni-tuebingen.de/~hbaayen/publications/baayenCUPstats.pdf). Cambridge University Press.

## Blogs / slides / lecture notes / videos / email lists

- Florian Jaeger's excellent collection of [resources for regression methods](https://wiki.bcs.rochester.edu/HlpLab/StatsCourses) (code sheets, slides, pointers to further resources)  on his HLPLab wiki. This includes Maureen Gillespie's tutorial on [how to code your predictors](https://wiki.bcs.rochester.edu/HlpLab/StatsCourses?action=AttachFile&do=view&target=gillespie-tutorial.pdf) to test different kinds of hypothesis.

- Shravan Vasishth's excellent [statistics lecture notes](https://github.com/vasishth/Statistics-lecture-notes-Potsdam/blob/master/IntroductoryStatistics/StatisticsNotesVasishth.pdf) on his statistics [github site](https://github.com/vasishth/Statistics-lecture-notes-Potsdam)

- Andrew Ng's excellent Coursera course on Machine Learning for great video explanations of linear and logistic regression. You can also just watch the youtube videos directly, e.g. [this one](https://www.youtube.com/watch?v=n1qyTXRdWQg) which explains the very basics of linear regression.

- In class we didn't get to ordinal or multinomial regression. [Here](https://cran.r-project.org/web/packages/ordinal/vignettes/clmm2_tutorial.pdf) is Rune Haubo Christensen's on ordinal regression (for ordinal data like Likert Scale ratings). [Here](http://www.ats.ucla.edu/stat/r/dae/mlogit.htm) is a tutorial on multinomial regression (for unordered categorical data with more than 2 levels, like the choice between referring to a referent by a name, a pronoun, or a definite description).

- Subscribe to the [ling-R-lang](https://mailman.ucsd.edu/mailman/listinfo/ling-r-lang-l) list

- In R: try `?foo`

- [Data wrangling with R cheatsheet](https://www.rstudio.com/wp-content/uploads/2015/02/data-wrangling-cheatsheet.pdf)

## Papers

The debate on how to choose a random effects structure:

Barr, D. J., Levy, R., Scheepers, C., & Tily, H. J. (2013). [Random effects structure for confirmatory hypothesis testing: Keep it maximal](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC3881361/). Journal of memory and language, 68(3), 255-278.

Bates, D., Kliegl, R., Vasishth, S., & Baayen, H. (2015). [Parsimonious mixed models](http://arxiv.org/pdf/1506.04967.pdf). arXiv preprint arXiv:1506.04967. 

Why mixed effects logistic regression is preferable to ANOVAs over proportions:

Jaeger, T. F. (2008). [Categorical data analysis: Away from ANOVAs (transformation or not) and towards logit mixed models](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC2613284/). Journal of Memory and Language, 59(4), 434-446.
