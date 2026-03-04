library(fixest)

# Intentional issues: naive TWFE only, no cohort support checks
m <- feols(y ~ i(event_time, ref = -1) + x | unit + year, cluster = ~unit, data = df)
etable(m)
