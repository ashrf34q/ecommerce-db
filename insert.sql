USE ecommercedb;

-- Loading data into customer 
INSERT INTO CUSTOMER (
  username, password, firstName, lastName, 
  address, phone, city, accountNumber, 
  postalCode, Email
) 
VALUES 
  (
    'sundusu32@wq', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 
    'Kamal', 'Mendez', '821-218 Libero. Av.', 
    '(875) 385-8396', 'Detroit', '432u289112', 
    '48322-1870', 'egestas.lacinia@protonmail.edu'
  ), 
  (
    'sjduehdh', 'f3b75561928b827f42d030496e69c719e6b921a939eeb49e20d3866a0edf6ef4', 
    'Driscoll', 'Daniel', '478-6302 Nibh St.', 
    '1-333-844-6781', 'Dearborn', '2342311212', 
    '34213-1982', 'ultricies.sem.magna@google.net'
  ),
  ('username', 'eddef9e8e578c2a560c3187c4152c8b6f3f90c1dcf8c88b386ac1a9a96079c2c', 'Louis', 'Price', 'P.O. Box 861, 953 Vel, Rd.', '(464) 397-1248', 'Dearborn', '43212E67', '4737', '2023-04-10', 'aenean.eget@yahoo.edu');

INSERT INTO PRODUCT_CATEGORY (name, description) 
VALUES 
  (
    'Bookstores', 'Books, novels and related categories'
  ), 
  (
    'Smart hand held devices', 'Smartphones, Smartwatches, headphones etc...'
  ), 
  (
    'Healthcare', 'OTC meds, vitamins, toothpastes etc...'
  );

INSERT INTO PRODUCT_INVENTORY (
  quantity, created_at, modified_at
) 
VALUES 
  (25, '2023-3-6', '2023-4-6'), 
  (34, '2022-3-6', '2023-4-4'), 
  (55, '2021-3-3', '2022-5-6'), 
  (24, '2020-3-1', '2023-4-5'),
  (37, '2023-04-05', '2023-04-07');

  
-- Loading data into product
INSERT INTO PRODUCT (
  name, description, sku, price, CategoryID, 
  InventoryID
) 
VALUES 
  (
    'Galaxy S22', 
    'Samsung Galaxy s22 smartphone', 
    'ZG011AGA', 
    669.99, 
    (
      select 
        CategoryID 
      from 
        product_category 
      where 
        name = 'Smart hand held devices'
    ), 
    (
      select 
        InventoryID 
      from 
        product_inventory 
      where 
        quantity = 55
    )
  ), 
  (
    '1984', 
    'dystopian social science fiction novel and cautionary tale by English writer George Orwell', 
    'GV45SAGA', 
    32.99, 
    (
      select 
        CategoryID 
      from 
        product_category 
      where 
        name = 'Bookstores'
    ), 
    (
      select 
        InventoryID 
      from 
        product_inventory 
      where 
        quantity = 24
    )
  ), 
  (
    'Multivitamin', 
    'Complete multivitamin for men', 
    'SDF346A', 
    35.59, 
    (
      select 
        CategoryID 
      from 
        product_category 
      where 
        name = 'Healthcare'
    ), 
    (
      select 
        InventoryID 
      from 
        product_inventory 
      where 
        quantity = 34
    )
  ),
  (
  'Lord of the Rings: The Two Towers', 
  "The second volume in J.R.R. Tolkien's epic adventure THE LORD OF THE RINGS", 
  'FER21345FC', 
  24.99, 
  (
    select 
      CategoryID 
    from 
      product_category 
    where 
      name = 'Bookstores'
  ), 
  (
    select 
      InventoryID 
    from 
      product_inventory 
    where 
      quantity = 25
  )
), 
(
  'Lord of the Rings: Return of the King', 
  "The third volume in J.R.R. Tolkien's epic adventure THE LORD OF THE RINGS", 
  'R255345G#', 
  24.99, 
  (
    select 
      CategoryID 
    from 
      product_category 
    where 
      name = 'Bookstores'
  ), 
  (
    select 
      InventoryID 
    from 
      product_inventory 
    where 
      quantity = 37
  )
);


  
INSERT INTO SHOPPING_SESSION(
  CustomerID, created_at, modified_at
) 
VALUES 
  (
    (
      select 
        CustomerID 
      from 
        customer 
      where 
        accountNumber = '432u289112'
    ), 
    '2023-04-04', 
    '2023-04-07'
  ), 
  (
    (
      select 
        CustomerID 
      from 
        customer 
      where 
        accountNumber = '2342311212'
    ), 
    '2023-03-03', 
    '2023-04-01'
  );


INSERT INTO cart_item (
  quantity, productID, created_at, modified_at
) 
VALUES 
  (
    2, 
    (
      select 
        ProductID 
      from 
        product 
      where 
        sku = 'ZG011AGA'
    ), 
    '2023-04-04', 
    '2023-04-04'
  ), 
  (
    5, 
    (
      select 
        ProductID 
      from 
        product 
      where 
        sku = 'GV45SAGA'
    ), 
    '2023-03-03', 
    '2023-03-05'
  ),
  (
  3, 
  (
    select 
      ProductID 
    from 
      product 
    where 
      sku = 'FER21345FC'
  ), 
  '2023-04-04', 
  '2023-04-04'
);
  
  
  insert into payment_method (
  CustomerID, CardType, CardNumber, 
  ExpMonth, ExpYear, ModifiedDate
) 
values 
  (
    (
      select 
        CustomerID 
      from 
        customer 
      where 
        accountNumber = '432u289112'
    ), 
    'VISA, Rewards Visa signature cards', 
    '4716091785856580', 
    06, 
    2026, 
    '2022-06-06'
  ), 
  (
    (
      select 
        CustomerID 
      from 
        customer 
      where 
        accountNumber = '432u289112'
    ), 
    'AMEX, Premium Gold card', 
    '347738258591087', 
    11, 
    2025, 
    '2023-04-09'
  ), 
  (
    (
      select 
        CustomerID 
      from 
        customer 
      where 
        accountNumber = '2342311212'
    ), 
    'DISCOVER, Student credit card', 
    '6011516019615979', 
    07, 
    2029, 
    '2023-05-05'
  );


insert into country_region(
  CountryRegionCode, name, CustomerID
) 
Values 
  (
    '734', 
    'Ann Arbor, Southeast Michigan', 
    (
      select 
        CustomerID 
      from 
        Customer 
      where 
        accountNumber = '2342311212'
    )
  ), 
  (
    '943', 
    'Georgia, Atlanta', 
    (
      select 
        CustomerID 
      from 
        Customer 
      where 
        accountNumber = '432u289112'
    )
  );


insert into sales_order(OrderDate, DueDate, ShipDate, SalesOrderNumber, CustomerID, CreditCardID, CreditCardApprovalCode, Subtotal, TaxAmt, TotalDue, Comment, ModifiedDate)
values('2023-03-05', '2023-03-09', '2023-03-07', '908765AC32Y', (select CustomerID from Customer where accountNumber='432u289112'), (select CreditCardID from payment_method where CardNumber='4716091785856580'), '200', 164.95, 5.28, 170.23, 'Leave at front door', '2023-03-06'),
('2023-04-05', '2023-04-07', '2023-04-10', '74627T1R4', (select CustomerID from Customer where accountNumber='432u289112'), (select CreditCardID from payment_method where CardNumber='347738258591087'), '200', 46.23, 3.4, 49.63, 'Leave inside mailbox', '2023-04-07'),
('2023-04-04', '2023-04-10', '2023-04-06', '73829U5X', (select CustomerID from Customer where accountNumber='2342311212'), (select CreditCardID from payment_method where CardNumber='6011516019615979'), '200', 1339.98, 80.4, 1420.38, 'Leave package at back door', '2023-04-04');


insert into order_history(OrderDate, CustomerID, SalesOrderID)
values((select OrderDate from sales_order where SalesOrderNumber='74627T1R4'), (select CustomerID from sales_order where SalesOrderNumber='74627T1R4'), (select SalesOrderID from sales_order where SalesOrderNumber='74627T1R4')),
((select OrderDate from sales_order where SalesOrderNumber='73829U5X'), (select CustomerID from sales_order where SalesOrderNumber='73829U5X'), (select SalesOrderID from sales_order where SalesOrderNumber='73829U5X')),
((select OrderDate from sales_order where SalesOrderNumber='908765AC32Y'), (select CustomerID from sales_order where SalesOrderNumber='908765AC32Y'), (select SalesOrderID from sales_order where SalesOrderNumber='908765AC32Y'));

insert into order_details(SalesOrderID, OrderQty, ProductID, CartItemID, UnitPrice, UnitPriceDiscount, ModifiedDate)
values((select SalesOrderID from sales_order where SalesOrderNumber='908765AC32Y'), 5, (select ProductID from product where sku='GV45SAGA'), (select CartItemID from cart_item where quantity=5), 32.99, 0, '2023-04-06'),
((select SalesOrderID from sales_order where SalesOrderNumber='73829U5X'), 2, (select ProductID from product where sku='ZG011AGA'), (select CartItemID from cart_item where quantity=2), 669.99, 0, '2023-04-06'),
((select SalesOrderID from sales_order where SalesOrderNumber='74627T1R4'), 3, (select ProductID from product where sku='FER21345FC'), (select CartItemID from cart_item where quantity=3), 24.99, 0, '2023-04-04');
