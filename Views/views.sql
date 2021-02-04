-- platform_region_name
CREATE VIEW platform_region_name AS 
SELECT pr.platformregionid, r.regionname, p.platformname
FROM platformregions AS pr
INNER JOIN platforms AS p ON pr.platformid = p.platformid
INNER JOIN regions AS r ON pr.regionid = r.regionid;

-- user_subscriptions
CREATE VIEW users_subscriptions AS
SELECT u.userid, u.username, prn.regionname, prn.platformname, prn.platformregionid
FROM users AS u
INNER JOIN subscribed_to AS s ON u.userid = s.userid
INNER JOIN platform_region_name AS prn 
ON s.platformregionid = prn.platformregionid;

-- platform_region_movies
CREATE VIEW platform_region_movies AS
SELECT prn.platformregionid, prn.regionname, prn.platformname, m.movieid, m.releasedate, m.movietitle, m.movieposterurl
FROM platform_region_name AS prn
INNER JOIN has_avalible AS ha ON prn.platformregionid = ha.platformregionid
INNER JOIN movies AS m ON ha.movieid = m.movieid;

-- user_moives
CREATE VIEW users_platforms_movies AS
SELECT us.userid, us.username, us.platformregionid, us.regionname, us.platformname, prm.movieid, prm.releasedate, prm.movietitle, prm.movieposterurl
FROM users_subscriptions AS us
INNER JOIN platform_region_movies AS prm
ON us.platformregionid = prm.platformregionid

-- user_reviews_moives
CREATE VIEW users_reviews_movies AS
SELECT u.userid, u.username, r.reviewid, r.reviewtext, r.rating, r.datewritten, r.approvalstatus, r.movieid, m.releasedate, m.movietitle, m.movieposterurl 
FROM users AS u
INNER JOIN reviews AS r
ON u.userid = r.userid
INNER JOIN movies AS m
ON m.movieid = r.movieid;

-- users_likes_movies
CREATE VIEW users_likes_movies AS
SELECT u.userid, u.username, r.rating, r.movieid, m.releasedate, m.movietitle, m.movieposterurl 
FROM users AS u
INNER JOIN reviews AS r
ON u.userid = r.userid
INNER JOIN movies AS m
ON m.movieid = r.movieid
WHERE r.rating > 3;

-- user_likes_tags
CREATE VIEW users_likes_tags AS
SELECT u.userid, u.username, t.tagid, t.tagname, c.categoryname
FROM users AS u
INNER JOIN likes AS l
ON u.userid = l.userid
INNER JOIN tags AS t
ON t.tagid = l.tagid
INNER JOIN categories AS c
ON c.categoryid = t.categoryid;

-- movie_has_tags
CREATE VIEW movie_has_tags AS
SELECT m.movieid, m.movietitle, m.releasedate, m.movieposterurl, t.tagid, t.tagname, c.categoryname
FROM movies AS m
INNER JOIN belongs_to AS bt
ON m.movieid = bt.movieid
INNER JOIN tags AS t
ON t.tagid = bt.tagid
INNER JOIN categories AS c
ON c.categoryid = t.categoryid;

