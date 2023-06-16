# 1. List the top ten negative review authors, content, and number of negative reviews in mainland China
USE `shop`;
SELECT author, review
FROM shopcomment as s
ORDER BY s.negativescore DESC LIMIT 0,10;

# 2. Proceed to the above, and print out the name of each restaurant and the per capita unit price.
SELECT shop.ShopName, shopcomment.author, shopcomment.NegativeScore, shopcomment.re view, shopcomment.avgprice
FROM `shopcomment` LEFT OUTER JOIN `shop` ON shopcomment.ShopID = shop.ShopID ORDER BY shopcomment.NegativeScore DESC
LIMIT 0, 10;

# 3. List the total number of merchants in Shanghai city
USE `shop`;
SELECT s.shopname
FROM shop as s, city as c.shopcity as sc
WHERE s.shopid = sc.shopid AND c.cityid=sc.cityid AND c.cityname=’上海’;

# 4. List the top ten popular businesses with the most reviews in Shanghai
SELECT s.shopname
FROM shop as s,city as c,shopcity as sc
WHERE s.shopid = sc.shopid AND c.cityid = sc.cityid AND c.cityname = '上海'
ORDER BY s.commentcount
LIMIT 0,10;

# 5. List the top ten merchants with the most expensive per capita unit price in Shanghai
SELECT shop.ShopName
FROM shop INNER JOIN shopcity ON shop.ShopID = shopcity.ShopID WHERE shopcity.CityID='CT_0001'
GROUP BY shop.AvgPriceVAR
ORDER BY shop.AvgPriceVAR DESC LIMIT 0,10;

# 6. List the popular cuisines with the largest number of merchants in the top ten merchants in mainland China
SELECT d.DishName, COUNT(*) as total
FROM shop as s, dish as d, shopdish as sd
WHERE s.ShopID = sd.ShopID AND sd.DishID = d.DishID GROUP BY d.DishName
ORDER BY total DESC LIMIT 0,10;

# 7. List the top ten comments, authors, and total scores with the highest total scores in mainland China
SELECT sc.Review, sc.Author, SUM(sc.CommentMagnitude+sc.CommentTaste+sc.CommentEnvi ronment+sc.CommentService) as score
FROM shopcomment as sc
GROUP BY sc.Review,sc.Author, sc.CommentMagnitude, sc.CommentTaste, sc.CommentEnviron ment, sc.CommentService
ORDER BY score DESC LIMIT 0,10

# 8. List the number of businesses of West Tyke Steak in each city
SELECT City.cityname, COUNT(ShopCity.CityID) FROM `Shop`, `ShopCity`,`City`
WHERE Shop.ShopID = ShopCity.ShopID
AND ShopCity.CityID = City.CityID
AND Shop.ShopName = '⻄堤牛排' GROUP BY City.cityname

# 9. List the name and number of stores with the largest number of total exhibition stores in the top ten in mainland China
SELECT s.shopname,COUNT(shopname) FROM shop as s, city as c,shopcity as sc WHERE s.shopid =sc.shopid
AND c.cityid=sc.cityid
AND c.cityname = '上海'
GROUP BY s.shopname
ORDER BY COUNT(*) DESC LIMIT 0,10;

# 10. List the top ten most discussed cuisines in Shanghai and Beijing respectively
(Shanghai)
SELECT Dish.DishName, count(Dish.DishName)
FROM `ShopComment`, `Shop`, `ShopCity`,`City`, `ShopDish`, `Dish` WHERE Shopcomment.ShopID = Shop.ShopID
AND Shop.ShopID =ShopCity.ShopID AND ShopCity.CityID = City.CityID
AND ShopCity.ShopID = ShopDish.ShopID AND ShopDish.DishID = Dish.DishID
AND City.CityName = '上海'
GROUP BY Dish.DishName
ORDER BY count(Dish.DishName) DESC LIMIT 0, 10

(Beijing)
SELECT Dish.DishName, count(Dish.DishName)
FROM `ShopComment`, `Shop`, `ShopCity`,`City`, `ShopDish`, `Dish` WHERE Shopcomment.ShopID = Shop.ShopID
AND Shop.ShopID =ShopCity.ShopID AND ShopCity.CityID = City.CityID
AND ShopCity.ShopID = ShopDish.ShopID AND ShopDish.DishID = Dish.DishID
AND City.CityName = '北京'
GROUP BY Dish.DishName
ORDER BY count(Dish.DishName) DESC LIMIT 0, 10

# 11. List the top 20 best and worst Sichuan restaurants in Shanghai
SELECT s.ShopName, (s.CommentMagnitude+ s.CommentTaste+ s.CommentEnvironment+ s.C ommentService) as score
FROM dish as d, city as c, shop as s, shopdish as sd, shopcity as sct
WHERE d.DishID = sd.DishID
AND sd.ShopID = s.ShopID 
AND c.CityID = sct.CityID 
AND sct.ShopID = s.ShopID 
AND c.CityName = '上海' 
AND d.DishName = '川菜' 
ORDER BY score LIMIT 0, 20;

# 12. Pivot Table - Make a hub analysis of the per capita unit price corresponding to city > region > cuisine
- [hw3_q12]

## Objective: 
To explore the correlation between price and comfort level, first observe the top ten and bottom ten prices and comfort levels of "per capita unit price", and then apply to all cities to calculate the correlation coefficient of price and comfort level

# 13.  List the top 10 cities with the most "per capita unit price"
USE `shop`;
SELECT AVG(s.avgprice), c.cityname
FROM shop as s, shopcity as sc, city as c WHERE s.shopid=sc.shopid
AND c.cityid=sc.cityid
GROUP BY cityname
ORDER BY AVG(s.avgprice) DESC LIMIT 0,10;

# 14. List the total number of stores in the top ten cities with per capita unit price
SELECT AVG(s.avgprice), c.cityname, COUNT(c.cityid) as TotalShopNum FROM shop as s, shopcity as sc, city as c
WHERE s.shopid =sc.shopid AND c.cityid=sc.cityid
GROUP BY cityname
ORDER BY AVG(s.avgprice) DESC LIMIT 0,10;

# 15. List the comfort level of restaurants in the top ten cities with per capita unit price
SELECT AVG(s.avgprice), AVG(s.CommentMagnitude+s.CommentTaste+s.CommentEnv ironment+s.CommentService) as Comfort, c.cityname
FROM shop as s, shopcity as sc, city as c
WHERE s.shopid =sc.shopid AND c.cityid=sc.cityid
GROUP BY cityname
ORDER BY AVG(s.avgprice) DESC LIMIT 0,10;

#16. The "average restaurant comfort" of the top ten cities after listing the per capita unit price (excluding cities with a per capita unit price of 0)
SELECT AVG(s.avgprice), AVG(s.CommentMagnitude+s.CommentTaste+s.CommentEnv ironment+s.CommentService) as Comfort, c.cityname
FROM shop as s, shopcity as sc, city as c
WHERE s.shopid =sc.shopid AND c.cityid=sc.cityid AND s.avgprice > 0
GROUP BY cityname ORDER BY AVG(s.avgprice) LIMIT 0,10;

# 17. Correlation coefficient of price and comfort level in the whole database
SELECT c.CityName, (s.CommentMagnitude+s.CommentTaste+s.CommentEnvironmen t+s.CommentService), AVG(s.AvgPrice)
FROM city as c, shop as s, shopcity as sc
WHERE c.CityID=sc.CityID
AND s.ShopID=sc.ShopID GROUP BY cityname
ORDER BY AVG(s.avgprice) DESC

##Conclusion: 
The correlation coefficient is about 0.90, that is, the correlation of this data set is a significant positive correlation.
