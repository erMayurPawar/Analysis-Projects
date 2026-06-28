use ecommerce_sales;

CREATE OR REPLACE VIEW dim_product AS
SELECT DISTINCT
    product_id,
    product_name,
    category,
    sub_category,
    brand
FROM sales;