# Regression with a Binary Dependent Variable

- Primary Source URL: https://bookdown.org/machar1991/ITER/11-rwabdv.html
- Imported on: 2026-03-23
- Component pages: 6

## Source Components

1. `11 Regression with a Binary Dependent Variable` - https://bookdown.org/machar1991/ITER/11-rwabdv.html
2. `11.1 Binary Dependent Variables and the Linear Probability Model` - https://bookdown.org/machar1991/ITER/11-1-binary-dependent-variables-and-the-linear-probability-model.html
3. `11.2 Probit and Logit Regression` - https://bookdown.org/machar1991/ITER/11-2-palr.html
4. `11.3 Estimation and Inference in the Logit and Probit Models` - https://bookdown.org/machar1991/ITER/11-3-estimation-and-inference-in-the-logit-and-probit-models.html
5. `11.4 Application to the Boston HMDA Data` - https://bookdown.org/machar1991/ITER/11-4-application-to-the-boston-hmda-data.html
6. `11.5 Exercises` - https://bookdown.org/machar1991/ITER/11-5-exercises-8.html

## Compiled Content

## 11 Regression with a Binary Dependent Variable

This chapter, we discusses a special class of regression models that aim to explain a limited dependent variable. In particular, we consider models where the dependent variable is binary. We will see that in such models, the regression function can be interpreted as a conditional probability function of the binary dependent variable.

We review the following concepts:

- the linear probability model

- the Probit model

- the Logit model

- maximum likelihood estimation of nonlinear regression models

Of course, we will also see how to estimate above models using R and discuss an application where we examine the question whether there is racial discrimination in the U.S. mortgage market.

The following packages and their dependencies are needed for reproduction of the code chunks presented throughout this chapter on your computer:

- AER (Christian Kleiber & Zeileis, 2017)

- stargazer (Hlavac, 2018)

Check whether the following code chunk runs without any errors.

```r
library(AER)
library(stargazer)
```

### References

Kleiber, C., & Zeileis, A. (2017). AER: Applied Econometrics with R (Version 1.2-5). Retrieved from https://CRAN.R-project.org/package=AER

Hlavac, M. (2018). stargazer: Well-Formatted Regression and Summary Statistics Tables (Version 5.2.2). Retrieved from https://CRAN.R-project.org/package=stargazer

## 11.1 Binary Dependent Variables and the Linear Probability Model

### Key Concept 11.1

### The Linear Probability Model

The linear regression model

\[Y_i = \beta_0 + \beta_1 + X_{1i} + \beta_2 X_{2i} + \dots + \beta_k X_{ki} + u_i\] with a binary dependent variable \(Y_i\) is called the linear probability model. In the linear probability model we have \[E(Y\vert X_1,X_2,\dots,X_k) = P(Y=1\vert X_1, X_2,\dots, X_3)\] where \[P(Y = 1 \vert X_1, X_2, \dots, X_k) = \beta_0 + \beta_1 + X_{1i} + \beta_2 X_{2i} + \dots + \beta_k X_{ki}.\]

Thus, \(\beta_j\) can be interpreted as the change in the probability that \(Y_i=1\), holding constant the other \(k-1\) regressors. Just as in common multiple regression, the \(\beta_j\) can be estimated using OLS and the robust standard error formulas can be used for hypothesis testing and computation of confidence intervals.

In most linear probability models, \(R^2\) has no meaningful interpretation since the regression line can never fit the data perfectly if the dependent variable is binary and the regressors are continuous. This can be seen in the application below.

It is essential to use robust standard errors since the \(u_i\) in a linear probability model are always heteroskedastic.

Linear probability models are easily estimated in R using the function lm().

#### Mortgage Data

Following the book, we start by loading the data set HMDA which provides data that relate to mortgage applications filed in Boston in the year of 1990.

```r
# load `AER` package and attach the HMDA data
library(AER)
data(HMDA)
```

We continue by inspecting the first few observations and compute summary statistics afterwards.

```r
# inspect the data
head(HMDA)
```

```r
## deny pirat hirat lvrat chist mhist phist unemp selfemp insurance
## 1 no 0.221 0.221 0.8000000 5 2 no 3.9 no no
## 2 no 0.265 0.265 0.9218750 2 2 no 3.2 no no
## 3 no 0.372 0.248 0.9203980 1 2 no 3.2 no no
## 4 no 0.320 0.250 0.8604651 1 2 no 4.3 no no
## 5 no 0.360 0.350 0.6000000 1 1 no 3.2 no no
## 6 no 0.240 0.170 0.5105263 1 1 no 3.9 no no
## condomin afam single hschool
## 1 no no no yes
## 2 no no yes yes
## 3 no no no yes
## 4 no no no yes
## 5 no no no yes
## 6 no no no yes
```

```r
summary(HMDA)
```

```r
## deny pirat hirat lvrat chist
## no :2095 Min. :0.0000 Min. :0.0000 Min. :0.0200 1:1353
## yes: 285 1st Qu.:0.2800 1st Qu.:0.2140 1st Qu.:0.6527 2: 441
## Median :0.3300 Median :0.2600 Median :0.7795 3: 126
## Mean :0.3308 Mean :0.2553 Mean :0.7378 4: 77
## 3rd Qu.:0.3700 3rd Qu.:0.2988 3rd Qu.:0.8685 5: 182
## Max. :3.0000 Max. :3.0000 Max. :1.9500 6: 201
## mhist phist unemp selfemp insurance condomin
## 1: 747 no :2205 Min. : 1.800 no :2103 no :2332 no :1694
## 2:1571 yes: 175 1st Qu.: 3.100 yes: 277 yes: 48 yes: 686
## 3: 41 Median : 3.200
## 4: 21 Mean : 3.774
## 3rd Qu.: 3.900
## Max. :10.600
## afam single hschool
## no :2041 no :1444 no : 39
## yes: 339 yes: 936 yes:2341
```

The variable we are interested in modelling is deny, an indicator for whether an applicant’s mortgage application has been accepted (deny = no) or denied (deny = yes). A regressor that ought to have power in explaining whether a mortgage application has been denied is pirat, the size of the anticipated total monthly loan payments relative to the the applicant’s income. It is straightforward to translate this into the simple regression model

\[\begin{align}
deny = \beta_0 + \beta_1 \times P/I\ ratio + u. \tag{11.1}
\end{align}\]
We estimate this model just as any other linear regression model using lm(). Before we do so, the variable deny must be converted to a numeric variable using as.numeric() as lm() does not accepts the dependent variable to be of class factor. Note that as.numeric(HMDA$deny) will turn deny = no into deny = 1 and deny = yes into deny = 2, so using as.numeric(HMDA$deny)-1 we obtain the values 0 and 1.

```r
# convert 'deny' to numeric
HMDA$deny

```r
## Call:
## lm(formula = deny ~ pirat, data = HMDA)
## Coefficients:
## (Intercept) pirat
## -0.07991 0.60353
```

Next, we plot the data and the regression line to reproduce Figure 11.1 of the book.

```r
# plot the data
plot(x = HMDA$pirat,
y = HMDA$deny,
main = "Scatterplot Mortgage Application Denial and the Payment-to-Income Ratio",
xlab = "P/I ratio",
ylab = "Deny",
pch = 20,
ylim = c(-0.4, 1.4),
cex.main = 0.8)

# add horizontal dashed lines and text
abline(h = 1, lty = 2, col = "darkred")
abline(h = 0, lty = 2, col = "darkred")
text(2.5, 0.9, cex = 0.8, "Mortgage denied")
text(2.5, -0.1, cex= 0.8, "Mortgage approved")

# add the estimated regression line
abline(denymod1,
lwd = 1.8,
col = "steelblue")
```

According to the estimated model, a payment-to-income ratio of \(1\) is associated with an expected probability of mortgage application denial of roughly \(50\%\) . The model indicates that there is a positive relation between the payment-to-income ratio and the probability of a denied mortgage application so individuals with a high ratio of loan payments to income are more likely to be rejected.

We may use coeftest() to obtain robust standard errors for both coefficient estimates.

```r
# print robust coefficient summary
coeftest(denymod1, vcov. = vcovHC, type = "HC1")
```

```r
## t test of coefficients:
## Estimate Std. Error t value Pr(>|t|)
## (Intercept) -0.079910 0.031967 -2.4998 0.01249 *
## pirat 0.603535 0.098483 6.1283 1.036e-09 ***
## ---
## Signif. codes: 0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

The estimated regression line is
\[\begin{align}
\widehat{deny} = -\underset{(0.032)}{0.080} + \underset{(0.098)}{0.604} P/I \ ratio. \tag{11.2}
\end{align}\]
The true coefficient on \(P/I \ ratio\) is statistically different from \(0\) at the \(1\%\) level. Its estimate can be interpreted as follows: a 1 percentage point increase in \(P/I \ ratio\) leads to an increase in the probability of a loan denial by \(0.604 \cdot 0.01 = 0.00604 \approx 0.6\%\) .

Following the book we augment the simple model (11.1) by an additional regressor \(black\) which equals \(1\) if the applicant is an African American and equals \(0\) otherwise. Such a specification is the baseline for investigating if there is racial discrimination in the mortgage market: if being black has a significant (positive) influence on the probability of a loan denial when we control for factors that allow for an objective assessment of an applicants credit worthiness, this is an indicator for discrimination.

```r
# rename the variable 'afam' for consistency
colnames(HMDA)[colnames(HMDA) == "afam"]

```r
## t test of coefficients:
## Estimate Std. Error t value Pr(>|t|)
## (Intercept) -0.090514 0.033430 -2.7076 0.006826 **
## pirat 0.559195 0.103671 5.3939 7.575e-08 ***
## blackyes 0.177428 0.025055 7.0815 1.871e-12 ***
## ---
## Signif. codes: 0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

The estimated regression function is
\[\begin{align}
\widehat{deny} =& \, -\underset{(0.029)}{0.091} + \underset{(0.089)}{0.559} P/I \ ratio + \underset{(0.025)}{0.177} black. \tag{11.3}
\end{align}\]
The coefficient on \(black\) is positive and significantly different from zero at the \(0.01\%\) level. The interpretation is that, holding constant the \(P/I \ ratio\), being black increases the probability of a mortgage application denial by about \(17.7\%\). This finding is compatible with racial discrimination. However, it might be distorted by omitted variable bias so discrimination could be a premature conclusion.

## 11.2 Probit and Logit Regression

The linear probability model has a major flaw: it assumes the conditional probability function to be linear. This does not restrict \(P(Y=1\vert X_1,\dots,X_k)\) to lie between \(0\) and \(1\). We can easily see this in our reproduction of Figure 11.1 of the book: for \(P/I \ ratio \geq 1.75\), (11.2) predicts the probability of a mortgage application denial to be bigger than \(1\). For applications with \(P/I \ ratio\) close to \(0\), the predicted probability of denial is even negative so that the model has no meaningful interpretation here.

This circumstance calls for an approach that uses a nonlinear function to model the conditional probability function of a binary dependent variable. Commonly used methods are Probit and Logit regression.

### Probit Regression

In Probit regression, the cumulative standard normal distribution function \(\Phi(\cdot)\) is used to model the regression function when the dependent variable is binary, that is, we assume
\[\begin{align}
E(Y\vert X) = P(Y=1\vert X) = \Phi(\beta_0 + \beta_1 X). \tag{11.4}
\end{align}\]
\(\beta_0 + \beta_1 X\) in (11.4) plays the role of a quantile \(z\). Remember that \[\Phi(z) = P(Z \leq z) \, \ Z \sim \mathcal{N}(0,1)\] such that the Probit coefficient \(\beta_1\) in (11.4) is the change in \(z\) associated with a one unit change in \(X\). Although the effect on \(z\) of a change in \(X\) is linear, the link between \(z\) and the dependent variable \(Y\) is nonlinear since \(\Phi\) is a nonlinear function of \(X\).

Since the dependent variable is a nonlinear function of the regressors, the coefficient on \(X\) has no simple interpretation. According to Key Concept 8.1, the expected change in the probability that \(Y=1\) due to a change in \(P/I \ ratio\) can be computed as follows:

- Compute the predicted probability that \(Y=1\) for the original value of \(X\).

- Compute the predicted probability that \(Y=1\) for \(X + \Delta X\).

- Compute the difference between both predicted probabilities.

Of course we can generalize (11.4) to Probit regression with multiple regressors to mitigate the risk of facing omitted variable bias. Probit regression essentials are summarized in Key Concept 11.2.

### Key Concept 11.2

### Probit Model, Predicted Probabilities and Estimated Effects

Assume that \(Y\) is a binary variable. The model

\[Y= \beta_0 + \beta_1 + X_1 + \beta_2 X_2 + \dots + \beta_k X_k + u \] with \[P(Y = 1 \vert X_1, X_2, \dots,X_k) = \Phi(\beta_0 + \beta_1 + X_1 + \beta_2 X_2 + \dots + \beta_k X_k)\] is the population Probit model with multiple regressors \(X_1, X_2, \dots, X_k\) and \(\Phi(\cdot)\) is the cumulative standard normal distribution function.

The predicted probability that \(Y=1\) given \(X_1, X_2, \dots, X_k\) can be calculated in two steps:

- Compute \(z = \beta_0 + \beta_1 X_1 + \beta_2 X_2 + \dots + \beta_k X_k\)

- Look up \(\Phi(z)\) by calling pnorm().

\(\beta_j\) is the effect on \(z\) of a one unit change in regressor \(X_j\), holding constant all other \(k-1\) regressors.

The effect on the predicted probability of a change in a regressor can be computed as in Key Concept 8.1.

In R, Probit models can be estimated using the function glm() from the package stats. Using the argument family we specify that we want to use a Probit link function.

We now estimate a simple Probit model of the probability of a mortgage denial.

```r
# estimate the simple probit model
denyprobit

```r
## z test of coefficients:
## Estimate Std. Error z value Pr(>|z|)
## (Intercept) -2.19415 0.18901 -11.6087 \[\begin{align}
\widehat{P(deny\vert P/I \ ratio}) = \Phi(-\underset{(0.19)}{2.19} + \underset{(0.54)}{2.97} P/I \ ratio). \tag{11.5}
\end{align}\]
Just as in the linear probability model we find that the relation between the probability of denial and the payments-to-income ratio is positive and that the corresponding coefficient is highly significant.

The following code chunk reproduces Figure 11.2 of the book.

```r
# plot data
plot(x = HMDA$pirat,
y = HMDA$deny,
main = "Probit Model of the Probability of Denial, Given P/I Ratio",
xlab = "P/I ratio",
ylab = "Deny",
pch = 20,
ylim = c(-0.4, 1.4),
cex.main = 0.85)

# add horizontal dashed lines and text
abline(h = 1, lty = 2, col = "darkred")
abline(h = 0, lty = 2, col = "darkred")
text(2.5, 0.9, cex = 0.8, "Mortgage denied")
text(2.5, -0.1, cex= 0.8, "Mortgage approved")

# add estimated regression line
x

The estimated regression function has a stretched “S”-shape which is typical for the CDF of a continuous random variable with symmetric PDF like that of a normal random variable. The function is clearly nonlinear and flattens out for large and small values of \(P/I \ ratio\) . The functional form thus also ensures that the predicted conditional probabilities of a denial lie between \(0\) and \(1\) .

We use predict() to compute the predicted change in the denial probability when \(P/I \ ratio\) is increased from \(0.3\) to \(0.4\) .

```r
# 1. compute predictions for P/I ratio = 0.3, 0.4
predictions

```r
## 2
## 0.06081433
```

We find that an increase in the payment-to-income ratio from \(0.3\) to \(0.4\) is predicted to increase the probability of denial by approximately \(6.2\%\).

We continue by using an augmented Probit model to estimate the effect of race on the probability of a mortgage application denial.

```r
denyprobit2

```r
## z test of coefficients:
## Estimate Std. Error z value Pr(>|z|)
## (Intercept) -2.258787 0.176608 -12.7898 \[\begin{align}
\widehat{P(deny\vert P/I \ ratio, black)} = \Phi (-\underset{(0.18)}{2.26} + \underset{(0.50)}{2.74} P/I \ ratio + \underset{(0.08)}{0.71} black). \tag{11.6}
\end{align}\]
While all coefficients are highly significant, both the estimated coefficients on the payments-to-income ratio and the indicator for African American descent are positive. Again, the coefficients are difficult to interpret but they indicate that, first, African Americans have a higher probability of denial than white applicants, holding constant the payments-to-income ratio and second, applicants with a high payments-to-income ratio face a higher risk of being rejected.

How big is the estimated difference in denial probabilities between two hypothetical applicants with the same payments-to-income ratio? As before, we may use predict() to compute this difference.

```r
# 1. compute predictions for P/I ratio = 0.3
predictions

```r
## 2
## 0.1578117
```

In this case, the estimated difference in denial probabilities is about \(15.8\%\) .

### Logit Regression

Key Concept 11.3 summarizes the Logit regression function.

### Key Concept 11.3

### Logit Regression

The population Logit regression function is

\[\begin{align*}
P(Y=1\vert X_1, X_2, \dots, X_k) =& \, F(\beta_0 + \beta_1 X_1 + \beta_2 X_2 + \dots + \beta_k X_k) \\
=& \, \frac{1}{1+e^{-(\beta_0 + \beta_1 X_1 + \beta_2 X_2 + \dots + \beta_k X_k)}}.
\end{align*}\]
The idea is similar to Probit regression except that a different CDF is used: \[F(x) = \frac{1}{1+e^{-x}}\] is the CDF of a standard logistically distributed random variable.

As for Probit regression, there is no simple interpretation of the model coefficients and it is best to consider predicted probabilities or differences in predicted probabilities. Here again, \(t\) -statistics and confidence intervals based on large sample normal approximations can be computed as usual.

It is fairly easy to estimate a Logit regression model using R .

```r
denylogit

```r
## z test of coefficients:
## Estimate Std. Error z value Pr(>|z|)
## (Intercept) -4.02843 0.35898 -11.2218

```r
# plot data
plot(x = HMDA$pirat,
y = HMDA$deny,
main = "Probit and Logit Models Model of the Probability of Denial, Given P/I Ratio",
xlab = "P/I ratio",
ylab = "Deny",
pch = 20,
ylim = c(-0.4, 1.4),
cex.main = 0.9)

# add horizontal dashed lines and text
abline(h = 1, lty = 2, col = "darkred")
abline(h = 0, lty = 2, col = "darkred")
text(2.5, 0.9, cex = 0.8, "Mortgage denied")
text(2.5, -0.1, cex= 0.8, "Mortgage approved")

# add estimated regression line of Probit and Logit models
x

Both models produce very similar estimates of the probability that a mortgage application will be denied depending on the applicants payment-to-income ratio.

Following the book we extend the simple Logit model of mortgage denial with the additional regressor \(black\).

```r
# estimate a Logit regression with multiple regressors
denylogit2

```r
## z test of coefficients:
## Estimate Std. Error z value Pr(>|z|)
## (Intercept) -4.12556 0.34597 -11.9245 \[\begin{align}
\widehat{P(deny=1 \vert P/I ratio, black)} = F(-\underset{(0.35)}{4.13} + \underset{(0.96)}{5.37} P/I \ ratio + \underset{(0.15)}{1.27} black). \tag{11.7}
\end{align}\]
As for the Probit model (11.6) all model coefficients are highly significant and we obtain positive estimates for the coefficients on \(P/I \ ratio\) and \(black\). For comparison we compute the predicted probability of denial for two hypothetical applicants that differ in race and have a \(P/I \ ratio\) of \(0.3\).

```r
# 1. compute predictions for P/I ratio = 0.3
predictions

```r
## 1 2
## 0.07485143 0.22414592
```

```r
# 2. Compute difference in probabilities
diff(predictions)
```

```r
## 2
## 0.1492945
```

We find that the white applicant faces a denial probability of only \(7.5\%\) , while the African American is rejected with a probability of \(22.4\%\) , a difference of \(14.9\%\) .

#### Comparison of the Models

The Probit model and the Logit model deliver only approximations to the unknown population regression function \(E(Y\vert X)\) . It is not obvious how to decide which model to use in practice. The linear probability model has the clear drawback of not being able to capture the nonlinear nature of the population regression function and it may predict probabilities to lie outside the interval \([0,1]\) . Probit and Logit models are harder to interpret but capture the nonlinearities better than the linear approach: both models produce predictions of probabilities that lie inside the interval \([0,1]\) . Predictions of all three models are often close to each other. The book suggests to use the method that is easiest to use in the statistical software of choice. As we have seen, it is equally easy to estimate Probit and Logit model using R . We can therefore give no general recommendation which method to use.

## 11.3 Estimation and Inference in the Logit and Probit Models

So far nothing has been said about how Logit and Probit models are estimated by statistical software. The reason why this is interesting is that both models are nonlinear in the parameters and thus cannot be estimated using OLS. Instead one relies on maximum likelihood estimation (MLE). Another approach is estimation by nonlinear least squares (NLS).

#### Nonlinear Least Squares

Consider the multiple regression Probit model
\[\begin{align}
E(Y_i\vert X_{1i}, \dots, X_{ki}) = P(Y_i=1\vert X_{1i}, \dots, X_{ki}) = \Phi(\beta_0 + \beta_1 X_{1i} + \dots + \beta_k X_{ki}). \tag{11.8}
\end{align}\]
Similarly to OLS, NLS estimates the parameters \(\beta_0,\beta_1,\dots,\beta_k\) by minimizing the sum of squared mistakes \[\sum_{i=1}^n\left[ Y_i - \Phi(b_0 + b_1 X_{1i} + \dots + b_k X_{ki}) \right]^2.\] NLS estimation is a consistent approach that produces estimates which are normally distributed in large samples. In R there are functions like nls() from package stats which provide algorithms for solving nonlinear least squares problems. However, NLS is inefficient, meaning that there are estimation techniques that have a smaller variance which is why we will not dwell any further on this topic.

#### Maximum Likelihood Estimation

In MLE we seek to estimate the unknown parameters choosing them such that the likelihood of drawing the sample observed is maximized. This probability is measured by means of the likelihood function, the joint probability distribution of the data treated as a function of the unknown parameters. Put differently, the maximum likelihood estimates of the unknown parameters are the values that result in a model which is most likely to produce the data observed. It turns out that MLE is more efficient than NLS.

As maximum likelihood estimates are normally distributed in large samples, statistical inference for coefficients in nonlinear models like Logit and Probit regression can be made using the same tools that are used for linear regression models: we can compute \(t\) -statistics and confidence intervals.

Many software packages use an MLE algorithm for estimation of nonlinear models. The function glm() uses an algorithm named iteratively reweighted least squares .

#### Measures of Fit

It is important to be aware that the usual \(R^2\) and \(\bar{R}^2\) are invalid for nonlinear regression models. The reason for this is simple: both measures assume that the relation between the dependent and the explanatory variable(s) is linear. This obviously does not hold for Probit and Logit models. Thus \(R^2\) need not lie between \(0\) and \(1\) and there is no meaningful interpretation. However, statistical software sometimes reports these measures anyway.

There are many measures of fit for nonlinear regression models and there is no consensus which one should be reported. The situation is even more complicated because there is no measure of fit that is generally meaningful. For models with a binary response variable like \(deny\) one could use the following rule: If \(Y_i = 1\) and \(\widehat{P(Y_i|X_{i1}, \dots, X_{ik})} > 0.5\) or if \(Y_i = 0\) and \(\widehat{P(Y_i|X_{i1}, \dots, X_{ik})}
```r
# compute pseudo-R2 for the probit model of mortgage denial
pseudoR2

```r
## [1] 0.08594259
```

Another way to obtain the \(\text{pseudo-}R^2\) is to estimate the null model using glm() and extract the maximized log-likelihoods for both the null and the full model using the function logLik().

```r
# compute the null model
denyprobit_null

```r
## [1] 0.08594259
```

- This is in contrast to the case of a numeric dependent variable where we use the squared errors for assessment of the quality of the prediction. ↩

## 11.4 Application to the Boston HMDA Data

Models (11.6) and (11.7) indicate that denial rates are higher for African American applicants holding constant the payment-to-income ratio. Both results could be subject to omitted variable bias. In order to obtain a more trustworthy estimate of the effect of being black on the probability of a mortgage application denial we estimate a linear probability model as well as several Logit and Probit models. We thereby control for financial variables and additional applicant characteristics which are likely to influence the probability of denial and differ between black and white applicants.

Sample averages as shown in Table 11.1 of the book can be easily reproduced using the functions mean() (as usual for numeric variables) and prop.table() (for factor variables).

```r
# Mean P/I ratio
mean(HMDA$pirat)
```

```r
## [1] 0.3308136
```

```r
# inhouse expense-to-total-income ratio
mean(HMDA$hirat)
```

```r
## [1] 0.2553461
```

```r
# loan-to-value ratio
mean(HMDA$lvrat)
```

```r
## [1] 0.7377759
```

```r
# consumer credit score
mean(as.numeric(HMDA$chist))
```

```r
## [1] 2.116387
```

```r
# mortgage credit score
mean(as.numeric(HMDA$mhist))
```

```r
## [1] 1.721008
```

```r
# public bad credit record
mean(as.numeric(HMDA$phist)-1)
```

```r
## [1] 0.07352941
```

```r
# denied mortgage insurance
prop.table(table(HMDA$insurance))
```

```r
## no yes
## 0.97983193 0.02016807
```

```r
# self-employed
prop.table(table(HMDA$selfemp))
```

```r
## no yes
## 0.8836134 0.1163866
```

```r
# single
prop.table(table(HMDA$single))
```

```r
## no yes
## 0.6067227 0.3932773
```

```r
# high school diploma
prop.table(table(HMDA$hschool))
```

```r
## no yes
## 0.01638655 0.98361345
```

```r
# unemployment rate
mean(HMDA$unemp)
```

```r
## [1] 3.774496
```

```r
# condominium
prop.table(table(HMDA$condomin))
```

```r
## no yes
## 0.7117647 0.2882353
```

```r
# black
prop.table(table(HMDA$black))
```

```r
## no yes
## 0.857563 0.142437
```

```r
# deny
prop.table(table(HMDA$deny))
```

```r
## 0 1
## 0.8802521 0.1197479
```

See Chapter 11.4 of the book or use R ’s help function for more on variables contained in the HMDA dataset.

Before estimating the models we transform the loan-to-value ratio ( lvrat ) into a factor variable, where

\[\begin{align*}
lvrat =
\begin{cases}
\text{low} & \text{if} \ \ lvrat < 0.8, \\
\text{medium} & \text{if} \ \ 0.8 \leq lvrat \leq 0.95, \\
\text{high} & \text{if} \ \ lvrat > 0.95
\end{cases}
\end{align*}\]
and convert both credit scores to numeric variables.

```r
# define low, medium and high loan-to-value ratio
HMDA$lvrat = 0.8 & HMDA$lvrat
Next we reproduce the estimation results presented in Table 11.2 of the book.

```r
# estimate all 6 models for the denial probability
lpm_HMDA
Just as in previous chapters, we store heteroskedasticity-robust standard errors of the coefficient estimators in a list which is then used as the argument se in stargazer() .

```r
rob_se

Dependent Variable: Mortgage Application Denial

deny
OLS logistic probit
(1) (2) (3) (4) (5) (6)
blackyes 0.084 *** 0.688 *** 0.389 *** 0.371 *** 0.363 *** 0.246
(0.023) (0.183) (0.099) (0.100) (0.101) (0.479)

pirat 0.449 *** 4.764 *** 2.442 *** 2.464 *** 2.622 *** 2.572 ***
(0.114) (1.332) (0.673) (0.654) (0.665) (0.728)

hirat -0.048 -0.109 -0.185 -0.302 -0.502 -0.538
(0.110) (1.298) (0.689) (0.689) (0.715) (0.755)

lvratmedium 0.031 ** 0.464 *** 0.214 *** 0.216 *** 0.215 ** 0.216 ***
(0.013) (0.160) (0.082) (0.082) (0.084) (0.083)

lvrathigh 0.189 *** 1.495 *** 0.791 *** 0.795 *** 0.836 *** 0.788 ***
(0.050) (0.325) (0.183) (0.184) (0.185) (0.185)

chist 0.031 *** 0.290 *** 0.155 *** 0.158 *** 0.344 *** 0.158 ***
(0.005) (0.039) (0.021) (0.021) (0.108) (0.021)

mhist 0.021 * 0.279 ** 0.148 ** 0.110 0.162 0.111
(0.011) (0.138) (0.073) (0.076) (0.104) (0.077)

phistyes 0.197 *** 1.226 *** 0.697 *** 0.702 *** 0.717 *** 0.705 ***
(0.035) (0.203) (0.114) (0.115) (0.116) (0.115)

insuranceyes 0.702 *** 4.548 *** 2.557 *** 2.585 *** 2.589 *** 2.590 ***
(0.045) (0.576) (0.305) (0.299) (0.306) (0.299)

selfempyes 0.060 *** 0.666 *** 0.359 *** 0.346 *** 0.342 *** 0.348 ***
(0.021) (0.214) (0.113) (0.116) (0.116) (0.116)

singleyes 0.229 *** 0.230 *** 0.226 ***
(0.080) (0.086) (0.081)

hschoolyes -0.613 *** -0.604 ** -0.620 ***
(0.229) (0.237) (0.229)

unemp 0.030 * 0.028 0.030
(0.018) (0.018) (0.018)

condominyes -0.055
(0.096)

I(mhist == 3) -0.107
(0.301)

I(mhist == 4) -0.383
(0.427)

I(chist == 3) -0.226
(0.248)

I(chist == 4) -0.251
(0.338)

I(chist == 5) -0.789 *
(0.412)

I(chist == 6) -0.905 *
(0.515)

blackyes:pirat -0.579
(1.550)

blackyes:hirat 1.232
(1.709)

Constant -0.183 *** -5.707 *** -3.041 *** -2.575 *** -2.896 *** -2.543 ***
(0.028) (0.484) (0.250) (0.350) (0.404) (0.370)

Observations 2,380 2,380 2,380 2,380 2,380 2,380
R 2 0.266
Adjusted R 2 0.263
Log Likelihood -635.637 -636.847 -628.614 -625.064 -628.332
Akaike Inf. Crit. 1,293.273 1,295.694 1,285.227 1,292.129 1,288.664
Residual Std. Error 0.279 (df = 2369)
F Statistic 85.974 *** (df = 10; 2369)
Note: * p ** p *** p

Table 11.1: HMDA Data: LPM, Probit and Logit Models

In Table 11.1, models (1), (2) and (3) are baseline specifications that include several financial control variables. They differ only in the way they model the denial probability. Model (1) is a linear probability model, model (2) is a Logit regression and model (3) uses the Probit approach.

In the linear model (1), the coefficients have direct interpretation. For example, an increase in the consumer credit score by \(1\) unit is estimated to increase the probability of a loan denial by about \(0.031\) percentage points. Having a high loan-to-value ratio is detriment for credit approval: the coefficient for a loan-to-value ratio higher than \(0.95\) is \(0.189\) so clients with this property are estimated to face an almost \(19\%\) larger risk of denial than those with a low loan-to-value ratio, ceteris paribus. The estimated coefficient on the race dummy is \(0.084\), which indicates the denial probability for African Americans is \(8.4\%\) larger than for white applicants with the same characteristics except for race. Apart from the housing-expense-to-income ratio and the mortgage credit score, all coefficients are significant.

Models (2) and (3) provide similar evidence that there is racial discrimination in the U.S. mortgage market. All coefficients except for the housing expense-to-income ratio (which is not significantly different from zero) are significant at the \(1\%\) level. As discussed above, the nonlinearity makes the interpretation of the coefficient estimates more difficult than for model (1). In order to make a statement about the effect of being black, we need to compute the estimated denial probability for two individuals that differ only in race. For the comparison we consider two individuals that share mean values for all numeric regressors. For the qualitative variables we assign the property that is most representative for the data at hand. For example, consider self-employment: we have seen that about \(88\%\) of all individuals in the sample are not self-employed such that we set selfemp = no. Using this approach, the estimate for the effect on the denial probability of being African American of the Logit model (2) is about \(4\%\). The next code chunk shows how to apply this approach for models (1) to (7) using R.

```r
# comppute regressor values for an average black person
new

```r
## 2
## 0.08369674
```

```r
# differnce predicted by the logit model
predictions

```r
## 2
## 0.04042135
```

```r
# difference predicted by probit model (3)
predictions

```r
## 2
## 0.05049716
```

```r
# difference predicted by probit model (4)
predictions

```r
## 2
## 0.03978918
```

```r
# difference predicted by probit model (5)
predictions

```r
## 2
## 0.04972468
```

```r
# difference predicted by probit model (6)
predictions

```r
## 2
## 0.03955893
```

The estimates of the impact on the denial probability of being black are similar for models (2) and (3). It is interesting that the magnitude of the estimated effects is much smaller than for Probit and Logit models that do not control for financial characteristics (see section 11.2). This indicates that these simple models produce biased estimates due to omitted variables.

Regressions (4) to (6) use regression specifications that include different applicant characteristics and credit rating indicator variables as well as interactions. However, most of the corresponding coefficients are not significant and the estimates of the coefficient on black obtained for these models as well as the estimated difference in denial probabilities do not differ much from those obtained for the similar specifications (2) and (3).

An interesting question related to racial discrimination can be investigated using the Probit model (6) where the interactions blackyes:pirat and blackyes:hirat are added to model (4). If the coefficient on blackyes:pirat was different from zero, the effect of the payment-to-income ratio on the denial probability would be different for black and white applicants. Similarly, a non-zero coefficient on blackyes:hirat would indicate that loan officers weight the risk of bankruptcy associated with a high loan-to-value ratio differently for black and white mortgage applicants. We can test whether these coefficients are jointly significant at the \(5\%\) level using an \(F\) -Test.

```r
linearHypothesis(probit_HMDA_4,
test = "F",
c("blackyes:pirat=0", "blackyes:hirat=0"),
vcov = vcovHC, type = "HC1")
```

```r
## Linear hypothesis test
## Hypothesis:
## blackyes:pirat = 0
## blackyes:hirat = 0
## Model 1: restricted model
## Model 2: deny ~ black * (pirat + hirat) + lvrat + chist + mhist + phist +
## insurance + selfemp + single + hschool + unemp
## Note: Coefficient covariance matrix supplied.
## Res.Df Df F Pr(>F)
## 1 2366
## 2 2364 2 0.2473 0.7809
```

Since \(p\text{-value} \approx 0.77\) for this test, the null cannot be rejected. Nonetheless, we can reject the hypothesis that there is no racial discrimination at all since the corresponding \(F\) -test has a \(p\text{-value}\) of about \(0.002\).

```r
linearHypothesis(probit_HMDA_4,
test = "F",
c("blackyes=0", "blackyes:pirat=0", "blackyes:hirat=0"),
vcov = vcovHC, type = "HC1")
```

```r
## Linear hypothesis test
## Hypothesis:
## blackyes = 0
## blackyes:pirat = 0
## blackyes:hirat = 0
## Model 1: restricted model
## Model 2: deny ~ black * (pirat + hirat) + lvrat + chist + mhist + phist +
## insurance + selfemp + single + hschool + unemp
## Note: Coefficient covariance matrix supplied.
## Res.Df Df F Pr(>F)
## 1 2367
## 2 2364 3 4.7774 0.002534 **
## ---
## Signif. codes: 0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

#### Summary

Models (1) to (6) provide evidence that there is an effect of being African American on the probability of a mortgage application denial: in all specifications, the effect is estimated to be positive (ranging from \(4\%\) to \(5\%\)) and is significantly different from zero at the \(1\%\) level. While the linear probability model seems to slightly overestimate this effect, it still can be used as an approximation to an intrinsically nonlinear relationship.

See Chapters 11.4 and 11.5 of the book for a discussion of external and internal validity of this study and some concluding remarks on regression models where the dependent variable is binary.

## 11.5 Exercises

#### 1. Titanic Survival Data

Chapter 11.2 presented three approaches to model the conditional expectation function of a binary dependent variable: the linear probability model as well as Probit and Logit regression.

The exercises in this Chapter use data on the fate of the passengers of the ocean linear Titanic. We aim to explain survival, a binary variable, by socioeconomic variables using the above approaches.

In this exercise we start with the aggregated data set Titanic. It is part of the package datasets which is part of base R. The following quote from the description of the dataset motivates the attempt to predict the probability of survival:

The sinking of the Titanic is a famous event, and new books are still being published about it. Many well-known facts — from the proportions of first-class passengers to the ‘women and children first’ policy, and the fact that that policy was not entirely successful in saving the women and children in the third class — are reflected in the survival rates for various classes of passenger.

Instructions:

- Assign the Titanic data to Titanic_1 and get an overview.

- Visualize the conditional survival rates for travel class (Class), gender (Sex) and age (Age) using mosaicplot().

#### 2. Titanic Survival Data — Ctd.

The Titanic data set from Exercise 1 is not useful for regression analysis because it is highly aggregated. In this exercise you will work with titanic.csv which is available under the URL https://stanford.io/2O9RUCF.

The columns of titanic.csv contain the following variables:

Survived — The survived indicator

Pclass — passenger class

Name — passenger’s Name

Sex — passenger’s gender

Age — passengers’s age

Siblings — number of siblings aboard

Parents.Children.Aboard — number of parents and children aboard

fare — the fare paid in british pound

Instructions:

- Import the data from titanic.csv using the function read.csv2(). Save it to Titanic_2.

- Assign the following column names to Titanic_2: Survived, Class, Name, Sex, Age, Siblings, Parents and Fare.

- Get an overview over the data set. Drop the column Name.

- Attach the packages corrplot and dplyr. Check whether there is multicollinearity in the data using corrplot().

Hints:

- read_csv() guesses the column specification as well as the seperators used in the.csv file. You should always check if the result is correct.

- You may use select_if() from the dplyr package to select all numeric columns from the data set.

#### 3. Titanic Survival Data — Survival Rates

Contingency tables similar to those provided by the data set Titanic from Exercise 1 may shed some light on the distribution of survival conditional and possible determinants thereof, e.g., the passenger class. Contingency tables are easily created using the base R function table.

Instructions:

- Generate a contingency table for Survived and Class using table(). Save the table to t_abs.

- t_abs reports absolute frequencies. Transform t_abs into a table which reports relative frequencies (relative to the total number of observations). Save the result to t_rel.

- Visualize the relative frequencies in t_rel using barplot(). Use different colors for better distinquishablitly among survival and non-survival rate (it does not matter which colors you use).

#### 4. Titanic Survival Data — Conditional Distributions of Age

Contingency tables are useful for summarizing distribution of categorical variables like Survived and Class in Exercise 3. They are, however, not useful when the variable of interest takes on many different integers (and they are even impossible to generate when the variable is continuous).

In this exercise you are asked to generate and visualize density estimates of the distribution of Age conditional on Survived to see whether there are indications how age relates to the chance of survival (despite that the data set reports integers, we treat Age as a continuous variable here). For example, it is interesting to see if the ‘women and children first’ policy was effective.

The data set Titanic_2 from the previous exercises is available in your working environment.

Instructions:

- Obtain kernel density estimates of the distributions of Age for both the survivors and the deceased.

- Save the results to dens_age_surv (survived) and dens_age_died (died).

- Plot both kernel density estimates (overlay them in a single plot!). Use different colors of your choive to make the estimates distinguishable.

Hints:

- Kernel density estimates can be obtained using the functon density().

- Use plot() and lines() to plot the density estimates.

#### 5. Titanic Survival Data — A Linear Probability Model for Survival I

How do socio-economic characteristics of the passengers impact the probability of survival? In particular, are there systematic differences between the three passenger classes? Do the data reflect the ‘children and women first’ policy?

It is natural to start the analysis by estimating a simple linear probability model like (LMP) \[Survived_i = \beta_0 + \beta_1 Class2_i + \beta_2 Class3_i + u_i\] with dummy variables \(Class2_i\) and \(Class3_i\).

The data set Titanic_2 from the previous exercises is available in your working environment.

Instructions:

- Attach the AER package.

- Class is of type int (integer), Convert Class to a factor variable.

- Estimate the linear probability model and save the result to surv_mod.

- Obtain a robust summary of the model coefficients.

- Use surv_mod to predict the probability of survival for the three passenger classes.

Hints:

- Linear probability models can be estimated using lm().

- Use predict() to obtain the predictions. Remember that a data.frame must be provided to the argument newdata.

#### 6. Titanic Survival Data — A Linear Probability Model for Survival II

Consider again the outcome from Exercise 5:

\[\widehat{Survived}_i = \underset{(0.03)}{0.63} - \underset{(0.05)}{0.16} Class2_i - \underset{(0.04)}{0.39} Class3_i + u_i \]

(The estimated coefficients in this model are related to the class specific sample means of Survived. You are asked to compute them below.)

The highly significant coefficients indicate that the probability of survival decreases with the passenger class, that is, passengers from a less luxurious class are less likely to survive.

This result could be affected by omitted variable bias arising from correlation of the passenger class with determinants of the probability of survival not included in the model. We therefore augment the model such that it includes all remaining variables as regressors.

The data set Titanic_2 as well as the model surv_mod from the previous exercises are available in your working environment. The AER package is attached.

Instructions:

- Use the model object surv_mod to obtain the class specific estimates for the probability of survival. Store them in surv_prob_c1, surv_prob_c2 and surv_prob_c3.

- Fit the augmented LMP and assign the result to the object LPM_mod.

- Obtain a robust summary of the model coefficients.

Hint:

- Remember that the formula a ~. specifies a regression of a on all other variables in the data set provided as the argument data in glm().

#### 7. Titanic Survival Data — Logistic Regression

Chapter 11.2 introduces Logistic regression, also called Logit regression, which is a more suitable than the LPM for modelling the conditional probability function of a dichotomous outcome variable. Logit regression uses a nonlinear link function that restricts the fitted values to lie between \(0\) and \(1\): in Logit regression, the log-odds of the outcome are modeled as a linear combination of the predictors while the LPM assumes that the conditional probability function of outcome is linear.

The data set Titanic_2 from Exercise 2 is available in your working environment. The package AER is attached.

Instructions:

- Use glm() to estimate the model \[\begin{align*} \log\left(\frac{P(survived_i = 1)}{1-P(survived_i = 1)}\right) =& \, \beta_0 + \beta_1 Class2_i + \beta_2 Ckass3_i + \beta_3 Sex_i \\ +& \, \beta_4 Age_i + \beta_5 Siblings_i + \beta_6 Perents_i + \beta_7 Fare_i + u_i. \end{align*}\]

- Obtain a robust summary of the model coefficients.

- The data frame passengers contains data on three hypothetical male passengers that differ only in their passenger class (the other variables are set to the respective sample average). Use Logit_mod to predict the probability of survival for these passengers.

Hints:

- Remember that the formula a ~. specifies a regression of a on all other variables in the data set provided as the argument data in glm().

- You need to specify the correct type of prediction in predict().

#### 8. Titanic Survival Data — Probit Regression

Repeat Exercise 7 but this time estimate the Probit model
\[\begin{align*}
P(Survived_i = 1\vert Class2_i, Class3_i, \dots, Fare_i) =& \, \Phi (\beta_0 + \beta_1 Class2_i + \beta_2 Class3_i + \beta_3 Sex_i \\ +& \, \beta_4 Age_i + \beta_5 Siblings_i + \beta_6 Parents_i + \beta_7 Fare_i + u_i).
\end{align*}\]
The data set Titanic_2 from the previous exercises as well as the Logit model Logit_mod are available in your working environment. The package AER is attached.

Instructions:

- Use glm() to estimate the above Probit model. Save the result to Probit_mod.

- Obtain a robust summary of the model coefficients.

- The data frame passengers contains data on three hypothetical male passengers that differ only in their passenger class (the other variables are set to the respective sample average). Use Probit_mod to predict the probability of survival for these passengers.

Hints:

- Remember that the formula a ~. specifies a regression of a on all other variables in the data set provided as the argument data in glm().

- You need to specify the correct type of prediction in predict().

-->
