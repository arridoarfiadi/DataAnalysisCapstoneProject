CREATE TABLE Group1(
OrderID INT NOT NULL,
CookieCakes INT NOT NULL,
BakeryDesserts INT NOT NULL,
PuddingDesserts INT NOT NULL,
CandyChocolates INT NOT NULL,
Foreign Key (OrderID) references OrderIDTable (OrderID)
);

CREATE TABLE Group2(
OrderID INT NOT NULL,
AppetizersSides INT NOT NULL,
FrozenPizza INT NOT NULL,
PreparedMeals INT NOT NULL,
SoupsSalads INT NOT NULL,
Foreign Key (OrderID) references OrderIDTable (OrderID)
);

CREATE TABLE Group3(
OrderID INT NOT NULL,
ChipsPretzels INT NOT NULL,
Crackers INT NOT NULL,
PopcornJerky INT NOT NULL,
DipsTapenades INT NOT NULL,
DipsSpreads INT NOT NULL,
Foreign Key (OrderID) references OrderIDTable (OrderID)
);

CREATE TABLE Group5(
OrderID INT NOT NULL,
WinesChampagnes INT NOT NULL,
BeersCoolers INT NOT NULL,
Spirits INT NOT NULL,
RedWines INT NOT NULL,
Foreign Key (OrderID) references OrderIDTable (OrderID)
);

CREATE TABLE Group4(
OrderID INT NOT NULL,
Tableware INT NOT NULL,
Condiments INT NOT NULL,
BunsRolls INT NOT NULL,
SpecialtyCheeses INT NOT NULL,
Foreign Key (OrderID) references OrderIDTable (OrderID)
);

CREATE TABLE Group6(
OrderID INT NOT NULL,
DrinkMixes INT NOT NULL,
SoftDrinks INT NOT NULL,
Juice INT NOT NULL,
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

LOAD DATA LOCAL INFILE '/Users/arridoarfiadi/Instacart_DataAnalytics/correlation/Group6.csv'
INTO TABLE Group6
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT c1.OrderID, ifnull(sum(distinct(c1.CookieCakes)),0), ifnull(sum(distinct(c1.BakeryDesserts)),0), ifnull(sum(distinct(c1.PuddingDesserts)),0), ifnull(sum(distinct(c1.CandyChocolates)),0),ifnull(sum(distinct(c2.AppetizersSides)),0),ifnull(sum(distinct(c2.FrozenPizza)),0),
ifnull(sum(distinct(c2.PreparedMeals)),0),ifnull(sum(distinct(c2.SoupsSalads)) ,0)
FROM group1 c1 left join group2 c2 on c1.OrderID = c2.OrderID group by OrderID
union
SELECT c2.OrderID, ifnull(sum(distinct(c1.CookieCakes)),0), ifnull(sum(distinct(c1.BakeryDesserts)),0), ifnull(sum(distinct(c1.PuddingDesserts)),0), ifnull(sum(distinct(c1.CandyChocolates)),0),ifnull(sum(distinct(c2.AppetizersSides)),0),ifnull(sum(distinct(c2.FrozenPizza)),0),
ifnull(sum(distinct(c2.PreparedMeals)),0),ifnull(sum(distinct(c2.SoupsSalads)) ,0)
FROM group1 c1 right join group2 c2 on c1.OrderID = c2.OrderID group by OrderID;


SELECT c1.OrderID, ifnull(sum(distinct(c1.ChipsPretzels)),0), ifnull(sum(distinct(c1.Crackers)),0), ifnull(sum(distinct(c1.PopcornJerky)),0), ifnull(sum(distinct(c1.DipsTapenades)),0),ifnull(sum(distinct(c1.DipsSpreads)),0),
ifnull(sum(distinct(c2.Tableware)),0), ifnull(sum(distinct(c2.Condiments)),0), ifnull(sum(distinct(c2.BunsRolls)),0), ifnull(sum(distinct(c2.SpecialtyCheeses)),0)
FROM group3 c1 left join group4 c2 on c1.OrderID = c2.OrderID group by OrderID
union
SELECT c2.OrderID, ifnull(sum(distinct(c1.ChipsPretzels)),0), ifnull(sum(distinct(c1.Crackers)),0), ifnull(sum(distinct(c1.PopcornJerky)),0), ifnull(sum(distinct(c1.DipsTapenades)),0),ifnull(sum(distinct(c1.DipsSpreads)),0),
ifnull(sum(distinct(c2.Tableware)),0), ifnull(sum(distinct(c2.Condiments)),0), ifnull(sum(distinct(c2.BunsRolls)),0), ifnull(sum(distinct(c2.SpecialtyCheeses)),0)
FROM group3 c1 right join group4 c2 on c1.OrderID = c2.OrderID group by OrderID;

SELECT c1.OrderID, ifnull(sum(distinct(c1.WinesChampagnes)),0), ifnull(sum(distinct(c1.BeersCoolers)),0),ifnull(sum(distinct(c1.Spirits)) ,0), ifnull(sum(distinct(c1.RedWines)) ,0),
ifnull(sum(distinct(c2.DrinkMixes)),0),ifnull(sum(distinct(c2.SoftDrinks)),0), ifnull(sum(distinct(c2.Juice)),0)
FROM group5 c1 left join group6 c2 on c1.OrderID = c2.OrderID group by OrderID
union
SELECT c2.OrderID, ifnull(sum(distinct(c1.WinesChampagnes)),0), ifnull(sum(distinct(c1.BeersCoolers)),0),ifnull(sum(distinct(c1.Spirits)) ,0), ifnull(sum(distinct(c1.RedWines)) ,0),
ifnull(sum(distinct(c2.DrinkMixes)),0),ifnull(sum(distinct(c2.SoftDrinks)),0), ifnull(sum(distinct(c2.Juice)),0)
FROM group5 c1 right join group6 c2 on c1.OrderID = c2.OrderID group by OrderID;

CREATE TABLE first(
OrderID INT NOT NULL,
CookieCakes INT NOT NULL,
BakeryDesserts INT NOT NULL,
PuddingDesserts INT NOT NULL,
CandyChocolates INT NOT NULL,
AppetizersSides INT NOT NULL,
FrozenPizza INT NOT NULL,
PreparedMeals INT NOT NULL,
SoupsSalads INT NOT NULL,
Foreign Key (OrderID) references OrderIDTable (OrderID)
);


CREATE TABLE second(
OrderID INT NOT NULL,
ChipsPretzels INT NOT NULL,
Crackers INT NOT NULL,
PopcornJerky INT NOT NULL,
DipsTapenades INT NOT NULL,
DipsSpreads INT NOT NULL,
OrderID INT NOT NULL,
Tableware INT NOT NULL,
Condiments INT NOT NULL,
BunsRolls INT NOT NULL,
SpecialtyCheeses INT NOT NULL,
Foreign Key (OrderID) references OrderIDTable (OrderID)
);

CREATE TABLE third(
OrderID INT NOT NULL,
WinesChampagnes INT NOT NULL,
BeersCoolers INT NOT NULL,
Spirits INT NOT NULL,
RedWines INT NOT NULL,
DrinkMixes INT NOT NULL,
SoftDrinks INT NOT NULL,
Juice INT NOT NULL,
Foreign Key (OrderID) references OrderIDTable (OrderID)
);

LOAD DATA LOCAL INFILE '/Users/arridoarfiadi/Instacart_DataAnalytics/correlation/firstParty.csv'
INTO TABLE first
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/Users/arridoarfiadi/Instacart_DataAnalytics/correlation/secondParty.csv'
INTO TABLE second
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/Users/arridoarfiadi/Instacart_DataAnalytics/correlation/thirdParty.csv'
INTO TABLE third
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT c1.OrderID, ifnull(sum(distinct(c1.CookieCakes)),0), ifnull(sum(distinct(c1.BakeryDesserts)),0), ifnull(sum(distinct(c1.PuddingDesserts)),0), ifnull(sum(distinct(c1.CandyChocolates)),0),ifnull(sum(distinct(c1.AppetizersSides)),0),ifnull(sum(distinct(c1.FrozenPizza)),0),
ifnull(sum(distinct(c1.PreparedMeals)),0),ifnull(sum(distinct(c1.SoupsSalads)) ,0),
ifnull(sum(distinct(c2.ChipsPretzels)),0), ifnull(sum(distinct(c2.Crackers)),0), ifnull(sum(distinct(c2.PopcornJerky)),0), ifnull(sum(distinct(c2.DipsTapenades)),0),ifnull(sum(distinct(c2.DipsSpreads)),0),
ifnull(sum(distinct(c2.Tableware)),0), ifnull(sum(distinct(c2.Condiments)),0), ifnull(sum(distinct(c2.BunsRolls)),0), ifnull(sum(distinct(c2.SpecialtyCheeses)),0)
FROM first c1 left join second c2 on c1.OrderID = c2.OrderID group by OrderID
union
SELECT c2.OrderID, ifnull(sum(distinct(c1.CookieCakes)),0), ifnull(sum(distinct(c1.BakeryDesserts)),0), ifnull(sum(distinct(c1.PuddingDesserts)),0), ifnull(sum(distinct(c1.CandyChocolates)),0),ifnull(sum(distinct(c1.AppetizersSides)),0),ifnull(sum(distinct(c1.FrozenPizza)),0),
ifnull(sum(distinct(c1.PreparedMeals)),0),ifnull(sum(distinct(c1.SoupsSalads)) ,0),
ifnull(sum(distinct(c2.ChipsPretzels)),0), ifnull(sum(distinct(c2.Crackers)),0), ifnull(sum(distinct(c2.PopcornJerky)),0), ifnull(sum(distinct(c2.DipsTapenades)),0),ifnull(sum(distinct(c2.DipsSpreads)),0),
ifnull(sum(distinct(c2.Tableware)),0), ifnull(sum(distinct(c2.Condiments)),0), ifnull(sum(distinct(c2.BunsRolls)),0), ifnull(sum(distinct(c2.SpecialtyCheeses)),0)
FROM first c1 right join second c2 on c1.OrderID = c2.OrderID group by OrderID;

CREATE TABLE firstAndSecond(
OrderID INT NOT NULL,
CookieCakes INT NOT NULL,
BakeryDesserts INT NOT NULL,
PuddingDesserts INT NOT NULL,
CandyChocolates INT NOT NULL,
AppetizersSides INT NOT NULL,
FrozenPizza INT NOT NULL,
PreparedMeals INT NOT NULL,
SoupsSalads INT NOT NULL,
ChipsPretzels INT NOT NULL,
Crackers INT NOT NULL,
PopcornJerky INT NOT NULL,
DipsTapenades INT NOT NULL,
DipsSpreads INT NOT NULL,
OrderID INT NOT NULL,
Tableware INT NOT NULL,
Condiments INT NOT NULL,
BunsRolls INT NOT NULL,
SpecialtyCheeses INT NOT NULL,
Foreign Key (OrderID) references OrderIDTable (OrderID)
);

LOAD DATA LOCAL INFILE '/Users/arridoarfiadi/Instacart_DataAnalytics/correlation/firstAndSecond.csv'
INTO TABLE firstAndSecond
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


h
