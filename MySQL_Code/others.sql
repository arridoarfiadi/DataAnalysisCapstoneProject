

select a.aisle_name Aisles, sum(op.add_to_cart_order) Amounts
from Order_Products op, Aisles a, Products p
where op.product_id = p.product_id and p.aisle_id = a.aisle_id
group by a.aisle_name
order by op.add_to_cart_order DESC

select p.product_name Product, sum(op.add_to_cart_order) Amounts, d.departmen_name
from Order_Products op, Deparment d, Products p
where op.product_id = p.product_id and p.department_id = d.department_id;

select sum(itemsPerOrder.numItems)/count(o.order_id) AverageItem from Orders o, (
select op.order_id OrderID, count(op.product_id) numItems from Order_Products op group by op.order_id) as itemsPerOrder
where itemsPerOrder.OrderID = o.order_id;
