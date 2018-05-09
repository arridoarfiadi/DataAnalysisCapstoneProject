CREATE TABLE Group1(
OrderID INT NOT NULL,
frozen INT NOT NULL,
other INT NOT NULL,
bakery INT NOT NULL,
produce INT NOT NULL,
Foreign Key (OrderID) references OrderIDTable (OrderID)
);

CREATE TABLE Group2(
OrderID INT NOT NULL,
alcohol INT NOT NULL,
international INT NOT NULL,
beverages INT NOT NULL,
pets INT NOT NULL,
Foreign Key (OrderID) references OrderIDTable (OrderID)
);


CREATE TABLE Group3(
OrderID INT NOT NULL,
dryGoodsPasta INT NOT NULL,
bulk INT NOT NULL,
personalCare INT NOT NULL,
meatSeafood INT NOT NULL,
Foreign Key (OrderID) references OrderIDTable (OrderID)
);

CREATE TABLE Group4(
OrderID INT NOT NULL,
pantry INT NOT NULL,
breakfast INT NOT NULL,
cannedGoods INT NOT NULL,
dairyEggs INT NOT NULL,
Foreign Key (OrderID) references OrderIDTable (OrderID)
);

CREATE TABLE Group5(
OrderID INT NOT NULL,
household INT NOT NULL,
babies INT NOT NULL,
snacks INT NOT NULL,
deli INT NOT NULL,
missing INT NOT NULL,
Foreign Key (OrderID) references OrderIDTable (OrderID)
);

LOAD DATA LOCAL INFILE '/Users/arridoarfiadi/Instacart_DataAnalytics/correlation/Group1.csv'
INTO TABLE Group1
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/Users/arridoarfiadi/Instacart_DataAnalytics/correlation/Group2.csv'
INTO TABLE Group2
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/Users/arridoarfiadi/Instacart_DataAnalytics/correlation/Group3.csv'
INTO TABLE Group3
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/Users/arridoarfiadi/Instacart_DataAnalytics/correlation/Group4.csv'
INTO TABLE Group4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/Users/arridoarfiadi/Instacart_DataAnalytics/correlation/Group5.csv'
INTO TABLE Group5
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
