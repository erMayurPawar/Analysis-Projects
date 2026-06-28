USE ecommerce_sales;

UPDATE sales SET
revenue = 
CASE
	WHEN order_status IN ('Delivered', 'Shipped', 'Pending')
    THEN (selling_price * quantity) - discount_amount
    
    WHEN order_status IN ('Cancelled', 'Returned')
    THEN 0
END,
net_profit =
CASE
	WHEN order_status IN ('Delivered', 'Shipped', 'Pending')
    THEN ((selling_price * quantity) - discount_amount) - (cost_price * quantity) - shipping_cost
    
    WHEN order_status = 'Cancelled'
    THEN 0
    
    WHEN order_status = 'Returned'
    THEN -shipping_cost
END;