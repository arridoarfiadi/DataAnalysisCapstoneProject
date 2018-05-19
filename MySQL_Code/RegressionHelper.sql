CREATE TABLE orderDepCorr(
OrderID INT NOT NULL,
numOfNoCorr INT NOT NULL,
numOfWeak INT NOT NULL,
numOfAverage INT NOT NULL,
numOfStrong INT NOT NULL,
Foreign Key (OrderID) references OrderIDTable (OrderID)
);

CREATE TABLE orderNature(
OrderID INT NOT NULL,
numOfShort INT NOT NULL,
numOfNormal INT NOT NULL,
numOfLong INT NOT NULL,
Foreign Key (OrderID) references OrderIDTable (OrderID)
);

LOAD DATA LOCAL INFILE '/Users/arridoarfiadi/Instacart_DataAnalytics/Regression Analysis/csv_files/corrDepartmentOfOrder.csv'
INTO TABLE orderDepCorr
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';

LOAD DATA LOCAL INFILE '/Users/arridoarfiadi/Instacart_DataAnalytics/Regression Analysis/csv_files/natureOfOrders.csv'
INTO TABLE orderNature
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';

CREATE TABLE RegressionDataset1(
OrderID INT NOT NULL,
itemOnOrder INT,
numOfReOrdered INT,
numOfShort INT,
numOfNormal INT,
numOfLong INT,
numOfNoCorr INT,
numOfWeak INT,
numOfAverage INT,
numOfStrong INT,
dayOfTheWeek INT,
hourOfTheDay INT,
Foreign Key (OrderID) references OrderIDTable (OrderID)
);

insert into RegressionDataset1(OrderID, itemOnOrder)
select op.order_id OrderID,   sum(op.product_id) itemOnOrder from Order_Products op
group by OrderID order by OrderID;


insert into RegressionDataset1(OrderID, numOfReOrdered) 
select op.order_id OrderID, count(op.reordered) numOfReOrdered from Order_Products op
group by OrderID order by OrderID;

insert into RegressionDataset1(OrderID, dayOfTheWeek, hourOfTheDay) 
select o.order_id OrderID, o.dow, o.order_hour_of_day from Orders o
group by OrderID order by OrderID;

insert into RegressionDataset1(OrderID,numOfShort,numOfNormal,numOfLong,numOfNoCorr,numOfWeak,numOfAverage,numOfStrong)
select n.OrderID, n.numOfShort,n.numOfNormal,n.numOfLong,c.numOfNoCorr,c.numOfWeak,c.numOfAverage,c.numOfStrong
from orderNature n,orderDepCorr c
where n.orderid = c.orderid
group by OrderID order by OrderID;


select r.OrderID OrderID, r.dayOfTheWeek dayOfTheWeek, r.hourOfTheDay hourOfTheDay,r.itemOnOrder itemOnOrder, 
r.numOfShort numOfShort,r.numOfNormal,r.numOfLong numOfLong,
r.numOfNoCorr numOfNoCorr,r.numOfWeak numOfWeak,r.numOfAverage numOfAverage,r.numOfStrong numOfStrong, 
r.numOfReOrdered numOfReOrdered
from RegressionDataset1 r
group by OrderID order by OrderID;
