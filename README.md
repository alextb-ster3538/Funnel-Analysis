

<img width="3124" height="500" alt="bunnel_banner" src="https://github.com/user-attachments/assets/d160a98c-c631-46c8-a34d-1fb26a4b30c7" />


# **E‑Commerce Funnel Analysis (Dec 30, 2025 → Jan 2, 2026)**

This project analyzes user behavior across an e‑commerce purchase funnel using BigQuery, SQL, and Power BI. The goal is to understand where users convert, where they drop off, and how efficiently the site monetizes traffic. The dashboard visualizes the full journey from page view to purchase, supported by SQL‑driven metrics and business insights.

**Simulated business context:** An e‑commerce team needs to diagnose funnel drop‑off and prioritize conversion‑rate‑optimization (CRO) efforts.

---

## 📊 Dashboard Preview

<img width="1603" height="901" alt="Dashboard Preview" src="https://github.com/user-attachments/assets/f3f69c93-71fd-4f3f-8d16-034d61ff36f5" />

---

## 📌 Executive Summary

This funnel analysis evaluates user behavior across the full purchase journey between **12/30/25 and 1/2/26**, highlighting conversion efficiency, drop‑off patterns, and traffic‑source performance. The largest drop‑off occurs at the **page → cart** stage, where only **31%** of users add an item to their cart. Once users add an item, intent strengthens significantly: **70%** progress to checkout, **84%** enter payment information, and **89%** complete a purchase.

Organic traffic drives the highest volume of users (**40%**), followed by social (**29%**) and paid ads (**20%**). The average user completes the full journey in approximately **43 minutes**, reflecting a moderate decision cycle. Revenue performance is strong, with revenue per visitor at **$17.64** and revenue per buyer at **$107.46**.

---

## 📌 Executive Takeaway

**The funnel is highly efficient beyond the initial view → cart stage, with strong purchase intent, smooth checkout progression, and high revenue efficiency driven primarily by organic traffic.**

---

## 📈 Key Insights

- **Page → Cart Conversion:** **31%**  
- **Cart → Checkout Conversion:** **70%**  
- **Checkout → Payment Conversion:** **84%**  
- **Payment → Purchase Conversion:** **89%**

- **User counts per stage:**  
  - Page View: **555**  
  - Add to Cart: **174**  
  - Checkout Start: **122**  
  - Payment Info: **103**  
  - Purchase: **92**

- **Drop‑off counts:**  
  - Page → Cart: **381**  
  - Cart → Checkout: **52**  
  - Checkout → Payment: **19**  
  - Payment → Purchase: **11**

- **Traffic Source Distribution:**  
  - Organic: **40.18%**  
  - Social: **29.37%**  
  - Paid Ads: **20.18%**  
  - Email: **10.27%**

- **Time to Convert:**  
  - View → Cart: **5.1 minutes**  
  - Cart → Purchase: **38 minutes**  
  - Total: **~43 minutes**

- **Revenue performance:**
  - Total revenue: **$85221**
  - Revenue per visitor: **$17.64**  
  - Revenue per buyer: **$107.46**

---

## 🧭 Recommendations

1. **Improve top‑of‑funnel view → cart conversion**  
   Optimize product page layout, CTAs, and messaging to reduce early drop‑off.

2. **Strengthen organic traffic performance**  
   Organic drives the highest volume; investing in SEO and content can amplify results.

3. **Optimize paid acquisition efficiency**  
   Paid ads show lower conversion efficiency; refine targeting and creative.

4. **Enhance checkout UX**  
   Although conversion is strong, small improvements can further reduce friction.

5. **Retarget cart abandoners**  
   Users who add to cart show high intent; retargeting can recover meaningful revenue.

---

## 🔍 What I Would Do Next as an Analyst

1. Segment funnel performance by device type.  
2. Analyze conversion and revenue by traffic source.  
3. Evaluate CAC and ROAS across acquisition channels.  
4. Investigate product‑level conversion patterns.  
5. Build time‑to‑convert cohorts to optimize retargeting windows.

---

## 🗂 Data

- **Source:** Synthetic event‑level e‑commerce data  
- **File:** `data/user_events.csv`  
- **Period covered:** **Dec 30, 2025 – Jan 2, 2026**  
- **Fields:** `event_id`, `user_id`, `event_type`, `event_date`, `product_id`, `amount`, `traffic_source`  
- **Funnel order:** page_view → add_to_cart → checkout_start → payment_info → purchase  
- **Full field definitions:** *Data Dictionary (Notion link)*  
- **DAX measure logic:** *DAX Measures Reference (Notion link)*

---

## 🛠 Tech Stack

- **BigQuery** — SQL data extraction & transformation  
- **SQL** — funnel metrics, revenue analysis, time‑to‑convert logic  
- **Power BI** — dashboard design, DAX measures, visualization  
- **DAX** — conversion metrics, moving averages  

---

## 📁 Folder Structure

```text
funnel-analysis/
│
├── data/
│   └── user_events.csv
│
├── sql/
│   └── funnel_queries.sql
│
├── powerbi/
│   └── funnel_dashboard.pbix
│
├── images/
│   ├── funnel_banner.png
│   └── dashboard_preview.png
│
├── .gitignore
├── LICENSE
└── README.md
```
---
## 📚 Additional Documentation
- [Data Dictionary](https://app.notion.com/p/Data_Dictionary_Revised_Notion_Ta-dd9f13f8ec6582ebb81d01c1d212ddb3?source=copy_link) — field definitions for the raw event data
- [DAX Measures Reference](https://app.notion.com/p/DAX-Measures-Documentation-5d3f13f8ec65834eb1b481bc87eb696c?source=copy_link) — full measure logic used in the dashboard

---

## ▶ How to Reproduce

1. Run the SQL scripts in `/sql/` using BigQuery to generate funnel metrics.
2. Load the PBIX file in `/powerbi/` to view or modify the dashboard.
3. Replace sample data (if included) with your own dataset following the same schema.

---

## 🙏 Credits & Inspiration

This project was inspired by a YouTube tutorial created by Lore So What.
Their walkthrough provided the initial framework for the funnel analysis logic and helped shape the overall project structure.

Original Tutorial:  
Lore So What: 
**Watch me Do a Data Analyst Project in minutes with SQL** by Lore So What
Link: https://www.youtube.com/watch?v=U-JlXWDqvco&t=251s
