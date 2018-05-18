CREATE TABLE departmentCorr(
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
INTO TABLE departmentCorr
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';

LOAD DATA LOCAL INFILE '/Users/arridoarfiadi/Instacart_DataAnalytics/Regression Analysis/csv_files/natureOfOrders.csv'
INTO TABLE orderNature
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';

CREATE TABLE temp(
OrderID INT NOT NULL,
itemOnOrder INT NOT NULL,
numOfReOrdered INT NOT NULL,
Foreign Key (OrderID) references OrderIDTable (OrderID)
);

insert into temp(OrderID, itemOnOrder)
select op.order_id OrderID,   sum(op.product_id) itemOnOrder from Order_Products op
group by OrderID order by OrderID;


insert into temp(OrderID, numOfReOrdered) 
select op.order_id OrderID,   count(op.reordered) numOfReOrdered from Order_Products op
group by OrderID order by OrderID;
