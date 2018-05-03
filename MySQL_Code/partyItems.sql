create view BakeryDesserts (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.aisle_id in (select aisle_id from Aisles where aisle_name like "Bakery De%");

create view BeersCoolers (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.aisle_id in (select aisle_id from Aisles where aisle_name like "Beers Coolers");

create view BunsRolls (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.aisle_id in (select aisle_id from Aisles where aisle_name like "Buns Rolls");

create view ChipsPretzels (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.aisle_id in (select aisle_id from Aisles where aisle_name like "Chips Pretzels%");

create view Condiments (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.aisle_id in (select aisle_id from Aisles where aisle_name like "Condiments");

create view CookieCakes (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.aisle_id in (select aisle_id from Aisles where aisle_name like "Cookies Cakes%");

create view Crackers (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.aisle_id in (select aisle_id from Aisles where aisle_name like "Crackers");

create view DipsTapenades (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.aisle_id in (select aisle_id from Aisles where aisle_name like "Fresh Dips Tapenades");

create view AppetizersSides (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.aisle_id in (select aisle_id from Aisles where aisle_name like "Frozen Appe%");

create view FrozenPizza (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.aisle_id in (select aisle_id from Aisles where aisle_name like "Frozen Pizza");

create view IceCream  (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.aisle_id in (select aisle_id from Aisles where aisle_name like "Ice Cream Ice");

create view IceCreamToppings (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.aisle_id in (select aisle_id from Aisles where aisle_name like "Ice Cream Toppings");

create view Juice (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.aisle_id in (select aisle_id from Aisles where aisle_name like "Juice Nectars");

create view PopcornJerky (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.aisle_id in (select aisle_id from Aisles where aisle_name like "Popcorn Jerky");

create view PreparedMeals (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.aisle_id in (select aisle_id from Aisles where aisle_name like "Prepared Meals");

create view SoupsSalads (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.aisle_id in (select aisle_id from Aisles where aisle_name like "Prepared Soups Salads");

create view DipsSpreads (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.aisle_id in (select aisle_id from Aisles where aisle_name like "Preserved Dips Spreads");

create view RedWines (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.aisle_id in (select aisle_id from Aisles where aisle_name like "Red Wines");

create view SoftDrinks (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.aisle_id in (select aisle_id from Aisles where aisle_name like "Soft Drinks");

create view RefrigeratedItems (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.aisle_id in (select aisle_id from Aisles where aisle_name like "Refrigerated");

create view Spirits (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.aisle_id in (select aisle_id from Aisles where aisle_name like "Spirits");

create view CandyChocolates (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.aisle_id in (select aisle_id from Aisles where aisle_name like "Candy Chocolate");

create view DrinkMixes (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.aisle_id in (select aisle_id from Aisles where aisle_name like "cocoa drink mixes");

create view PuddingDesserts (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.aisle_id in (select aisle_id from Aisles where aisle_name like "refrigerated pudd%");

create view WinesChampagnes (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.aisle_id in (select aisle_id from Aisles where aisle_name like "specialty Wines Champagnes");

create view SpecialtyCheeses (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.aisle_id in (select aisle_id from Aisles where aisle_name like "Specialty Cheeses");

create view Tableware (OrderID, Product, Amount) as
select op.order_id OrderID, p.product_name Product, op.add_to_cart_order Amount from Order_Products op, Products p
where op.product_id = p.product_id and p.aisle_id in (select aisle_id from Aisles where aisle_name like "plates bowls cups flatware");
