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
Foreign Key (OrderID) references OrderIDTable (OrderID)
);

CREATE TABLE RegressionDataset2(
OrderID INT NOT NULL,
numOfReOrdered INT,
Foreign Key (OrderID) references OrderIDTable (OrderID)
);

insert into RegressionDataset1(OrderID, itemOnOrder)
select op.order_id OrderID,   count(op.product_id) itemOnOrder from Order_Products op
group by OrderID order by OrderID;


insert into RegressionDataset2(OrderID, numOfReOrdered) 
select op.order_id OrderID, sum(op.reordered) numOfReOrdered from Order_Products op
group by OrderID order by OrderID;

select n.OrderID OrderID, o.order_dow dayOfTheWeek, o.order_hour_of_day hourOfTheDay, rd1.itemOnOrder itemOnOrder, 
n.numOfShort numOfShort,n.numOfNormal,n.numOfLong numOfLong,
c.numOfNoCorr numOfNoCorr,c.numOfWeak numOfWeak,c.numOfAverage numOfAverage,c.numOfStrong numOfStrong, 
rd2.numOfReOrdered numOfReOrdered
from RegressionDataset1 rd1,RegressionDataset2 rd2, orders o, ordernature n, orderDepCorr c
where n.orderid= c.orderid and n.orderid = o.Order_ID and n.orderid = rd1.orderid and n.orderid = rd2.orderid
and o.order_id = c.orderid and o.order_id = rd1.OrderID and o.order_id =rd2.orderid 
and c.orderid = rd1.orderid and c.orderid =rd2.orderid
and rd1.OrderID = rd2.orderid
group by OrderID order by OrderID;

