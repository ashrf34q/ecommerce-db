use ecommercedb;

select firstName, lastName from customer where CustomerID = 2;

select name, price from product where CategoryID = 10;

-- This shows the one-to-many relationship between customer and order history 
select * from order_history where CustomerID = 1;

select accountNumber from customer where city = 'Dearborn';

-- Update product price, giving a discount
update product set price = price*0.7 where CategoryID = 10;

-- Retrieving how much we have from a specific product in the inventory, and the name of a specific product  
select quantity, name from product_inventory, product where product.ProductID = 7 
and product.InventoryID = product_inventory.InventoryID;

-- update customer password 
update customer set password = 'TestPassword' where CustomerID = 2;

delete from customer where CustomerID = 3;

delete from shopping_session where CustomerID = 2;

-- Here we're retrieving details of a specific order from the order history
SELECT * FROM order_details, order_history WHERE order_history.SalesOrderID = 2 
AND order_history.SalesOrderID=order_details.SalesOrderID;

-- Selecting all orders from the order table, based on a customer ID.
-- This query shows the one-to-many relationship between Customer and sales_order
SELECT * FROM sales_order WHERE CustomerID=1;

-- Retrieving the product's name, description and price of a cart item
SELECT name, description, price FROM product, cart_item 
WHERE cartItemID = 2 and cart_item.productID=product.ProductID;

-- Retrieving total due and payment details for a specific order
select TotalDue, CardType, CardNumber, ExpMonth, ExpYear from payment_method, sales_order 
where SalesOrderID = 1 and payment_method.CreditCardID = sales_order.CreditCardID;