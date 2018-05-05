create View test1 (OrderID, CookieCakes, BakeryDesserts) as
select bb.OrderID OrderID, ifnull(b.amount, 0) CookieCakes, ifnull(bb.amount, 0) BakeryDesserts from CookieCakes b right JOIN BakeryDesserts bb on b.OrderID = bb.OrderID
union
select b.OrderID OrderID, ifnull(b.amount, 0) CookieCakes, ifnull(bb.amount, 0) BakeryDesserts from CookieCakes b left JOIN BakeryDesserts bb on b.OrderID = bb.OrderID;

create View test2 (OrderID, CookieCakes, BakeryDesserts, PuddingDesserts) as
select b.OrderID OrderID, ifnull(bb.CookieCakes, 0) CookieCakes, ifnull(bb.BakeryDesserts, 0) BakeryDesserts, ifnull(b.amount, 0) PuddingDesserts from test1 bb right JOIN PuddingDesserts b on bb.OrderID = b.OrderID
union
select bb.OrderID OrderID, ifnull(bb.CookieCakes, 0) CookieCakes, ifnull(bb.BakeryDesserts, 0) BakeryDesserts, ifnull(b.amount, 0) PuddingDesserts from test1 bb left JOIN PuddingDesserts b on bb.OrderID = b.OrderID;


create View Group1 (OrderID, CookieCakes, BakeryDesserts, PuddingDesserts,CandyChocolates) as
select s.OrderID OrderID, ifnull(bb.CookieCakes, 0) CookieCakes, ifnull(bb.BakeryDesserts, 0) BakeryDesserts, ifnull(bb.PuddingDesserts, 0) PuddingDesserts, ifnull(s.amount, 0) CandyChocolates
from CookieCakesBakeryDessertsPuddingDesserts bb right JOIN CandyChocolates s on bb.OrderID = s.OrderID
union
select bb.OrderID OrderID, ifnull(bb.CookieCakes, 0) CookieCakes, ifnull(bb.BakeryDesserts, 0) BakeryDesserts, ifnull(bb.PuddingDesserts, 0) PuddingDesserts, ifnull(s.amount, 0) CandyChocolates
from test2 bb left JOIN CandyChocolates s on bb.OrderID = s.OrderID;

create View test3 (OrderID, AppetizersSides, FrozenPizza) as
select p.OrderID OrderID, ifnull(fj.amount, 0) AppetizersSides, ifnull(p.amount, 0) FrozenPizza from AppetizersSides fj right JOIN FrozenPizza p on fj.OrderID = p.OrderID
union
select fj.OrderID OrderID, ifnull(fj.amount, 0) AppetizersSides, ifnull(p.amount, 0) FrozenPizza from AppetizersSides fj left JOIN FrozenPizza p on fj.OrderID = p.OrderID;

create View test4 (OrderID, AppetizersSides, FrozenPizza, PreparedMeals) as
select ff.OrderID OrderID, ifnull(fp.AppetizersSides, 0) AppetizersSides, ifnull(fp.FrozenPizza, 0) FrozenPizza,  ifnull(ff.amount, 0) PreparedMeals from test1 fp right JOIN PreparedMeals ff on fp.OrderID = ff.OrderID
union
select fp.OrderID OrderID, ifnull(fp.AppetizersSides, 0) AppetizersSides, ifnull(fp.FrozenPizza, 0) FrozenPizza,  ifnull(ff.amount, 0) PreparedMeals from test1 fp left JOIN PreparedMeals ff on fp.OrderID = ff.OrderID;

create View Group2 (OrderID, AppetizersSides, FrozenPizza, PreparedMeals, SoupsSalads) as
select g.OrderID OrderID, ifnull(fp.AppetizersSides, 0) AppetizersSides, ifnull(fp.FrozenPizza, 0) FrozenPizza,ifnull(fp.PreparedMeals, 0) PreparedMeals,  ifnull(g.amount, 0) SoupsSalads from test2 fp right JOIN SoupsSalads g on fp.OrderID = g.OrderID
union
select fp.OrderID OrderID, ifnull(fp.AppetizersSides, 0) AppetizersSides, ifnull(fp.FrozenPizza, 0) FrozenPizza,ifnull(fp.PreparedMeals, 0) PreparedMeals,  ifnull(g.amount, 0) SoupsSalads from test2 fp left JOIN SoupsSalads g on fp.OrderID = g.OrderID;

create View test5 (OrderID, ChipsPretzels, Crackers) as
select p.OrderID OrderID, ifnull(fj.amount, 0) ChipsPretzels, ifnull(p.amount, 0) Crackers from ChipsPretzels fj right JOIN Crackers p on fj.OrderID = p.OrderID
union
select fj.OrderID OrderID, ifnull(fj.amount, 0) ChipsPretzels, ifnull(p.amount, 0) Crackers from ChipsPretzels fj left JOIN Crackers p on fj.OrderID = p.OrderID;

create View test6 (OrderID, ChipsPretzels, Crackers, PopcornJerky) as
select ff.OrderID OrderID, ifnull(fp.ChipsPretzels, 0) ChipsPretzels, ifnull(fp.Crackers, 0) Crackers,  ifnull(ff.amount, 0) PopcornJerky from test5 fp right JOIN PopcornJerky ff on fp.OrderID = ff.OrderID
union
select fp.OrderID OrderID, ifnull(fp.ChipsPretzels, 0) ChipsPretzels, ifnull(fp.Crackers, 0) Crackers,  ifnull(ff.amount, 0) PopcornJerky from test5 fp left JOIN PopcornJerky ff on fp.OrderID = ff.OrderID;

create View test7 (OrderID, ChipsPretzels, Crackers, PopcornJerky, DipsTapenades) as
select g.OrderID OrderID, ifnull(fp.ChipsPretzels, 0) ChipsPretzels, ifnull(fp.Crackers, 0) Crackers,ifnull(fp.PopcornJerky, 0) PopcornJerky,  ifnull(g.amount, 0) DipsTapenades from test6 fp right JOIN DipsTapenades g on fp.OrderID = g.OrderID
union
select fp.OrderID OrderID, ifnull(fp.ChipsPretzels, 0) ChipsPretzels, ifnull(fp.Crackers, 0) Crackers,ifnull(fp.PopcornJerky, 0) PopcornJerky,  ifnull(g.amount, 0) DipsTapenades from test6 fp left JOIN DipsTapenades g on fp.OrderID = g.OrderID;


create View Group3 (OrderID, ChipsPretzels, Crackers, PopcornJerky, DipsTapenades,DipsSpreads ) as
select g.OrderID OrderID, ifnull(fp.ChipsPretzels, 0) ChipsPretzels, ifnull(fp.Crackers, 0) Crackers,ifnull(fp.PopcornJerky, 0) PopcornJerky,  ifnull(fp.DipsTapenades, 0) DipsTapenades, ifnull(g.amount, 0) DipsSpreads from test7 fp right JOIN DipsSpreads g on fp.OrderID = g.OrderID
union
select fp.OrderID OrderID, ifnull(fp.ChipsPretzels, 0) ChipsPretzels, ifnull(fp.Crackers, 0) Crackers,ifnull(fp.PopcornJerky, 0) PopcornJerky,  ifnull(fp.DipsTapenades, 0) DipsTapenades, ifnull(g.amount, 0) DipsSpreads from test7 fp left JOIN DipsSpreads g on fp.OrderID = g.OrderID;

create View test8 (OrderID, Tableware, Condiments) as
select bb.OrderID OrderID, ifnull(b.amount, 0) Tableware, ifnull(bb.amount, 0) Condiments from Tableware b right JOIN Condiments bb on b.OrderID = bb.OrderID
union
select b.OrderID OrderID, ifnull(b.amount, 0) Tableware, ifnull(bb.amount, 0) Condiments from Tableware b left JOIN Condiments bb on b.OrderID = bb.OrderID;

create View test9 (OrderID, Tableware, Condiments, BunsRolls) as
select b.OrderID OrderID, ifnull(bb.Tableware, 0) Tableware, ifnull(bb.Condiments, 0) Condiments, ifnull(b.amount, 0) BunsRolls from test8 bb right JOIN BunsRolls b on bb.OrderID = b.OrderID
union
select bb.OrderID OrderID, ifnull(bb.Tableware, 0) Tableware, ifnull(bb.Condiments, 0) Condiments, ifnull(b.amount, 0) BunsRolls from test8 bb left JOIN BunsRolls b on bb.OrderID = b.OrderID;


create View Group4 (OrderID, Tableware, Condiments, BunsRolls,SpecialtyCheeses) as
select s.OrderID OrderID, ifnull(bb.Tableware, 0) Tableware, ifnull(bb.Condiments, 0) Condiments, ifnull(bb.BunsRolls, 0) BunsRolls, ifnull(s.amount, 0) SpecialtyCheeses
from test9 bb right JOIN SpecialtyCheeses s on bb.OrderID = s.OrderID
union
select bb.OrderID OrderID, ifnull(bb.Tableware, 0) Tableware, ifnull(bb.Condiments, 0) Condiments, ifnull(bb.BunsRolls, 0) BunsRolls, ifnull(s.amount, 0) SpecialtyCheeses
from test9 bb left JOIN SpecialtyCheeses s on bb.OrderID = s.OrderID;

create View test10 (OrderID, WinesChampagnes, BeersCoolers) as
select e.OrderID OrderID, ifnull(c.amount, 0) WinesChampagnes, ifnull(e.amount, 0) BeersCoolers from WinesChampagnes c right JOIN BeersCoolers e on c.OrderID = e.OrderID
union
select c.OrderID OrderID, ifnull(c.amount, 0) WinesChampagnes, ifnull(e.amount, 0) BeersCoolers from WinesChampagnes c left JOIN BeersCoolers e on c.OrderID = e.OrderID;

create View test11 (OrderID, WinesChampagnes, BeersCoolers, Spirits) as
select fb.OrderID OrderID, ifnull(ce.WinesChampagnes, 0) WinesChampagnes, ifnull(ce.BeersCoolers, 0) BeersCoolers,  ifnull(fb.amount, 0) Spirits from test10 ce right JOIN Spirits fb on ce.OrderID = fb.OrderID
union
select ce.OrderID OrderID, ifnull(ce.WinesChampagnes, 0) WinesChampagnes, ifnull(ce.BeersCoolers, 0) BeersCoolers,  ifnull(fb.amount, 0) Spirits from test10 ce left JOIN Spirits fb on ce.OrderID = fb.OrderID;

create View group5 (OrderID, WinesChampagnes, BeersCoolers, Spirits, RedWines) as
select bbp.OrderID OrderID, ifnull(cef.WinesChampagnes, 0) WinesChampagnes, ifnull(cef.BeersCoolers, 0) BeersCoolers,  ifnull(cef.Spirits, 0) Spirits,  ifnull(bbp.amount, 0) RedWines
from test11 cef right JOIN RedWines bbp on cef.OrderID = bbp.OrderID
union
select cef.OrderID OrderID, ifnull(cef.WinesChampagnes, 0) WinesChampagnes, ifnull(cef.BeersCoolers, 0) BeersCoolers,  ifnull(cef.Spirits, 0) Spirits ,  ifnull(bbp.amount, 0) RedWines
from test11 cef left JOIN RedWines bbp on cef.OrderID = bbp.OrderID;

create View test12 (OrderID, DrinkMixes, SoftDrinks) as
select bb.OrderID OrderID, ifnull(b.amount, 0) DrinkMixes, ifnull(bb.amount, 0) SoftDrinks from DrinkMixes b right JOIN SoftDrinks bb on b.OrderID = bb.OrderID
union
select b.OrderID OrderID, ifnull(b.amount, 0) DrinkMixes, ifnull(bb.amount, 0) SoftDrinks from DrinkMixes b left JOIN SoftDrinks bb on b.OrderID = bb.OrderID;

create View group6 (OrderID, DrinkMixes, SoftDrinks, Juice) as
select b.OrderID OrderID, ifnull(bb.DrinkMixes, 0) DrinkMixes, ifnull(bb.SoftDrinks, 0) SoftDrinks, ifnull(b.amount, 0) Juice from test12 bb right JOIN Juice b on bb.OrderID = b.OrderID
union
select bb.OrderID OrderID, ifnull(bb.DrinkMixes, 0) DrinkMixes, ifnull(bb.SoftDrinks, 0) SoftDrinks, ifnull(b.amount, 0) Juice from test12 bb left JOIN Juice b on bb.OrderID = b.OrderID;
