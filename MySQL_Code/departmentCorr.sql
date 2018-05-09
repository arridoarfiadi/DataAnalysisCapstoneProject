create view frozen (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.department_id in (select department_id from Departments where department_name like "frozen");

create view other (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.department_id in (select department_id from Departments where department_name like "other");

create view bakery (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.department_id in (select department_id from Departments where department_name like "bakery");

create view produce (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.department_id in (select department_id from Departments where department_name like "produce");

create view alcohol (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.department_id in (select department_id from Departments where department_name like "alcohol");

create view international (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.department_id in (select department_id from Departments where department_name like "international");

create view beverages (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.department_id in (select department_id from Departments where department_name like "beverages");


create view pets (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.department_id in (select department_id from Departments where department_name like "pets");

create view dryGoodsPasta (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.department_id in (select department_id from Departments where department_name like "dry goods pasta");

create view bulk (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.department_id in (select department_id from Departments where department_name like "bulk");

create view personalCare (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.department_id in (select department_id from Departments where department_name like "personal care");

create view meatSeafood (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.department_id in (select department_id from Departments where department_name like "meat seafood");

create view pantry (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.department_id in (select department_id from Departments where department_name like "pantry");

create view breakfast (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.department_id in (select department_id from Departments where department_name like "breakfast");

create view cannedGoods (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.department_id in (select department_id from Departments where department_name like "canned goods");

create view dairyEggs (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.department_id in (select department_id from Departments where department_name like "dairy eggs");

create view household (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.department_id in (select department_id from Departments where department_name like "household");

create view babies (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.department_id in (select department_id from Departments where department_name like "babies");

create view snacks (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.department_id in (select department_id from Departments where department_name like "snacks");

create view deli (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.department_id in (select department_id from Departments where department_name like "deli");

create view missing (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.department_id in (select department_id from Departments where department_name like "missing");
