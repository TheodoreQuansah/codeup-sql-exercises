-- Use the albums_db database.
USE albums_db;

-- What is the primary key for the albums table?
-- id

-- What does the column named 'name' represent?
-- The name of the albums

-- What do you think the sales column represents?
-- the number of albums sold

-- Find the name of all albums by Pink Floyd.
 SELECT artist, name FROM albums WHERE artist = 'Pink Floyd'. -- The Dark Side of the Moon, The Wall.; 

-- What is the year Sgt. Pepper's Lonely Hearts Club Band was released?
SELECT release_date FROM albums WHERE name = 'Sgt. Pepper's Lonely Hearts Club Band was released'. -- 1967.

-- What is the genre for the album Nevermind?
SELECT artist, name, genre FROM albums WHERE name = 'Nevermind';. -- Grunge, Alternative rock. 

-- Which albums were released in the 1990s?
SELECT name, release_date FROM albums WHERE release_date BETWEEN 1990 AND 1999;

-- Which albums had less than 20 million certified sales? Rename this column as low_selling_albums.
SELECT name, sales AS low_selling_albums FROM albums WHERE sales < 20;
