CREATE TABLE departmentCorr(
OrderID INT NOT NULL ,
frozen INT  ,
other INT  ,
bakery INT  ,
produce INT  ,
alcohol INT  ,
international INT  ,
beverages INT  ,
pets INT  ,
dryGoodsPasta INT  ,
bulk INT  ,
personalCare INT  ,
meatSeafood INT  ,
pantry INT  ,
breakfast INT  ,
cannedGoods INT  ,
dairyEggs INT  ,
household INT  ,
babies INT  ,
snacks INT  ,
deli INT  ,
missing INT  ,
Foreign Key (OrderID) references OrderIDTable (OrderID)
);

insert into departmentCorr (OrderID, frozen)
select op.order_id OrderID,   sum(op.add_to_cart_order) Amount from Order_Products op, Products p
where op.product_id = p.product_id and
p.department_id in (select department_id from Departments where department_name like "frozen") group by OrderID order by OrderID;

insert into departmentCorr (OrderID, other)
select op.order_id OrderID,   sum(op.add_to_cart_order) Amount from Order_Products op, Products p
where op.product_id = p.product_id and
p.department_id in (select department_id from Departments where department_name like "other") group by OrderID order by OrderID;

insert into departmentCorr (OrderID, bakery)
select op.order_id OrderID,   sum(op.add_to_cart_order) Amount from Order_Products op, Products p
where op.product_id = p.product_id and
p.department_id in (select department_id from Departments where department_name like "bakery") group by OrderID order by OrderID;

insert into departmentCorr (OrderID, produce)
select op.order_id OrderID,   sum(op.add_to_cart_order) Amount from Order_Products op, Products p
where op.product_id = p.product_id and
p.department_id in (select department_id from Departments where department_name like "produce") group by OrderID order by OrderID;

insert into departmentCorr (OrderID, alcohol)
select op.order_id OrderID,   sum(op.add_to_cart_order) Amount from Order_Products op, Products p
where op.product_id = p.product_id and
p.department_id in (select department_id from Departments where department_name like "alcohol") group by OrderID order by OrderID;

insert into departmentCorr (OrderID, international)
select op.order_id OrderID,   sum(op.add_to_cart_order) Amount from Order_Products op, Products p
where op.product_id = p.product_id and
p.department_id in (select department_id from Departments where department_name like "international") group by OrderID order by OrderID;

insert into departmentCorr (OrderID, beverages)
select op.order_id OrderID,   sum(op.add_to_cart_order) Amount from Order_Products op, Products p
where op.product_id = p.product_id and
p.department_id in (select department_id from Departments where department_name like "beverages") group by OrderID order by OrderID;

insert into departmentCorr (OrderID, pets)
select op.order_id OrderID,   sum(op.add_to_cart_order) Amount from Order_Products op, Products p
where op.product_id = p.product_id and
p.department_id in (select department_id from Departments where department_name like "pets") group by OrderID order by OrderID;

insert into departmentCorr (OrderID, dryGoodsPasta)
select op.order_id OrderID,   sum(op.add_to_cart_order) Amount from Order_Products op, Products p
where op.product_id = p.product_id and
p.department_id in (select department_id from Departments where department_name like "dry goods pasta") group by OrderID order by OrderID;

insert into departmentCorr (OrderID, bulk)
select op.order_id OrderID,   sum(op.add_to_cart_order) Amount from Order_Products op, Products p
where op.product_id = p.product_id and
p.department_id in (select department_id from Departments where department_name like "bulk") group by OrderID order by OrderID;

insert into departmentCorr (OrderID, personalCare)
select op.order_id OrderID,   op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and
p.department_id in (select department_id from Departments where department_name like "personal care") group by OrderID order by OrderID;

insert into departmentCorr (OrderID, meatSeafood)
select op.order_id OrderID,   op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and
p.department_id in (select department_id from Departments where department_name like "meat seafood") group by OrderID order by OrderID;

insert into departmentCorr (OrderID, pantry)
select op.order_id OrderID,   sum(op.add_to_cart_order) Amount from Order_Products op, Products p
where op.product_id = p.product_id and
p.department_id in (select department_id from Departments where department_name like "pantry") group by OrderID order by OrderID;

insert into departmentCorr (OrderID, breakfast)
select op.order_id OrderID,   sum(op.add_to_cart_order) Amount from Order_Products op, Products p
where op.product_id = p.product_id and
p.department_id in (select department_id from Departments where department_name like "breakfast") group by OrderID order by OrderID;

insert into departmentCorr (OrderID, cannedGoods)
select op.order_id OrderID,   sum(op.add_to_cart_order) Amount from Order_Products op, Products p
where op.product_id = p.product_id and
p.department_id in (select department_id from Departments where department_name like "canned goods") group by OrderID order by OrderID;

insert into departmentCorr (OrderID, dairyEggs)
select op.order_id OrderID,   sum(op.add_to_cart_order) Amount from Order_Products op, Products p
where op.product_id = p.product_id and
p.department_id in (select department_id from Departments where department_name like "dairy eggs") group by OrderID order by OrderID;

insert into departmentCorr (OrderID, household)
select op.order_id OrderID,   sum(op.add_to_cart_order) Amount from Order_Products op, Products p
where op.product_id = p.product_id and
p.department_id in (select department_id from Departments where department_name like "household") group by OrderID order by OrderID;

insert into departmentCorr (OrderID, babies)
select op.order_id OrderID,   sum(op.add_to_cart_order) Amount from Order_Products op, Products p
where op.product_id = p.product_id and
p.department_id in (select department_id from Departments where department_name like "babies") group by OrderID order by OrderID;

insert into departmentCorr (OrderID, snacks)
select op.order_id OrderID,   sum(op.add_to_cart_order) Amount from Order_Products op, Products p
where op.product_id = p.product_id and
p.department_id in (select department_id from Departments where department_name like "snacks") group by OrderID order by OrderID;

insert into departmentCorr (OrderID, deli)
select op.order_id OrderID,   sum(op.add_to_cart_order) Amount from Order_Products op, Products p
where op.product_id = p.product_id and 
p.department_id in (select department_id from Departments where department_name like "deli") group by OrderID order by OrderID;

insert into departmentCorr (OrderID, missing)
select op.order_id OrderID,   sum(op.add_to_cart_order) Amount from Order_Products op, Products p
where op.product_id = p.product_id and
p.department_id in (select department_id from Departments where department_name like "missing") group by OrderID order by OrderID;


select g.orderid OrderID, ifnull(sum(distinct(g.frozen )),0),
ifnull(sum(distinct(g.other )),0), ifnull(sum(distinct(g.bakery )),0),
ifnull(sum(distinct(g.produce )),0), ifnull(sum(distinct(g.alcohol )),0),
ifnull(sum(distinct(g.international )),0), ifnull(sum(distinct(g.beverages )),0),
ifnull(sum(distinct(g.pets )),0), ifnull(sum(distinct(g.dryGoodsPasta )),0),
ifnull(sum(distinct(g.bulk )),0), ifnull(sum(distinct(g.personalCare )),0),
ifnull(sum(distinct(g.meatSeafood )),0), ifnull(sum(distinct(g.pantry )),0),
ifnull(sum(distinct(g.breakfast )),0), ifnull(sum(distinct(g.cannedGoods )),0),
ifnull(sum(distinct(g.dairyEggs )),0), ifnull(sum(distinct(g.household )),0),
ifnull(sum(distinct(g.babies )),0), ifnull(sum(distinct(g.snacks )),0),
ifnull(sum(distinct(g.deli )),0), ifnull(sum(distinct(g.missing )),0),
from departmentCorr g  group by OrderID order by OrderID;
