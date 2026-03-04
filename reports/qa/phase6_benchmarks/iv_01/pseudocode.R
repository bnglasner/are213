library(fixest)

# Intentional issues: no first-stage reporting and no weak-IV robust inference
m <- feols(earnings ~ age + edu | county + year | completion ~ center_assignment, data = df)

# Intentional issue: no placebo/exclusion diagnostics
etable(m)
