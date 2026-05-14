# VSLA Replication Project



## Overview

This project replicates selected empirical results from the paper:



**Impact of Village Savings and Loans Associations: Evidence from a Cluster Randomized Trial**



published in the *Journal of Development Economics (2016)*.



The project focuses on replicating treatment effect estimations using STATA and understanding the empirical workflow commonly used in development economics research.



---



## Research Question

Does participation in Village Savings and Loan Associations (VSLAs) improve access to loans and financial outcomes among rural households?



---



## Methodology

- Cluster Randomized Controlled Trial (RCT)

- Intention-to-Treat (ITT) estimation

- OLS regression

- Clustered standard errors

- Block fixed effects



---



## Data

- Household-level survey data

- Malawi

- Baseline and post-treatment observations



---



## Key Empirical Workflow

- Constructed reproducible research folder structure

- Loaded and inspected STATA datasets

- Generated transformed variables

- Conducted baseline balance checks

- Estimated treatment effects on loan access

- Interpreted causal inference results



---



## Preliminary Findings

The replication results suggest that participation in the VSLA treatment significantly increased access to loans.



Example result:



- Treatment coefficient: 0.122

- P-value: 0.002



Interpretation:

The treatment group experienced a statistically significant increase in loan access compared to the control group.



---



## Technical Skills Demonstrated

- STATA

- Applied econometrics

- Data cleaning

- Causal inference

- Clustered standard errors

- Empirical replication

- Research documentation



---



## Repository Structure



```

data/        -> raw datasets

dofiles/     -> STATA do-files

outputs/     -> regression outputs

graphs/      -> figures and visualizations

paper/       -> original research paper

reports/     -> replication reports

note/        -> replication notes and documentation



---



## Replication Status

Current progress:

- Dataset successfully loaded and inspected

- Key variables generated

- Baseline balance tests explored

- Initial treatment effect regression replicated

- Clustered standard errors implemented



Next steps:

- Replicate additional treatment effect tables

- Export regression outputs

- Reproduce figures and tables

- Improve reproducibility workflow

---

## Treatment Effect Visualization

The figure below presents the estimated treatment effect of participation in Village Savings and Loan Associations (VSLAs) on household loan access.

![Professional Treatment Effect Plot](./professional_treatment_plot.png)

