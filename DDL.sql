USE EcommerceDb;

 CREATE TABLE IF NOT EXISTS CUSTOMER( 
	CustomerID INT NOT NULL auto_increment PRIMARY KEY, 
    username VARCHAR(10),
    password VARCHAR(20),
    firstName VARCHAR(30),
    lastName VARCHAR(30),
    address varchar(35),
    phone varchar(25),
    city varchar(20),
    accountNumber varchar(15),
    postalCode varchar(15),
    modifiedDate datetime,
    Email varchar(200)
    );
    
CREATE TABLE IF NOT EXISTS PAYMENT_METHOD(
	CreditCardID INT NOT NULL auto_increment PRIMARY KEY,
    CustomerID INT NOT NULL,
    CardType varchar(255),
    CardNumber varchar(35),
    ExpMonth tinyint,
    ExpYear smallint,
    ModifiedDate datetime,
    foreign key (CustomerID) references CUSTOMER (CustomerID)
);


CREATE TABLE IF NOT EXISTS SALES_ORDER(
	SalesOrderID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    OrderDate datetime,
    DueDate datetime,
    ShipDate datetime,
    SalesOrderNumber varchar(25),
    CustomerID INT Not Null,
    CreditCardID INT Not null,
    foreign key (CustomerID) references CUSTOMER(CustomerID),
    foreign key (CreditCardID) references PAYMENT_METHOD(CreditCardID),
    CreditCardApprovalCode varchar(15),
    Subtotal decimal,
    TaxAmt decimal,
    TotalDue decimal,
    Comment varchar(128),
    ModifiedDate datetime
);


CREATE TABLE IF NOT EXISTS ORDER_HISTORY(
	OrderHistoryID INT NOT NULL auto_increment PRIMARY KEY,
    OrderDate datetime,
    CustomerID int not null,
    foreign key (CustomerID) references CUSTOMER(CustomerID),
    SalesOrderID int not null,
    foreign key (SalesOrderID) references SALES_ORDER(SalesOrderID)
);

CREATE TABLE IF NOT EXISTS PRODUCT_INVENTORY(
	InventoryID int not null auto_increment primary key,
    quantity int,
    created_at datetime,
    modified_at datetime
);

CREATE TABLE IF NOT EXISTS PRODUCT_CATEGORY(
	CategoryID int not null auto_increment primary key,
    name varchar(150),
    description varchar(255)
);

CREATE TABLE IF NOT EXISTS PRODUCT(
	ProductID int not null auto_increment primary key,
    name varchar(150),
    description varchar(300),
    sku varchar(10),
    price decimal,
    CategoryID int not null,
    InventoryID int not null,
    foreign key (CategoryID) references PRODUCT_CATEGORY(CategoryID),
    foreign key (InventoryID) references PRODUCT_INVENTORY(InventoryID)
);

CREATE TABLE IF NOT EXISTS CART_ITEM(
	CartItemID int not null auto_increment primary key,
    quantity int,
    productID int not null,
    foreign key (productID) references PRODUCT(ProductID),
    created_at datetime,
    modified_at datetime
);

CREATE TABLE IF NOT EXISTS ORDER_DETAILS(
	OrderDetailsID INT NOT NULL auto_increment PRIMARY KEY,
    SalesOrderID int not null,
    OrderQty smallint,
    ProductID int not null,
    CartItemID int not null,
    foreign key(SalesOrderID) references SALES_ORDER(SalesOrderID),
    foreign key (ProductID) references PRODUCT(ProductID),
    foreign key (CartItemID) references CART_ITEM(CartItemID),
    UnitPrice decimal,
    UnitPriceDiscount decimal,
    ModifiedDate datetime
);
    
    
CREATE TABLE IF NOT EXISTS COUNTRY_REGION(
	CountryRegionCode varchar(5) not null primary key,
    name varchar(30),
    CustomerID int not null,
    foreign key (CustomerID) references CUSTOMER(CustomerID)
);
    
CREATE TABLE IF NOT EXISTS SHOPPING_SESSION(
	SessionID int not null auto_increment primary key,
    CustomerID int not null,
    foreign key (CustomerID) references CUSTOMER(CustomerID),
    created_at datetime,
    modified_at datetime
);
    