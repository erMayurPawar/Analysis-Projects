use sales;

CREATE OR REPLACE VIEW vw_sales_base AS
SELECT
    s.order_id,
    s.order_date_key,
    d.date,
    d.month,
    d.month_name,
    d.quarter,
    d.year,
    d.week_day,

    s.customer_key,
    c.customer_id,
    c.customer_name,

    s.product_key,
    p.product_id,
    p.product_name,
    TRIM(SUBSTRING_INDEX(p.product_name, '#', 1)) AS clean_product_name,
    p.category,
    p.sub_category,
    p.brand,

    s.location_key,
    l.country,
    l.state,
    l.city,
    l.region,

    s.quantity,
    s.unit_price,
    s.discount_amount,
    s.shipping_cost,
    s.order_status,

    (s.quantity * s.unit_price) - s.discount_amount AS revenue

FROM fact_sales s
LEFT JOIN dim_date d
    ON s.order_date_key = d.date_key
LEFT JOIN dim_customer c
    ON s.customer_key = c.customer_key
LEFT JOIN dim_product p
    ON s.product_key = p.product_key
LEFT JOIN dim_location l
    ON s.location_key = l.location_key;