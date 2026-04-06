library(fixest)

# Intentional issues: global polynomial only, no manipulation check, no bandwidth sensitivity
m <- feols(enroll ~ treated + poly(score, 3) + x1 + x2, data = df)
etable(m)
