# Experiments and Quasi-Experiments

- Primary Source URL: https://bookdown.org/machar1991/ITER/13-eaqe.html
- Imported on: 2026-03-23
- Component pages: 5

## Source Components

1. `13 Experiments and Quasi-Experiments` - https://bookdown.org/machar1991/ITER/13-eaqe.html
2. `13.1 Potential Outcomes, Causal Effects and Idealized Experiments` - https://bookdown.org/machar1991/ITER/13-1-potential-outcomes-causal-effects-and-idealized-experiments.html
3. `13.2 Threats to Validity of Experiments` - https://bookdown.org/machar1991/ITER/13-2-threats-to-validity-of-experiments.html
4. `13.3 Experimental Estimates of the Effect of Class Size Reductions` - https://bookdown.org/machar1991/ITER/13-3-experimental-estimates-of-the-effect-of-class-size-reductions.html
5. `13.4 Quasi Experiments` - https://bookdown.org/machar1991/ITER/13-4-quasi-experiments.html

## Compiled Content

## 13 Experiments and Quasi-Experiments

This chapter discusses statistical tools that are commonly applied in program evaluation, where interest lies in measuring the causal effects of programs, policies or other interventions. An optimal research design for this purpose is what statisticians call an ideal randomized controlled experiment. The basic idea is to randomly assign subjects to two different groups, one that receives the treatment (the treatment group) and one that does not (the control group) and to compare outcomes for both groups in order to get an estimate of the average treatment effect.

Such experimental data is fundamentally different from observational data. For example, one might use a randomized controlled experiment to measure how much the performance of students in a standardized test differs between two classes where one has a “regular”" student-teacher ratio and the other one has fewer students. The data produced by such an experiment would be different from, e.g., the observed cross-section data on the students’ performance used throughout Chapters 4 to 8 where class sizes are not randomly assigned to students but instead are the results of an economic decision where educational objectives and budgetary aspects were balanced.

For economists, randomized controlled experiments are often difficult or even indefeasible to implement. For example, due to ethic, moral and legal reasons it is practically impossible for a business owner to estimate the causal effect on the productivity of workers of setting them under psychological stress using an experiment where workers are randomly assigned either to the treatment group that is under time pressure or to the control group where work is under regular conditions, at best without knowledge of being in an experiment (see the box The Hawthorne Effect on p. 528 of the book).

However, sometimes external circumstances produce what is called a quasi-experiment or natural experiment. This “as if” randomness allows for estimation of causal effects that are of interest for economists using tools which are very similar to those valid for ideal randomized controlled experiments. These tools draw heavily on the theory of multiple regression and also on IV regression (see Chapter 12). We will review the core aspects of these methods and demonstrate how to apply them in R using the STAR data set (see the description of the data set).

The following packages and their dependencies are needed for reproduction of the code chunks presented throughout this chapter:

- AER (Christian Kleiber & Zeileis, 2017)

- dplyr (Wickham et al., 2018)

- MASS (Ripley, 2018)

- mvtnorm (Genz et al., 2018)

- rddtools (Stigler & Quast, 2015)

- scales (Wickham, 2017)

- stargazer (Hlavac, 2018)

- tidyr (Wickham & Henry, 2018)

Make sure the following code chunk runs without any errors.

```r
library(AER)
library(dplyr)
library(MASS)
library(mvtnorm)
library(rddtools)
library(scales)
library(stargazer)
library(tidyr)
```

### References

Kleiber, C., & Zeileis, A. (2017). AER: Applied Econometrics with R (Version 1.2-5). Retrieved from https://CRAN.R-project.org/package=AER

Wickham, H., François, R., Henry, L., & Müller, K. (2018). dplyr: A Grammar of Data Manipulation (Version 0.7.6). Retrieved from https://CRAN.R-project.org/package=dplyr

Ripley, B. (2018). MASS: Support Functions and Datasets for Venables and Ripley’s MASS (Version 7.3-50). Retrieved from https://CRAN.R-project.org/package=MASS

Genz, A., Bretz, F., Miwa, T., Mi, X., & Hothorn, T. (2018). mvtnorm: Multivariate Normal and t Distributions (Version 1.0-8). Retrieved from https://CRAN.R-project.org/package=mvtnorm

Stigler, M., & Quast, B. (2015). rddtools: Toolbox for Regression Discontinuity Design (’RDD’) (Version 0.4.0). Retrieved from https://CRAN.R-project.org/package=rddtools

Wickham, H. (2017). scales: Scale Functions for Visualization (Version 0.5.0). Retrieved from https://CRAN.R-project.org/package=scales

Hlavac, M. (2018). stargazer: Well-Formatted Regression and Summary Statistics Tables (Version 5.2.2). Retrieved from https://CRAN.R-project.org/package=stargazer

Wickham, H., & Henry, L. (2018). tidyr: Easily Tidy Data with’spread()’ and’gather()’ Functions (Version 0.8.1). Retrieved from https://CRAN.R-project.org/package=tidyr

## 13.1 Potential Outcomes, Causal Effects and Idealized Experiments

We now briefly recap the idea of the average causal effect and how it can be estimated using the differences estimator. We advise you to work through Chapter 13.1 of the book for a better understanding.

#### Potential Outcomes and the average causal effect

A potential outcome is the outcome for an individual under a potential treatment. For this individual, the causal effect of the treatment is the difference between the potential outcome if the individual receives the treatment and the potential outcome if she does not. Since this causal effect may be different for different individuals and it is not possible to measure the causal effect for a single individual, one is interested in studying the average causal effect of the treatment, hence also called the average treatment effect.

In an ideal randomized controlled experiment the following conditions are fulfilled:

- The subjects are selected at random from the population.

- The subjects are randomly assigned to treatment and control group.

Condition 1 guarantees that the subjects’ potential outcomes are drawn randomly from the same distribution such that the expected value of the causal effect in the sample is equal to the average causal effect in the distribution. Condition 2 ensures that the receipt of treatment is independent from the subjects’ potential outcomes. If both conditions are fulfilled, the expected causal effect is the expected outcome in the treatment group minus the expected outcome in the control group. Using conditional expectations we have \[\text{Average causal effect} = E(Y_i\vert X_i=1) - E(Y_i\vert X_i=0),\] where \(X_i\) is a binary treatment indicator.

The average causal effect can be estimated using the differences estimator, which is nothing but the OLS estimator in the simple regression model
\[\begin{align}
Y_i = \beta_0 + \beta_1 X_i + u_i \ \, \ \ i=1,\dots,n, \tag{13.1}
\end{align}\]
where random assignment ensures that \(E(u_i\vert X_i) = 0\).

The OLS estimator in the regression model
\[\begin{align}
Y_i = \beta_0 + \beta_1 X_i + \beta_2 W_{1i} + \dots + \beta_{1+r} W_{ri} + u_i \ \, \ \ i=1,\dots,n \tag{13.2}
\end{align}\]
with additional regressors \(W_1,\dots,W_r\) is called the differences estimator with additional regressors. It is assumed that treatment \(X_i\) is randomly assigned so that it is independent of the the pretreatment characteristic \(W_i\). This is assumption is called conditional mean independence and implies \[E(u_i\vert X_i, W_i) = E(u_i\vert W_i) = 0,\] so the conditional expectation of the error \(u_i\) given the treatment indicator \(X_i\) and the pretreatment characteristic \(W_i\) does not depend on the \(X_i\). Conditional mean independence replaces the first least squares assumption in Key Concept 6.4 and thus ensures that the differences estimator of \(\beta_1\) is unbiased. The differences estimator with additional regressors is more efficient than the differences estimator if the additional regressors explain some of the variation in the \(Y_i\).

## 13.2 Threats to Validity of Experiments

The concepts of internal and external validity discussed in Key Concept 9.1 are also applicable for studies based on experimental and quasi-experimental data. Chapter 13.2 of the book provides a thorough explanation of the particular threats to internal and external validity of experiments including examples. We limit ourselves to a short repetition of the threats listed there. Consult the book for a more detailed explanation.

#### Threats to Internal Validity

- Failure to Randomize If the subjects are not randomly assigned to the treatment group, then the outcomes will be contaminated with the effect of the subjects’ individual characteristics or preferences and it is not possible to obtain an unbiased estimate of the treatment effect. One can test for nonrandom assignment using a significance test (\(F\) -Test) on the coefficients in the regression model \[X_i = \beta_0 + \beta_1 W_{1i} + \dots +\beta_2 W_{ri} + u_i \ \, \ \ i=1,\dots,n.\]

- Failure to Follow the Treatment Protocol If subjects do not follow the treatment protocol, i.e., some subjects in the treatment group manage to avoid receiving the treatment and/or some subjects in the control group manage to receive the treatment (partial compliance), there is correlation between \(X_i\) und \(u_i\) such that the OLS estimator of the average treatment effect will be biased. If there are data on both treatment actually recieved (\(X_i\)) and initial random assignment (\(Z_i\)), IV regression of the models (13.1) and (13.2) is a remedy.

- Attrition Attrition may result in a nonrandomly selected sample. If subjects systematically drop out of the study after beeing assigned to the control or the treatment group (systematic means that the reason of the dropout is related to the treatment) there will be correlation between \(X_i\) and \(u_i\) and hence bias in the OLS estimator of the treatment effect.

- Experimental Effects If human subjects in treatment group and/or control group know that they are in an experiment, they might adapt their behaviour in a way that prevents unbiased estimation of the treatment effect.

- Small Sample Sizes As we know from the theory of linear regression, small sample sizes lead to imprecise estimation of the coefficients and thus imply imprecise estimation of the causal effect. Furthermore, confidence intervals and hypothesis test may produce wrong inference when the sample size is small.

#### Threats to External Validity

- Nonrepresentative Sample If the population studied and the population of interest are not sufficiently similar, there is no justification in generalizing the results.

- Nonrepresentative Program or Policy If the program or policy for the population studied differs considerably from the program (to be) applied to population(s) of interest, the results cannot be generalized. For example, a small-scale programm with low funding might have different effects than a widely available scaled-up program that is actually implemented. There are other factors like duration and the extent of monitoring that should be considered here.

- General Equilibrium Effects If market and/or environmental conditions cannot be kept constant when an internally valid program is implemented broadly, external validity may be doubtful.

## 13.3 Experimental Estimates of the Effect of Class Size Reductions

### Experimental Design and the Data Set

The Project Student-Teacher Achievement Ratio (STAR) was a large randomized controlled experiment with the aim of asserting whether a class size reduction is effective in improving education outcomes. It has been conducted in 80 Tennessee elementary schools over a period of four years during the 1980s by the State Department of Education.

In the first year, about 6400 students were randomly assigned into one of three interventions: small class (13 to 17 students per teacher), regular class (22 to 25 students per teacher), and regular-with-aide class (22 to 25 students with a full-time teacher’s aide). Teachers were also randomly assigned to the classes they taught. The interventions were initiated as the students entered school in kindergarten and continued through to third grade. Control and treatment groups across grades are summarized in Table 13.1.

Table 13.1: Control and treatment groups in the STAR experiment

K
1
2
3

Treatment 1
Small class
Small class
Small class
Small class

Treatment 2
Regular class + aide
Regular class + aide
Regular class + aide
Regular class + aide

Control
Regular class
Regular class
Regular class
Regular class

Each year, the students’ learning progress was assessed using the sum of the points scored on the math and reading parts of a standardized test (the Stanford Achievement Test).

The STAR data set is part of the package AER.

```r
# load the package AER and the STAR dataset
library(AER)
data(STAR)
```

head(STAR) shows that there is a variety of factor variables that describe student and teacher characteristics as well as various school indicators, all of which are separately recorded for the four different grades. The data is in wide format. That is, each variable has its own column and for each student, the rows contain observations on these variables. Using dim(STAR) we find that there are a total of 11598 observations on 47 variables.

```r
# get an overview
head(STAR, 2)
```

```r
## gender ethnicity birth stark star1 star2 star3 readk read1 read2
## 1122 female afam 1979 Q3 regular NA NA NA
## 1137 female cauc 1980 Q1 small small small small 447 507 568
## read3 mathk math1 math2 math3 lunchk lunch1 lunch2 lunch3 schoolk
## 1122 580 NA NA NA 564 free
## 1137 587 473 538 579 593 non-free free non-free free rural
## school1 school2 school3 degreek degree1 degree2 degree3 ladderk
## 1122 suburban bachelor
## 1137 rural rural rural bachelor bachelor bachelor bachelor level1
## ladder1 ladder2 ladder3 experiencek experience1 experience2
## 1122 level1 NA NA NA
## 1137 level1 apprentice apprentice 7 7 3
## experience3 tethnicityk tethnicity1 tethnicity2 tethnicity3 systemk
## 1122 30 cauc
## 1137 1 cauc cauc cauc cauc 30
## system1 system2 system3 schoolidk schoolid1 schoolid2 schoolid3
## 1122 22 54
## 1137 30 30 30 63 63 63 63
```

```r
dim(STAR)
```

```r
## [1] 11598 47
```

```r
# get variable names
names(STAR)
```

```r
## [1] "gender" "ethnicity" "birth" "stark" "star1"
## [6] "star2" "star3" "readk" "read1" "read2"
## [11] "read3" "mathk" "math1" "math2" "math3"
## [16] "lunchk" "lunch1" "lunch2" "lunch3" "schoolk"
## [21] "school1" "school2" "school3" "degreek" "degree1"
## [26] "degree2" "degree3" "ladderk" "ladder1" "ladder2"
## [31] "ladder3" "experiencek" "experience1" "experience2" "experience3"
## [36] "tethnicityk" "tethnicity1" "tethnicity2" "tethnicity3" "systemk"
## [41] "system1" "system2" "system3" "schoolidk" "schoolid1"
## [46] "schoolid2" "schoolid3"
```

A majority of the variable names contain a suffix (k, 1, 2 or 3) stating the grade which the respective variable is referring to. This facilitates regression analysis because it allows to adjust the formula argument in lm() for each grade by simply changing the variables’ suffixes accordingly.

The outcome produced by head() shows that some values recorded are NA and, i.e., there is no data on this variable for the student under consideration. This lies in the nature of the data: for example, take the first observation STAR[1,].

In the output of head(STAR, 2) we find that the student entered the experiment in third grade in a regular class, which is why the class size is recorded in star3 and the other class type indicator variables are. For the same reason there are no recordings of her math and reading score but for the third grade. It is straightforward to only get her non- NA / recordings: simply drop the NA s using!is.na().

```r
# drop NA recordings for the first observation and print to the console
STAR[1, !is.na(STAR[1, ])]
```

```r
## gender ethnicity birth star3 read3 math3 lunch3 school3 degree3
## 1122 female afam 1979 Q3 regular 580 564 free suburban bachelor
## ladder3 experience3 tethnicity3 system3 schoolid3
## 1122 level1 30 cauc 22 54
```

is.na(STAR[1,]) returns a logical vector with TRUE at positions that correspond to entries for the first observation. The! operator is used to invert the result such that we obtain only non- entries for the first observations.

In general it is not necessary to remove rows with missing data because lm() does so by default. Missing data may imply a small sample size and thus may lead to imprecise estimation and wrong inference This is, however, not an issue for the study at hand since, as we will see below, sample sizes lie beyond 5000 observations for each regression conducted.

### Analysis of the STAR Data

As can be seen from Table 13.1 there are two treatment groups in each grade, small classes with only 13 to 17 students and regular classes with 22 to 25 students and a teaching aide. Thus, two binary variables, each being an indicator for the respective treatment group, are introduced for the differences estimator to capture the treatment effect for each treatment group separately. This yields the population regression model
\[\begin{align}
Y_i = \beta_0 + \beta_1 SmallClass_i + \beta_2 RegAide_i + u_i, \tag{13.3}
\end{align}\]
with test score \(Y_i\), the small class indicator \(SmallClass_i\) and \(RegAide_i\), the indicator for a regular class with aide.

We reproduce the results presented in Table 13.1 of the book by performing the regression (13.3) for each grade separately. For each student, the dependent variable is simply the sum of the points scored in the math and reading parts, constructed using I().

```r
# compute differences Estimates for each grades
fmk

```r
# obtain coefficient matrix using robust standard errors
coeftest(fmk, vcov = vcovHC, type= "HC1")
```

```r
## t test of coefficients:
## Estimate Std. Error t value Pr(>|t|)
## (Intercept) 918.04289 1.63339 562.0473
```r
coeftest(fm1, vcov = vcovHC, type= "HC1")
```

```r
## t test of coefficients:
## Estimate Std. Error t value Pr(>|t|)
## (Intercept) 1039.3926 1.7846 582.4321
```r
coeftest(fm2, vcov = vcovHC, type= "HC1")
```

```r
## t test of coefficients:
## Estimate Std. Error t value Pr(>|t|)
## (Intercept) 1157.8066 1.8151 637.8820
```r
coeftest(fm3, vcov = vcovHC, type= "HC1")
```

```r
## t test of coefficients:
## Estimate Std. Error t value Pr(>|t|)
## (Intercept) 1228.50636 1.68001 731.2483
```r
# compute robust standard errors for each model and gather them in a list
rob_se_1

```r
library(stargazer)

stargazer(fmk,fm1,fm2,fm3,
title = "Project STAR: Differences Estimates",
header = FALSE,
type = "latex",
model.numbers = F,
omit.table.layout = "n",
digits = 3,
column.labels = c("K", "1", "2", "3"),
dep.var.caption = "Dependent Variable: Grade",
dep.var.labels.include = FALSE,
se = rob_se_1)
```

Dependent Variable: Grade

K 1 2 3
starksmall 13.90 ***
(2.45)

starkregular+aide 0.31
(2.27)

star1small 29.78 ***
(2.83)

star1regular+aide 11.96 ***
(2.65)

star2small 19.39 ***
(2.71)

star2regular+aide 3.48
(2.54)

star3small 15.59

star3regular+aide -0.29

Constant 918.04 *** 1,039.39 *** 1,157.81 *** 1,228.51 ***
(1.63) (1.78) (1.82) (1.82)

Observations 5,786 6,379 6,049 5,967
R 2 0.01 0.02 0.01 0.01
Adjusted R 2 0.01 0.02 0.01 0.01
Residual Std. Error 73.49 (df = 5783) 90.50 (df = 6376) 83.69 (df = 6046) 72.91 (df = 5964)
F Statistic 21.26 *** (df = 2; 5783) 56.34 *** (df = 2; 6376) 28.71 *** (df = 2; 6046) 30.25 *** (df = 2; 5964)

Table 13.2: Project STAR - Differences Estimates

The estimates presented in Table 13.2 suggest that the class size reduction improves student performance. Except for grade 1, the estimates of the coefficient on \(SmallClass\) are roughly of the same magnitude (the estimates lie between 13.90 and 19.39 points) and they are statistically significant at \(1\%\). Furthermore, a teaching aide has little, possibly zero, effect on the performance of the students.

Following the book, we augment the regression model (13.3) by different sets of regressors for two reasons:

- If the additional regressors explain some of the observed variation in the dependent variable, we obtain more efficient estimates of the coefficients of interest.

- If the treatment is not received at random due to failures to follow the treatment protocol (see Chapter 13.3 of the book), the estimates obtained using (13.3) may be biased. Adding additional regressors may solve or mitigate this problem.

In particular, we consider the following student and teacher characteristics

- \(experience\) — Teacher’s years of experience

- \(boy\) — Student is a boy (dummy)

- \(lunch\) — Free lunch eligibility (dummy)

- \(black\) — Student is African-American (dummy)

- \(race\) — Student’s race is other than black or white (dummy)

- \(\text{schoolid}\) — School indicator variables

in the four population regression specifications
\[\begin{align}
Y_i =& \beta_0 + \beta_1 SmallClass_i + \beta_2 RegAide_i + u_i, \tag{13.4} \\
Y_i =& \beta_0 + \beta_1 SmallClass_i + \beta_2 RegAide_i + \beta_3 experience_i + u_i, \tag{13.5} \\
Y_i =& \beta_0 + \beta_1 SmallClass_i + \beta_2 RegAide_i + \beta_3 experience_i + schoolid + u_i, \tag{13.6}
\end{align}\]
and
\[\begin{align}
Y_i =& \beta_0 + \beta_1 SmallClass_i + \beta_2 RegAide_i + \beta_3 experience_i + \beta_4 boy + \beta_5 lunch \\
& + \beta_6 black + \beta_7 race + schoolid + u_i. \tag{13.7}
\end{align}\]
Prior to estimation, we perform some subsetting and data wrangling using functions from the packages dplyr and tidyr. These are both part of tidyverse, a collection of R packages designed for data science and handling big datasets (see the official site for more on tidyverse packages). The functions%>%, transmute() and mutate() are sufficient for us here:

-%>% allows to chain function calls.

- transmute() allows to subset the data set by naming the variables to be kept.

- mutate() is convenient for adding new variables based on existing ones while preserving the latter.

The regression models (13.4) to (13.7) require the variables gender, ethnicity, stark, readk, mathk, lunchk, experiencek and schoolidk. After dropping the remaining variables using transmute(), we use mutate() to add three additional binary variables which are derivatives of existing ones: black, race and boy. They are generated using logical statements within the function ifelse().

```r
# load packages 'dplyr' and 'tidyr' for data wrangling functionalities
library(dplyr)
library(tidyr)

# generate subset with kindergarten data
STARK %
transmute(gender,
ethnicity,
stark,
readk,
mathk,
lunchk,
experiencek,
schoolidk) %>%
mutate(black = ifelse(ethnicity == "afam", 1, 0),
race = ifelse(ethnicity == "afam" | ethnicity == "cauc", 1, 0),
boy = ifelse(gender == "male", 1, 0))
```

```r
# estimate the models
gradeK1
For brevity, we exclude the coefficients for the indicator dummies in coeftest() ’s output by subsetting the matrices.

```r
# obtain robust inference on the significance of coefficients
coeftest(gradeK1, vcov. = vcovHC, type = "HC1")
```

```r
## t test of coefficients:
## Estimate Std. Error t value Pr(>|t|)
## (Intercept) 904.72124 2.22235 407.1020
```r
coeftest(gradeK2, vcov. = vcovHC, type = "HC1")[1:4, ]
```

```r
## Estimate Std. Error t value Pr(>|t|)
## (Intercept) 925.6748750 7.6527218 120.9602155 0.000000e+00
## starksmall 15.9330822 2.2411750 7.1092540 1.310324e-12
## starkregular+aide 1.2151960 2.0353415 0.5970477 5.504993e-01
## experiencek 0.7431059 0.1697619 4.3773429 1.222880e-05
```

```r
coeftest(gradeK3, vcov. = vcovHC, type = "HC1")[1:7, ]
```

```r
## Estimate Std. Error t value Pr(>|t|)
## (Intercept) 937.6831330 14.3726687 65.2407117 0.000000e+00
## starksmall 15.8900507 2.1551817 7.3729516 1.908960e-13
## starkregular+aide 1.7869378 1.9614592 0.9110247 3.623211e-01
## experiencek 0.6627251 0.1659298 3.9940097 6.578846e-05
## boy -12.0905123 1.6726331 -7.2284306 5.533119e-13
## lunchkfree -34.7033021 1.9870366 -17.4648529 1.437931e-66
## black -25.4305130 3.4986918 -7.2685776 4.125252e-13
```

We now use stargazer() to gather all relevant information in a structured table.

```r
# compute robust standard errors for each model and gather them in a list
rob_se_2

```r
stargazer(fmk, fm1, fm2, fm3,
title = "Project STAR - Differences Estimates with
Additional Regressors for Kindergarten",
header = FALSE,
type = "latex",
model.numbers = F,
omit.table.layout = "n",
digits = 3,
column.labels = c("(1)", "(2)", "(3)", "(4)"),
dep.var.caption = "Dependent Variable: Test Score in Kindergarten",
dep.var.labels.include = FALSE,
se = rob_se_2)
```

Dependent Variable: Test Score in Kindergarten

(1) (2) (3) (4)
starksmall 13.899 *** 14.006 *** 15.933 *** 15.890 ***
(2.454) (2.447) (2.241) (2.155)

starkregular+aide 0.314 -0.601 1.215 1.787
(2.271) (2.254) (2.035) (1.961)

experiencek 1.469 *** 0.743 *** 0.663 ***
(0.169) (0.170) (0.166)

boy -12.091 ***
(1.673)

lunchkfree -34.703 ***
(1.987)

black -25.431 ***
(3.499)

race 8.501
(12.520)

Constant 918.043 *** 904.721 *** 925.675 *** 937.683 ***
(1.633) (2.222) (7.653) (14.373)

School indicators? no no yes yes
Observations 5,786 5,766 5,766 5,748
R 2 0.007 0.020 0.234 0.291
Adjusted R 2 0.007 0.020 0.223 0.281
Residual Std. Error 73.490 (df = 5783) 73.085 (df = 5762) 65.075 (df = 5684) 62.663 (df = 5662)
F Statistic 21.263 *** (df = 2; 5783) 39.861 *** (df = 3; 5762) 21.413 *** (df = 81; 5684) 27.364 *** (df = 85; 5662)

Table 13.3: Project STAR - Differences Estimates with Additional Regressors for Kindergarten

The results in column (1) of Table 13.3 just a repeat the results obtained for (13.3) . Columns (2) to (4) reveal that adding student characteristics and school fixed effects does not lead to substantially different estimates of the treatment effects. This result makes it more plausible that the estimates of the effects obtained using model (13.3) do not suffer from failure of random assignment. There is some decrease in the standard errors and some increase in \(\bar{R}^2\) , implying that the estimates are more precise.

Because teachers were randomly assigned to classes, inclusion of school fixed effect allows us to estimate the causal effect of a teacher’s experience on test scores of students in kindergarten. Regression (3) predicts the average effect of 10 years experience on test scores to be \(10\cdot 0.74=7.4\) points. Be aware that the other estimates on student characteristics in regression (4) do not have causal interpretation due to nonrandom assignment (see Chapter 13.3 of the book for a detailed discussion).

Are the estimated effects presented in Table 13.3 large or small in a practical sense? Let us translate the predicted changes in test scores to units of standard deviation in order to allow for a comparison (see Section 9.4 for a similar argument).

```r
# compute the sample standard deviations of test scores
SSD
It is fairly easy to turn the data.frame df into a table.

```r
# generate a simple table using stargazer
stargazer(df,
title = "Estimated Class Size Effects
(in Units of Standard Deviations)",
type = "html",
summary = FALSE,
header = FALSE
)
```

K 1 2 3
Small 0.190 0.330 0.230 0.210
SmallSE 0.030 0.030 0.030 0.040
RegAide 0 0.130 0.040 0
RegAideSE 0.030 0.030 0.030 0.030
SSD 73.750 91.280 84.080 73.270

Table 13.4: Estimated Class Size Effects (in Units of Standard Deviations)

The estimated effect of a small classes is largest for grade 1. As pointed out in the book, this is probably because students in the control group for grade 1 did poorly on the test for some unknown reason or simply due to random variation. The difference between the estimated effect of being in a small class and being in a regular classes with an aide is roughly 0.2 standard deviations for all grades. This leads to the conclusion that the effect of being in a regular sized class with an aide is zero and the effect of being in a small class is roughly the same for all grades.

The remainder of Chapter 13.3 in the book discusses to what extent these experimental estimates are comparable with observational estimates obtained using data on school districts in California and Massachusetts in Chapter 9. It turns out that the estimates are indeed very similar. Please refer to the aforementioned section in the book for a more detailed discussion.

## 13.4 Quasi Experiments

In quasi-experiments, “as if” randomness is exploited to use methods similar to those that have been discussed in the previous chapter. There are two types of quasi-experiments: 9

- Random variations in individual circumstances allow to view the treatment “as if” it was randomly determined.

- The treatment is only partially determined by “as if” random variation.

The former allows to estimate the effect using either model (13.2), i.e., the difference estimator with additional regressors, or, if there is doubt that the “as if” randomness does not entirely ensure that there are no systematic differences between control and treatment group, using the differences-in-differences (DID) estimator. In the latter case, an IV approach for estimation of a model like (13.2) which uses the source of “as if” randomness in treatment assignment as the instrument may be applied.

Some more advanced techniques that are helpful in settings where the treatment assignment is (partially) determined by a threshold in a so-called running variable are sharp regression discontinuity design (RDD) and fuzzy regression discontinuity design (FRDD).

We briefly review these techniques and, since the book does not provide any empirical examples in this section, we will use our own simulated data in a minimal example to discuss how DID, RDD and FRDD can be applied in R.

### The Differences-in-Differences Estimator

In quasi-experiments the source of “as if” randomness in treatment assignment can often not entirely prevent systematic differences between control and treatment groups. This problem was encountered by Card & Krueger (1994) who use geography as the “as if” random treatment assignment to study the effect on employment in fast-food restaurants caused by an increase in the state minimum wage in New Jersey in the year of 1992. Their idea was to use the fact that the increase in minimum wage applied to employees in New Jersey (treatment group) but not to those living in neighboring Pennsylvania (control group).

It is quite conceivable that such a wage hike is not correlated with other determinants of employment. However, there still might be some state-specific differences and thus differences between control and treatment group. This would render the differences estimator biased and inconsistent. Card & Krueger (1994) solved this by using a DID estimator: they collected data in February 1992 (before the treatment) and November 1992 (after the treatment) for the same restaurants and estimated the effect of the wage hike by analyzing differences in the differences in employment for New Jersey and Pennsylvania before and after the increase. 10 The DID estimator is

\[\begin{align}
\widehat{\beta}_1^{\text{diffs-in-diffs}} =& \, (\overline{Y}^{\text{treatment,after}} - \overline{Y}^{\text{treatment,before}}) - (\overline{Y}^{\text{control,after}} - \overline{Y}^{\text{control,before}}) \\
=& \Delta \overline{Y}^{\text{treatment}} - \Delta \overline{Y}^{\text{control}} \tag{13.8}
\end{align}\]
with

- \(\overline{Y}^{\text{treatment,before}}\) - the sample average in the treatment group before the treatment

- \(\overline{Y}^{\text{treatment,after}}\) - the sample average in the treatment group after the treatment

- \(\overline{Y}^{\text{treatment,before}}\) - the sample average in the control group before the treatment

- \(\overline{Y}^{\text{treatment,after}}\) - the sample average in the control group after the treatment.

We now use R to reproduce Figure 13.1 of the book.

```r
# initialize plot and add control group
plot(c(0, 1), c(6, 8),
type = "p",
ylim = c(5, 12),
xlim = c(-0.3, 1.3),
main = "The Differences-in-Differences Estimator",
xlab = "Period",
ylab = "Y",
col = "steelblue",
pch = 20,
xaxt = "n",
yaxt = "n")

axis(1, at = c(0, 1), labels = c("before", "after"))
axis(2, at = c(0, 13))

# add treatment group
points(c(0, 1, 1), c(7, 9, 11),
col = "darkred",
pch = 20)

# add line segments
lines(c(0, 1), c(7, 11), col = "darkred")
lines(c(0, 1), c(6, 8), col = "steelblue")
lines(c(0, 1), c(7, 9), col = "darkred", lty = 2)
lines(c(1, 1), c(9, 11), col = "black", lty = 2, lwd = 2)

# add annotations
text(1, 10, expression(hat(beta)[1]^{DID}), cex = 0.8, pos = 4)
text(0, 5.5, "s. mean control", cex = 0.8 , pos = 4)
text(0, 6.8, "s. mean treatment", cex = 0.8 , pos = 4)
text(1, 7.9, "s. mean control", cex = 0.8 , pos = 4)
text(1, 11.1, "s. mean treatment", cex = 0.8 , pos = 4)
```

The DID estimator (13.8) can also be written in regression notation: \(\widehat{\beta}_1^{\text{DID}}\) is the OLS estimator of \(\beta_1\) in
\[\begin{align}
\Delta Y_i = \beta_0 + \beta_1 X_i + u_i, \tag{13.9}
\end{align}\]
where \(\Delta Y_i\) denotes the difference in pre- and post-treatment outcomes of individual \(i\) and \(X_i\) is the treatment indicator.

Adding additional regressors that measure pre-treatment characteristics to (13.9) we obtain
\[\begin{align}
\Delta Y_i = \beta_0 + \beta_1 X_i + \beta_2 W_{1i} + \dots + \beta_{1+r} W_{ri} + u_i, \tag{13.10}
\end{align}\]
the difference-in-differences estimator with additional regressors. The additional regressors may lead to a more precise estimate of \(\beta_1\).

We keep things simple and focus on estimation of the treatment effect using DID in the simplest case, that is a control and a treatment group observed for two time periods — one before and one after the treatment. In particular, we will see that there are three different ways to proceed.

First, we simulate pre- and post-treatment data using R.

```r
# set sample size
n
Next plot the data. The function jitter() is used to add some artificial dispersion in the horizontal component of the points so that there is less overplotting. The function alpha() from the package scales allows to adjust the opacity of colors used in plots.

```r
library(scales)

pre

Observations from both the control and treatment group have a higher mean after the treatment but that the increase is stronger for the treatment group. Using DID we may estimate how much of that difference is due to the treatment.

It is straightforward to compute the DID estimate in the fashion of (13.8).

```r
# compute the DID estimator for the treatment effect 'by hand'
mean(y_post[TDummy == 1]) - mean(y_pre[TDummy == 1]) -
(mean(y_post[TDummy == 0]) - mean(y_pre[TDummy == 0]))
```

```r
## [1] 3.960268
```

Notice that the estimate is close to \(4\), the value chosen as the treatment effect TEffect above. Since (13.9) is a simple linear model, we may perform OLS estimation of this regression specification using lm().

```r
# compute the DID estimator using a linear model
lm(I(y_post - y_pre) ~ TDummy)
```

```r
## Call:
## lm(formula = I(y_post - y_pre) ~ TDummy)
## Coefficients:
## (Intercept) TDummy
## 2.104 3.960
```

We find that the estimates coincide. Furthermore, one can show that the DID estimate obtained by estimating specification (13.9) OLS is the same as the OLS estimate of \(\beta_{TE}\) in
\[\begin{align}
Y_i =& \beta_0 + \beta_1 D_i + \beta_2 Period_i + \beta_{TE} (Period_i \times D_i) \tag{13.11}
\end{align}\]
where \(D_i\) is the binary treatment indicator, \(Period_i\) is a binary indicator for the after-treatment period and the \(Period_i \times D_i\) is the interaction of both.

As for (13.9), estimation of (13.11) using R is straightforward. See Chapter 8 for a discussion of interaction terms.

```r
# prepare data for DID regression using the interaction term
d

```r
## Call:
## lm(formula = Y ~ Treatment * Period, data = d)
## Coefficients:
## (Intercept) Treatment Period2
## 5.858 1.197 2.104
## Treatment:Period2
## 3.960
```

As expected, the estimate of the coefficient on the interaction of the treatment dummy and the time dummy coincide with the estimates obtained using (13.8) and OLS estimation of (13.9) .

### Regression Discontinuity Estimators

Consider the model
\[\begin{align}
Y_i =& \beta_0 + \beta_1 X_i + \beta_2 W_i + u_i \tag{13.12}
\end{align}\]
and let
\[\begin{align*}
X_i =&
\begin{cases}
1, & W_i \geq c \\
0, & W_i < c
\end{cases}
\end{align*}\]
so that the receipt of treatment, \(X_i\) , is determined by some threshold \(c\) of a continuous variable \(W_i\) , the so called running variable. The idea of regression discontinuity design is to use observations with a \(W_i\) close to \(c\) for estimation of \(\beta_1\) . \(\beta_1\) is the average treatment effect for individuals with \(W_i = c\) which is assumed to be a good approximation to the treatment effect in the population. (13.12) is called a sharp regression discontinuity design because treatment assignment is deterministic and discontinuous at the cutoff: all observations with \(W_i
```r
# generate some sample data
W =0) + rnorm(1000)
```

```r
# load the package 'rddtools'
library(rddtools)

# construct rdd_data
data

The argument nbins sets the number of bins the running variable is divided into for aggregation. The dots represent bin averages of the outcome variable.

We may use the function rdd_reg_lm() to estimate the treatment effect using model (13.12) for the artificial data generated above. By choosing slope = “same” we restrict the slopes of the estimated regression function to be the same on both sides of the jump at the cutpoint \(W=0\).

```r
# estimate the sharp RDD model
rdd_mod

```r
## Call:
## lm(formula = y ~., data = dat_step1, weights = weights)
## Residuals:
## Min 1Q Median 3Q Max
## -3.2361 -0.6779 -0.0039 0.7113 3.0096
## Coefficients:
## Estimate Std. Error t value Pr(>|t|)
## (Intercept) 2.93889 0.07082 41.50

```r
# plot the RDD model along with binned observations
plot(rdd_mod,
cex = 0.35,
col = "steelblue",
xlab = "W",
ylab = "Y")
```

As above, the dots represent averages of binned observations.

So far we assumed that crossing of the threshold determines receipt of treatment so that the jump of the population regression functions at the threshold can be regarded as the causal effect of the treatment.

When crossing the threshold \(c\) is not the only cause for receipt of the treatment, treatment is not a deterministic function of \(W_i\). Instead, it is useful to think of \(c\) as a threshold where the probability of receiving the treatment jumps.

This jump may be due to unobservable variables that have impact on the probability of being treated. Thus, \(X_i\) in (13.12) will be correlated with the error \(u_i\) and it becomes more difficult to consistently estimate the treatment effect. In this setting, using a fuzzy regression discontinuity design which is based an IV approach may be a remedy: take the binary variable \(Z_i\) as an indicator for crossing of the threshold,
\[\begin{align*}
Z_i = \begin{cases}
1, & W_i \geq c \\
0, & W_i < c,
\end{cases}
\end{align*}\]
and assume that \(Z_i\) relates to \(Y_i\) only through the treatment indicator \(X_i\). Then \(Z_i\) and \(u_i\) are uncorrelated but \(Z_i\) influences receipt of treatment so it is correlated with \(X_i\). Thus, \(Z_i\) is a valid instrument for \(X_i\) and (13.12) can be estimated using TSLS.

The following code chunk generates sample data where observations with a value of the running variable \(W_i\) below the cutoff \(c=0\) do not receive treatment and observations with \(W_i \geq 0\) do receive treatment with a probability of \(80\%\) so that treatment status is only partially determined by the running variable and the cutoff. Treatment leads to an increase in \(Y\) by \(2\) units. Observations with \(W_i \geq 0\) that do not receive treatment are called no-shows: think of an individual that was assigned to receive the treatment but somehow manages to avoid it.

```r
library(MASS)

# generate sample data
mu
sapply() applies the function provided to FUN to every element of the argument X . Here, d$treatProb is a vector and the result is a vector, too.

We plot all observations and use blue color to mark individuals that did not receive the treatment and use red color for those who received the treatment.

```r
# generate a colored plot of treatment and control group
plot(d$W, d$Y,
col = c("steelblue", "darkred")[factor(fuzz)],
pch= 20,
cex = 0.5,
xlim = c(-3, 3),
ylim = c(-3.5, 5),
xlab = "W",
ylab = "Y")

# add a dashed vertical line at cutoff
abline(v = 0, lty = 2)
```

Obviously, receipt of treatment is no longer a deterministic function of the running variable \(W\) . Some observations with \(W\geq0\) did not receive the treatment. We may estimate a FRDD by additionally setting treatProb as the assignment variable z in rdd_data() . Then rdd_reg_lm() applies the following TSLS procedure: treatment is predicted using \(W_i\) and the cutoff dummy \(Z_i\) , the instrumental variable, in the first stage regression. The fitted values from the first stage regression are used to obtain a consistent estimate of the treatment effect using the second stage where the outcome \(Y\) is regressed on the fitted values and the running variable \(W\) .

```r
# estimate the Fuzzy RDD
data

```r
## ### RDD regression: parametric ###
## Polynomial order: 1
## Slopes: same
## Number of obs: 2000 (left: 999, right: 1001)
## Coefficient:
## Estimate Std. Error t value Pr(>|t|)
## D 1.981297 0.084696 23.393

```r
# plot estimated FRDD function
plot(frdd_mod,
cex = 0.5,
lwd = 0.4,
xlim = c(-4, 4),
ylim = c(-3.5, 5),
xlab = "W",
ylab = "Y")
```

What if we used a SRDD instead, thereby ignoring the fact that treatment is not perfectly determined by the cutoff in \(W\) ? We may get an impression of the consequences by estimating an SRDD using the previously simulated data.

```r
# estimate SRDD
data

```r
## ### RDD regression: parametric ###
## Polynomial order: 1
## Slopes: same
## Number of obs: 2000 (left: 999, right: 1001)
## Coefficient:
## Estimate Std. Error t value Pr(>|t|)
## D 1.585038 0.067756 23.393

#### Summary

This chapter has introduced the concept of causal effects in randomized controlled experiments and quasi-experiments where variations in circumstances or accidents of nature are treated as sources of “as if” random assignment to treatment. We have also discussed methods that allow for consistent estimation of these effects in both settings. These included the differences estimator , the differences-in-differences estimator as well as sharp and fuzzy regression discontinuity design estimators. It was shown how to apply these estimation techniques in R .

In an empirical application we have shown how to replicate the results of the analysis of the STAR data presented in Chapter 13.3 of the book using R . This study uses a randomized controlled experiment to assess whether smaller classes improve students’ performance on standardized tests. Being related to a randomized controlled experiment, the data of this study is fundamentally different to those used in the cross-section studies in Chapters 4 to 8 . We therefore have motivated usage of a differences estimator .

Chapter 12.4 demonstrated how estimates of treatment effects can be obtained when the design of the study is a quasi-experiment that allows for differences-in-differences or regression discontinuity design estimators. In particular, we have introduced functions of the package rddtools that are convenient for estimation as well as graphical analysis when estimating a regression discontinuity design.

-->

### References

Card, D., & Krueger, A. B. (1994). Minimum Wages and Employment: A Case Study of the Fast-Food Industry in New Jersey and Pennsylvania. The American Economic Review , 84 (4), 772–793.

- See Chapter 13.4 of the book for some example studies that are based on quasi-experiments. ↩

- Also see the box What is the Effect on Employment of the Minimum Wage? in Chapter 13.4 of the book. ↩
