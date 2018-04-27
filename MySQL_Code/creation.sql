Create database Instacart;
use Instacart;

SET FOREIGN_KEY_CHECKS = 0;

CREATE TABLE Orders(
order_id INT NOT NULL,
user_id INT NOT NULL,
eval_set VARCHAR(255) NOT NULL,
order_num INT NOT NULL,
order_dow VARCHAR(5) NOT NULL,
order_hour_of_day INT NOT NULL,
days_since_prior_order INT,
PRIMARY KEY (order_id)
);


CREATE TABLE Departments(
department_id INT NOT NULL,
department_name VARCHAR(50) NOT NULL,
PRIMARY KEY (department_id)
);

CREATE TABLE Aisles(
aisle_id INT NOT NULL,
aisle_name VARCHAR(255) NOT NULL,
PRIMARY KEY (aisle_id)
);


CREATE TABLE Products(
product_id INT NOT NULL,
product_name VARCHAR(255) NOT NULL,
aisle_id INT NOT NULL,
department_id INT NOT NULL,
PRIMARY KEY (product_id),
FOREIGN KEY (aisle_id) REFERENCES Aisles(aisle_id),
FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

CREATE TABLE Order_Products(
order_id INT NOT NULL,
product_id INT NOT NULL,
add_to_cart_order INT NOT NULL,
reordered TINYINT NOT NULL,
PRIMARY KEY (order_id, product_id),
FOREIGN KEY (order_id) REFERENCES Orders(order_id),
FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

LOAD DATA LOCAL INFILE '/Users/arridoarfiadi/Downloads/DATA/Orders.csv' 
INTO TABLE Orders 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/Users/arridoarfiadi/Downloads/DATA/aisles.csv' 
INTO TABLE Aisles 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/Users/arridoarfiadi/Downloads/DATA/departments.csv' 
INTO TABLE Departments 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/Users/arridoarfiadi/Downloads/DATA/products.csv' 
INTO TABLE Products 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/Users/arridoarfiadi/Downloads/DATA/order_products__train.csv' 
INTO TABLE Order_Products 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/Users/arridoarfiadi/Downloads/DATA/order_products__prior.csv' 
INTO TABLE Order_Products 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;





