CREATE DATABASE ABCCoffeShopWarehouse;
CREATE TABLE ABCCoffeShopWarehouse.Dim_Dates (
	transaction_date date PRIMARY KEY,
    Date_ID int,
    Week_ID int,
    Week_Desc varchar(255),
    Month_ID int,
    Month_Name varchar(255),
    Quarter_ID int,
    Quarter_Name varchar(255),
    Year_ID int
);

CREATE TABLE ABCCoffeShopWarehouse.Dim_Product (
    product_id int PRIMARY KEY,
    product_group varchar(255),
    product_category varchar(255),
    product_type varchar(255),
    product varchar(255),
    product_description varchar(255),
    unit_of_measure varchar(255),
    current_wholesale_price float,
    current_retail_price float,
    tax_exempt_yn varchar(255),
    promo_yn varchar(255),
    new_product_yn varchar(255)
);
CREATE TABLE ABCCoffeShopWarehouse.Dim_Customer (
    customer_id int PRIMARY KEY,
    home_store int,
    customer_first_name varchar(255),
    customer_email varchar(255),
    customer_since date,
    loyalty_card_number varchar(255),
    birthdate date,
    gender varchar(255),
    birth_year int
);

CREATE TABLE ABCCoffeShopWarehouse.Dim_Staff (
    staff_id int PRIMARY KEY,
    first_name varchar(255),
    last_name varchar(255),
    position varchar(255),
    start_date date,
    location varchar(255)
);

CREATE TABLE ABCCoffeShopWarehouse.Dim_Generations (
    birth_year int PRIMARY KEY,
    generation varchar(255)
);

CREATE TABLE ABCCoffeShopWarehouse.Dim_Outlet (
    sales_outlet_id int PRIMARY KEY,
    sales_outlet_type varchar(255),
    store_square_feet int,
    store_address varchar(255),
    store_city varchar(255),
    store_state_province varchar(255),
    store_telephone varchar(255),
    store_postal_code int,
    store_longitude float,
    store_latitude float,
    manager int,
    Neighorhood varchar(255)
);

CREATE TABLE ABCCoffeShopWarehouse.Sales_Targets (
    sales_outlet_id int PRIMARY KEY,
    yearmonth varchar(255),
    beans_goal int,
    beverage_goal int,
    food_goal int,
    merchandise_goal int,
    total_goal int,
    Month_ID int,
    Year_ID int,
    FOREIGN KEY (sales_outlet_id) REFERENCES Dim_Outlet(sales_outlet_id)
);

CREATE TABLE ABCCoffeShopWarehouse.Pastry_Inventory (
    sales_outlet_id int,
    transaction_date date,
    product_id int,
    start_of_day int,
    quantity_sold int,
    waste int,
    waste_precentage float,
    FOREIGN KEY (sales_outlet_id) REFERENCES Dim_Outlet(sales_outlet_id),
    FOREIGN KEY (transaction_date) REFERENCES Dim_Dates(transaction_date),
    FOREIGN KEY (product_id) REFERENCES Dim_Product(product_id)
);

CREATE TABLE ABCCoffeShopWarehouse.Sales_Reciepts (
    transaction_id int PRIMARY KEY,
    transaction_date date,
    transaction_time time,
    sales_outlet_id int,
    staff_id int,
    customer_id int,
    instore_yn varchar(255),
    order_id int,
    line_item_id int,
    product_id int,
    quantity int,
    line_item_amount float,
    unit_price float,
    promo_item_yn varchar(255),
    FOREIGN KEY (sales_outlet_id) REFERENCES Dim_Outlet(sales_outlet_id),
    FOREIGN KEY (transaction_date) REFERENCES Dim_Dates(transaction_date),
    FOREIGN KEY (product_id) REFERENCES Dim_Product(product_id),
    FOREIGN KEY (staff_id) REFERENCES Dim_Staff(staff_id),
    FOREIGN KEY (customer_id) REFERENCES Dim_Customer(customer_id)
);
