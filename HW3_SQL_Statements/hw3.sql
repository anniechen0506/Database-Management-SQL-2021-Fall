#An internet company hires you as Database administrator for online auction services. 
#There are three tables as the following. (Member.png, Bid_Record.png, Item.png)

#Please write the SQL statement for each requirement
# 1) Write the SQL statement to add a field  gender' to table M
ALTER TABLE Member
ADD COLUMN Gender CHAR(1)

#2) Write the SQL statement to update the member Bob's phone number to 0918
USE hw3;
UPDATE Member SET phone_no = '0918000007' WHERE name = 'Bob';

#3) List the names and price of the mobile phones, whose starting prices are lower than 6000.
SELECT i.name, i.price
FROM Item AS i
WHERE i.price<6000 and i.type='手機'

# 4) List the names of the members in Taipei
SELECT m.name
FROM Member AS m
WHERE m.area='台北'

# 5) List the names of the members, whose phone numbers start with 0935
SELECT m.name
FROM Member AS m
WHERE m.phone_no LIKE '0935%'

# 6) List the number of members for every area, in descending
SELECT m.area, COUNT(m.area)
FROM Member AS m
WHERE m.area IN ('台北', '台南', '高雄')
GROUP BY m.area
ORDER BY m.area;

# 7) List the names of members, who ever bid two or more times.
SELECT Member.name
FROM Bid_Record 
JOIN Member ON Bid_Record.m_id=Member.id
GROUP BY Bid_Record.m_id
HAVING COUNT(Bid_Record.M_id)>=2;

# 8) List the names of members, who never provide items to bid.
SELECT Member.name 
FROM Member
WHERE Member.id NOT IN 
(SELECT m_id FROM Item)

# 9) HOT LIST - for every item, list its name and the number of bid, in descending order.
SELECT i.name, COUNT(b.i_id)
FROM Bid_Record AS b, Item AS i
WHERE b.i_id=i.id
GROUP BY b.i_id
ORDER BY COUNT(b.i_id) DESC;

# 10) TOP LIST - for every item, list its names and price gain from bidding, in descending order.
SELECT i.name, (b.bid_price-i.price)
FROM Bid_Record AS b
LEFT JOIN Item AS i ON b.i_id=i.id 
WHERE b.bid_price-i.price IN
(SELECT DISTINCT MAX(b.bid_price-i.price) FROM Bid_Record, Item)
GROUP BY i.name,(b.bid_price-i.price)
ORDER BY MAX(b.bid_price-i.price) DESC
