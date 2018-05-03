create view Bread (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.aisle_id in (select aisle_id from Aisles where aisle_name like "bread");

create view BreakfastBakery (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.aisle_id in (select aisle_id from Aisles where aisle_name like "breakfast bakery");

create view Butter (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.aisle_id in (select aisle_id from Aisles where aisle_name like "butter");

create view Spreads (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.aisle_id in (select aisle_id from Aisles where aisle_name like "spreads");

create view Coffee (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.aisle_id in (select aisle_id from Aisles where aisle_name like "coffee");

create view Eggs (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.aisle_id in (select aisle_id from Aisles where aisle_name like "eggs");

create view FrozenBreakfast (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.aisle_id in (select aisle_id from Aisles where aisle_name like "frozen breakfast");

create view BreakfastBarsPastries (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.aisle_id in (select aisle_id from Aisles where aisle_name like "breakfast bars pastries");

create view FrozenJuice (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.aisle_id in (select aisle_id from Aisles where aisle_name like "frozen juice");

create view ProteinMealReplacement (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.aisle_id in (select aisle_id from Aisles where aisle_name like "protein meal replacements");

create view FreshFruits (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.aisle_id in (select aisle_id from Aisles where aisle_name like "fresh fruits");

create view Granola (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.aisle_id in (select aisle_id from Aisles where aisle_name like "granola");

create view Milk (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.aisle_id in (select aisle_id from Aisles where aisle_name like "milk");

create view Cereal (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.aisle_id in (select aisle_id from Aisles where aisle_name like "cereal");

create view Yogurt (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.aisle_id in (select aisle_id from Aisles where aisle_name like "yogurt");

create view Juice (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.aisle_id in (select aisle_id from Aisles where aisle_name like "Juice Nectars");


create view OatmealPancakes (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.aisle_id in (select aisle_id from Aisles where aisle_name like "hot cereal%");

create view SyrupHoney (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.aisle_id in (select aisle_id from Aisles where aisle_name like "honeys%");

create view GranolaBars (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.aisle_id in (select aisle_id from Aisles where aisle_name like "energy granola%");

create view NutsSeeds (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.aisle_id in (select aisle_id from Aisles where aisle_name like "nuts seeds%");

create view BaconSausage (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.aisle_id in (select aisle_id from Aisles where aisle_name like "hot dogs%");

create view LactoseFree (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.aisle_id in (select aisle_id from Aisles where aisle_name like "soy lactosefree");


create view Creamers (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.aisle_id in (select aisle_id from Aisles where aisle_name like "cream");

create view Tea (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.aisle_id in (select aisle_id from Aisles where aisle_name like "Tea");
