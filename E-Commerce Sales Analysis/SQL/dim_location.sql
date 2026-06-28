use ecommerce_sales;

CREATE OR REPLACE VIEW dim_location AS
SELECT DISTINCT
    location_id,
    country,
    state,
    city,
    region
FROM sales;