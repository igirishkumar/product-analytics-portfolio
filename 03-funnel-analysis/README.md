
# 📊 Funnel Analysis: User Behavior, Drop‑Offs & Product Insights

## 📁 Project Overview  
This project analyzes a **4‑step product funnel** using synthetic event‑level data:

1. **Device Added**  
2. **Device Configured**  
3. **Alert Viewed**  
4. **Alert Resolved**

The goal is to understand **where users drop off**, what drives conversion, and how different **countries**, **cohorts**, and **plan types** behave across the funnel.  
The project includes:

- Funnel conversion analysis  
- Cohort analysis  
- Step‑level correlation  
- Path analysis  
- Logistic regression modeling  
- Funnel sensitivity by plan type  
- SQL + Python end‑to‑end workflow  
- Actionable product recommendations  

---

## 🧠 Key Insights

### **1. Biggest Drop‑Off**
- The largest drop‑off occurs between **Device Configured → Alert Viewed**  
- Users complete setup but fail to engage with alerts (core product value)

### **2. Country Performance**
- **US** shows the strongest funnel  
- **IN** shows the weakest funnel with high mid‑funnel friction

### **3. Plan Type Sensitivity**
- **Enterprise** users convert best across all steps  
- **Free** users show the weakest engagement and highest drop‑offs

### **4. Behavioral Drivers**
- **alert_viewed** is the strongest predictor of final conversion  
- Early steps like **device_added** have weak downstream influence

### **5. Path Analysis**
Most common user paths:
- `1>1>0>0` — users configure but never view alerts  
- `1>0>0>0` — users add device but never configure  
- Only a small portion complete the full funnel (`1>1>1>1`)

### **6. Time‑to‑Convert**
- Delays in configuration indicate UX friction  
- Faster configuration strongly correlates with higher alert engagement

---

## 🛠️ Tech Stack

### **Python**
- pandas  
- numpy  
- seaborn / matplotlib  
- scikit‑learn  
- duckdb (optional SQL execution)

### **SQL**
Used for:
- Data extraction  
- Funnel step creation  
- Cohort segmentation  
- Path analysis  

### **Data**
- Synthetic dataset generated in Python  
- Stored as `funnel_data.csv`  
- Loaded into DuckDB for SQL queries

---

## 🗄️ Data Model

### **Table: `funnel_data`**  
**Grain:** One row per user  

| Column | Description |
|--------|-------------|
| user_id | Unique user identifier |
| signup_ts | User signup timestamp |
| country | User country |
| plan_type | free / pro / enterprise |
| device_added_ts | Timestamp of device added |
| device_configured_ts | Timestamp of device configured |
| alert_viewed_ts | Timestamp of alert viewed |
| alert_resolved_ts | Timestamp of alert resolved |

### **Derived Fields**
- device_added (1/0)  
- device_configured (1/0)  
- alert_viewed (1/0)  
- alert_resolved (1/0)  
- signup_month  
- path  
- time_to_config  

---

## 🧩 SQL Integration (DuckDB)

Load CSV into DuckDB:

```sql
CREATE TABLE funnel_data AS
SELECT *
FROM read_csv_auto('/02-funnel-analysis/data/funnel_data.csv');
```

This enables running SQL queries as if the data lived in a real warehouse.

---

## 📈 Analysis Components

### **1. Funnel Conversion**
- Stage‑wise conversion rates  
- Drop‑off visualization  
- Country and plan segmentation  

### **2. Cohort Analysis**
- Monthly signup cohorts  
- Funnel performance over time  

### **3. Step‑Level Correlation**
- Identifies which steps influence downstream behavior  
- Confirms alert engagement as the strongest driver  

### **4. Path Analysis**
- Most common user paths  
- Identifies where users stop progressing  

### **5. Logistic Regression**
- Predicts probability of final conversion  
- Model shows perfect separation (expected in funnels)  
- Direction of coefficients still meaningful  

### **6. Funnel Sensitivity**
- Enterprise vs Pro vs Free  
- Highlights where product improvements matter most  

---

## 💡 Recommendations

1. **Improve device configuration UX**  
   Reduce friction in the highest‑impact early step.

2. **Add contextual help or nudges for alert viewing**  
   Since alert_viewed is the strongest predictor of resolution.

3. **Prioritize improvements for Free plan users**  
   They show the weakest funnel and highest drop‑offs.

4. **Run an experiment on configuration‑wizard redesign**  
   A/B test shorter steps, clearer instructions, or auto‑setup.

5. **Add proactive alert explanations for high‑drop‑off countries**  
   Tailor messaging or UI for regions like IN.

6. **Introduce alert‑view reminders or push notifications**  
   Helps convert users stuck at the alert_viewed step.

---

## 📦 Project Structure

```
/02-funnel-analysis
│
├── data/
│   └── funnel_data.csv
│
├── notebooks/
│   └── funnel_analysis.ipynb
│
├── visuals/
│   ├── funnel_by_country.png
│   ├── cohort_funnel.png
│   ├── correlation_matrix.png
│   ├── path_analysis.png
│   └── plan_sensitivity.png
│
└── README.md
```

---

## 🏁 Final Summary

This project demonstrates an end‑to‑end analytics workflow combining **SQL**, **Python**, **statistical modeling**, and **product thinking**.  
It identifies the key behavioral drivers of conversion, quantifies funnel friction, and provides actionable recommendations for improving user engagement.

