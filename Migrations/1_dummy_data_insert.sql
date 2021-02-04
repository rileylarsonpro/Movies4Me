INSERT INTO Users VALUES ('1','jackson','floaiw8eg4i8gla3','1');
INSERT INTO Users VALUES ('2','riley','floaiw8eg4i8gla3','1');
INSERT INTO Users VALUES ('3','william','floaiw8eg4i8gla3','1');

INSERT INTO Movies VALUES ('1','10/10/2008','The Dark Knight','https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_UX182_CR0,0,182,268_AL_.jpg');
INSERT INTO Movies VALUES ('2','10/10/1999','The Matrix','https://m.media-amazon.com/images/M/MV5BNzQzOTk3OTAtNDQ0Zi00ZTVkLWI0MTEtMDllZjNkYzNjNTc4L2ltYWdlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_UX182_CR0,0,182,268_AL_.jpg');
INSERT INTO Movies VALUES ('3','10/10/2010','Shutter Island','https://m.media-amazon.com/images/M/MV5BNzQzOTk3OTAtNDQ0Zi00ZTVkLWI0MTEtMDllZjNkYzNjNTc4L2ltYWdlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_UX182_CR0,0,182,268_AL_.jpg');
INSERT INTO Movies VALUES ('4','10/10/2020','Tenet','https://m.media-amazon.com/images/M/MV5BYzg0NGM2NjAtNmIxOC00MDJmLTg5ZmYtYzM0MTE4NWE2NzlhXkEyXkFqcGdeQXVyMTA4NjE0NjEy._V1_UX182_CR0,0,182,268_AL_.jpg');
INSERT INTO Movies VALUES ('5','10/10/1990','Goodfellas','https://m.media-amazon.com/images/M/MV5BY2NkZjEzMDgtN2RjYy00YzM1LWI4ZmQtMjIwYjFjNmI3ZGEwXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_UX182_CR0,0,182,268_AL_.jpg');

INSERT INTO Platforms VALUES ('1', 'Netflix');
INSERT INTO Platforms VALUES ('2', 'Amazon Prime');
INSERT INTO Platforms VALUES ('3', 'Hulu');

INSERT INTO Regions VALUES ('United States', '1');
INSERT INTO Regions VALUES ('United Kingdom', '2');
INSERT INTO Regions VALUES ('Australia', '3');

INSERT INTO Categories VALUES ('1', 'Genre');
INSERT INTO Categories VALUES ('2', 'Director');
INSERT INTO Categories VALUES ('3', 'Content Rating');

INSERT INTO Reviews VALUES ('1', 'This movie was great', '5', '1/28/2020', '1', '1', '1');
INSERT INTO Reviews VALUES ('2', 'This movie was bad', '1', '1/28/2020', '1', '2', '2');
INSERT INTO Reviews VALUES ('3', 'This movie was OK', '3', '1/28/2020', '1', '2', '3');
INSERT INTO Reviews VALUES ('4', '', '5', '1/28/2020', '0', '5', '1');

INSERT INTO PlatformRegions VALUES ('1', '1', '1');
INSERT INTO PlatformRegions VALUES ('2', '2', '1');
INSERT INTO PlatformRegions VALUES ('3', '3', '1');
INSERT INTO PlatformRegions VALUES ('4', '1', '2');
INSERT INTO PlatformRegions VALUES ('5', '1', '3');

INSERT INTO Tags VALUES ('R','1', '3');
INSERT INTO Tags VALUES ('PG-13','2', '3');
INSERT INTO Tags VALUES ('Nolan','3', '2');
INSERT INTO Tags VALUES ('Scorsese','4','2');
INSERT INTO Tags VALUES ('Action','5', '1');
INSERT INTO Tags VALUES ('Drama','6', '1');

INSERT INTO Subscribed_to VALUES ('1','1');
INSERT INTO Subscribed_to VALUES ('2','1');
INSERT INTO Subscribed_to VALUES ('3','1');
INSERT INTO Subscribed_to VALUES ('1','4');
INSERT INTO Subscribed_to VALUES ('2','4');
INSERT INTO Subscribed_to VALUES ('3','5');
INSERT INTO Subscribed_to VALUES ('1','2');

INSERT INTO Has_avalible VALUES ('1','1');
INSERT INTO Has_avalible VALUES ('1','2');
INSERT INTO Has_avalible VALUES ('1','3');
INSERT INTO Has_avalible VALUES ('2','1');
INSERT INTO Has_avalible VALUES ('2','2');
INSERT INTO Has_avalible VALUES ('2','3');
INSERT INTO Has_avalible VALUES ('2','5');
INSERT INTO Has_avalible VALUES ('4','1');
INSERT INTO Has_avalible VALUES ('4','2');
INSERT INTO Has_avalible VALUES ('5','3');
INSERT INTO Has_avalible VALUES ('5','4');
INSERT INTO Has_avalible VALUES ('5','5');

INSERT INTO Likes VALUES ('1', '1');
INSERT INTO Likes VALUES ('1', '5');
INSERT INTO Likes VALUES ('2', '1');
INSERT INTO Likes VALUES ('2', '4');
INSERT INTO Likes VALUES ('3', '3');
INSERT INTO Likes VALUES ('3', '6');

INSERT INTO Belongs_to VALUES ('2', '1');
INSERT INTO Belongs_to VALUES ('3', '1');
INSERT INTO Belongs_to VALUES ('5', '1');
INSERT INTO Belongs_to VALUES ('1', '2');
INSERT INTO Belongs_to VALUES ('5', '2');
INSERT INTO Belongs_to VALUES ('1', '3');
INSERT INTO Belongs_to VALUES ('4', '3');
INSERT INTO Belongs_to VALUES ('6', '3');
INSERT INTO Belongs_to VALUES ('2', '4');
INSERT INTO Belongs_to VALUES ('3', '4');
INSERT INTO Belongs_to VALUES ('5', '4');
INSERT INTO Belongs_to VALUES ('1', '5');
INSERT INTO Belongs_to VALUES ('4', '5');
INSERT INTO Belongs_to VALUES ('6', '5');
