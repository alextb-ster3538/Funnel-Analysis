<img width="3124" height="500" alt="bunnel_banner" src="https://github.com/user-attachments/assets/d160a98c-c631-46c8-a34d-1fb26a4b30c7" />




# E‑Commerce Funnel Analysis (Jan 1, 2026 → Feb 1, 2026)

This project analyzes user behavior across an e‑commerce purchase funnel using BigQuery, SQL, and Power BI. The goal is to understand where users convert, where they drop off, and how efficiently the site monetizes traffic. The dashboard visualizes the full journey from page view to purchase, supported by SQL‑driven metrics and business insights.

---

## 📊 Dashboard Preview

<img width="1367" height="766" alt="funnel_dashboard" src="https://github.com/user-attachments/assets/b7deb388-4231-40a7-8f38-78e08acc1d1b" />


---

## 📌 Executive Summary

This funnel analysis evaluates user behavior across the full purchase journey between 1/1/26 and 2/1/26, highlighting where users convert, where they drop off, and how efficiently the site monetizes traffic. The data shows that while the largest drop‑off occurs at the initial view → cart stage, users who add an item demonstrate strong intent, with 71% progressing to checkout and minimal abandonment through payment and purchase. Organic traffic drives the majority of visitors, indicating strong non‑paid discovery, while social and paid channels contribute meaningful volume. The average user completes the full journey in approximately 25 minutes, reflecting a relatively fast decision cycle. Monetization efficiency is strong, with revenue per visitor at $17.75 and revenue per buyer at $108.11, underscoring the high value of converted users and the effectiveness of the checkout experience.

---

## 📌 One‑Sentence Executive Takeaway

**The funnel is highly efficient beyond the initial view → cart stage, with strong purchase intent, fast decision cycles, and high revenue efficiency driven primarily by organic traffic.**

---

## 📈 Key Insights

- 4,579 users viewed the page; 1,416 (31%) added an item to their cart — the primary drop‑off point.  
- Cart → checkout conversion is strong at **71%**, showing high intent once users add an item.  
- Checkout → payment drops **19%**, and payment → purchase drops only **8%**, indicating an efficient checkout flow.  
- Organic traffic drives **41%** of visitors, followed by social and paid channels.  
- Average time from view → cart is **11 minutes**; cart → purchase adds another **13 minutes**, totaling ~25 minutes.  
- Revenue per visitor = **$17.75**; revenue per buyer = **$108.11**, showing strong monetization efficiency.

---

## 🧭 Recommendations

1. **Improve the top‑of‑funnel view → cart conversion**  
   A/B test product page layout, CTA placement, and messaging to reduce early drop‑off.

2. **Strengthen organic traffic performance**  
   Organic is the highest‑volume source; investing in SEO and content could amplify results.

3. **Optimize paid and social acquisition efficiency**  
   Refine targeting and creative to improve CAC and ROAS.

4. **Maintain the current checkout experience**  
   Low drop‑off indicates a strong flow; preserve this structure as traffic scales.

5. **Implement retargeting for cart abandoners**  
   Given high intent after cart add, retargeting could recover a meaningful portion of early drop‑offs.

---

## 🔍 What I Would Do Next as an Analyst

1. Segment the funnel by device type — mobile vs desktop often reveals hidden friction points.  
2. Analyze revenue and conversion by traffic source — identify which channels produce the highest‑value buyers.  
3. Overlay CAC and ROAS onto the funnel — connect acquisition cost to funnel performance.  
4. Investigate product‑level performance — determine which products drive the highest conversion or abandonment.  
5. Conduct a time‑to‑convert cohort analysis — optimize retargeting windows based on user behavior.

---

## 🛠 Tech Stack

- **BigQuery** — SQL data extraction & transformation  
- **SQL** — funnel metrics, revenue analysis, time‑to‑convert logic  
- **Power BI** — dashboard design, DAX measures, visualization  
- **DAX** — conversion metrics, moving averages  

---

## 📁 Folder Structure

**Folder Structure**

funnel-analysis/  
│  
├── data/  
│   └── sample_data.csv  
│  
├── sql/  
│   └── funnel_queries.sql  
│  
├── powerbi/  
│   └── funnel_dashboard.pbix  
│  
├── images/  
│   └── funnel_banner.png  
│   └── dashboard_preview.png  
│  
├── .gitignore  
│  
├── LICENSE  
│  
└── README.md  

---

## ▶ How to Reproduce

1. Run the SQL scripts in `/sql/` using BigQuery to generate funnel metrics.  
2. Load the PBIX file in `/powerbi/` to view or modify the dashboard.  
3. Replace sample data (if included) with your own dataset following the same schema.

---

