DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist 

CREATE TABLE regions 
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

INSERT INTO regions
(name)
VALUES
('Vancouver'),
('Seattle'),
('P.E.I'),
('Toronto'),
('New York'),
('Los Angelas'),
('Ottawa'),
('Las Vegas');

CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    pref_region_id INTEGER REFERENCES regions ON DELETE CASCADE
);

INSERT INTO users
(name, pref_region_id)
VALUES
('Lola Daniels', 3),
('Timmy Toms', 1),
('Jackson Monet', 4),
('Vincent Vita', 8),
('Pan Fan', 7),
('Gert Hurt', 6),
('Sam Whales', 5),
('Jerry Tom', 4),
('Ivan Fong', 3),
('Ruth Bert', 1);

CREATE TABLE categories
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

INSERT INTO categories
(name)
VALUES
('community'),
('housing'),
('personals'),
('for sale'),
('discussion forums');

CREATE TABLE posts
(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    user_id INTEGER REFERENCES users ON DELETE CASCADE,
    region_id INTEGER REFERENCES regions ON DELETE CASCADE,
    location TEXT NOT NULL
);

INSERT INTO posts
(title,user_id,region_id,location)
VALUES
('yoga class', 3 , 1, 'Richmond'),
('sublet', 1, 5, 'Brooklyn'),
('missing cat', 2 ,2 , 'by the beach'),
('ski gear for sale', 6 , 1 , 'Whistler'),
('tech_news', 5, 4 , 'downtown');

CREATE TABLE categories_posts
(
    id SERIAL PRIMARY KEY,
    cat_id INTEGER REFERENCES categories ON DELETE CASCADE,
    post_id INTEGER REFERENCES posts ON DELETE CASCADE
);

INSERT INTO categories_posts
(cat_id,post_id)
VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5);


