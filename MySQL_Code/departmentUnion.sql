create View test1 (OrderID, frozen, other) as
select e.OrderID OrderID, ifnull(c.amount, 0) frozen, ifnull(e.amount, 0) other from frozen c right JOIN other e on c.OrderID = e.OrderID
union
select c.OrderID OrderID, ifnull(c.amount, 0) frozen, ifnull(e.amount, 0) other from frozen c left JOIN other e on c.OrderID = e.OrderID;

create View test2 (OrderID, frozen, other, bakery) as
select fb.OrderID OrderID, ifnull(ce.frozen, 0) frozen, ifnull(ce.other, 0) other,  ifnull(fb.amount, 0) bakery from test1 ce right JOIN bakery fb on ce.OrderID = fb.OrderID
union
select ce.OrderID OrderID, ifnull(ce.frozen, 0) frozen, ifnull(ce.other, 0) other,  ifnull(fb.amount, 0) bakery from test1 ce left JOIN bakery fb on ce.OrderID = fb.OrderID;

create View departmentcorr1 (OrderID, frozen, other, bakery, produce) as
select bbp.OrderID OrderID, ifnull(cef.frozen, 0) frozen, ifnull(cef.other, 0) other,  ifnull(cef.bakery, 0) bakery,  ifnull(bbp.amount, 0) produce
from test2 cef right JOIN produce bbp on cef.OrderID = bbp.OrderID
union
select cef.OrderID OrderID, ifnull(cef.frozen, 0) frozen, ifnull(cef.other, 0) other,  ifnull(cef.bakery, 0) bakery ,  ifnull(bbp.amount, 0) produce
from test2 cef left JOIN produce bbp on cef.OrderID = bbp.OrderID;

create View test3 (OrderID, alcohol, international) as
select p.OrderID OrderID, ifnull(fj.amount, 0) alcohol, ifnull(p.amount, 0) international from alcohol fj right JOIN international p on fj.OrderID = p.OrderID
union
select fj.OrderID OrderID, ifnull(fj.amount, 0) alcohol, ifnull(p.amount, 0) international from alcohol fj left JOIN international p on fj.OrderID = p.OrderID;

create View test4 (OrderID, alcohol, international, beverages) as
select ff.OrderID OrderID, ifnull(fp.alcohol, 0) alcohol, ifnull(fp.international, 0) international,  ifnull(ff.amount, 0) beverages from test3 fp right JOIN beverages ff on fp.OrderID = ff.OrderID
union
select fp.OrderID OrderID, ifnull(fp.alcohol, 0) alcohol, ifnull(fp.international, 0) international,  ifnull(ff.amount, 0) beverages from test3 fp left JOIN beverages ff on fp.OrderID = ff.OrderID;

create View Group2 (OrderID, alcohol, international, beverages, pets) as
select g.OrderID OrderID, ifnull(fp.alcohol, 0) alcohol, ifnull(fp.international, 0) international,ifnull(fp.beverages, 0) beverages,  ifnull(g.amount, 0) pets from test4 fp right JOIN pets g on fp.OrderID = g.OrderID
union
select fp.OrderID OrderID, ifnull(fp.alcohol, 0) alcohol, ifnull(fp.international, 0) international,ifnull(fp.beverages, 0) beverages,  ifnull(g.amount, 0) pets from test4 fp left JOIN pets g on fp.OrderID = g.OrderID;

create View test5 (OrderID, dryGoodsPasta, bulk) as
select bb.OrderID OrderID, ifnull(b.amount, 0) dryGoodsPasta, ifnull(bb.amount, 0) bulk from dryGoodsPasta b right JOIN bulk bb on b.OrderID = bb.OrderID
union
select b.OrderID OrderID, ifnull(b.amount, 0) dryGoodsPasta, ifnull(bb.amount, 0) bulk from dryGoodsPasta b left JOIN bulk bb on b.OrderID = bb.OrderID;

create View test6 (OrderID, dryGoodsPasta, bulk, personalCare) as
select b.OrderID OrderID, ifnull(bb.dryGoodsPasta, 0) dryGoodsPasta, ifnull(bb.bulk, 0) bulk, ifnull(b.amount, 0) personalCare from test5 bb right JOIN personalCare b on bb.OrderID = b.OrderID
union
select bb.OrderID OrderID, ifnull(bb.dryGoodsPasta, 0) dryGoodsPasta, ifnull(bb.bulk, 0) bulk, ifnull(b.amount, 0) personalCare from test5 bb left JOIN personalCare b on bb.OrderID = b.OrderID;


create View Group3 (OrderID, dryGoodsPasta, bulk, personalCare,meatSeafood) as
select s.OrderID OrderID, ifnull(bb.dryGoodsPasta, 0) dryGoodsPasta, ifnull(bb.bulk, 0) bulk, ifnull(bb.personalCare, 0) personalCare, ifnull(s.amount, 0) meatSeafood
from test6 bb right JOIN meatSeafood s on bb.OrderID = s.OrderID
union
select bb.OrderID OrderID, ifnull(bb.dryGoodsPasta, 0) dryGoodsPasta, ifnull(bb.bulk, 0) bulk, ifnull(bb.personalCare, 0) personalCare, ifnull(s.amount, 0) meatSeafood
from test6 bb left JOIN meatSeafood s on bb.OrderID = s.OrderID;

create View test8 (OrderID, pantry, breakfast) as
select bb.OrderID OrderID, ifnull(b.amount, 0) pantry, ifnull(bb.amount, 0) breakfast from pantry b right JOIN breakfast bb on b.OrderID = bb.OrderID
union
select b.OrderID OrderID, ifnull(b.amount, 0) pantry, ifnull(bb.amount, 0) breakfast from pantry b left JOIN breakfast bb on b.OrderID = bb.OrderID;

create View test9 (OrderID, pantry, breakfast, cannedGoods) as
select b.OrderID OrderID, ifnull(bb.pantry, 0) pantry, ifnull(bb.breakfast, 0) breakfast, ifnull(b.amount, 0) cannedGoods from test8 bb right JOIN cannedGoods b on bb.OrderID = b.OrderID
union
select bb.OrderID OrderID, ifnull(bb.pantry, 0) pantry, ifnull(bb.breakfast, 0) breakfast, ifnull(b.amount, 0) cannedGoods from test8 bb left JOIN cannedGoods b on bb.OrderID = b.OrderID;


create View Group4 (OrderID, pantry, breakfast, cannedGoods,dairyEggs) as
select s.OrderID OrderID, ifnull(bb.pantry, 0) pantry, ifnull(bb.breakfast, 0) breakfast, ifnull(bb.cannedGoods, 0) cannedGoods, ifnull(s.amount, 0) dairyEggs
from test9 bb right JOIN dairyEggs s on bb.OrderID = s.OrderID
union
select bb.OrderID OrderID, ifnull(bb.pantry, 0) pantry, ifnull(bb.breakfast, 0) breakfast, ifnull(bb.cannedGoods, 0) cannedGoods, ifnull(s.amount, 0) dairyEggs
from test9 bb left JOIN dairyEggs s on bb.OrderID = s.OrderID;

create View test10 (OrderID, household, babies) as
select p.OrderID OrderID, ifnull(fj.amount, 0) household, ifnull(p.amount, 0) babies from household fj right JOIN babies p on fj.OrderID = p.OrderID
union
select fj.OrderID OrderID, ifnull(fj.amount, 0) household, ifnull(p.amount, 0) babies from household fj left JOIN babies p on fj.OrderID = p.OrderID;

create View test11 (OrderID, household, babies, snacks) as
select ff.OrderID OrderID, ifnull(fp.household, 0) household, ifnull(fp.babies, 0) babies,  ifnull(ff.amount, 0) snacks from test10 fp right JOIN snacks ff on fp.OrderID = ff.OrderID
union
select fp.OrderID OrderID, ifnull(fp.household, 0) household, ifnull(fp.babies, 0) babies,  ifnull(ff.amount, 0) snacks from test10 fp left JOIN snacks ff on fp.OrderID = ff.OrderID;

create View test12 (OrderID, household, babies, snacks, deli) as
select g.OrderID OrderID, ifnull(fp.household, 0) household, ifnull(fp.babies, 0) babies,ifnull(fp.snacks, 0) snacks,  ifnull(g.amount, 0) deli from test11 fp right JOIN deli g on fp.OrderID = g.OrderID
union
select fp.OrderID OrderID, ifnull(fp.household, 0) household, ifnull(fp.babies, 0) babies,ifnull(fp.snacks, 0) snacks,  ifnull(g.amount, 0) deli from test11 fp left JOIN deli g on fp.OrderID = g.OrderID;


create View Group5 (OrderID, household, babies, snacks, deli,missing ) as
select g.OrderID OrderID, ifnull(fp.household, 0) household, ifnull(fp.babies, 0) babies,ifnull(fp.snacks, 0) snacks,  ifnull(fp.deli, 0) deli, ifnull(g.amount, 0) missing from test12 fp right JOIN missing g on fp.OrderID = g.OrderID
union
select fp.OrderID OrderID, ifnull(fp.household, 0) household, ifnull(fp.babies, 0) babies,ifnull(fp.snacks, 0) snacks,  ifnull(fp.deli, 0) deli, ifnull(g.amount, 0) missing from test12 fp left JOIN missing g on fp.OrderID = g.OrderID;
