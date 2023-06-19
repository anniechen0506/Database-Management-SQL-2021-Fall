# Collected data through web-crawling and established a database in SQL for trend analysis and information retrieval
# Visualized results of analysis by using Tableau to provide insights for one of Asia’s largest e-commerce platforms

## Job Analysis
# 1. Discuss the trend of Shopee-related vacancies on the Dcard job categories forum every month
USE hw5;
CREATE TABLE shopee
SELECT MID(post_time,1,7) as month, count(*)
FROM work
WHERE CONTENT LIKE '蝦皮％'
GROUP BY month



# 2. Positive and negative voices discussing Shopee vacancies on job categories forum
SELECT count(ts_3.id) as total
FROM ts_page_content_3 as ts_3
WHERE s_area_id = 'WH_F0116_0014'
AND ts_3.content like '%Pchome%' AND ts_3.content like %pchome%'
AND ts_3.sentiment = 'M';

SELECT count(ts_3.id) as total
FROM ts_page_content_3 as ts_3
WHERE s_area_id = 'WH_F0116_0014'
AND ts_3.content like '%Shopee%' AND ts_3.content like %蝦皮%'
AND ts_3.sentiment = 'M';



## Demand Analysis
# 3. Discuss monthly online shopping trends
SELECT MID(post_time, 6,2) as month, count(*) as posts_number
FROM 'ts_page_content'
GROUP BY month
ORDER BY month;



# 4. Time point trend of posting within a day
#(1) Dcard
CREATE TABLE timetrend
SELECT MID(post_time,12,2) as hour, count(*)
FROM 'ts_page_content'
GROUP BY hour
ORDER by count(*) DESC;

#(2) PTT group purchase forum
CREATE TABLE time_ptt
SELECT MID(post_time,12,2) as hour, count(*)
FROM 'ptt'
GROUP BY hour
ORDER by count(*) DESC;



# 5. The volume of discussions about "very expensive" and "very cheap" products on the Dcard online shopping forum
# First, use string to deal with the name of discussed article and temporarily save as tmp
CREATE TABLE AS tmp
SELECT id, title, author, content AS titlename
FROM ts_page_content
WHERE s_area_id = 'WH_F0116_0186';

# Mark the "expensive" tag by searching for content keyword
SELECT * FROM hw5.ts_page_content;
CREATE TABLE tmp2 AS
SELECT id, title, author, "很貴" AS tag FROM ts_page_content
WHERE s_area_id = 'WH_F0116_0186'
AND (content like '%好貴%' OR content like '%有點貴% OR content like '%不便宜%' OR content like '%CP值不高%' OR content like '%CP值低');

# Mark the "cheap" tag by searching for content keyword
SELECT * FROM hw5.ts_page_content;
INSERT INTO tmp2
SELECT id, title, author, "便宜" AS tag FROM ts_page_content
WHERE s_area_id = 'WH_F0116_0186'
AND (content like '%便宜%' OR content like '%不貴% OR content like '%高CP%' OR content like '%CP值高%');

# List out all the discussed articles that mentioned "expensive"
SELECT t.titlename, count(*)
FROM tmp AS t, tmp2 AS g
WHERE t.id = g.id AND tag = '很貴' and t.titlename <> ''
GROUP BY t.titlename
ORDER BY count(*) DESC;

# List out all the discussed articles that mentioned "cheap"
SELECT t.titlename, count(*)
FROM tmp AS t, tmp2 AS g
WHERE t.id = g.id AND tag = '便宜' and t.titlename <> ''
GROUP BY t.titlename
ORDER BY count(*) DESC;

# Count how may article mentioned "很貴"
SELECT count(*)
FROM tmp AS t, tmp2 as g
WHERE t.id = g.id AND tag = '很貴' and t.titlename <> ''
ORDER BY count(*) DESC;

# Count how may article mentioned "便宜"
SELECT count(*)
FROM tmp AS t, tmp2 as g
WHERE t.id = g.id AND tag = '便宜' and t.titlename <> ''
ORDER BY count(*) DESC;



## Supply Analysis
# 6. Competitor Analysis: the internet volume of discussing various e-commerce platforms on Dcard
SELECT * FROM hw5.ts_page_content;

# Create a e-commerce platforms list
CREATE TABLE tmp_onlineshop

# Filter Shopee
SELECT id, title, author, sentiment, content, "蝦皮" AS tag FROM ts_page_content
WHERE s_area_id = 'WH_F0116_0186'
  AND (content like '%蝦皮%' or content like '%Shopee%');
  
# Filter Pchome
INSERT INTO tmp_onlineshop
SELECT id, title, author, sentiment, content, "PChome" AS tag FROM ts_page_content
WHERE s_area_id = 'WH_F0116_0186'
  AND (content like '%PChome%' or content like '%pchome%' or content like '%Pchome%');
  
# Filter Momo
INSERT INTO tmp_onlineshop
SELECT id, title, author, sentiment, content, "MOMO" AS tag FROM ts_page_content
WHERE s_area_id = 'WH_F0116_0186'
  AND (content like '%MOMO%' or content like '%Momo%' or content like '%momo%');
  
# Filter Taobao
INSERT INTO tmp_onlineshop
SELECT id, title, author, sentiment, content, "淘寶" AS tag FROM ts_page_content
WHERE s_area_id = 'WH_F0116_0186'
  AND (content like '%淘寶%' or content like '%掏寶%' or content like '%Taobao%');
  
# Filter 東森購物
INSERT INTO tmp_onlineshop
SELECT id, title, author, sentiment, content, "東森購物" AS tag FROM ts_page_content
WHERE s_area_id = 'WH_F0116_0186'
  AND (content like '%東森購物%' or content like '%東森%');

# Filter 樂天購物
INSERT INTO tmp_onlineshop
SELECT id, title, author, sentiment, content, "樂天" AS tag FROM ts_page_content
WHERE s_area_id = 'WH_F0116_0186'
  AND (content like '%樂天購物%' or content like '%樂天%' or content like '%Rakuten%' or content like '%rakuten%');
  
# Filter 松果購物
INSERT INTO tmp_onlineshop
SELECT id, title, author, sentiment, content, "松果" AS tag FROM ts_page_content
WHERE s_area_id = 'WH_F0116_0186'
  AND (content like '%松果購物%' or content like '%松果%');

# Calculate the Internet volume of each e-commerce platforms
SELECT tag, count(*)
FROM hw5.tmp_onlineshop
GROUP BY tag
ORDER BY count(*) DESC;



# 7. Sentiment Analysis: Analyze the sentiment of the discussion on Dcard Online Shop Category
# Compare the internet volume sentiment of e-commerce platforms from both Taiwan and China (Shopee and Taobao)
SELECT sentiment AS '評價', count(*) AS '聲量(則)'
FROM hw5.tmp_onlineshop
WHERE tag = '蝦皮'
GROUP BY sentiment
ORDER BY count(*) DESC;

SELECT sentiment AS '評價', count(*) AS '聲量(則)'
FROM hw5.tmp_onlineshop
WHERE tag = '淘寶'
GROUP BY sentiment
ORDER BY count(*) DESC;



# 8. Top 10 Hottest Cloths of the Year (on Dcard and PTT forum)
1) Dcard
SELECT count(ts.id) AS total
FROM ts_page_content AS ts
WHERE s_area_id = 'WH_F0116_0186'
AND content like '%商品品類%'

2) PTT
# 8. Top 10 Hottest Cloths of the Year (on Dcard and PTT forum)
SELECT count(ts2.id) AS total
FROM ts_page_content_2 AS ts2
WHERE s_area_id = 'WH_F0001_1776'
AND content like '%商品品類%'



## The impact of the pandemic on e-commerce platforms
# 9. During the pandemic, discussion on the popularity of anti-pandemic products
CREATE TABLE COVID_trend
SELECT MID(post_time, 1, 7) AS date, count(*)
FROM 'ts_page_content'
WHERE s_area_id = 'WH_F0116_0186' 
AND content like '%疫情%' or content like '%口罩%' or content like '%酒精%' or content like '%確診%'
(content like '%pandemic%' or content like '%mask%' or content like '%alcohol%' or content like '%Diagnosed%')
GROUP BY date;




# 10. Discuss the changes of popular keywords before and after the pandemic 
# -> How e-commerce platform marketing strategies change according to the trend

#In this question, 2021-5-15 (before and after the outbreak of the local pandemic) is set as the demarcation point before and after the epidemic. We want to know whether the consumption habits of the people will change before and after the outbreak, so we will explore whether popular keywords will be significant before and after this time point.

# Before the pandemic
SELECT ts.title, count(*)
FROM ts_page_content AS ts
WHERE s_area_id = 'WH_F0116_0186'
AND post_time between '2020-01-01 00:00:00' AND '2021-05-15 00:00:00'
GROUP BY title
ORDER BY count(*)
DESC;

# After the pandemic
SELECT ts.title, count(*)
FROM ts_page_content AS ts
WHERE s_area_id = 'WH_F0116_0186'
AND post_time between '2021-05-15 00:00:00' AND '2021-12-31 00:00:00'
GROUP BY title
ORDER BY count(*)
DESC;


