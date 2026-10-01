# World Layoffs Exploratory Data Analysis (EDA) Project

## 📌 Overview
This project performs an Exploratory Data Analysis (EDA) on global tech layoff data using **MySQL**. The goal is to uncover key business insights, trends, and patterns across companies, industries, locations, and timeframes.

---

## 💡 Key Business Questions & Analysis Covered

1. **Max & Min Metrics:** Identified single-day layoff peaks and high-funding bankruptcies.
2. **Top Impacted Companies & Industries:** Analyzed total layoffs grouped by company and industry to highlight the most vulnerable sectors.
3. **Yearly & Country Trends:** Evaluated which years and nations recorded the highest number of workforce reductions.
4. **Rolling Total Layoffs:** Created a monthly cumulative sum (Rolling Total) using `CTEs` and `SUM() OVER()` window functions to visualize layoffs progression over time.
5. **Top Companies per Year:** Utilized `DENSE_RANK()` and multiple `CTEs` to isolate the top 5 companies with the largest layoffs for each individual calendar year.

---

## 🧰 Tools & SQL Concepts Used
- **Database:** MySQL Workbench
- **Advanced SQL:** CTEs, Window Functions (`SUM() OVER`, `DENSE_RANK()`), Aggregate Functions (`SUM`, `MAX`, `AVG`), Grouping (`GROUP BY`, `ORDER BY`), Date Parsing (`YEAR()`, `SUBSTRING()`).
