use ecommerce_sales;

CREATE OR REPLACE VIEW dim_customer AS
SELECT DISTINCT
    customer_id,
    customer_name,
    gender,
    age_group
FROM sales;