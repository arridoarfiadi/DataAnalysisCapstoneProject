SELECT c1.OrderID, ifnull(sum(c1.Cereal),0), ifnull(sum(c1.Milk),0), ifnull(sum(c1.Yogurt),0), ifnull(sum(c1.Juice),0),ifnull(sum(c2.Bread),0),ifnull(sum(c2.BBakery),0),
ifnull(sum(c2.Butter),0),ifnull(sum(c2.Spreads) ,0) 
FROM breakfastcorr1 c1 left join breakfastcorr2 c2 on c1.OrderID = c2.OrderID group by OrderID
union 
SELECT c2.OrderID, ifnull(sum(c1.Cereal),0), ifnull(sum(c1.Milk),0), ifnull(sum(c1.Yogurt),0), ifnull(sum(c1.Juice),0),ifnull(sum(c2.Bread),0),ifnull(sum(c2.BBakery),0),
ifnull(sum(c2.Butter),0),ifnull(sum(c2.Spreads) ,0) 
FROM breakfastcorr1 c1 right join breakfastcorr2 c2 on c1.OrderID = c2.OrderID group by OrderID;