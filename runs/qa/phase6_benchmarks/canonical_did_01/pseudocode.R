library(fixest)

# Intentional issues: no pre-trend diagnostics and no placebo timing checks
m <- feols(wage ~ treated * post + x1 + x2 | region + year, cluster = ~region, data = df)
etable(m)
