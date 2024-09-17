/* Total sales by State */
SELECT state, 
		city,
        store_name, 
        order_date,
		ROUND(SUM(order_items.list_price * quantity),2) as total_sales
FROM project1.orders
LEFT OUTER JOIN project1.stores
ON orders.store_id = stores.store_id
LEFT OUTER JOIN project1.order_items
ON orders.order_id = order_items.order_id
GROUP BY state, store_name, city, order_date
ORDER BY total_sales desc
LIMIT 10 OFFSET 10;

/* Total products and sales per brand */
SELECT COUNT(product_name) AS products,
		ROUND(SUM(products.list_price*order_items.quantity),2) as totalprice,
        brand_name, 
        products.brand_id
FROM project1.products
LEFT OUTER JOIN project1.brands
ON products.brand_id = brands.brand_id
LEFT OUTER JOIN project1.order_items
ON order_items.product_id = products.product_id
GROUP BY brand_name, products.brand_id
ORDER BY products DESC;


/* Highest selling products */
SELECT products.product_id, 
		product_name, 
        brand_name,
        category_name,
		ROUND(SUM(order_items.list_price * order_items.quantity),2) as total_price
FROM project1.products 
LEFT OUTER JOIN project1.brands
ON products.brand_id = brands.brand_id
LEFT OUTER JOIN project1.order_items
ON products.product_id = order_items.order_id
LEFT OUTER JOIN project1.categories
ON products.category_id = categories.category_id
GROUP BY products.product_id, product_name, brand_name, category_name
ORDER BY total_price desc;

/* Top selling product by order date */
SELECT order_items.order_id, 
		product_name, 
        order_date,
        store_id, 
		sum(order_items.list_price * order_items.quantity) as total_price
FROM project1.order_items
LEFT OUTER JOIN project1.products
ON order_items.product_id = products.product_id /* this is to add the product name from products table */
LEFT OUTER JOIN project1.orders
ON order_items.order_id = orders.order_id /* this is to add the store id from orders table */
GROUP BY order_items.order_id, product_name, store_id, order_date
ORDER BY order_date ASC;







