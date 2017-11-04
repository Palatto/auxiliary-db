# Creates database relations
# Author: Swetha Revanur

DROP TABLE IF EXISTS Requests;
DROP TABLE IF EXISTS Promotions;
DROP TABLE IF EXISTS NoFoodCount;
DROP TABLE IF EXISTS GoingCount;
DROP TABLE IF EXISTS RequestTypes;
DROP TABLE IF EXISTS PromotionTypes;
DROP TABLE IF EXISTS Users;

CREATE TABLE Users (
    username VARCHAR(255) NOT NULL,
	PRIMARY KEY(username)
);

CREATE TABLE PromotionTypes (
    promotion_type VARCHAR(255) NOT NULL,
	promotion_code INT NOT NULL,
	PRIMARY KEY(promotion_code)
);

CREATE TABLE RequestTypes (
    request_type VARCHAR(255) NOT NULL,
	request_code INT NOT NULL,
	PRIMARY KEY(request_code)
);

CREATE TABLE GoingCount (
    promotion_id VARCHAR(255) NOT NULL,
	going_count INT NOT NULL,
	PRIMARY KEY(promotion_id)
);

CREATE TABLE NoFoodCount (
    promotion_id VARCHAR(255) NOT NULL,
	no_food_count INT NOT NULL,
	PRIMARY KEY(promotion_id)
);

CREATE TABLE Promotions (
    promotion_id VARCHAR(255) NOT NULL,
	title VARCHAR(255) NOT NULL,
	start_time DATETIME NOT NULL,
	end_time DATETIME NOT NULL,
	location VARCHAR(255) NOT NULL,
	promotion_code INT NOT NULL,
	no_food BOOLEAN NOT NULL,
	est_id VARCHAR(255),
	PRIMARY KEY(promotion_id),
	FOREIGN KEY(promotion_code) REFERENCES PromotionTypes(promotion_code)
);

CREATE TABLE Requests (
    username VARCHAR(255) NOT NULL,
	promotion_id VARCHAR(255) NOT NULL,
	request_code INT NOT NULL,
	FOREIGN KEY(username) REFERENCES Users(username),
	FOREIGN KEY(promotion_id) REFERENCES Promotions(promotion_id),
	FOREIGN KEY(request_code) REFERENCES RequestTypes(request_code)
);

