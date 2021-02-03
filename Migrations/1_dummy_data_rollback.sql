DELETE FROM Belongs_to WHERE MovieId < '6';

DELETE FROM Likes WHERE UserId < '4';

DELETE FROM Has_avalible WHERE PlatformRegionId < '6';

DELETE FROM Subscribed_to WHERE UserId < '4';

DELETE FROM Tags WHERE TagId = '1';
DELETE FROM Tags WHERE TagId = '2'; 
DELETE FROM Tags WHERE TagId = '3';
DELETE FROM Tags WHERE TagId = '4';
DELETE FROM Tags WHERE TagId = '5'; 
DELETE FROM Tags WHERE TagId = '6'; 

DELETE FROM PlatformRegions WHERE PlatformRegionId = '1'; 
DELETE FROM PlatformRegions WHERE PlatformRegionId = '2'; 
DELETE FROM PlatformRegions WHERE PlatformRegionId = '3'; 
DELETE FROM PlatformRegions WHERE PlatformRegionId = '4'; 
DELETE FROM PlatformRegions WHERE PlatformRegionId = '5'; 

DELETE FROM Reviews WHERE ReviewId = '1';
DELETE FROM Reviews WHERE ReviewId = '2';
DELETE FROM Reviews WHERE ReviewId = '3';
DELETE FROM Reviews WHERE ReviewId = '4';

DELETE FROM Categories WHERE CategoryId = '1';
DELETE FROM Categories WHERE CategoryId = '2';
DELETE FROM Categories WHERE CategoryId = '3';

DELETE FROM Regions WHERE  RegionId = '1';
DELETE FROM Regions WHERE  RegionId = '2';
DELETE FROM Regions WHERE  RegionId = '3';

DELETE FROM Platforms WHERE  PlatformId = '1';
DELETE FROM Platforms WHERE  PlatformId = '2';
DELETE FROM Platforms WHERE  PlatformId = '3';

DELETE FROM Movies WHERE MovieId = '1';
DELETE FROM Movies WHERE MovieId = '2';
DELETE FROM Movies WHERE MovieId = '3';
DELETE FROM Movies WHERE MovieId = '4';
DELETE FROM Movies WHERE MovieId = '5';

DELETE FROM Users WHERE UserId = '1';
DELETE FROM Users WHERE UserId = '2';
DELETE FROM Users WHERE UserId = '3';