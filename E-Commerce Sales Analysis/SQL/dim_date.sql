USE ecommerce_sales;

CREATE OR REPLACE VIEW dim_date AS
SELECT DISTINCT
    order_date_id,
    date,
    day,
    month,
    month_name,
    quarter,
    year,
    week_day
FROM sales;

SELECT date, COUNT(*)
FROM dim_date
GROUP BY date
HAVING COUNT(*) > 1;

SELECT COUNT(DISTINCT date) AS unique_dates
FROM dim_date;