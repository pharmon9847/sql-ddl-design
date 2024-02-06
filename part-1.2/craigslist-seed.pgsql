DROP DATABASE craigslist_db;

CREATE DATABASE craigslist_db;

\c craigslist_db;

CREATE TABLE Regions (
    id SERIAL PRIMARY KEY,
    region_name VARCHAR NOT NULL
);

CREATE TABLE Users (
    id SERIAL PRIMARY KEY,
    username VARCHAR NOT NULL,
    password VARCHAR NOT NULL,
    region_id INTEGER NOT NULL REFERENCES Regions
);

CREATE TABLE Categories (
    id SERIAL PRIMARY KEY,
    category_name VARCHAR NOT NULL,
    category_description TEXT NOT NULL
);

CREATE TABLE Posts (
    id SERIAL PRIMARY KEY,
    post_title VARCHAR NOT NULL,
    post_text TEXT NOT NULL,
    post_location VARCHAR NOT NULL,
    user_id INTEGER NOT NULL REFERENCES Users,
    region_id INTEGER NOT NULL REFERENCES Regions,
    category_id INTEGER NOT NULL REFERENCES Categories
);

INSERT INTO Regions (region_name)
VALUES
('North-East'),
('Mid-Atlantic'),
('South'),
('Mid-West'),
('West-Coast'),
('North-West');

INSERT INTO Users (username, password, region_id)
VALUES
('supdog1', 'supdog123', 1),
('supdog2', 'supdog456', 2),
('supdog3', 'supdog789', 3),
('yoyoma1', 'yoyoma123', 4),
('yoyoma2', 'yoyoma456', 5),
('yoyoma3', 'yoyoma789', 6);

INSERT INTO Categories (category_name, category_description)
VALUES
('Automotive', 'A place to sell all your old car and truck junk'),
('Kitchen', 'A place to sell all your kitchen junk'),
('Lawn and Garden', 'A place to sell your old lawn and garden junk'),
('Furniture', 'A place to sell your old furniture'),
('Electronics', 'A place to sell your old electronics'),
('Services', 'A place to find local services');

INSERT INTO Posts (post_title, post_text, post_location, user_id, region_id, category_id)
VALUES
('1973 Truck', 'Selling my old truck', 'Boston, MA', 1, 1, 1),
('2022 Microwave', 'Selling my old microwave', 'Raleigh, NC', 2, 2, 2),
('Lawn mower for sale', 'Who wants to buy my old lawn mower?', 'Oxford, MS', 3, 3, 3),
('Old sofa', 'Old leather sofa for sale', 'Scranton, OH', 4, 4, 4),
('2020 Mac Book Pro for sale', 'Selling my Mac Book for cheap!', 'Los Angeles, CA', 5, 5, 5),
('Notary Public', 'Your go-to notary public', 'Portland, OR', 6, 6, 6)

