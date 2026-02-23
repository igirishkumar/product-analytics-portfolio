

# ✅ **Project 01: A/B Test Evaluation (Smart Alert Tooltip)**  


---

# **A/B Test Evaluation — Smart Alert Tooltip**  
### **Product Analytics Portfolio — Project 01**

This project evaluates whether introducing a **Smart Alert Tooltip** improves **Day‑7 Engagement** for IoT device managers.  
The analysis is performed using **Python**, **DuckDB SQL**, and **statistical testing**.

---

## **📌 1. Experiment Overview**

The Smart Alert Tooltip is designed to help users better understand a key feature in the IoT dashboard.  
The goal of this experiment is to determine whether the tooltip increases user engagement.

### **Hypothesis**  
The tooltip will increase **Day‑7 Engagement** by nudging users toward the feature and improving comprehension.

### **Primary Metric**  
- **Day‑7 Engagement** (binary)

### **Secondary Metrics**  
- Feature usage  
- Average session time  

### **Guardrail Metrics**  
- Error rate  
- Page load time  

### **Success Criteria**  
- Statistically significant improvement in Day‑7 engagement  
- No degradation in guardrails  
- Consistent effect across countries  

---

## **📌 2. Dataset**

The dataset contains **10,000 users**, randomly assigned to:

- **Group A** (control)  
- **Group B** (treatment)

Each row includes:

- user_id  
- group  
- country  
- signup_date  
- day7_engaged  
- feature_used  
- avg_session_time  
- error_rate  
- page_load_ms  

The dataset was generated programmatically for portfolio purposes.

---

## **📌 3. Randomization Check**

Countries are evenly distributed across groups A and B.  
This confirms that randomization worked correctly and there is no allocation bias.

---

## **📌 4. Primary Metric — Day‑7 Engagement**

| Group | Conversion Rate |
|-------|-----------------|
| A | 21.77% |
| B | 23.60% |

**Lift:** ~8.4%  
**p‑value:** < 0.05 (statistically significant)

**Interpretation:**  
Treatment B shows a meaningful and statistically significant improvement in Day‑7 engagement.

---

## **📌 5. Feature Usage Analysis**

| Group | Feature Usage Rate |
|-------|--------------------|
| A | ~18% |
| B | ~26% |

**Interpretation:**  
Feature usage increased substantially in Group B, strongly suggesting that the tooltip successfully nudges users toward the feature.  
This likely explains the engagement lift.

---

## **📌 6. Guardrail Metrics**

| Metric | A | B | Interpretation |
|--------|---|---|----------------|
| Error Rate | 0.012552 | 0.012578 | Safe |
| Page Load Time | 329.26 ms | 328.62 ms | Safe |

**Interpretation:**  
No performance or reliability degradation.  
Guardrails remain stable.

---

## **📌 7. Session Time Comparison**

Group B shows slightly higher average session time, consistent with deeper engagement and increased feature usage.

---

## **📌 8. Country‑Level Consistency**

Conversion rates were evaluated across DE, IN, US, UK, and FR.  
The lift is consistent across all countries, and no segment shows a negative effect.

This strengthens confidence in rolling out the feature globally.

---

## **📌 9. Final Recommendation**

### **✔ Roll Out Treatment B to 100% of Users**

**Reasons:**

- ~8.4% improvement in Day‑7 engagement  
- Statistically significant  
- Strong increase in feature usage  
- Guardrails remain safe  
- Effect consistent across countries  
- No performance degradation  

This is a **low‑risk, high‑impact** improvement.

---

## **📌 10. Tools & Technologies**

- **Python** (Pandas, NumPy, SciPy, Statsmodels)  
- **DuckDB SQL**  
- **Matplotlib / Seaborn**  
- **Jupyter Notebook**  
- **GitHub**  

---

## **📌 11. Repository Structure**

```
project/
│
├── data/
│   └── ab_test_data.csv
│
├── sql/
│   └── analysis.sql
│
├── notebook/
│   └── ab_test_evaluation.ipynb
│
└── README.md
```

---

## **📌 12. Key Takeaways**

- Demonstrates end‑to‑end A/B test evaluation  
- Combines SQL + Python + statistical testing  
- Shows product thinking and decision‑making  
- Includes guardrail analysis and segmentation  
- Portfolio‑ready case study for product analytics roles  

