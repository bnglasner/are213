# Instrumental Variables Regression

- Primary Source URL: https://bookdown.org/machar1991/ITER/12-ivr.html
- Imported on: 2026-03-23
- Component pages: 7

## Source Components

1. `12 Instrumental Variables Regression` - https://bookdown.org/machar1991/ITER/12-ivr.html
2. `12.1 The IV Estimator with a Single Regressor and a Single Instrument` - https://bookdown.org/machar1991/ITER/12-1-TIVEWASRAASI.html
3. `12.2 The General IV Regression Model` - https://bookdown.org/machar1991/ITER/12-2-TGIVRM.html
4. `12.3 Checking Instrument Validity` - https://bookdown.org/machar1991/ITER/12-3-civ.html
5. `12.4 Application to the Demand for Cigarettes` - https://bookdown.org/machar1991/ITER/12-4-attdfc.html
6. `12.5 Where Do Valid Instruments Come From?` - https://bookdown.org/machar1991/ITER/12-5-where-do-valid-instruments-come-from.html
7. `12.6 Exercises` - https://bookdown.org/machar1991/ITER/12-6-exercises-9.html

## Compiled Content

## 12 Instrumental Variables Regression

As discussed in Chapter 9, regression models may suffer from problems like omitted variables, measurement errors and simultaneous causality. If so, the error term is correlated with the regressor of interest and so that the corresponding coefficient is estimated inconsistently. So far we have assumed that we can add the omitted variables to the regression to mitigate the risk of biased estimation of the causal effect of interest. However, if omitted factors cannot be measured or are not available for other reasons, multiple regression cannot solve the problem. The same issue arises if there is simultaneous causality. When causality runs from \(X\) to \(Y\) and vice versa, there will be an estimation bias that cannot be corrected for by multiple regression.

A general technique for obtaining a consistent estimator of the coefficient of interest is instrumental variables (IV) regression. In this chapter we focus on the IV regression tool called two-stage least squares (TSLS). The first sections briefly recap the general mechanics and assumptions of IV regression and show how to perform TSLS estimation using R. Next, IV regression is used for estimating the elasticity of the demand for cigarettes — a classical example where multiple regression fails to do the job because of simultaneous causality.

Just like for the previous chapter, the packages AER (Christian Kleiber & Zeileis, 2017) and stargazer (Hlavac, 2018) are required for reproducing the code presented in this chapter. Check whether the code chunk below executes without any error messages.

```r
library(AER)
library(stargazer)
```

### References

Kleiber, C., & Zeileis, A. (2017). AER: Applied Econometrics with R (Version 1.2-5). Retrieved from https://CRAN.R-project.org/package=AER

Hlavac, M. (2018). stargazer: Well-Formatted Regression and Summary Statistics Tables (Version 5.2.2). Retrieved from https://CRAN.R-project.org/package=stargazer

## 12.1 The IV Estimator with a Single Regressor and a Single Instrument

Consider the simple regression model

\[\begin{align}
Y_i = \beta_0 + \beta_1 X_i + u_i \ \, \ \ i=1,\dots,n \tag{12.1}
\end{align}\]
where the error term \(u_i\) is correlated with the regressor \(X_i\) (\(X\) is endogenous) such that OLS is inconsistent for the true \(\beta_1\). In the most simple case, IV regression uses a single instrumental variable \(Z\) to obtain a consistent estimator for \(\beta_1\).

\(Z\) must satisfy two conditions to be a valid instrument:

1. Instrument relevance condition:

\(X\) and its instrument \(Z\) must be correlated: \(\rho_{Z_i,X_i} \neq 0\).

2. Instrument exogeneity condition:

The instrument \(Z\) must not be correlated with the error term \(u\): \(\rho_{Z_i,u_i} = 0\).

#### The Two-Stage Least Squares Estimator

As can be guessed from its name, TSLS proceeds in two stages. In the first stage, the variation in the endogenous regressor \(X\) is decomposed into a problem-free component that is explained by the instrument \(Z\) and a problematic component that is correlated with the error \(u_i\). The second stage uses the problem-free component of the variation in \(X\) to estimate \(\beta_1\).

The first stage regression model is \[X_i = \pi_0 + \pi_1 Z_i + \nu_i,\] where \(\pi_0 + \pi_1 Z_i\) is the component of \(X_i\) that is explained by \(Z_i\) while \(\nu_i\) is the component that cannot be explained by \(Z_i\) and exhibits correlation with \(u_i\).

Using the OLS estimates \(\widehat{\pi}_0\) and \(\widehat{\pi}_1\) we obtain predicted values \(\widehat{X}_i, \ \ i=1,\dots,n\). If \(Z\) is a valid instrument, the \(\widehat{X}_i\) are problem-free in the sense that \(\widehat{X}\) is exogenous in a regression of \(Y\) on \(\widehat{X}\) which is done in the second stage regression. The second stage produces \(\widehat{\beta}_0^{TSLS}\) and \(\widehat{\beta}_1^{TSLS}\), the TSLS estimates of \(\beta_0\) and \(\beta_1\).

For the case of a single instrument one can show that the TSLS estimator of \(\beta_1\) is

\[\begin{align}
\widehat{\beta}_1^{TSLS} = \frac{s_{ZY}}{s_{ZX}} = \frac{\frac{1}{n-1}\sum_{i=1}^n(Y_i - \overline{Y})(Z_i - \overline{Z})}{\frac{1}{n-1}\sum_{i=1}^n(X_i - \overline{X})(Z_i - \overline{Z})}, \tag{12.2}
\end{align}\]
which is nothing but the ratio of the sample covariance between \(Z\) and \(Y\) to the sample covariance between \(Z\) and \(X\).

As shown in Appendix 12.3 of the book, (12.2) is a consistent estimator for \(\beta_1\) in (12.1) under the assumption that \(Z\) is a valid instrument. Just as for every other OLS estimator we have considered so far, the CLT implies that the distribution of \(\widehat{\beta}_1^{TSLS}\) can be approximated by a normal distribution if the sample size is large. This allows us to use \(t\) -statistics and confidence intervals which are also computed by certain R functions. A more detailed argument on the large-sample distribution of the TSLS estimator is sketched in Appendix 12.3 of the book.

#### Application to the Demand For Cigarettes

The relation between the demand for and the price of commodities is a simple yet widespread problem in economics. Health economics is concerned with the study of how health-affecting behavior of individuals is influenced by the health-care system and regulation policy. Probably the most prominent example in public policy debates is smoking as it is related to many illnesses and negative externalities.

It is plausible that cigarette consumption can be reduced by taxing cigarettes more heavily. The question is by how much taxes must be increased to reach a certain reduction in cigarette consumption. Economists use elasticities to answer this kind of question. Since the price elasticity for the demand of cigarettes is unknown, it must be estimated. As discussed in the box Who Invented Instrumental Variables Regression presented in Chapter 12.1 of the book, an OLS regression of log quantity on log price cannot be used to estimate the effect of interest since there is simultaneous causality between demand and supply. Instead, IV regression can be used.

We use the data set CigarettesSW which comes with the package AER. It is a panel data set that contains observations on cigarette consumption and several economic indicators for all 48 continental federal states of the U.S. from 1985 to 1995. Following the book we consider data for the cross section of states in 1995 only.

We start by loading the package, attaching the data set and getting an overview.

```r
# load the data set and get an overview
library(AER)
data("CigarettesSW")
summary(CigarettesSW)
```

```r
## state year cpi population
## AL : 2 1985:48 Min. :1.076 Min. : 478447
## AR : 2 1995:48 1st Qu.:1.076 1st Qu.: 1622606
## AZ : 2 Median :1.300 Median : 3697472
## CA : 2 Mean :1.300 Mean : 5168866
## CO : 2 3rd Qu.:1.524 3rd Qu.: 5901500
## CT : 2 Max. :1.524 Max. :31493524
## (Other):84
## packs income tax price
## Min. : 49.27 Min. : 6887097 Min. :18.00 Min. : 84.97
## 1st Qu.: 92.45 1st Qu.: 25520384 1st Qu.:31.00 1st Qu.:102.71
## Median :110.16 Median : 61661644 Median :37.00 Median :137.72
## Mean :109.18 Mean : 99878736 Mean :42.68 Mean :143.45
## 3rd Qu.:123.52 3rd Qu.:127313964 3rd Qu.:50.88 3rd Qu.:176.15
## Max. :197.99 Max. :771470144 Max. :99.00 Max. :240.85
## taxs
## Min. : 21.27
## 1st Qu.: 34.77
## Median : 41.05
## Mean : 48.33
## 3rd Qu.: 59.48
## Max. :112.63
```

Use?CigarettesSW for a detailed description of the variables.

We are interested in estimating \(\beta_1\) in

\[\begin{align}
\log(Q_i^{cigarettes}) = \beta_0 + \beta_1 \log(P_i^{cigarettes}) + u_i, \tag{12.3}
\end{align}\]
where \(Q_i^{cigarettes}\) is the number of cigarette packs per capita sold and \(P_i^{cigarettes}\) is the after-tax average real price per pack of cigarettes in state \(i\).

The instrumental variable we are going to use for instrumenting the endogenous regressor \(\log(P_i^{cigarettes})\) is \(SalesTax\), the portion of taxes on cigarettes arising from the general sales tax. \(SalesTax\) is measured in dollars per pack. The idea is that \(SalesTax\) is a relevant instrument as it is included in the after-tax average price per pack. Also, it is plausible that \(SalesTax\) is exogenous since the sales tax does not influence quantity sold directly but indirectly through the price.

We perform some transformations in order to obtain deflated cross section data for the year 1995.

We also compute the sample correlation between the sales tax and price per pack. The sample correlation is a consistent estimator of the population correlation. The estimate of approximately \(0.614\) indicates that \(SalesTax\) and \(P_i^{cigarettes}\) exhibit positive correlation which meets our expectations: higher sales taxes lead to higher prices. However, a correlation analysis like this is not sufficient for checking whether the instrument is relevant. We will later come back to the issue of checking whether an instrument is relevant and exogenous.

```r
# compute real per capita prices
CigarettesSW$rprice

```r
## [1] 0.6141228
```

```r
# generate a subset for the year 1995
c1995
The first stage regression is \[\log(P_i^{cigarettes}) = \pi_0 + \pi_1 SalesTax_i + \nu_i.\] We estimate this model in R using lm(). In the second stage we run a regression of \(\log(Q_i^{cigarettes})\) on \(\widehat{\log(P_i^{cigarettes})}\) to obtain \(\widehat{\beta}_0^{TSLS}\) and \(\widehat{\beta}_1^{TSLS}\).

```r
# perform the first stage regression
cig_s1

```r
## t test of coefficients:
## Estimate Std. Error t value Pr(>|t|)
## (Intercept) 4.6165463 0.0289177 159.6444
```r
# inspect the R^2 of the first stage regression
summary(cig_s1)$r.squared
```

```r
## [1] 0.4709961
```

We next store \(\widehat{\log(P_i^{cigarettes})}\), the fitted values obtained by the first stage regression cig_s1, in the variable lcigp_pred.

```r
# store the predicted values
lcigp_pred
Next, we run the second stage regression which gives us the TSLS estimates we seek.

```r
# run the stage 2 regression
cig_s2

```r
## t test of coefficients:
## Estimate Std. Error t value Pr(>|t|)
## (Intercept) 9.71988 1.70304 5.7074 7.932e-07 ***
## lcigp_pred -1.08359 0.35563 -3.0469 0.003822 **
## ---
## Signif. codes: 0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

Thus estimating the model (12.3) using TSLS yields

\[\begin{align}
\widehat{\log(Q_i^{cigarettes})} = \underset{(1.70)}{9.72} + \underset{(0.36)}{1.08} \log(P_i^{cigarettes}), \tag{12.4}
\end{align}\]
where we write \(\log(P_i^{cigarettes})\) instead of \(\widehat{\log(P_i^{cigarettes})}\) for consistency with the book.

The function ivreg() from the package AER carries out TSLS procedure automatically. It is used similarly as lm(). Instruments can be added to the usual specification of the regression formula using a vertical bar separating the model equation from the instruments. Thus, for the regression at hand the correct formula is log(packs) ~ log(rprice) | salestax.

```r
# perform TSLS using 'ivreg()'
cig_ivreg

```r
## t test of coefficients:
## Estimate Std. Error t value Pr(>|t|)
## (Intercept) 9.71988 1.52832 6.3598 8.346e-08 ***
## log(rprice) -1.08359 0.31892 -3.3977 0.001411 **
## ---
## Signif. codes: 0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

We find that the coefficient estimates coincide for both approaches.

Two Notes on the Computation of TSLS Standard Errors

- We have demonstrated that running the individual regressions for each stage of TSLS using lm() leads to the same coefficient estimates as when using ivreg() . However, the standard errors reported for the second-stage regression, e.g., by coeftest() or summary() , are invalid : neither adjusts for using predictions from the first-stage regression as regressors in the second-stage regression. Fortunately, ivreg() performs the necessary adjustment automatically. This is another advantage over manual step-by-step estimation which we have done above for demonstrating the mechanics of the procedure.

- Just like in multiple regression it is important to compute heteroskedasticity-robust standard errors as we have done above using vcovHC() .

The TSLS estimate for \(\beta_1\) in (12.4) suggests that an increase in cigarette prices by one percent reduces cigarette consumption by roughly \(1.08\) percentage points, which is fairly elastic. However, we should keep in mind that this estimate might not be trustworthy even though we used IV estimation: there still might be a bias due to omitted variables. Thus a multiple IV regression approach is needed.

## 12.2 The General IV Regression Model

The simple IV regression model is easily extended to a multiple regression model which we refer to as the general IV regression model. In this model we distinguish between four types of variables: the dependent variable, included exogenous variables, included endogenous variables and instrumental variables. Key Concept 12.1 summarizes the model and the common terminology. See Chapter 12.2 of the book for a more comprehensive discussion of the individual components of the general model.

### Key Concept 12.1

### The General Instrumental Variables Regression Model and Terminology

\[\begin{align}
Y_i = \beta_0 + \beta_1 X_{1i} + \dots + \beta_k X_{ki} + \beta_{k+1} W_{1i} + \dots + \beta_{k+r} W_{ri} + u_i, \tag{12.5}
\end{align}\]
with \(i=1,\dots,n\) is the general instrumental variables regression model where

- \(Y_i\) is the dependent variable

- \(\beta_0,\dots,\beta_{k+1}\) are \(1+k+r\) unknown regression coefficients

- \(X_{1i},\dots,X_{ki}\) are \(k\) endogenous regressors

- \(W_{1i},\dots,W_{ri}\) are \(r\) exogenous regressors which are uncorrelated with \(u_i\)

- \(u_i\) is the error term

- \(Z_{1i},\dots,Z_{mi}\) are \(m\) instrumental variables

The coefficients are overidentified if \(m>k\) . If \(m
While computing both stages of TSLS individually is not a big deal in (12.1) , the simple regression model with a single endogenous regressor, Key Concept 12.2 clarifies why resorting to TSLS functions like ivreg() are more convenient when the set of potentially endogenous regressors (and instruments) is large.

Estimating regression models with TSLS using multiple instruments by means of ivreg() is straightforward. There are, however, some subtleties in correctly specifying the regression formula.

Assume that you want to estimate the model \[Y_i = \beta_0 + \beta_1 X_{1i} + \beta_2 X_{2i} + W_{1i} + u_i\] where \(X_{1i}\) and \(X_{2i}\) are endogenous regressors that shall be instrumented by \(Z_{1i}\) , \(Z_{2i}\) and \(Z_{3i}\) and \(W_{1i}\) is an exogenous regressor. The corresponding data is available in a data.frame with column names y , x1 , x1 , w1 , z1 , z2 and z3 . It might be tempting to specify the argument formula in your call of ivreg() as y ~ x1 + x2 + w1 | z1 + z2 + z3 which is wrong. As explained in the documentation of ivreg() (see ?ivreg ), it is necessary to list all exogenous variables as instruments too, that is joining them by + ’s on the right of the vertical bar: y ~ x1 + x2 + w1 | w1 + z1 + z2 + z3 where w1 is “instrumenting itself”.

If there is a large number of exogenous variables it may be convenient to provide an update formula with a . (this includes all variables except for the dependent variable) right after the | and to exclude all endogenous variables using a - . For example, if there is one exogenous regressor w1 and one endogenous regressor x1 with instrument z1 , the appropriate formula would be y ~ w1 + x1 | w1 + z1 which is equivalent to y ~ w1 + x1 | . - x1 + z1 .

### Key Concept 12.2

### Two-Stage Least Squares

Similarly to the simple IV regression model, the general IV model (12.5) can be estimated using the two-stage least squares estimator:

- First-stage regression(s) Run an OLS regression for each of the endogenous variables ( \(X_{1i},\dots,X_{ki}\) ) on all instrumental variables ( \(Z_{1i},\dots,Z_{mi}\) ), all exogenous variables ( \(W_{1i},\dots,W_{ri}\) ) and an intercept. Compute the fitted values ( \(\widehat{X}_{1i},\dots,\widehat{X}_{ki}\) ).

- Second-stage regression Regress the dependent variable on the predicted values of all endogenous regressors, all exogenous variables and an intercept using OLS. This gives \(\widehat{\beta}_{0}^{TSLS},\dots,\widehat{\beta}_{k+r}^{TSLS}\) , the TSLS estimates of the model coefficients.

In the general IV regression model, the instrument relevance and instrument exogeneity assumptions are the same as in the simple regression model with a single endogenous regressor and only one instrument. See Key Concept 12.3 for a recap using the terminology of general IV regression.

### Key Concept 12.3

### Two Conditions for Valid Instruments

For \(Z_{1i},\dots,Z_{mi}\) to be a set of valid instruments, the following two conditions must be fulfilled:

- Instrument Relevance : if there are \(k\) endogenous variables, \(r\) exogenous variables and \(m\geq k\) instruments \(Z\) and the \(\widehat{X}_{1i}^*,\dots,\widehat{X}_{ki}^*\) are the predicted values from the \(k\) population first stage regressions, it must hold that \[(\widehat{X}_{1i}^*,\dots,\widehat{X}_{ki}^*, W_{1i}, \dots, W_{ri},1)\] are not perfectly multicollinear. \(1\) denotes the constant regressor which equals \(1\) for all observations. Note : If there is only one endogenous regressor \(X_i\) , there must be at least one non-zero coefficient on the \(Z\) and the \(W\) in the population regression for this condition to be valid: if all of the coefficients are zero, all the \(\widehat{X}^*_i\) are just the mean of \(X\) such that there is perfect multicollinearity.

- Instrument Exogeneity : All \(m\) instruments must be uncorrelated with the error term, \[\rho_{Z_{1i},u_i} = 0,\dots,\rho_{Z_{mi},u_i} = 0.\]

One can show that if the IV regression assumptions presented in Key Concept 12.4 hold, the TSLS estimator in (12.5) is consistent and normally distributed when the sample size is large. Appendix 12.3 of the book deals with a proof in the special case with a single regressor, a single instrument and no exogenous variables. The reasoning behind this carries over to the general IV model. Chapter 18 of the book proves a more complicated explanation for the general case.

For our purposes it is sufficient to bear in mind that validity of the assumptions stated in Key Concept 12.4 allows us to obtain valid statistical inference using R functions which compute \(t\) -Tests, \(F\) -Tests and confidence intervals for model coefficients.

### Key Concept 12.4

### The IV Regression Assumptions

For the general IV regression model in Key Concept 12.1 we assume the following:

- \(E(u_i\vert W_{1i}, \dots, W_{ri}) = 0.\)

- \((X_{1i},\dots,X_{ki},W_{1i},\dots,W_{ri},Z_{1i},\dots,Z_{mi})\) are i.i.d. draws from their joint distribution.

- All variables have nonzero finite fourth moments, i.e., outliers are unlikely.

- The \(Z\) s are valid instruments (see Key Concept 12.3).

#### Application to the Demand for Cigarettes

The estimated elasticity of the demand for cigarettes in (12.1) is \(1.08\) . Although (12.1) was estimated using IV regression it is plausible that this IV estimate is biased: in this model, the TSLS estimator is inconsistent for the true \(\beta_1\) if the instrument (the real sales tax per pack) correlates with the error term. This is likely to be the case since there are economic factors, like state income, which impact the demand for cigarettes and correlate with the sales tax. States with high personal income tend to generate tax revenues by income taxes and less by sales taxes. Consequently, state income should be included in the regression model.

\[\begin{align}
\log(Q_i^{cigarettes}) = \beta_0 + \beta_1 \log(P_i^{cigarettes}) + \beta_2 \log(income_i) + u_i \tag{12.6}
\end{align}\]
Before estimating (12.6) using ivreg() we define \(income\) as real per capita income rincome and append it to the data set CigarettesSW .

```r
# add rincome to the dataset
CigarettesSW$rincome

```r
# estimate the model
cig_ivreg2

```r
## t test of coefficients:
## Estimate Std. Error t value Pr(>|t|)
## (Intercept) 9.43066 1.25939 7.4883 1.935e-09 ***
## log(rprice) -1.14338 0.37230 -3.0711 0.003611 **
## log(rincome) 0.21452 0.31175 0.6881 0.494917
## ---
## Signif. codes: 0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

We obtain

\[\begin{align}
\widehat{\log(Q_i^{cigarettes})} = \underset{(1.26)}{9.42} - \underset{(0.37)}{1.14} \log(P_i^{cigarettes}) + \underset{(0.31)}{0.21} \log(income_i). \tag{12.7}
\end{align}\]
Following the book we add the cigarette-specific taxes ( \(cigtax_i\) ) as a further instrumental variable and estimate again using TSLS.

```r
# add cigtax to the data set
CigarettesSW$cigtax

```r
# estimate the model
cig_ivreg3

```r
## t test of coefficients:
## Estimate Std. Error t value Pr(>|t|)
## (Intercept) 9.89496 0.95922 10.3157 1.947e-13 ***
## log(rprice) -1.27742 0.24961 -5.1177 6.211e-06 ***
## log(rincome) 0.28040 0.25389 1.1044 0.2753
## ---
## Signif. codes: 0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

Using the two instruments \(salestax_i\) and \(cigtax_i\) we have \(m=2\) and \(k=1\) so the coefficient on the endogenous regressor \(\log(P_i^{cigarettes})\) is overidentified . The TSLS estimate of (12.6) is

\[\begin{align}
\widehat{\log(Q_i^{cigarettes})} = \underset{(0.96)}{9.89} - \underset{(0.25)}{1.28} \log(P_i^{cigarettes}) + \underset{(0.25)}{0.28} \log(income_i). \tag{12.8}
\end{align}\]
Should we trust the estimates presented in (12.7) or rather rely on (12.8) ? The estimates obtained using both instruments are more precise since in (12.8) all standard errors reported are smaller than in (12.7) . In fact, the standard error for the estimate of the demand elasticity is only two thirds of the standard error when the sales tax is the only instrument used. This is due to more information being used in estimation (12.8) . If the instruments are valid, (12.8) can be considered more reliable.

However, without insights regarding the validity of the instruments it is not sensible to make such a statement. This stresses why checking instrument validity is essential. Chapter 12.3 briefly discusses guidelines in checking instrument validity and presents approaches that allow to test for instrument relevance and exogeneity under certain conditions. These are then used in an application to the demand for cigarettes in Chapter 12.4 .

## 12.3 Checking Instrument Validity

#### Instrument Relevance

Instruments that explain little variation in the endogenous regressor \(X\) are called weak instruments . Weak instruments provide little information about the variation in \(X\) that is exploited by IV regression to estimate the effect of interest: the estimate of the coefficient on the endogenous regressor is estimated inaccurately. Moreover, weak instruments cause the distribution of the estimator to deviate considerably from a normal distribution even in large samples such that the usual methods for obtaining inference about the true coefficient on \(X\) may produce wrong results. See Chapter 12.3 and Appendix 12.4 of the book for a more detailed argument on the undesirable consequences of using weak instruments in IV regression.

### Key Concept 12.5

### A Rule of Thumb for Checking for Weak Instruments

Consider the case of a single endogenous regressor \(X\) and \(m\) instruments \(Z_1,\dots,Z_m\) . If the coefficients on all instruments in the population first-stage regression of a TSLS estimation are zero, the instruments do not explain any of the variation in the \(X\) which clearly violates assumption 1 of Key Concept 12.2. Although the latter case is unlikely to be encountered in practice, we should ask ourselves “to what extent” the assumption of instrument relevance should be fulfilled.

While this is hard to answer for general IV regression, in the case of a single endogenous regressor \(X\) one may use the following rule of thumb:

Compute the \(F\) -statistic which corresponds to the hypothesis that the coefficients on \(Z_1,\dots,Z_m\) are all zero in the first-stage regression. If the \(F\) -statistic is less than \(10\) , the instruments are weak such that the TSLS estimate of the coefficient on \(X\) is biased and no valid statistical inference about its true value can be made. See also Appendix 12.5 of the book.

The rule of thumb of Key Concept 12.5 is easily implemented in R . Run the first-stage regression using lm() and subsequently compute the heteroskedasticity-robust \(F\) -statistic by means of linearHypothesis() . This is part of the application to the demand for cigarettes discussed in Chapter 12.4 .

#### If Instruments are Weak

There are two ways to proceed if instruments are weak:

- Discard the weak instruments and/or find stronger instruments. While the former is only an option if the unknown coefficients remain identified when the weak instruments are discarded, the latter can be very difficult and even may require a redesign of the whole study.

- Stick with the weak instruments but use methods that improve upon TSLS in this scenario, for example limited information maximum likelihood estimation, see Appendix 12.5 of the book.

#### When the Assumption of Instrument Exogeneity is Violated

If there is correlation between an instrument and the error term, IV regression is not consistent (this is shown in Appendix 12.4 of the book). The overidentifying restrictions test (also called the \(J\) -test) is an approach to test the hypothesis that additional instruments are exogenous. For the \(J\) -test to be applicable there need to be more instruments than endogenous regressors. The \(J\) -test is summarized in Key Concept 12.5.

### Key Concept 12.6

### \(J\) -Statistic / Overidentifying Restrictions Test

Take \(\widehat{u}_i^{TSLS} \ , \ i = 1,\dots,n\) , the residuals of the TSLS estimation of the general IV regression model (12.5) . Run the OLS regression

\[\begin{align}
\widehat{u}_i^{TSLS} =& \, \delta_0 + \delta_1 Z_{1i} + \dots + \delta_m Z_{mi} + \delta_{m+1} W_{1i} + \dots + \delta_{m+r} W_{ri} + e_i \tag{12.9}
\end{align}\]
and test the joint hypothesis \[H_0: \delta_1 = 0, \dots, \delta_{m} = 0\] which states that all instruments are exogenous. This can be done using the corresponding \(F\) -statistic by computing \[J = mF.\] This test is the overidentifying restrictions test and the statistic is called the \(J\) -statistic with \[J \sim \chi^2_{m-k}\] in large samples under the null and the assumption of homoskedasticity. The degrees of freedom \(m-k\) state the degree of overidentification since this is the number of instruments \(m\) minus the number of endogenous regressors \(k\) .

It is important to note that the \(J\) -statistic discussed in Key Concept 12.6 is only \(\chi^2_{m-k}\) distributed when the error term \(e_i\) in the regression (12.9) is homoskedastic. A discussion of the heteroskedasticity-robust \(J\) -statistic is beyond the scope of this chapter. We refer to Section 18.7 of the book for a theoretical argument.

As for the procedure shown in Key Concept 12.6, the application in the next section shows how to apply the \(J\) -test using linearHypothesis() .

## 12.4 Application to the Demand for Cigarettes

Are the general sales tax and the cigarette-specific tax valid instruments? If not, TSLS is not helpful to estimate the demand elasticity for cigarettes discussed in Chapter 12.2 . As discussed in Chapter 12.1 , both variables are likely to be relevant but whether they are exogenous is a different question.

The book argues that cigarette-specific taxes could be endogenous because there might be state specific historical factors like economic importance of the tobacco farming and cigarette production industry that lobby for low cigarette specific taxes. Since it is plausible that tobacco growing states have higher rates of smoking than others, this would lead to endogeneity of cigarette specific taxes. If we had data on the size on the tobacco and cigarette industry, we could solve this potential issue by including the information in the regression. Unfortunately, this is not the case.

However, since the role of the tobacco and cigarette industry is a factor that can be assumed to differ across states but not over time we may exploit the panel structure of CigarettesSW instead: as shown in Chapter 10.2 , regression using data on changes between two time periods eliminates such state specific and time invariant effects. Following the book we consider changes in variables between 1985 and 1995. That is, we are interested in estimating the long-run elasticity of the demand for cigarettes.

The model to be estimated by TSLS using the general sales tax and the cigarette-specific sales tax as instruments hence is

\[\begin{align}
\begin{split}
\log(Q_{i,1995}^{cigarettes}) - \log(Q_{i,1995}^{cigarettes}) =& \, \beta_0 + \beta_1 \left[\log(P_{i,1995}^{cigarettes}) - \log(P_{i,1985}^{cigarettes}) \right] \\ &+ \beta_2 \left[\log(income_{i,1995}) - \log(income_{i,1985})\right] + u_i. \end{split}\tag{12.10}
\end{align}\]
We first create differences from 1985 to 1995 for the dependent variable, the regressors and both instruments.

```r
# subset data for year 1985
c1985
We now perform three different IV estimations of (12.10) using ivreg():

- TSLS using only the difference in the sales taxes between 1985 and 1995 as the instrument.

- TSLS using only the difference in the cigarette-specific sales taxes 1985 and 1995 as the instrument.

- TSLS using both the difference in the sales taxes 1985 and 1995 and the difference in the cigarette-specific sales taxes 1985 and 1995 as instruments.

```r
# estimate the three models
cig_ivreg_diff1
As usual we use coeftest() in conjunction with vcovHC() to obtain robust coefficient summaries for all models.

```r
# robust coefficient summary for 1.
coeftest(cig_ivreg_diff1, vcov = vcovHC, type = "HC1")
```

```r
## t test of coefficients:
## Estimate Std. Error t value Pr(>|t|)
## (Intercept) -0.117962 0.068217 -1.7292 0.09062.
## pricediff -0.938014 0.207502 -4.5205 4.454e-05 ***
## incomediff 0.525970 0.339494 1.5493 0.12832
## ---
## Signif. codes: 0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

```r
# robust coefficient summary for 2.
coeftest(cig_ivreg_diff2, vcov = vcovHC, type = "HC1")
```

```r
## t test of coefficients:
## Estimate Std. Error t value Pr(>|t|)
## (Intercept) -0.017049 0.067217 -0.2536 0.8009
## pricediff -1.342515 0.228661 -5.8712 4.848e-07 ***
## incomediff 0.428146 0.298718 1.4333 0.1587
## ---
## Signif. codes: 0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

```r
# robust coefficient summary for 3.
coeftest(cig_ivreg_diff3, vcov = vcovHC, type = "HC1")
```

```r
## t test of coefficients:
## Estimate Std. Error t value Pr(>|t|)
## (Intercept) -0.052003 0.062488 -0.8322 0.4097
## pricediff -1.202403 0.196943 -6.1053 2.178e-07 ***
## incomediff 0.462030 0.309341 1.4936 0.1423
## ---
## Signif. codes: 0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

We proceed by generating a tabulated summary of the estimation results using stargazer() .

```r
# gather robust standard errors in a list
rob_se

Dependent variable: 1985-1995 difference in log per pack price

IV: salestax IV: cigtax IVs: salestax, cigtax
(1) (2) (3)
pricediff -0.938 *** -1.343 *** -1.202 ***
(0.208) (0.229) (0.197)

incomediff 0.526 0.428 0.462
(0.339) (0.299) (0.309)

Constant -0.118 * -0.017 -0.052
(0.068) (0.067) (0.062)

Observations 48 48 48
R 2 0.550 0.520 0.547
Adjusted R 2 0.530 0.498 0.526
Residual Std. Error (df = 45) 0.091 0.094 0.091
Note: * p ** p *** p

Table 12.1: TSLS Estimates of the Long-Term Elasticity of the Demand for Cigarettes using Panel Data

Table 12.1 reports negative estimates of the coefficient on pricediff that are quite different in magnitude. Which one should we trust? This hinges on the validity of the instruments used. To assess this we compute \(F\) -statistics for the first-stage regressions of all three models to check instrument relevance.

```r
# first-stage regressions
mod_relevance1

```r
# check instrument relevance for model (1)
linearHypothesis(mod_relevance1,
"salestaxdiff = 0",
vcov = vcovHC, type = "HC1")
```

```r
## Linear hypothesis test
## Hypothesis:
## salestaxdiff = 0
## Model 1: restricted model
## Model 2: pricediff ~ salestaxdiff + incomediff
## Note: Coefficient covariance matrix supplied.
## Res.Df Df F Pr(>F)
## 1 46
## 2 45 1 28.445 3.009e-06 ***
## ---
## Signif. codes: 0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

```r
# check instrument relevance for model (2)
linearHypothesis(mod_relevance2,
"cigtaxdiff = 0",
vcov = vcovHC, type = "HC1")
```

```r
## Linear hypothesis test
## Hypothesis:
## cigtaxdiff = 0
## Model 1: restricted model
## Model 2: pricediff ~ cigtaxdiff + incomediff
## Note: Coefficient covariance matrix supplied.
## Res.Df Df F Pr(>F)
## 1 46
## 2 45 1 98.034 7.09e-13 ***
## ---
## Signif. codes: 0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

```r
# check instrument relevance for model (3)
linearHypothesis(mod_relevance3,
c("salestaxdiff = 0", "cigtaxdiff = 0"),
vcov = vcovHC, type = "HC1")
```

```r
## Linear hypothesis test
## Hypothesis:
## salestaxdiff = 0
## cigtaxdiff = 0
## Model 1: restricted model
## Model 2: pricediff ~ incomediff + salestaxdiff + cigtaxdiff
## Note: Coefficient covariance matrix supplied.
## Res.Df Df F Pr(>F)
## 1 46
## 2 44 2 76.916 4.339e-15 ***
## ---
## Signif. codes: 0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

We also conduct the overidentifying restrictions test for model three which is the only model where the coefficient on the difference in log prices is overidentified ( \(m=2\) , \(k=1\) ) such that the \(J\) -statistic can be computed. To do this we take the residuals stored in cig_ivreg_diff3 and regress them on both instruments and the presumably exogenous regressor incomediff . We again use linearHypothesis() to test whether the coefficients on both instruments are zero which is necessary for the exogeneity assumption to be fulfilled. Note that with test = “Chisq” we obtain a chi-squared distributed test statistic instead of an \(F\) -statistic.

```r
# compute the J-statistic
cig_iv_OR

```r
## Linear hypothesis test
## Hypothesis:
## salestaxdiff = 0
## cigtaxdiff = 0
## Model 1: restricted model
## Model 2: residuals(cig_ivreg_diff3) ~ incomediff + salestaxdiff + cigtaxdiff
## Res.Df RSS Df Sum of Sq Chisq Pr(>Chisq)
## 1 46 0.37472
## 2 44 0.33695 2 0.037769 4.932 0.08492 .
## ---
## Signif. codes: 0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

Caution: In this case the \(p\) -Value reported by linearHypothesis() is wrong because the degrees of freedom are set to \(2\). This differs from the degree of overidentification (\(m-k=2-1=1\)) so the \(J\) -statistic is \(\chi^2_1\) distributed instead of following a \(\chi^2_2\) distribution as assumed defaultly by linearHypothesis(). We may compute the correct \(p\) -Value using pchisq().

```r
# compute correct p-value for J-statistic
pchisq(cig_OR_test[2, 5], df = 1, lower.tail = FALSE)
```

```r
## [1] 0.02636406
```

Since this value is smaller than \(0.05\) we reject the hypothesis that both instruments are exogenous at the level of \(5\%\). This means one of the following:

- The sales tax is an invalid instrument for the per-pack price.

- The cigarettes-specific sales tax is an invalid instrument for the per-pack price.

- Both instruments are invalid.

The book argues that the assumption of instrument exogeneity is more likely to hold for the general sales tax (see Chapter 12.4 of the book) such that the IV estimate of the long-run elasticity of demand for cigarettes we consider the most trustworthy is \(-0.94\), the TSLS estimate obtained using the general sales tax as the only instrument.

The interpretation of this estimate is that over a 10-year period, an increase in the average price per package by one percent is expected to decrease consumption by about \(0.94\) percentage points. This suggests that, in the long run, price increases can reduce cigarette consumption considerably.

## 12.5 Where Do Valid Instruments Come From?

Chapter 12.5 of the book presents a comprehensive discussion of approaches to find valid instruments in practice by the example of three research questions:

- Does putting criminals in jail reduce crime?

- Does cutting class sizes increase test scores?

- Does aggressive treatment of heart attacks prolong lives?

This section is not directly related to applications in R which is why we do not discuss the contents here. We encourage you to work through this on your own.

#### Summary

ivreg() from the package AER provides convenient functionalities to estimate IV regression models in R. It is an implementation of the TSLS estimation approach.

Besides treating IV estimation, we have also discussed how to test for weak instruments and how to conduct an overidentifying restrictions test when there are more instruments than endogenous regressors using R.

An empirical application has shown how ivreg() can be used to estimate the long-run elasticity of demand for cigarettes based on CigarettesSW, a panel data set on cigarette consumption and economic indicators for all 48 continental U.S. states for 1985 and 1995. Different sets of instruments were used and it has been argued why using the general sales tax as the only instrument is the preferred choice. The estimate of the demand elasticity deemed the most trustworthy is \(-0.94\). This estimate suggests that there is a remarkable negative long-run effect on cigarette consumption of increasing prices.

## 12.6 Exercises

#### 1. The College Distance Data

There are many studies in labor economics which deal with the issue of estimating human capital earnings functions which state how wage income is determined by education and working experience. A prominent example is Card (1993) who investigates the economic return to schooling and uses college proximity as an instrumental variable.

The exercises in this chapter deal with the dataset CollegeDistance which is similar to the data used by Card (1993). It stems from a survey of high school graduates with variables coded for wages, education, average tuition and a number of socio-economic measures. The data set also includes the distance from a college while the survey participants were in high school. CollegeDistance comes with the AER package.

Instructions:

- Attach the AER package and load the CollegeDistance data.

- Get an overview over the data set.

- The variable distance (the distance to the closest 4-year college in 10 miles) will serve as an instrument in later exercises. Use a histogram to visualize the distribution of distance.

Hints:

- Use data() to attach the data set.

- The function hist() can be used to generate histograms.

#### 2. The Selection Problem

Regressing wage on education and control variables to estimate the human capital earnings function is problematic because education is not randomly assigned across the surveyed: individuals make their own education choices and so measured differences in earnings between individuals with different levels of education depend on how these choices are made. In the literature this is referred to as a selection problem. This selection problem implies that education is endogenous so the OLS estimate will be biased and we cannot make valid inference regarding the true coefficient.

In this exercise you are asked to estimate two regressions which both do not yield trustworthy estimates of the coefficient on education due to the issue sketched above. Later you will compare the results to those obtained using the instrumental variables approach applied by Card (1993).

The AER package has been attached. The data set CollegeDistance is available in your global environment.

Instructions:

- Regress the logarithm of wage on education, that is, estimate the model \[\log(wage_i) = \beta_0 + \beta_1 education_i + u_i\] Save the result to wage_mod_1.

- Augment the model by including the regressors unemp, hispanic, af-am, female and urban. Save the result to wage_mod_2

- Obtain summaries on the estimated coefficients in both models.

#### 3. Instrumental Variables Regression Approaches — I

The above discussed selection problem renders the regression estimates in Exercise 2 implausible which is why Card (1993) suggests instrumental variables regression that uses college distance as an instrument for education.

Why use college distance as an instrument? The logic behind this is that distance from a college will be correlated to the decision to pursue a college degree (relevance) but may not predict wages apart from increased education (exogeneity) so college proximity could be considered a valid instrument (recall the definition of a valid instrument stated at the beginning of Chapter 12.1).

The AER package has been attached. The data set CollegeDistance is available in your global environment.

Instructions:

- Compute the correlations of the instrument distance with the edogenous regressor education and the dependent variable wage.

- How much of the variation in education is explained by the first-stage regression which uses distance as a regressor? Save the result to R2.

- Repeat Exercise 2 with IV regression, i.e., employ distance as an instrument for education in both regressions using ivreg(). Save the results to wage_mod_iv1 and wage_mod_iv2. Obtain robust coefficient summaries for both models.

#### 4. Instrumental Variables Regression Approaches — II

Convince yourself that ivreg() works as expected by implementing the TSLS algorithm presented in Key Concept 12.2 for a single instrument, see Chapter 12.2.

Instructions:

- Complete the function TSLS() such that it implements the TSLS estimator.

- Use TSLS() to reproduce the coefficient estimates obtained using ivreg() for both models of Exercise 3.

Hints:

- Completion of the function boils down to replacing the... by appropriate arguments.

- Besides the data set (data), the function expects the dependent variable (Y), exogenous regressors (W), the endogenous regressors (X) and an instrument (Z) as arguments. All of these should be of class character.

- Including W = NULL in the head of the function definition ensures that the set of exogenous variables is empty, by default.

#### 5. Should we trust the Results?

This is not a real code exercise (there are no submission correctness tests for checking your code). Instead we would like you to use the widget below to compare the results obtained using the OLS regressions of Exercise 2 with those of the IV regressions of Exercise 3.

The data set CollegeDistance and all model objects from Exercises 2 and 3 are available in the global environment.

Instructions:

Convince yourself of the following:

- It is likely that the bias of the estimated coefficient on education in the simple regression model wage_mod_1 is subtantial because the regressor is endogenous due to omitting variables from the model which correlate with education and impact wage income.

- Due to the selection problem in described in Exercise 2, the estimate of the coefficient of interest is not trustworthy even in the multiple regression model wage_mod_2 which includes several socio-economic control variables. The coeffiecient on education is not significant and its estimate is close to zero).

- Instrumenting education by the college distance as done in wage_mod_iv1 yields the IV estimate of the coefficient of interest. The result should, however, not be considered reliable because this simple model probably suffers from omitted variables bias just as the multiple regression model wage_mod_2 from Exercise 2, see 1. Again, the coeffiecient on education is not significant its estimate is quite small.

- wage_mod_iv2, the multiple regression model where we include demographic control variables and instrumend education by distance delivers the most reliable estimate of the impact of education on wage income among all the models considered. The coefficient is highly significant and the estimate is about \(0.067\). Following Key Concept 8.2, the interpretation is that an additional year of schooling is expected to increases wage income by roughly \(0.067 \cdot 100\% = 6.7\%\).

- Is the estimate of the coefficient on education reported by wage_mod_iv2 trustworthy? This question is not easy to answer. In any case, we should bear in mind that using an instrumental variables approach is problematic when the instrument is weak. This could be the case here: Families with strong preference for education may move into neighborhoods close to colleges. Furthermore, neighborhoods close to colleges may have stronger job markets reflected by higher incomes. Such features would render the instrument invalid as they introduce unobserved variables which influence earnings but cannot be captured by years of schooling, our measure of education.

-->

### References

Card, D. (1993). Using geographic variation in college proximity to estimate the return to schooling. National Bureau of Economic Research.
