# Project Title

![Python](https://img.shields.io/badge/Python-3.10-blue)
![SQL](https://img.shields.io/badge/SQL-Expert-orange)
![dbt](https://img.shields.io/badge/dbt-Analytics%20Engineering-red)


# A/B Test Evaluation — Onboarding Tooltip

## 📌 Overview
The product team launched a new onboarding tooltip and wanted to measure whether it increased Day‑7 engagement. 
An A/B test was conducted with 10k+ users in each group.

## 🧠 Methodology
- Validated randomization balance
- Defined Day‑7 engagement as the primary metric
- Computed conversion rates and lift
- Ran a two‑proportion z‑test
- Checked guardrail metrics

## 📊 Results
- Control: 21.0% engagement
- Treatment: 23.5% engagement
- Lift: **11.9%**
- p‑value: **0.004** (significant)
- Guardrails: No negative impact

## 📈 Visualizations
- Conversion rate bar chart
- Confidence interval plot
- Country‑level lift heatmap

## 🎯 Recommendation
Roll out the tooltip to 100% of users.  
Test placement variations in a follow‑up experiment.

## ✔️ Skills Demonstrated
- Experiment design
- Causal inference
- Statistical testing
- Product metrics
- Data visualization
- Insight storytelling
