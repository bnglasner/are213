# Regression Models with Multiple Regressors

- Primary Source URL: https://bookdown.org/machar1991/ITER/6-rmwmr.html
- Imported on: 2026-03-23
- Component pages: 7

## Source Components

1. `6 Regression Models with Multiple Regressors` - https://bookdown.org/machar1991/ITER/6-rmwmr.html
2. `6.1 Omitted Variable Bias` - https://bookdown.org/machar1991/ITER/6-1-omitted-variable-bias.html
3. `6.2 The Multiple Regression Model` - https://bookdown.org/machar1991/ITER/6-2-tmrm.html
4. `6.3 Measures of Fit in Multiple Regression` - https://bookdown.org/machar1991/ITER/6-3-mofimr.html
5. `6.4 OLS Assumptions in Multiple Regression` - https://bookdown.org/machar1991/ITER/6-4-ols-assumptions-in-multiple-regression.html
6. `6.5 The Distribution of the OLS Estimators in Multiple Regression` - https://bookdown.org/machar1991/ITER/6-5-the-distribution-of-the-ols-estimators-in-multiple-regression.html
7. `6.6 Exercises` - https://bookdown.org/machar1991/ITER/6-6-exercises-4.html

## Compiled Content

## 6 Regression Models with Multiple Regressors

In what follows we introduce linear regression models that use more than just one explanatory variable and discuss important key concepts in multiple regression. As we broaden our scope beyond the relationship of only two variables (the dependent variable and a single regressor) some potential new issues arise such as multicollinearity and omitted variable bias (OVB). In particular, this chapter deals with omitted variables and its implication for causal interpretation of OLS-estimated coefficients.

Naturally, we will discuss estimation of multiple regression models using R. We will also illustrate the importance of thoughtful usage of multiple regression models via simulation studies that demonstrate the consequences of using highly correlated regressors or misspecified models.

The packages AER (Christian Kleiber & Zeileis, 2017) and MASS (Ripley, 2018) are needed for reproducing the code presented in this chapter. Make sure that the following code chunk executes without any errors.

```r
library(AER)
library(MASS)
```

### References

Kleiber, C., & Zeileis, A. (2017). AER: Applied Econometrics with R (Version 1.2-5). Retrieved from https://CRAN.R-project.org/package=AER

Ripley, B. (2018). MASS: Support Functions and Datasets for Venables and Ripley’s MASS (Version 7.3-50). Retrieved from https://CRAN.R-project.org/package=MASS

## 6.1 Omitted Variable Bias

The previous analysis of the relationship between test score and class size discussed in Chapters 4 and 5 has a major flaw: we ignored other determinants of the dependent variable (test score) that correlate with the regressor (class size). Remember that influences on the dependent variable which are not captured by the model are collected in the error term, which we so far assumed to be uncorrelated with the regressor. However, this assumption is violated if we exclude determinants of the dependent variable which vary with the regressor. This might induce an estimation bias, i.e., the mean of the OLS estimator’s sampling distribution is no longer equals the true mean. In our example we therefore wrongly estimate the causal effect on test scores of a unit change in the student-teacher ratio, on average. This issue is called omitted variable bias (OVB) and is summarized by Key Concept 6.1.

### Key Concept 6.1

### Omitted Variable Bias in Regression with a Single Regressor

Omitted variable bias is the bias in the OLS estimator that arises when the regressor, \(X\), is correlated with an omitted variable. For omitted variable bias to occur, two conditions must be fulfilled:

- \(X\) is correlated with the omitted variable.

- The omitted variable is a determinant of the dependent variable \(Y\).

Together, 1. and 2. result in a violation of the first OLS assumption \(E(u_i\vert X_i) = 0\). Formally, the resulting bias can be expressed as

\[\hat\beta_1 \xrightarrow[]{p} \beta_1 + \rho_{Xu} \frac{\sigma_u}{\sigma_X}. \tag{6.1} \] See Appendix 6.1 of the book for a detailed derivation. (6.1) states that OVB is a problem that cannot be solved by increasing the number of observations used to estimate \(\beta_1\), as \(\hat\beta_1\) is inconsistent: OVB prevents the estimator from converging in probability to the true parameter value. Strength and direction of the bias are determined by \(\rho_{Xu}\), the correlation between the error term and the regressor.

In the example of test score and class size, it is easy to come up with variables that may cause such a bias, if omitted from the model. As mentioned in the book, a highly relevant variable could be the percentage of English learners in the school district: it is plausible that the ability to speak, read and write English is an important factor for successful learning. Therefore, students that are still learning English are likely to perform worse in tests than native speakers. Also, it is conceivable that the share of English learning students is bigger in school districts where class sizes are relatively large: think of poor urban districts where a lot of immigrants live.

Let us think about a possible bias induced by omitting the share of English learning students (\(PctEL\)) in view of (6.1). When the estimated regression model does not include \(PctEL\) as a regressor although the true data generating process (DGP) is

\[TestScore = \beta_0 + \beta_1 \times STR + \beta_2 \times PctEL \tag{6.2}\]

where \(STR\) and \(PctEL\) are correlated, we have

\[\rho_{STR,PctEL}\neq0.\]

Let us investigate this using R. After defining our variables we may compute the correlation between \(STR\) and \(PctEL\) as well as the correlation between \(STR\) and \(TestScore\).

```r
# load the AER package
library(AER)

# load the data set
data(CASchools)

# define variables
CASchools$STR

```r
## [1] -0.2263627
```

```r
cor(CASchools$STR, CASchools$english)
```

```r
## [1] 0.1876424
```

The fact that \(\widehat{\rho}_{STR, Testscore} = -0.2264\) is cause for concern that omitting \(PctEL\) leads to a negatively biased estimate \(\hat\beta_1\) since this indicates that \(\rho_{Xu}
```r
# estimate both regression models
mod

```r
## Call:
## lm(formula = score ~ STR, data = CASchools)
## Coefficients:
## (Intercept) STR
## 698.93 -2.28
```

```r
mult.mod
```

```r
## Call:
## lm(formula = score ~ STR + english, data = CASchools)
## Coefficients:
## (Intercept) STR english
## 686.0322 -1.1013 -0.6498
```

We find the outcomes to be consistent with our expectations.

The following section discusses some theory on multiple regression models.

## 6.2 The Multiple Regression Model

The multiple regression model extends the basic concept of the simple regression model discussed in Chapters 4 and 5. A multiple regression model enables us to estimate the effect on \(Y_i\) of changing a regressor \(X_{1i}\) if the remaining regressors \(X_{2i},X_{3i}\dots,X_{ki}\) do not vary. In fact we already have performed estimation of the multiple regression model (6.2) using R in the previous section. The interpretation of the coefficient on student-teacher ratio is the effect on test scores of a one unit change student-teacher ratio if the percentage of English learners is kept constant.

Just like in the simple regression model, we assume the true relationship between \(Y\) and \(X_{1i},X_{2i}\dots\dots,X_{ki}\) to be linear. On average, this relation is given by the population regression function

\[E(Y_i\vert X_{1i}=x_1, X_{2i}=x_2, X_{3i}=x_3,\dots, X_{ki}=x_k) = \beta_0 + \beta_1 x_1 + \beta_2 x_2 + \beta_3 x_3 + \dots + \beta_k x_k. \tag{6.3} \]

As in the simple regression model, the relation \[Y_i = \beta_0 + \beta_1 X_{1i} + \beta_2 X_{2i} + \beta_3 X_{3i} + \dots + \beta_k X_{ki}\] does not hold exactly since there are disturbing influences to the dependent variable \(Y\) we cannot observe as explanatory variables. Therefore we add an error term \(u\) which represents deviations of the observations from the population regression line to (6.3). This yields the population multiple regression model \[Y_i = \beta_0 + \beta_1 X_{1i} + \beta_2 X_{2i} + \beta_3 X_{3i} + \dots + \beta_k X_{ki} + u_i, \ i=1,\dots,n. \tag{6.4} \]

Key Concept 6.2 summarizes the core concepts of the multiple regression model.

### Key Concept 6.2

### The Multiple Regression Model

The multiple regression model is

\[Y_i = \beta_0 + \beta_1 X_{1i} + \beta_2 X_{2i} + \beta_3 X_{3i} + \dots + \beta_k X_{ki} + u_i \ \, \ \ i=1,\dots,n. \]

The designations are similar to those in the simple regression model:

- \(Y_i\) is the \(i^{th}\) observation in the dependent variable. Observations on the \(k\) regressors are denoted by \(X_{1i},X_{2i},\dots,X_{ki}\) and \(u_i\) is the error term.

- The average relationship between \(Y\) and the regressors is given by the population regression line \[E(Y_i\vert X_{1i}=x_1, X_{2i}=x_2, X_{3i}=x_3,\dots, X_{ki}=x_k) = \beta_0 + \beta_1 x_1 + \beta_2 x_2 + \beta_3 x_3 + \dots + \beta_k x_k. \]

- \(\beta_0\) is the intercept; it is the expected value of \(Y\) when all \(X\) s equal \(0\). \(\beta_j \, \ j=1,\dots,k\) are the coefficients on \(X_j \, \ j=1,\dots,k\). \(\beta_1\) measures the expected change in \(Y_i\) that results from a one unit change in \(X_{1i}\) while holding all other regressors constant.

How can we estimate the coefficients of the multiple regression model (6.4)? We will not go too much into detail on this issue as our focus is on using R. However, it should be pointed out that, similarly to the simple regression model, the coefficients of the multiple regression model can be estimated using OLS. As in the simple model, we seek to minimize the sum of squared mistakes by choosing estimates \(b_0,b_1,\dots,b_k\) for the coefficients \(\beta_0,\beta_1,\dots,\beta_k\) such that

\[\sum_{i=1}^n (Y_i - b_0 - b_1 X_{1i} - b_2 X_{2i} - \dots - b_k X_{ki})^2 \tag{6.5}\]

is minimized. Note that (6.5) is simply an extension of \(SSR\) in the case with just one regressor and a constant. The estimators that minimize (6.5) are hence denoted \(\hat\beta_0,\hat\beta_1,\dots,\hat\beta_k\) and, as in the simple regression model, we call them the ordinary least squares estimators of \(\beta_0,\beta_1,\dots,\beta_k\). For the predicted value of \(Y_i\) given the regressors and the estimates \(\hat\beta_0,\hat\beta_1,\dots,\hat\beta_k\) we have

\[\hat{Y}_i = \hat\beta_0 + \hat\beta_1 X_{1i} + \dots +\hat\beta_k X_{ki}. \] The difference between \(Y_i\) and its predicted value \(\hat{Y}_i\) is called the OLS residual of observation \(i\): \(\hat{u} = Y_i - \hat{Y}_i\).

For further information regarding the theory behind multiple regression, see Chapter 18.1 of the book which inter alia presents a derivation of the OLS estimator in the multiple regression model using matrix notation.

Now let us jump back to the example of test scores and class sizes. The estimated model object is mult.mod. As for simple regression models we can use summary() to obtain information on estimated coefficients and model statistics.

```r
summary(mult.mod)$coef
```

```r
## Estimate Std. Error t value Pr(>|t|)
## (Intercept) 686.0322445 7.41131160 92.565565 3.871327e-280
## STR -1.1012956 0.38027827 -2.896026 3.978059e-03
## english -0.6497768 0.03934254 -16.515882 1.657448e-47
```

So the estimated multiple regression model is

\[\widehat{TestScore} = 686.03 - 1.10 \times STR - 0.65 \times PctEL \tag{6.6}. \]

Unlike in the simple regression model where the data can be represented by points in the two-dimensional coordinate system, we now have three dimensions. Hence observations can be represented by points in three-dimensional space. Therefore (6.6) is now longer a regression line but a regression plane. This idea extends to higher dimensions when we further expand the number of regressors \(k\). We then say that the regression model can be represented by a hyperplane in the \(k+1\) dimensional space. It is already hard to imagine such a space if \(k=3\) and we best stick with the general idea that, in the multiple regression model, the dependent variable is explained by a linear combination of the regressors. However, in the present case we are able to visualize the situation. The following figure is an interactive 3D visualization of the data and the estimated regression plane (6.6).

We observe that the estimated regression plane fits the data reasonably well — at least with regard to the shape and spatial position of the points. The color of the markers is an indicator for the absolute deviation from the predicted regression plane. Observations that are colored more reddish lie close to the regression plane while the color shifts to blue with growing distance. An anomaly that can be seen from the plot is that there might be heteroskedasticity: we see that the dispersion of regression errors made, i.e., the distance of observations to the regression plane tends to decrease as the share of English learning students increases.

## 6.3 Measures of Fit in Multiple Regression

In multiple regression, common summary statistics are \(SER\), \(R^2\) and the adjusted \(R^2\).

Taking the code from Section 6.2, simply use summary(mult.mod) to obtain the \(SER\), \(R^2\) and adjusted- \(R^2\). For multiple regression models the \(SER\) is computed as

\[SER = s_{\hat u} = \sqrt{s_{\hat u}^2} \] where modify the denominator of the premultiplied factor in \(s_{\hat u}^2\) in order to accommodate for additional regressors. Thus,

\[s_{\hat u}^2 = \frac{1}{n-k-1} \, SSR \]

with \(k\) denoting the number of regressors excluding the intercept.

While summary() computes the \(R^2\) just as in the case of a single regressor, it is no reliable measure for multiple regression models. This is due to \(R^2\) increasing whenever an additional regressor is added to the model. Adding a regressor decreases the \(SSR\) — at least unless the respective estimated coefficient is exactly zero what practically never happens (see Chapter 6.4 of the book for a detailed argument). The adjusted \(R^2\) takes this into consideration by “punishing” the addition of regressors using a correction factor. So the adjusted \(R^2\), or simply \(\bar{R}^2\), is a modified version of \(R^2\). It is defined as

\[\bar{R}^2 = 1-\frac{n-1}{n-k-1} \, \frac{SSR}{TSS}. \]

As you may have already suspected, summary() adjusts the formula for \(SER\) and it computes \(\bar{R}^2\) and of course \(R^2\) by default, thereby leaving the decision which measure to rely on to the user.

You can find both measures at the bottom of the output produced by calling summary(mult.mod).

```r
summary(mult.mod)
```

```r
## Call:
## lm(formula = score ~ STR + english, data = CASchools)
## Residuals:
## Min 1Q Median 3Q Max
## -48.845 -10.240 -0.308 9.815 43.461
## Coefficients:
## Estimate Std. Error t value Pr(>|t|)
## (Intercept) 686.03224 7.41131 92.566
```r
# define the components
n

```r
## SER R2 Adj.R2
## 14.4644831 0.4264315 0.4236805
```

Now, what can we say about the fit of our multiple regression model for test scores with the percentage of English learners as an additional regressor? Does it improve on the simple model including only an intercept and a measure of class size? The answer is yes: compare \(\bar{R}^2\) with that obtained for the simple regression model mod.

Including \(PctEL\) as a regressor improves the \(\bar{R}^2\), which we deem to be more reliable in view of the above discussion. Notice that the difference between \(R^2\) and \(\bar{R}^2\) is small since \(k=2\) and \(n\) is large. In short, the fit of (6.6) improves vastly on the fit of the simple regression model with \(STR\) as the only regressor. Comparing regression errors we find that the precision of the multiple regression model (6.6) improves upon the simple model as adding \(PctEL\) lowers the \(SER\) from \(18.6\) to \(14.5\) units of test score.

As already mentioned, \(\bar{R}^2\) may be used to quantify how good a model fits the data. However, it is rarely a good idea to maximize these measures by stuffing the model with regressors. You will not find any serious study that does so. Instead, it is more useful to include regressors that improve the estimation of the causal effect of interest which is not assessed by means the \(R^2\) of the model. The issue of variable selection is covered in Chapter 8.

## 6.4 OLS Assumptions in Multiple Regression

In the multiple regression model we extend the three least squares assumptions of the simple regression model (see Chapter 4) and add a fourth assumption. These assumptions are presented in Key Concept 6.4. We will not go into the details of assumptions 1-3 since their ideas generalize easy to the case of multiple regressors. We will focus on the fourth assumption. This assumption rules out perfect correlation between regressors.

### Key Concept 6.4

### The Least Squares Assumptions in the Multiple Regression Model

The multiple regression model is given by

\[Y_i = \beta_0 + \beta_1 X_{1i} + \beta_1 X_{2i} + \dots + \beta_k X_{ki} + u_i \, \ i=1,\dots,n. \]

The OLS assumptions in the multiple regression model are an extension of the ones made for the simple regression model:

- Regressors \((X_{1i}, X_{2i}, \dots, X_{ki}, Y_i) \, \ i=1,\dots,n\), are drawn such that the i.i.d. assumption holds.

- \(u_i\) is an error term with conditional mean zero given the regressors, i.e., \[E(u_i\vert X_{1i}, X_{2i}, \dots, X_{ki}) = 0. \]

- Large outliers are unlikely, formally \(X_{1i},\dots,X_{ki}\) and \(Y_i\) have finite fourth moments.

- No perfect multicollinearity.

### Multicollinearity

Multicollinearity means that two or more regressors in a multiple regression model are strongly correlated. If the correlation between two or more regressors is perfect, that is, one regressor can be written as a linear combination of the other(s), we have perfect multicollinearity. While strong multicollinearity in general is unpleasant as it causes the variance of the OLS estimator to be large (we will discuss this in more detail later), the presence of perfect multicollinearity makes it impossible to solve for the OLS estimator, i.e., the model cannot be estimated in the first place.

The next section presents some examples of perfect multicollinearity and demonstrates how lm() deals with them.

#### Examples of Perfect Multicollinearity

How does R react if we try to estimate a model with perfectly correlated regressors?

lm will produce a warning in the first line of the coefficient section of the output (1 not defined because of singularities) and ignore the regressor(s) which is (are) assumed to be a linear combination of the other(s). Consider the following example where we add another variable FracEL, the fraction of English learners, to CASchools where observations are scaled values of the observations for english and use it as a regressor together with STR and english in a multiple regression model. In this example english and FracEL are perfectly collinear. The R code is as follows.

```r
# define the fraction of English learners
CASchools$FracEL

```r
## Call:
## lm(formula = score ~ STR + english + FracEL, data = CASchools)
## Residuals:
## Min 1Q Median 3Q Max
## -48.845 -10.240 -0.308 9.815 43.461
## Coefficients: (1 not defined because of singularities)
## Estimate Std. Error t value Pr(>|t|)
## (Intercept) 686.03224 7.41131 92.566
```r
# if STR smaller 12, NS = 0, else NS = 1
CASchools$NS

```r
## Call:
## lm(formula = score ~ computer + english + NS, data = CASchools)
## Residuals:
## Min 1Q Median 3Q Max
## -49.492 -9.976 -0.778 8.761 43.798
## Coefficients: (1 not defined because of singularities)
## Estimate Std. Error t value Pr(>|t|)
## (Intercept) 663.704837 0.984259 674.319
```r
table(CASchools$NS)
```

```r
## 1
## 420
```

CASchools$NS is a vector of \(420\) ones and our data set includes \(420\) observations. This obviously violates assumption 4 of Key Concept 6.4: the observations for the intercept are always \(1\),

\[\begin{align*}
intercept = \, & \lambda \cdot NS
\end{align*}\]
\[\begin{align*}
\begin{pmatrix} 1
\\ \vdots \\ 1
\end{pmatrix} = \, & \lambda \cdot
\begin{pmatrix} 1 \\
\vdots \\ 1
\end{pmatrix} \\
\Leftrightarrow \, & \lambda = 1.
\end{align*}\]
Since the regressors can be written as a linear combination of each other, we face perfect multicollinearity and R excludes NS from the model. Thus the take-away message is: think carefully about how the regressors in your models relate!

Another example of perfect multicollinearity is known as the dummy variable trap. This may occur when multiple dummy variables are used as regressors. A common case for this is when dummies are used to sort the data into mutually exclusive categories. For example, suppose we have spatial information that indicates whether a school is located in the North, West, South or East of the U.S. This allows us to create the dummy variables

\[\begin{align*}
North_i =&
\begin{cases}
1 \ \ \text{if located in the north} \\
0 \ \ \text{otherwise}
\end{cases} \\
West_i =&
\begin{cases}
1 \ \ \text{if located in the west} \\
0 \ \ \text{otherwise}
\end{cases} \\
South_i =&
\begin{cases}
1 \ \ \text{if located in the south} \\
0 \ \ \text{otherwise}
\end{cases} \\
East_i =&
\begin{cases}
1 \ \ \text{if located in the east} \\
0 \ \ \text{otherwise}.
\end{cases}
\end{align*}\]
Since the regions are mutually exclusive, for every school \(i=1,\dots,n\) we have \[North_i + West_i + South_i + East_i = 1. \]

We run into problems when trying to estimate a model that includes a constant and all four direction dummies in the model, e.g., \[TestScore = \beta_0 + \beta_1 \times STR + \beta_2 \times english + \beta_3 \times North_i + \beta_4 \times West_i + \beta_5 \times South_i + \beta_6 \times East_i + u_i \tag{6.8}\] since then for all observations \(i=1,\dots,n\) the constant term is a linear combination of the dummies:

\[\begin{align}
intercept = \, & \lambda_1 \cdot (North + West + South + East) \\
\begin{pmatrix} 1 \\ \vdots \\ 1\end{pmatrix} = \, & \lambda_1 \cdot \begin{pmatrix} 1 \\ \vdots \\ 1\end{pmatrix} \\ \Leftrightarrow \, & \lambda_1 = 1
\end{align}\]
and we have perfect multicollinearity. Thus the “dummy variable trap” means not paying attention and falsely including exhaustive dummies and a constant in a regression model.

How does lm() handle a regression like (6.8)? Let us first generate some artificial categorical data and append a new column named directions to CASchools and see how lm() behaves when asked to estimate the model.

```r
# set seed for reproducibility
set.seed(1)

# generate artificial data on location
CASchools$direction

```r
## Call:
## lm(formula = score ~ STR + english + direction, data = CASchools)
## Residuals:
## Min 1Q Median 3Q Max
## -48.018 -10.098 -0.556 9.304 42.596
## Coefficients:
## Estimate Std. Error t value Pr(>|t|)
## (Intercept) 685.67356 7.43308 92.246
```r
# Percentage of english speakers
CASchools$PctES

```r
## Call:
## lm(formula = score ~ STR + english + PctES, data = CASchools)
## Residuals:
## Min 1Q Median 3Q Max
## -48.845 -10.240 -0.308 9.815 43.461
## Coefficients: (1 not defined because of singularities)
## Estimate Std. Error t value Pr(>|t|)
## (Intercept) 686.03224 7.41131 92.566

#### Imperfect Multicollinearity

As opposed to perfect multicollinearity, imperfect multicollinearity is — to a certain extent — less of a problem. In fact, imperfect multicollinearity is the reason why we are interested in estimating multiple regression models in the first place: the OLS estimator allows us to isolate influences of correlated regressors on the dependent variable. If it was not for these dependencies, there would not be a reason to resort to a multiple regression approach and we could simply work with a single-regressor model. However, this is rarely the case in applications. We already know that ignoring dependencies among regressors which influence the outcome variable has an adverse effect on estimation results.

So when and why is imperfect multicollinearity a problem? Suppose you have the regression model

\[Y_i = \beta_0 + \beta_1 X_{1i} + \beta_2 X_{2i} + u_i \tag{6.9} \]

and you are interested in estimating \(\beta_1\), the effect on \(Y_i\) of a one unit change in \(X_{1i}\), while holding \(X_{2i}\) constant. You do not know that the true model indeed includes \(X_2\). You follow some reasoning and add \(X_2\) as a covariate to the model in order to address a potential omitted variable bias. You are confident that \(E(u_i\vert X_{1i}, X_{2i})=0\) and that there is no reason to suspect a violation of the assumptions 2 and 3 made in Key Concept 6.4. If \(X_1\) and \(X_2\) are highly correlated, OLS struggles to precisely estimate \(\beta_1\). That means that although \(\hat\beta_1\) is a consistent and unbiased estimator for \(\beta_1\), it has a large variance due to \(X_2\) being included in the model. If the errors are homoskedastic, this issue can be better understood from the formula for the variance of \(\hat\beta_1\) in the model (6.9) (see Appendix 6.2 of the book):

\[\sigma^2_{\hat\beta_1} = \frac{1}{n} \left(\frac{1}{1-\rho^2_{X_1,X_2}} \right) \frac{\sigma^2_u}{\sigma^2_{X_1}}. \tag{6.10} \]

First, if \(\rho_{X_1,X_2}=0\), i.e., if there is no correlation between both regressors, including \(X_2\) in the model has no influence on the variance of \(\hat\beta_1\). Secondly, if \(X_1\) and \(X_2\) are correlated, \(\sigma^2_{\hat\beta_1}\) is inversely proportional to \(1-\rho^2_{X_1,X_2}\) so the stronger the correlation between \(X_1\) and \(X_2\), the smaller is \(1-\rho^2_{X_1,X_2}\) and thus the bigger is the variance of \(\hat\beta_1\). Thirdly, increasing the sample size helps to reduce the variance of \(\hat\beta_1\). Of course, this is not limited to the case with two regressors: in multiple regressions, imperfect multicollinearity inflates the variance of one or more coefficient estimators. It is an empirical question which coefficient estimates are severely affected by this and which are not. When the sample size is small, one often faces the decision whether to accept the consequence of adding a large number of covariates (higher variance) or to use a model with only few regressors (possible omitted variable bias). This is called bias-variance trade-off.

In sum, undesirable consequences of imperfect multicollinearity are generally not the result of a logical error made by the researcher (as is often the case for perfect multicollinearity) but are rather a problem that is linked to the data used, the model to be estimated and the research question at hand.

### Simulation Study: Imperfect Multicollinearity

Let us conduct a simulation study to illustrate the issues sketched above.

- We use (6.9) as the data generating process and choose \(\beta_0 = 5\), \(\beta_1 = 2.5\) and \(\beta_2 = 3\) and \(u_i\) is an error term distributed as \(\mathcal{N}(0,5)\). In a first step, we sample the regressor data from a bivariate normal distribution: \[X_i = (X_{1i}, X_{2i}) \overset{i.i.d.}{\sim} \mathcal{N} \left[\begin{pmatrix} 0 \\ 0 \end{pmatrix}, \begin{pmatrix} 10 & 2.5 \\ 2.5 & 10 \end{pmatrix} \right] \] It is straightforward to see that the correlation between \(X_1\) and \(X_2\) in the population is rather low:

\[\rho_{X_1,X_2} = \frac{Cov(X_1,X_2)}{\sqrt{Var(X_1)}\sqrt{Var{(X_2)}}} = \frac{2.5}{10} = 0.25 \]

- Next, we estimate the model (6.9) and save the estimates for \(\beta_1\) and \(\beta_2\). This is repeated \(10000\) times with a for loop so we end up with a large number of estimates that allow us to describe the distributions of \(\hat\beta_1\) and \(\hat\beta_2\).

- We repeat steps 1 and 2 but increase the covariance between \(X_1\) and \(X_2\) from \(2.5\) to \(8.5\) such that the correlation between the regressors is high: \[\rho_{X_1,X_2} = \frac{Cov(X_1,X_2)}{\sqrt{Var(X_1)}\sqrt{Var{(X_2)}}} = \frac{8.5}{10} = 0.85 \]

- In order to assess the effect on the precision of the estimators of increasing the collinearity between \(X_1\) and \(X_2\) we estimate the variances of \(\hat\beta_1\) and \(\hat\beta_2\) and compare.

```r
# load packages
library(MASS)
library(mvtnorm)

# set number of observations
n

```r
## hat_beta_1 hat_beta_2
## 0.05674375 0.05712459
```

```r
diag(var(coefs2))
```

```r
## hat_beta_1 hat_beta_2
## 0.1904949 0.1909056
```

We are interested in the variances which are the diagonal elements. We see that due to the high collinearity, the variances of \(\hat\beta_1\) and \(\hat\beta_2\) have more than tripled, meaning it is more difficult to precisely estimate the true coefficients.

## 6.5 The Distribution of the OLS Estimators in Multiple Regression

As in simple linear regression, different samples will produce different values of the OLS estimators in the multiple regression model. Again, this variation leads to uncertainty of those estimators which we seek to describe using their sampling distribution(s). In short, if the assumption made in Key Concept 6.4 hold, the large sample distribution of \(\hat\beta_0,\hat\beta_1,\dots,\hat\beta_k\) is multivariate normal such that the individual estimators themselves are also normally distributed. Key Concept 6.5 summarizes the corresponding statements made in Chapter 6.6 of the book. A more technical derivation of these results can be found in Chapter 18 of the book.

### Key Concept 6.5

### Large-sample distribution of \(\hat\beta_0,\hat\beta_1,\dots,\hat\beta_k\)

If the least squares assumptions in the multiple regression model (see Key Concept 6.4) hold, then, in large samples, the OLS estimators \(\hat\beta_0,\hat\beta_1,\dots,\hat\beta_k\) are jointly normally distributed. We also say that their joint distribution is multivariate normal. Further, each \(\hat\beta_j\) is distributed as \(\mathcal{N}(\beta_j,\sigma_{\beta_j}^2)\) .

Essentially, Key Concept 6.5 states that, if the sample size is large, we can approximate the individual sampling distributions of the coefficient estimators by specific normal distributions and their joint sampling distribution by a multivariate normal distribution.

How can we use R to get an idea of what the joint PDF of the coefficient estimators in multiple regression model looks like? When estimating a model on some data, we end up with a set of point estimates that do not reveal much information on the joint density of the estimators. However, with a large number of estimations using repeatedly randomly sampled data from the same population we can generate a large set of point estimates that allows us to plot an estimate of the joint density function.

The approach we will use to do this in R is a follows:

- Generate \(10000\) random samples of size \(50\) using the DGP \[ Y_i = 5 + 2.5 \cdot X_{1i} + 3 \cdot X_{2i} + u_i \] where the regressors \(X_{1i}\) and \(X_{2i}\) are sampled for each observation as \[ X_i = (X_{1i}, X_{2i}) \sim \mathcal{N} \left[\begin{pmatrix} 0 \\ 0 \end{pmatrix}, \begin{pmatrix} 10 & 2.5 \\ 2.5 & 10 \end{pmatrix} \right] \] and \[ u_i \sim \mathcal{N}(0,5) \] is an error term.

- For each of the \(10000\) simulated sets of sample data, we estimate the model \[ Y_i = \beta_0 + \beta_1 X_{1i} + \beta_2 X_{2i} + u_i \] and save the coefficient estimates \(\hat\beta_1\) and \(\hat\beta_2\) .

- We compute a density estimate of the joint distribution of \(\hat\beta_1\) and \(\hat\beta_2\) in the model above using the function kde2d() from the package MASS , see ?MASS . This estimate is then plotted using the function persp() .

```r
# load packages
library(MASS)
library(mvtnorm)

# set sample size
n

From the plot above we can see that the density estimate has some similarity to a bivariate normal distribution (see Chapter 2) though it is not very pretty and probably a little rough. Furthermore, there is a correlation between the estimates such that \(\rho\neq0\) in (2.1). Also, the distribution’s shape deviates from the symmetric bell shape of the bivariate standard normal distribution and has an elliptical surface area instead.

```r
# estimate the correlation between estimators
cor(coefs[, 1], coefs[, 2])
```

```r
## [1] -0.2503028
```

Where does this correlation come from? Notice that, due to the way we generated the data, there is correlation between the regressors \(X_1\) and \(X_2\). Correlation between the regressors in a multiple regression model always translates into correlation between the estimators (see Appendix 6.2 of the book). In our case, the positive correlation between \(X_1\) and \(X_2\) translates to negative correlation between \(\hat\beta_1\) and \(\hat\beta_2\). To get a better idea of the distribution you can vary the point of view in the subsequent smooth interactive 3D plot of the same density estimate used for plotting with persp(). Here you can see that the shape of the distribution is somewhat stretched due to \(\rho=-0.20\) and it is also apparent that both estimators are unbiased since their joint density seems to be centered close to the true parameter vector \((\beta_1,\beta_2) = (2.5,3)\).

## 6.6 Exercises

#### 1. The Boston Housing Data Set

For the course of this section, you will work with Boston, the Boston Housing data set which contains 506 observations on housing values in suburbs of Boston. Boston comes with the package MASS which is already installed for the interactive R exercises below.

Instructions:

- Load both the package and the data set.

- Get yourself an overview over the data using function(s) known from the previous chapters.

- Estimate a simple linear regression model that explains the median house value of districts (medv) by the percent of households with low socioeconomic status, lstat, and a constant. Save the model to bh_mod.

- Print a coefficient summary to the console that reports robust standard errors.

Hint:

You only need basic R functions here: library(), data(), lm() and coeftest().

#### 2. A Multiple Regression Model of Housing Prices I

Now, let us expand the approach from the previous exercise by adding additional regressors to the model and estimating it again.

As has been discussed in Chapter 6.3, adding regressors to the model improves the fit so the \(SER\) decreases and the \(R^2\) increases.

The packages AER and MASS have been loaded. The model object bh_mod is available in the environment.

Instructions:

- Regress the median housing value in a district, medv, on the average age of the buildings, age, the per-capita crime rate, crim, the percentage of individuals with low socioeconomic status, lstat, and a constant. Put differently, estimate the model \[medv_i = \beta_0 + \beta_1 lstat_i + \beta_2 age_i + \beta_3 crim_i + u_i.\]

- Print a coefficient summary to the console that reports robust standard errors for the augmented model.

- The \(R^2\) of the simple regression model is stored in R2_res. Save the multiple regression models \(R^2\) to R2_unres and check whether the augmented model yields a higher \(R^2\). Use for the comparison.

#### 3. A Multiple Regression Model of Housing Prices II

The equation below describes estimated model from Exercise 2 (heteroskedasticity-robust standard errors in parentheses).

\[\widehat{medv}_i = \underset{(0.74)}{32.828} \underset{(0.08)}{-0.994} \times lstat_i \underset{(0.03)}{-0.083} \times crim_i + \underset{(0.02)}{0.038} \times age_i\]

This model is saved in bh_mult_mod which is available in the working environment.

Instructions:

As has been stressed in Chapter 6.3, it is not meaningful to use \(R^2\) when comparing regression models with a different number of regressors. Instead, the \(\bar{R}^2\) should be used. \(\bar{R}^2\) adjusts for the circumstance that the \(SSR\) reduces when a regressor is added to the model.

- Use the model object to compute the correction factor \(CF = \frac{n-1}{n-k-1}\) where \(n\) is the number of observations and \(k\) is the number of regressors, excluding the intercept. Save it to CF.

- Use summary() to obtain \(R^2\) and \(\bar{R}^2\) for bh_mult_mod. It is sufficient if you print both values to the console.

- Check that \[\bar{R}^2 = 1 - (1-R^2) \cdot CF.\] Use the == operator.

#### 4. A Fully-Fledged Model for Housing Values?

Have a look at the description of the variables contained in the Boston data set. Which variable would you expect to have the highest \(p\) -value in a multiple regression model which uses all remaining variables as regressors to explain medv?

Instructions:

- Regress medv on all remaining variables that you find in the Boston data set.

- Obtain a heteroskedasticity-robust summary of the coefficients.

- The \(\bar{R}^2\) for the model in exercise 3 is \(0.5533\). What can you say about the \(\bar{R}^2\) of the large regression model? Does this model improve on the previous one (no code submission needed)?

The packages AER and MASS as well as the data set Boston are loaded to the working environment.

Hints:

- For brevity, use the regression formula medv ~. in your call of lm(). This is a shortcut that specifies a regression of medv on all the remaining variables in the data set supplied to the argument data.

- Use summary on both models for a comparison of both \(\bar{R}^2\) s.

#### 5. Model Selection

Maybe we can improve the model by dropping a variable?

In this exercise, you have to estimate several models, each time dropping one of the explanatory variables used in the large regression model of Exercise 4 and compare the \(\bar{R}^2\).

The full regression model from the previous exercise, full_mod, is available in your environment.

Instructions:

- You are completely free in solving this exercise. We recommend the following approach: Start by estimating a model mod_new, say, where, e.g., lstat is excluded from the explanatory variables. Next, access the \(\bar{R}^2\) of this model.

- Compare the \(\bar{R}^2\) of this model to the \(\bar{R}^2\) of the full model (this was about \(0.7338\)).

- Repeat Steps 1 and 2 for all explanatory variables used in the full regression model. Save the model with the highest improvement in \(\bar{R}^2\) to better_mod.

-->
