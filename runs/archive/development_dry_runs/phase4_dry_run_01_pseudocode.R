# Phase 4 dry run pseudo-code: staggered DiD with intentional issues

library(fixest)

# Intentional issue: drop never-treated units without justification
df <- subset(df_raw, treated_ever == 1)

# Intentional issue: event time built from a possibly incorrect cohort year field
df$event_time <- df$year - df$treat_year_reported

# Intentional issue: naive TWFE only, no heterogeneity-robust estimator
m1 <- feols(
  y ~ i(event_time, ref = -1) + x1 + x2 | unit_id + year,
  cluster = ~unit_id,
  data = df
)

# Intentional issue: no pre-trend joint test, no placebo timing checks
etable(m1)

# Intentional issue: no sensitivity to clustering dimension or multiway clustering
