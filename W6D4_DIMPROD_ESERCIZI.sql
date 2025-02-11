SHOW DATABASES;
USE AdventureWorksDW;
SHOW TABLES;
SELECT*FROM dimproduct;
SELECT*FROM dimproductsubcategory;
SELECT*FROM dimproductcategory;

-- Esercizio 1 --

SELECT dimproduct.ProductKey, dimproduct.EnglishProductName, dimproductsubcategory.EnglishProductSubcategoryName
FROM dimproduct JOIN dimproductsubcategory 
ON dimproduct.ProductSubcategoryKey = dimproductsubcategory.ProductSubcategoryKey;

-- Esercizio 2 --
SELECT dimproduct.ProductKey, dimproduct.EnglishProductName, dimproductsubcategory.EnglishProductSubcategoryName, dimproductcategory.EnglishProductCategoryName
FROM dimproduct JOIN dimproductsubcategory 
ON dimproduct.ProductSubcategoryKey = dimproductsubcategory.ProductSubcategoryKey 
JOIN dimproductcategory
ON dimproductsubcategory.productcategorykey = dimproductcategory.productcategorykey;

-- Esercizio 3 --
SELECT*FROM factresellersales;
SELECT dimproduct.ProductKey, dimproduct.EnglishProductName, factresellersales.SalesOrderNumber, factresellersales.ShipDate, factresellersales.SalesAmount
FROM dimproduct JOIN factresellersales
ON dimproduct.ProductKey = factresellersales.ProductKey;

-- Esercizio 4 --
SELECT productkey, englishproductname, standardcost, color, listprice, standardcost, finishedgoodsflag
FROM dimproduct 
WHERE FinishedGoodsFlag =1;

SELECT productkey, englishproductname, standardcost, color, listprice, standardcost, finishedgoodsflag
from dimproduct
where productkey in (select productkey from factresellersales);

SELECT productkey, englishproductname, standardcost, color, listprice, standardcost, finishedgoodsflag
from dimproduct
where productkey not in (select productkey from factresellersales);

-- Esercizio 5 --
SELECT dimproduct.ProductKey, dimproduct.EnglishProductName, factresellersales.SalesOrderNumber, factresellersales.OrderDate, factresellersales.SalesAmount
FROM dimproduct JOIN factresellersales
ON dimproduct.productkey = factresellersales.productkey;

-- Esercizio 6 --
SELECT factresellersales.SalesOrderNumber, dimproduct.EnglishProductName, dimproduct.ProductKey
FROM factresellersales JOIN dimproduct
ON factresellersales.productkey = dimproduct.productkey;

-- Esercizio 7 --
SELECT*FROM dimreseller;

-- Esercizio 8 --
SELECT dimreseller.resellerkey, dimreseller.ResellerName, dimgeography.City, dimgeography.EnglishCountryRegionName
FROM dimreseller JOIN dimgeography
ON dimreseller.GeographyKey = dimgeography.GeographyKey;

-- Esercizio 9 --
SELECT factresellersales.SalesOrderNumber, factresellersales.SalesOrderLineNumber, factresellersales.OrderDate, factresellersales.UnitPrice, factresellersales.OrderQuantity, factresellersales.TotalProductCost,
dimproduct.EnglishProductName, dimproductsubcategory.EnglishProductSubcategoryName, dimreseller.ResellerName, dimgeography.City
FROM dimgeography 
JOIN dimreseller
ON dimgeography.GeographyKey = dimreseller.GeographyKey
JOIN factresellersales 
ON dimreseller.ResellerKey = factresellersales.ResellerKey
JOIN dimproduct
ON factresellersales.productkey = dimproduct.ProductKey
JOIN dimproductsubcategory
ON dimproduct.productsubcategorykey = dimproductsubcategory.productsubcategorykey;














