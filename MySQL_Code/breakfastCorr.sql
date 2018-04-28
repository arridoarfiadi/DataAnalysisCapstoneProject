
CREATE TABLE OrderIDTable(
OrderID INT NOT NULL,
PRIMARY KEY (OrderID)
);

CREATE TABLE breakfastcorr1(
OrderID INT NOT NULL,
Cereal INT NOT NULL,
Milk INT NOT NULL,
Yogurt INT NOT NULL,
Juice INT NOT NULL,
Foreign Key (OrderID) references OrderIDTable (OrderID)
);

CREATE TABLE breakfastcorr2(
OrderID INT NOT NULL,
Bread INT NOT NULL,
BBakery INT NOT NULL,
Butter INT NOT NULL,
Spreads INT NOT NULL,
Foreign Key (OrderID) references OrderIDTable (OrderID)
);

CREATE TABLE breakfastcorr3(
OrderID INT NOT NULL,
Coffee INT NOT NULL,
Eggs INT NOT NULL,
FrozenB INT NOT NULL,
BBarsPastries INT NOT NULL,
Foreign Key (OrderID) references OrderIDTable (OrderID)
);

CREATE TABLE breakfastcorr4(
OrderID INT NOT NULL,
FrozenJuice INT NOT NULL,
Protein INT NOT NULL,
Fruits INT NOT NULL,
Granola INT NOT NULL,
Foreign Key (OrderID) references OrderIDTable (OrderID)
);

LOAD DATA LOCAL INFILE '/Users/arridoarfiadi/Instacart_DataAnalytics/correlation/orderid.csv'
INTO TABLE OrderIDTable
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/Users/arridoarfiadi/Instacart_DataAnalytics/correlation/breakfastcorr.csv'
INTO TABLE breakfastcorr1
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/Users/arridoarfiadi/Instacart_DataAnalytics/correlation/breakfastcorr2.csv'
INTO TABLE breakfastcorr2
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/Users/arridoarfiadi/Instacart_DataAnalytics/correlation/breakfastcorr3.csv'
INTO TABLE breakfastcorr3
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/Users/arridoarfiadi/Instacart_DataAnalytics/correlation/breakfastcorr4.csv'
INTO TABLE breakfastcorr4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT c1.OrderID, ifnull(sum(c1.Cereal),0), ifnull(sum(c1.Milk),0), ifnull(sum(c1.Yogurt),0), ifnull(sum(c1.Juice),0),ifnull(sum(c2.Bread),0),ifnull(sum(c2.BBakery),0),
ifnull(sum(c2.Butter),0),ifnull(sum(c2.Spreads) ,0)
FROM breakfastcorr1 c1 left join breakfastcorr2 c2 on c1.OrderID = c2.OrderID group by OrderID
union
SELECT c2.OrderID, ifnull(sum(c1.Cereal),0), ifnull(sum(c1.Milk),0), ifnull(sum(c1.Yogurt),0), ifnull(sum(c1.Juice),0),ifnull(sum(c2.Bread),0),ifnull(sum(c2.BBakery),0),
ifnull(sum(c2.Butter),0),ifnull(sum(c2.Spreads) ,0)
FROM breakfastcorr1 c1 right join breakfastcorr2 c2 on c1.OrderID = c2.OrderID group by OrderID;

SELECT c1.OrderID, ifnull(sum(c1.coffee),0), ifnull(sum(c1.eggs),0), ifnull(sum(c1.frozenb),0), ifnull(sum(c1.BBarsPastries),0),ifnull(sum(c2.FrozenJuice),0),ifnull(sum(c2.protein),0),
ifnull(sum(c2.fruits),0),ifnull(sum(c2.granola) ,0)
FROM breakfastcorr3 c1 left join breakfastcorr4 c2 on c1.OrderID = c2.OrderID group by OrderID
union
SELECT c2.OrderID, ifnull(sum(c1.coffee),0), ifnull(sum(c1.eggs),0), ifnull(sum(c1.frozenb),0), ifnull(sum(c1.BBarsPastries),0),ifnull(sum(c2.FrozenJuice),0),ifnull(sum(c2.protein),0),
ifnull(sum(c2.fruits),0),ifnull(sum(c2.granola) ,0)
FROM breakfastcorr3 c1 right join breakfastcorr4 c2 on c1.OrderID = c2.OrderID group by OrderID;


CREATE TABLE breakfastcorr1and2(
OrderID INT NOT NULL,
Cereal INT NOT NULL,
Milk INT NOT NULL,
Yogurt INT NOT NULL,
Juice INT NOT NULL,
Bread INT NOT NULL,
BBakery INT NOT NULL,
Butter INT NOT NULL,
Spreads INT NOT NULL,
Foreign Key (OrderID) references OrderIDTable (OrderID)
);

CREATE TABLE breakfastcorr3and4(
OrderID INT NOT NULL,
Coffee INT NOT NULL,
Eggs INT NOT NULL,
FrozenB INT NOT NULL,
BBarsPastries INT NOT NULL,
FrozenJuice INT NOT NULL,
Protein INT NOT NULL,
Fruits INT NOT NULL,
Granola INT NOT NULL,
Foreign Key (OrderID) references OrderIDTable (OrderID)
);


LOAD DATA LOCAL INFILE '/Users/arridoarfiadi/Instacart_DataAnalytics/correlation/1and2Combine.csv'
INTO TABLE breakfastcorr1and2
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/Users/arridoarfiadi/Instacart_DataAnalytics/correlation/3and4Combine.csv'
INTO TABLE breakfastcorr3and4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT c1.OrderID, ifnull(sum(c1.Cereal),0) Cereal, ifnull(sum(c1.Milk),0) Milk, ifnull(sum(c1.Yogurt),0) Yogurt, ifnull(sum(c1.Juice),0) Juice,ifnull(sum(c1.Bread),0) Bread,ifnull(sum(c1.BBakery),0) BBakery,
ifnull(sum(c1.Butter),0) Butter,ifnull(sum(c1.Spreads) ,0) Spreads, ifnull(sum(c2.coffee),0) Coffee, ifnull(sum(c2.eggs),0) Eggs, ifnull(sum(c2.frozenb),0) FrozenB, ifnull(sum(c2.BBarsPastries),0) BBarsPastries,
ifnull(sum(c2.FrozenJuice),0) FrozenJuice,ifnull(sum(c2.protein),0) Protein, ifnull(sum(c2.fruits),0) Fruits,ifnull(sum(c2.granola) ,0) Granola
FROM breakfastcorr1and2 c1 left join breakfastcorr3and4 c2 on c1.OrderID = c2.OrderID group by OrderID
union
SELECT c2.OrderID, ifnull(sum(c1.Cereal),0) Cereal, ifnull(sum(c1.Milk),0) Milk, ifnull(sum(c1.Yogurt),0) Yogurt, ifnull(sum(c1.Juice),0) Juice,ifnull(sum(c1.Bread),0) Bread,ifnull(sum(c1.BBakery),0) BBakery,
ifnull(sum(c1.Butter),0) Butter,ifnull(sum(c1.Spreads) ,0) Spreads, ifnull(sum(c2.coffee),0) Coffee, ifnull(sum(c2.eggs),0) Eggs, ifnull(sum(c2.frozenb),0) FrozenB, ifnull(sum(c2.BBarsPastries),0) BBarsPastries,
ifnull(sum(c2.FrozenJuice),0) FrozenJuice,ifnull(sum(c2.protein),0) Protein, ifnull(sum(c2.fruits),0) Fruits,ifnull(sum(c2.granola) ,0) Granola
FROM breakfastcorr1and2 c1 right join breakfastcorr3and4 c2 on c1.OrderID = c2.OrderID group by OrderID
