use ecommerce_sales;

CREATE OR REPLACE VIEW fact_sales AS
SELECT
    order_id,
    order_date_id,
    customer_id,
    product_id,
    location_id,

    quantity,
    cost_price,
    selling_price,
    discount_amount,
    shipping_cost,
    revenue,
    net_profit,

    payment_method,
    order_status
FROM sales;