create View CerealMilk (OrderID, Cereal_Amount, Milk_Amount) as
select m.OrderID OrderID, ifnull(c.amount, 0) Cereal_Amount, ifnull(m.amount, 0) Milk_Amount from Cereal c right JOIN Milk m on c.OrderID = m.OrderID
union
select c.OrderID OrderID, ifnull(c.amount, 0) Cereal_Amount, ifnull(m.amount, 0) Milk_Amount from Cereal c left JOIN Milk m on c.OrderID = m.OrderID;

create View CerealMilkYogurt (OrderID, Cereal_Amount, Milk_Amount, Yogurt_Amount) as
select y.OrderID OrderID, ifnull(cm.Cereal_Amount, 0) Cereal_Amount, ifnull(cm.Milk_Amount, 0) Milk_Amount, ifnull(y.amount, 0) Yogurt_Amount
from CerealMilk cm right JOIN Yogurt y on cm.OrderID = y.OrderID
union
select cm.OrderID OrderID, ifnull(cm.Cereal_Amount, 0) Cereal_Amount, ifnull(cm.Milk_Amount, 0) Milk_Amount, ifnull(y.amount, 0) Yogurt_Amount
from CerealMilk cm left JOIN Yogurt y on cm.OrderID = y.OrderID;

create view breakfastCorr (OrderID,Cereal_Amount,Milk_Amount,Yogurt_Amount, Juice_Amount) as
select j.OrderID OrderID, ifnull(cmy.Cereal_Amount, 0) Cereal_Amount, ifnull(cmy.Milk_Amount, 0) Milk_Amount, ifnull(cmy.Yogurt_Amount, 0) Yogurt_Amount,  ifnull(j.amount, 0) Juice_Amount
from CerealMilkYogurt cmy right JOIN Juice j on cmy.OrderID = j.OrderID
union
select cmy.OrderID OrderID, ifnull(cmy.Cereal_Amount, 0) Cereal_Amount, ifnull(cmy.Milk_Amount, 0) Milk_Amount, ifnull(cmy.Yogurt_Amount, 0) Yogurt_Amount,  ifnull(j.amount, 0) Juice_Amount
from CerealMilkYogurt cmy left JOIN Juice j on cmy.OrderID = j.OrderID

create View BreadBBakery (OrderID, Bread, BBakery) as
select bb.OrderID OrderID, ifnull(b.amount, 0) Bread, ifnull(bb.amount, 0) BBakery from Bread b right JOIN BreakfastBakery bb on b.OrderID = bb.OrderID
union
select b.OrderID OrderID, ifnull(b.amount, 0) Bread, ifnull(bb.amount, 0) BBakery from Bread b left JOIN BreakfastBakery bb on b.OrderID = bb.OrderID;

create View BreadBBakeryButter (OrderID, Bread, BBakery, Butter) as
select b.OrderID OrderID, ifnull(bb.Bread, 0) Bread, ifnull(bb.BBakery, 0) BBakery, ifnull(b.amount, 0) Butter from BreadBBakery bb right JOIN Butter b on bb.OrderID = b.OrderID
union
select bb.OrderID OrderID, ifnull(bb.Bread, 0) Bread, ifnull(bb.BBakery, 0) BBakery, ifnull(b.amount, 0) Butter from BreadBBakery bb left JOIN Butter b on bb.OrderID = b.OrderID;


create View BreadBBakeryButterSpreads (OrderID, Bread, BBakery, Butter,Spreads) as
select s.OrderID OrderID, ifnull(bb.Bread, 0) Bread, ifnull(bb.BBakery, 0) BBakery, ifnull(bb.Butter, 0) Butter, ifnull(s.amount, 0) Spreads
from BreadBBakeryButter bb right JOIN Spreads s on bb.OrderID = s.OrderID
union
select bb.OrderID OrderID, ifnull(bb.Bread, 0) Bread, ifnull(bb.BBakery, 0) BBakery, ifnull(bb.Butter, 0) Butter, ifnull(s.amount, 0) Spreads
from BreadBBakeryButter bb left JOIN Spreads s on bb.OrderID = s.OrderID;

create View CoffeeEggs (OrderID, Coffee, Eggs) as
select e.OrderID OrderID, ifnull(c.amount, 0) Coffee, ifnull(e.amount, 0) Eggs from Coffee c right JOIN Eggs e on c.OrderID = e.OrderID
union
select c.OrderID OrderID, ifnull(c.amount, 0) Coffee, ifnull(e.amount, 0) Eggs from Coffee c left JOIN Eggs e on c.OrderID = e.OrderID;

create View CoffeeEggsFrozenB (OrderID, Coffee, Eggs, FrozenB) as
select fb.OrderID OrderID, ifnull(ce.Coffee, 0) Coffee, ifnull(ce.Eggs, 0) Eggs,  ifnull(fb.amount, 0) FrozenB from CoffeeEggs ce right JOIN FrozenBreakfast fb on ce.OrderID = fb.OrderID
union
select ce.OrderID OrderID, ifnull(ce.Coffee, 0) Coffee, ifnull(ce.Eggs, 0) Eggs,  ifnull(fb.amount, 0) FrozenB from CoffeeEggs ce left JOIN FrozenBreakfast fb on ce.OrderID = fb.OrderID;

create View breakfastcorr3 (OrderID, Coffee, Eggs, FrozenB, BBarsPastries) as
select bbp.OrderID OrderID, ifnull(cef.Coffee, 0) Coffee, ifnull(cef.Eggs, 0) Eggs,  ifnull(cef.FrozenB, 0) FrozenB,  ifnull(bbp.amount, 0) BBarsPastries
from CoffeeEggsFrozenB cef right JOIN BreakfastBarsPastries bbp on cef.OrderID = bbp.OrderID
union
select cef.OrderID OrderID, ifnull(cef.Coffee, 0) Coffee, ifnull(cef.Eggs, 0) Eggs,  ifnull(cef.FrozenB, 0) FrozenB ,  ifnull(bbp.amount, 0) BBarsPastries
from CoffeeEggsFrozenB cef left JOIN BreakfastBarsPastries bbp on cef.OrderID = bbp.OrderID;

create View FJuiceProtein (OrderID, FrozenJuice, Protein) as
select p.OrderID OrderID, ifnull(fj.amount, 0) FrozenJuice, ifnull(p.amount, 0) Protein from FrozenJuice fj right JOIN proteinmealreplacement p on fj.OrderID = p.OrderID
union
select fj.OrderID OrderID, ifnull(fj.amount, 0) FrozenJuice, ifnull(p.amount, 0) Protein from FrozenJuice fj left JOIN proteinmealreplacement p on fj.OrderID = p.OrderID;

create View FJuiceProteinFruits (OrderID, FrozenJuice, Protein, Fruits) as
select ff.OrderID OrderID, ifnull(fp.FrozenJuice, 0) FrozenJuice, ifnull(fp.Protein, 0) Protein,  ifnull(ff.amount, 0) Fruits from FJuiceProtein fp right JOIN FreshFuice ff on fp.OrderID = ff.OrderID
union
select fp.OrderID OrderID, ifnull(fp.FrozenJuice, 0) FrozenJuice, ifnull(fp.Protein, 0) Protein,  ifnull(ff.amount, 0) Fruits from FJuiceProtein fp left JOIN FreshFuice ff on fp.OrderID = ff.OrderID;

create View breakfastcorr4 (OrderID, FrozenJuice, Protein, Fruits, Granola) as
select g.OrderID OrderID, ifnull(fp.FrozenJuice, 0) FrozenJuice, ifnull(fp.Protein, 0) Protein,ifnull(fp.Fruits, 0) Fruits,  ifnull(g.amount, 0) Granola from FJuiceProteinFruits fp right JOIN Granola g on fp.OrderID = g.OrderID
union
select fp.OrderID OrderID, ifnull(fp.FrozenJuice, 0) FrozenJuice, ifnull(fp.Protein, 0) Protein,ifnull(fp.Fruits, 0) Fruits,  ifnull(g.amount, 0) Granola from FJuiceProteinFruits fp left JOIN Granola g on fp.OrderID = g.OrderID;

create view breakfastCombine1 (OrderID,Cereal,Milk,Yogurt, Juice,Bread, BBakery,Butter, Spreads) as
select bc2.OrderID OrderID, ifnull(bc1.Cereal_Amount, 0) Cereal, ifnull(bc1.Milk_Amount, 0) Milk, ifnull(bc1.Yogurt_Amount, 0) Yogurt,  ifnull(bc1.Juice_Amount, 0) Juice,
ifnull(bc2.Bread, 0) Bread, ifnull(bc2.BBakery, 0) BBakery, ifnull(bc2.Butter, 0) Butter,  ifnull(bc2.Spreads, 0) Spreads
from breakfastcorr bc1 right JOIN breadbbakerybutterspreads bc2 on bc1.OrderID = bc2.OrderID
union
select bc1.OrderID OrderID, ifnull(bc1.Cereal_Amount, 0) Cereal, ifnull(bc1.Milk_Amount, 0) Milk, ifnull(bc1.Yogurt_Amount, 0) Yogurt,  ifnull(bc1.Juice_Amount, 0) Juice,
ifnull(bc2.Bread, 0) Bread, ifnull(bc2.BBakery, 0) BBakery, ifnull(bc2.Butter, 0) Butter,  ifnull(bc2.Spreads, 0) Spreads
from breakfastcorr bc1 left JOIN breadbbakerybutterspreads bc2 on bc1.OrderID = bc2.OrderID;

create View extra1 (OrderID, OatmealPancakes, syruphoney) as
select p.OrderID OrderID, ifnull(fj.amount, 0) OatmealPancakes, ifnull(p.amount, 0) SyrupHoney from oatmealPancakes fj right JOIN syruphoney p on fj.OrderID = p.OrderID
union
select fj.OrderID OrderID, ifnull(fj.amount, 0) OatmealPancakes, ifnull(p.amount, 0) SyrupHoney from OatmealPancakes fj left JOIN syruphoney p on fj.OrderID = p.OrderID;

create View extra2 (OrderID, OatmealPancakes, SyrupHoney, GranolaBars) as
select ff.OrderID OrderID, ifnull(fp.OatmealPancakes, 0) OatmealPancakes, ifnull(fp.SyrupHoney, 0) SyrupHoney,  ifnull(ff.amount, 0) GranolaBars from extra1 fp right JOIN GranolaBars ff on fp.OrderID = ff.OrderID
union
select fp.OrderID OrderID, ifnull(fp.OatmealPancakes, 0) OatmealPancakes, ifnull(fp.SyrupHoney, 0) SyrupHoney,  ifnull(ff.amount, 0) GranolaBars from extra1 fp left JOIN GranolaBars ff on fp.OrderID = ff.OrderID;

create View extra3 (OrderID, OatmealPancakes, SyrupHoney, GranolaBars, NutsSeeds) as
select g.OrderID OrderID, ifnull(fp.OatmealPancakes, 0) OatmealPancakes, ifnull(fp.SyrupHoney, 0) SyrupHoney,ifnull(fp.GranolaBars, 0) GranolaBars,  ifnull(g.amount, 0) NutsSeeds from extra2 fp right JOIN NutsSeeds g on fp.OrderID = g.OrderID
union
select fp.OrderID OrderID, ifnull(fp.OatmealPancakes, 0) OatmealPancakes, ifnull(fp.SyrupHoney, 0) SyrupHoney,ifnull(fp.GranolaBars, 0) GranolaBars,  ifnull(g.amount, 0) NutsSeeds from extra2 fp left JOIN NutsSeeds g on fp.OrderID = g.OrderID;

create View CreamersCreamCheese (OrderID, Creamers, CreamCheese) as
select bb.OrderID OrderID, ifnull(b.amount, 0) Creamers, ifnull(bb.amount, 0) CreamCheese from Creamers b right JOIN CreamCheese bb on b.OrderID = bb.OrderID
union
select b.OrderID OrderID, ifnull(b.amount, 0) Creamers, ifnull(bb.amount, 0) CreamCheese from Creamers b left JOIN CreamCheese bb on b.OrderID = bb.OrderID;

create View CreamersCreamCheeseTea (OrderID, Creamers, CreamCheese, Tea) as
select b.OrderID OrderID, ifnull(bb.Creamers, 0) Creamers, ifnull(bb.CreamCheese, 0) CreamCheese, ifnull(b.amount, 0) Tea from CreamersCreamCheese bb right JOIN Tea b on bb.OrderID = b.OrderID
union
select bb.OrderID OrderID, ifnull(bb.Creamers, 0) Creamers, ifnull(bb.CreamCheese, 0) CreamCheese, ifnull(b.amount, 0) Tea from CreamersCreamCheese bb left JOIN Tea b on bb.OrderID = b.OrderID;

create View BaconSausageLactoseFree (OrderID, BaconSausage, LactoseFree) as
select e.OrderID OrderID, ifnull(c.amount, 0) BaconSausage, ifnull(e.amount, 0) LactoseFree from BaconSausage c right JOIN LactoseFree e on c.OrderID = e.OrderID
union
select c.OrderID OrderID, ifnull(c.amount, 0) BaconSausage, ifnull(e.amount, 0) LactoseFree from BaconSausage c left JOIN LactoseFree e on c.OrderID = e.OrderID;
