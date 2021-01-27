Generate SQL
CREATE TABLE Users
(
  UserId SERIAL,
  Username VARCHAR NOT NULL,
  Password VARCHAR NOT NULL,
  ModeratorStatus BOOLEAN,
  PRIMARY KEY (UserId),
  UNIQUE (Username)
);

CREATE TABLE Movies
(
  MovieId SERIAL,
  ReleaseDate DATE NOT NULL,
  MovieTitle VARCHAR NOT NULL,
  MoviePosterURL VARCHAR NOT NULL,
  PRIMARY KEY (MovieId)
);

CREATE TABLE Platforms
(
  PlatformId SERIAL,
  Platform VARCHAR NOT NULL,
  PRIMARY KEY (PlatformId)
);

CREATE TABLE Regions
(
  Region VARCHAR NOT NULL,
  RegionId SERIAL,
  PRIMARY KEY (RegionId)
);

CREATE TABLE Categories
(
  CategoryId SERIAL,
  CategoryName VARCHAR NOT NULL,
  PRIMARY KEY (CategoryId)
);

CREATE TABLE Reviews
(
  ReviewId SERIAL,
  ReviewText VARCHAR,
  Rating SERIAL,
  DateWritten DATE NOT NULL,
  ApprovalStatus BOOLEAN,
  MovieId SERIAL,
  UserId SERIAL,
  PRIMARY KEY (ReviewId),
  FOREIGN KEY (MovieId) REFERENCES Movies(MovieId),
  FOREIGN KEY (UserId) REFERENCES Users(UserId)
);

CREATE TABLE PlatformRegions
(
  PlatformRegionId SERIAL,
  RegionId SERIAL,
  PlatformId SERIAL,
  PRIMARY KEY (PlatformRegionId),
  FOREIGN KEY (RegionId) REFERENCES Regions(RegionId),
  FOREIGN KEY (PlatformId) REFERENCES Platforms(PlatformId)
);

CREATE TABLE Tags
(
  TagName VARCHAR NOT NULL,
  TagId SERIAL,
  CategoryId SERIAL,
  PRIMARY KEY (TagId),
  FOREIGN KEY (CategoryId) REFERENCES Categories(CategoryId)
);

CREATE TABLE Subscribed_to
(
  UserId SERIAL,
  PlatformRegionId SERIAL,
  PRIMARY KEY (UserId, PlatformRegionId),
  FOREIGN KEY (UserId) REFERENCES Users(UserId),
  FOREIGN KEY (PlatformRegionId) REFERENCES PlatformRegions(PlatformRegionId)
);

CREATE TABLE Has_avalible
(
  PlatformRegionId SERIAL,
  MovieId SERIAL,
  PRIMARY KEY (PlatformRegionId, MovieId),
  FOREIGN KEY (PlatformRegionId) REFERENCES PlatformRegions(PlatformRegionId),
  FOREIGN KEY (MovieId) REFERENCES Movies(MovieId)
);

CREATE TABLE Likes
(
  UserId SERIAL,
  TagId SERIAL,
  PRIMARY KEY (UserId, TagId),
  FOREIGN KEY (UserId) REFERENCES Users(UserId),
  FOREIGN KEY (TagId) REFERENCES Tags(TagId)
);

CREATE TABLE Belongs_to
(
  TagId SERIAL,
  MovieId SERIAL,
  PRIMARY KEY (TagId, MovieId),
  FOREIGN KEY (TagId) REFERENCES Tags(TagId),
  FOREIGN KEY (MovieId) REFERENCES Movies(MovieId)
);