library(fixest)

# Intentional issues: uses only own-treatment indicator, no exposure mapping alternatives
m <- feols(y ~ treated + x1 + x2 | village + year, cluster = ~village, data = df)
etable(m)
