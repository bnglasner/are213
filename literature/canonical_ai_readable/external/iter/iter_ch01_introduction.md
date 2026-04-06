# Introduction

- Primary Source URL: https://bookdown.org/machar1991/ITER/1-introduction.html
- Imported on: 2026-03-23
- Component pages: 2

## Source Components

1. `1 Introduction` - https://bookdown.org/machar1991/ITER/1-introduction.html
2. `1.1 A Very Short Introduction to R and RStudio` - https://bookdown.org/machar1991/ITER/1-1-a-very-short-introduction-to-r-and-rstudio.html

## Compiled Content

## 1 Introduction

The interest in the freely available statistical programming language and software environment R (R Core Team, 2018) is soaring. By the time we wrote first drafts for this project, more than 11000 add-ons (many of them providing cutting-edge methods) were made available on the Comprehensive R Archive Network (CRAN), an extensive network of FTP servers around the world that store identical and up-to-date versions of R code and its documentation. R dominates other (commercial) software for statistical computing in most fields of research in applied statistics. The benefits of it being freely available, open source and having a large and constantly growing community of users that contribute to CRAN render R more and more appealing for empirical economists and econometricians alike.

A striking advantage of using R in econometrics is that it enables students to explicitly document their analysis step-by-step such that it is easy to update and to expand. This allows to re-use code for similar applications with different data. Furthermore, R programs are fully reproducible, which makes it straightforward for others to comprehend and validate results.

Over the recent years, R has thus become an integral part of the curricula of econometrics classes we teach at the University of Duisburg-Essen. In some sense, learning to code is comparable to learning a foreign language and continuous practice is essential for the learning success. Needless to say, presenting bare R code on slides does not encourage the students to engage with hands-on experience on their own. This is why R is crucial. As for accompanying literature, there are some excellent books that deal with R and its applications to econometrics, e.g., Kleiber & Zeileis (2008). However, such sources may be somewhat beyond the scope of undergraduate students in economics having little understanding of econometric methods and barely any experience in programming at all. Consequently, we started to compile a collection of reproducible reports for use in class. These reports provide guidance on how to implement selected applications from the textbook Introduction to Econometrics (Stock & Watson, 2015) which serves as a basis for the lecture and the accompanying tutorials. This process was facilitated considerably by knitr (Xie, 2018 b) and R markdown (Allaire et al., 2018). In conjunction, both R packages provide powerful functionalities for dynamic report generation which allow to seamlessly combine pure text, LaTeX, R code and its output in a variety of formats, including PDF and HTML. Moreover, writing and distributing reproducible reports for use in academia has been enriched tremendously by the bookdown package (Xie, 2018 a) which has become our main tool for this project. bookdown builds on top of R markdown and allows to create appealing HTML pages like this one, among other things. Being inspired by Using R for Introductory Econometrics (Heiss, 2016) 1 and with this powerful toolkit at hand we wrote up our own empirical companion to Stock & Watson (2015). The result, which you started to look at, is Introduction to Econometrics with R.

Similarly to the book by Heiss (2016), this project is neither a comprehensive econometrics textbook nor is it intended to be a general introduction R. We feel that Stock and Watson do a great job at explaining the intuition and theory of econometrics, and at any rate better than we could in yet another introductory textbook! Introduction to Econometrics with R is best described as an interactive script in the style of a reproducible research report which aims to provide students with a platform-independent e-learning arrangement by seamlessly intertwining theoretical core knowledge and empirical skills in undergraduate econometrics. Of course, the focus is on empirical applications with R. We leave out derivations and proofs wherever we can. Our goal is to enable students not only to learn how results of case studies can be replicated with R but we also intend to strengthen their ability in using the newly acquired skills in other empirical applications — immediately within Introduction to Econometrics with R.

To realize this, each chapter contains interactive R programming exercises. These exercises are used as supplements to code chunks that display how previously discussed techniques can be implemented within R. They are generated using the DataCamp light widget and are backed by an R session which is maintained on DataCamp’s servers. You may play around with the example exercise presented below.

As you can see above, the widget consists of two tabs. script.R mimics an .R-file, a file format that is commonly used for storing R code. Lines starting with a # are commented out, that is, they are not recognized as code. Furthermore, script.R works like an exercise sheet where you may write down the solution you come up with. If you hit the button Run, the code will be executed, submission correctness tests are run and you will be notified whether your approach is correct. If it is not correct, you will receive feedback suggesting improvements or hints. The other tab, R Console, is a fully functional R console that can be used for trying out solutions to exercises before submitting them. Of course you may submit (almost any) R code and use the console to play around and explore. Simply type a command and hit the Enter key on your keyboard.

As an example, consider the following line of code presented in chunk below. It tells R to compute the number of packages available on CRAN. The code chunk is followed by the output produced.

```r
# check the number of R packages available on CRAN
nrow(available.packages(repos = "http://cran.us.r-project.org"))
```

```r
## [1] 13156
```

Each code chunk is equipped with a button on the outer right hand side which copies the code to your clipboard. This makes it convenient to work with larger code segments in your version of R / RStudio or in the widgets presented throughout the book. In the widget above, you may click on R Console and type nrow(available.packages(repos = "http://cran.us.r-project.org")) (the command from the code chunk above) and execute it by hitting Enter on your keyboard. 2

Note that some lines in the widget are out-commented which ask you to assign a numeric value to a variable and then to print the variable’s content to the console. You may enter your solution approach to script.R and hit the button Run in order to get the feedback described further above. In case you do not know how to solve this sample exercise (don’t panic, that is probably why you are reading this), a click on Hint will provide you with some advice. If you still can’t find a solution, a click on Solution will provide you with another tab, Solution.R which contains sample solution code. It will often be the case that exercises can be solved in many different ways and Solution.R presents what we consider as comprehensible and idiomatic.

### References

R Core Team. (2018). R: A Language and Environment for Statistical Computing. Vienna, Austria: R Foundation for Statistical Computing. Retrieved from https://www.R-project.org/

Kleiber, C., & Zeileis, A. (2008). Applied Econometrics with R. Springer.

Stock, J., & Watson, M. (2015). Introduction to Econometrics, Third Update, Global Edition. Pearson Education Limited.

Xie, Y. (2018b). knitr: A General-Purpose Package for Dynamic Report Generation in R (Version 1.20). Retrieved from https://CRAN.R-project.org/package=knitr

Allaire, J., Xie, Y., McPherson, J., Luraschi, J., Ushey, K., Atkins, A., … Chang, W. (2018). rmarkdown: Dynamic Documents for R (Version 1.10). Retrieved from https://CRAN.R-project.org/package=rmarkdown

Xie, Y. (2018a). bookdown: Authoring Books and Technical Documents with R Markdown (Version 0.7.20). Retrieved from https://github.com/rstudio/bookdown

Heiss, F. (2016). Using R for Introductory Econometrics. CreateSpace Independent Publishing Platform. Retrieved from http://www.urfie.net/

- Heiss (2016) builds on the popular Introductory Econometrics (Wooldridge, 2016) and demonstrates how to replicate the applications discussed therein using R. ↩

- The R session is initialized by clicking into the widget. This might take a few seconds. Just wait for the indicator next to the button Run to turn green. ↩

## 1.1 A Very Short Introduction to R and RStudio

Figure 1.1: RStudio: the four panes

#### R Basics

As mentioned before, this book is not intended to be an introduction to R but as a guide on how to use its capabilities for applications commonly encountered in undergraduate econometrics. Those having basic knowledge in R programming will feel comfortable starting with Chapter 2. This section, however, is meant for those who have not worked with R or RStudio before. If you at least know how to create objects and call functions, you can skip it. If you would like to refresh your skills or get a feeling for how to work with RStudio, keep reading.

First of all start RStudio and open a new R script by selecting File, New File, R Script. In the editor pane, type

```r
1 + 1
```

and click on the button labeled Run in the top right corner of the editor. By doing so, your line of code is sent to the console and the result of this operation should be displayed right underneath it. As you can see, R works just like a calculator. You can do all arithmetic calculations by using the corresponding operator (+, -, *, / or ^). If you are not sure what the last operator does, try it out and check the results.

#### Vectors

R is of course more sophisticated than that. We can work with variables or, more generally, objects. Objects are defined by using the assignment operator
```r
y

```r
## [1] 1 2 3 4 5
```

You can also create a vector of letters or words. For now just remember that characters have to be surrounded by quotes, else they will be parsed as object names.

```r
hello
Here we have created a vector of length 2 containing the words Hello and World.

Do not forget to save your script! To do so, select File, Save.

#### Functions

You have seen the function c() that can be used to combine objects. In general, all function calls look the same: a function name is always followed by round parentheses. Sometimes, the parentheses include arguments.

Here are two simple examples.

```r
# generate the vector `z`
z

```r
## [1] 3
```

In the first line we use a function called seq() to create the exact same vector as we did in the previous section, calling it z . The function takes on the arguments from , to and by which should be self-explanatory. The function mean() computes the arithmetic mean of its argument x . Since we pass the vector z as the argument x , the result is 3 !

If you are not sure which arguments a function expects, you may consult the function’s documentation. Let’s say we are not sure how the arguments required for seq() work. We then type ?seq in the console. By hitting return the documentation page for that function pops up in the lower right pane of RStudio . In there, the section Arguments holds the information we seek. On the bottom of almost every help page you find examples on how to use the corresponding functions. This is very helpful for beginners and we recommend to look out for those.

Of course, all of the commands presented above also work in interactive widgets throughout the book. You may try them below.

-->
