-- Create database
CREATE DATABASE MovieAnalysisDB;

-- Use this database
USE MovieAnalysisDB;

-- Create genres table for movie categories
CREATE TABLE genres (
    genre_id INT PRIMARY KEY IDENTITY(1,1),      -- Genre unique ID (auto-increment)
    genre_name VARCHAR(50) NOT NULL UNIQUE,      -- Genre name (50 chars, unique)
    description TEXT NULL                        -- Description (optional)
);

-- Insert genre data
INSERT INTO genres (genre_name, description) VALUES
('Action', 'High-energy films'),
('Drama', 'Emotional stories'),
('Comedy', 'Humorous films'),
('Thriller', 'Suspenseful plots'),
('Sci-Fi', 'Science fiction'),
('Romance', 'Love stories'),
('Horror', 'Scary content'),
('Animation', 'Animated films'),
('Crime', 'Criminal themes'),
('Family', 'Family-friendly');

-- Create directors table
CREATE TABLE directors (
    director_id INT PRIMARY KEY IDENTITY(1,1),   -- Director unique ID
    director_name VARCHAR(100) NOT NULL,         -- Director name (required)
    birth_year INT NULL,                         -- Birth year (optional)
    nationality VARCHAR(50) NULL,                -- Country (optional)
    awards_count INT DEFAULT 0                   -- Awards count (default 0)
);

-- Insert directors
INSERT INTO directors (director_name, birth_year, nationality, awards_count) VALUES
('Christopher Nolan', 1970, 'British', 8),
('Steven Spielberg', 1946, 'American', 15),
('Martin Scorsese', 1942, 'American', 12),
('Quentin Tarantino', 1963, 'American', 9),
('David Fincher', 1962, 'American', 7),
('Denis Villeneuve', 1967, 'Canadian', 6),
('Paul Thomas Anderson', 1970, 'American', 5),
('Joel Coen', 1954, 'American', 4),
('Bong Joon-ho', 1969, 'South Korean', 6),
('Ari Aster', 1986, 'American', 3);

-- Create actors table
CREATE TABLE actors (
    actor_id INT PRIMARY KEY IDENTITY(1,1),      -- Actor unique ID
    actor_name VARCHAR(100) NOT NULL,            -- Actor name (required)
    birth_year INT NULL,                         -- Birth year (optional)
    nationality VARCHAR(50) NULL,                -- Country (optional)
    total_movies INT DEFAULT 0                   -- Total movies count
);

-- Insert actors
INSERT INTO actors (actor_name, birth_year, nationality, total_movies) VALUES
('Leonardo DiCaprio', 1974, 'American', 35),
('Tom Hanks', 1956, 'American', 52),
('Meryl Streep', 1949, 'American', 45),
('Brad Pitt', 1963, 'American', 48),
('Morgan Freeman', 1937, 'American', 58),
('Cate Blanchett', 1969, 'Australian', 42),
('Robert De Niro', 1943, 'American', 65),
('Scarlett Johansson', 1984, 'American', 40),
('Christian Bale', 1974, 'Welsh', 38),
('Frances McDormand', 1957, 'American', 36),
('Tom Hardy', 1977, 'British', 32),
('Saoirse Ronan', 1994, 'Irish', 28),
('Timothée Chalamet', 1994, 'American', 15),
('Zendaya', 1996, 'American', 22),
('Oscar Isaac', 1979, 'Guatemalan-American', 35);

-- Create movies main table
CREATE TABLE movies (
    movie_id INT PRIMARY KEY IDENTITY(1,1),         -- Movie unique ID
    movie_title VARCHAR(150) NOT NULL,              -- Movie name (required)
    release_date DATE NOT NULL,                     -- Release date (required)
    genre_id INT NOT NULL,                          -- Foreign key: genre
    director_id INT NOT NULL,                       -- Foreign key: director
    budget_usd DECIMAL(12, 2) NULL,                 -- Budget in USD
    worldwide_revenue_usd DECIMAL(12, 2) NULL,      -- Revenue in USD
    imdb_rating DECIMAL(3, 1) NULL,                 -- IMDB rating (e.g., 8.8)
    runtime_minutes INT NULL,                       -- Duration in minutes
    language VARCHAR(50) NULL,                      -- Movie language
    country_of_origin VARCHAR(50) NULL,             -- Production country
    CONSTRAINT fk_movies_genre FOREIGN KEY (genre_id) REFERENCES genres(genre_id),
    CONSTRAINT fk_movies_director FOREIGN KEY (director_id) REFERENCES directors(director_id)
);

-- Insert movies
INSERT INTO movies (movie_title, release_date, genre_id, director_id, budget_usd, worldwide_revenue_usd, imdb_rating, runtime_minutes, language, country_of_origin) VALUES
('Inception', '2010-07-16', 5, 1, 160000000, 839000000, 8.8, 148, 'English', 'USA'),
('The Dark Knight', '2008-07-18', 9, 1, 185000000, 1001000000, 9.0, 152, 'English', 'USA'),
('Interstellar', '2014-11-07', 5, 1, 165000000, 731000000, 8.6, 169, 'English', 'USA'),
('Oppenheimer', '2023-07-21', 2, 1, 100000000, 952000000, 8.1, 180, 'English', 'USA'),
('Dune', '2021-10-22', 5, 6, 165000000, 536000000, 8.0, 156, 'English', 'USA'),
('Pulp Fiction', '1994-10-14', 9, 4, 8000000, 213000000, 8.9, 154, 'English', 'USA'),
('Se7en', '1995-09-22', 9, 5, 33000000, 327000000, 8.6, 127, 'English', 'USA'),
('Forrest Gump', '1994-07-06', 2, 2, 55000000, 678000000, 8.8, 142, 'English', 'USA'),
('The Shawshank Redemption', '1994-10-14', 2, 3, 25000000, 58000000, 9.3, 142, 'English', 'USA'),
('Parasite', '2019-05-30', 2, 9, 11000000, 258000000, 8.6, 132, 'Korean', 'South Korea'),
('Nomadland', '2020-09-11', 2, 8, 8500000, 109000000, 7.3, 107, 'English', 'USA'),
('Avatar', '2009-12-18', 5, 7, 237000000, 2923000000, 7.8, 162, 'English', 'USA'),
('The Matrix', '1999-03-31', 5, 5, 63000000, 467000000, 8.7, 136, 'English', 'USA'),
('Blade Runner 2049', '2017-10-06', 5, 6, 150000000, 260000000, 8.0, 164, 'English', 'USA'),
('Toy Story', '1995-11-22', 8, 2, 30000000, 365000000, 8.3, 81, 'English', 'USA'),
('The Grand Budapest Hotel', '2014-03-28', 1, 2, 31000000, 173000000, 8.1, 99, 'English', 'USA'),
('Hereditary', '2018-06-08', 7, 10, 10000000, 80000000, 7.6, 127, 'English', 'USA'),
('Get Out', '2017-02-24', 7, 2, 4500000, 255000000, 7.7, 104, 'English', 'USA'),
('Goodfellas', '1990-09-19', 9, 3, 25000000, 47000000, 8.7, 146, 'English', 'USA'),
('Once Upon a Time in Hollywood', '2019-07-26', 9, 4, 95000000, 374000000, 7.6, 161, 'English', 'USA');

-- Create movie-actor relationship table (Many-to-Many)
CREATE TABLE movie_cast (
    cast_id INT PRIMARY KEY IDENTITY(1,1),                      -- Cast record ID
    movie_id INT NOT NULL,                                       -- Which movie
    actor_id INT NOT NULL,                                       -- Which actor
    character_name VARCHAR(100) NULL,                            -- Character name
    role_type VARCHAR(20) DEFAULT 'Supporting'                   -- Lead/Supporting/Cameo
        CHECK (role_type IN ('Lead', 'Supporting', 'Cameo')),    -- Only these values
    CONSTRAINT fk_cast_movie FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
    CONSTRAINT fk_cast_actor FOREIGN KEY (actor_id) REFERENCES actors(actor_id),
    CONSTRAINT uc_cast UNIQUE (movie_id, actor_id, character_name)  -- No duplicates
);

-- Insert cast data
INSERT INTO movie_cast (movie_id, actor_id, character_name, role_type) VALUES
(1, 1, 'Cobb', 'Lead'),
(1, 11, 'Eames', 'Supporting'),
(2, 9, 'Batman', 'Lead'),
(2, 7, 'Commissioner Gordon', 'Supporting'),
(3, 1, 'Cooper', 'Lead'),
(4, 13, 'J. Robert Oppenheimer', 'Lead'),
(5, 13, 'Paul Atreides', 'Lead'),
(6, 1, 'Vincent Vega', 'Lead'),
(7, 1, 'Detective Mills', 'Lead'),
(8, 2, 'Forrest Gump', 'Lead'),
(9, 5, 'Red', 'Lead'),
(12, 1, 'Jake Sully', 'Lead'),
(13, 1, 'Thomas Anderson', 'Lead'),
(14, 11, 'K', 'Lead'),
(15, 2, 'Woody', 'Lead'),
(18, 13, 'Chris Washington', 'Lead'),
(19, 7, 'Henry Hill', 'Lead'),
(20, 1, 'Rick Dalton', 'Lead');

-- Create reviews table for user ratings and comments
CREATE TABLE reviews (
    review_id INT PRIMARY KEY IDENTITY(1,1),      -- Review unique ID
    movie_id INT NOT NULL,                         -- Which movie
    reviewer_name VARCHAR(100) NULL,               -- Who reviewed it
    rating_out_of_10 DECIMAL(3, 1) NOT NULL,      -- Rating (e.g., 8.5)
    review_text TEXT NULL,                         -- Review comment
    review_date DATE NOT NULL,                     -- Date of review
    helpful_count INT DEFAULT 0,                   -- How many found it helpful
    CONSTRAINT fk_reviews_movie FOREIGN KEY (movie_id) REFERENCES movies(movie_id)
);

-- Insert reviews
INSERT INTO reviews (movie_id, reviewer_name, rating_out_of_10, review_text, review_date, helpful_count) VALUES
(1, 'John Smith', 9.0, 'Mind-bending masterpiece', '2023-06-15', 245),
(1, 'Emily Johnson', 8.5, 'Great film, complex', '2023-07-20', 182),
(2, 'Michael Brown', 9.5, 'Greatest superhero film', '2023-08-10', 512),
(3, 'Sarah Davis', 8.8, 'Epic space journey', '2023-09-05', 378),
(4, 'Robert Wilson', 8.2, 'Excellent portrayal', '2023-10-12', 289),
(5, 'Jessica Lee', 8.1, 'Visually stunning', '2023-11-08', 156),
(8, 'David Miller', 8.9, 'Timeless classic', '2023-12-01', 634),
(9, 'Amanda Taylor', 9.4, 'Perfectly crafted', '2024-01-15', 821),
(10, 'Chris Anderson', 8.7, 'Brilliant storytelling', '2024-02-20', 467),
(12, 'Laura Martinez', 7.9, 'Groundbreaking effects', '2024-03-10', 234);

USE MovieAnalysisDB;

-- Create box_office table
CREATE TABLE box_office (
    box_office_id INT PRIMARY KEY IDENTITY(1,1),
    movie_id INT NOT NULL,
    collection_week INT NULL,
    collection_date DATE NOT NULL,
    country VARCHAR(50) NULL,
    weekend_collection_usd DECIMAL(12, 2) NULL,
    total_collection_usd DECIMAL(12, 2) NULL,
    CONSTRAINT fk_boxoffice_movie FOREIGN KEY (movie_id) REFERENCES movies(movie_id)
);

-- Insert box office data (with CONVERT for safe date insertion)
INSERT INTO box_office (movie_id, collection_week, collection_date, country, weekend_collection_usd, total_collection_usd) VALUES
(1, 1, CONVERT(DATE, '2010-07-16'), 'USA', 35000000, 35000000),
(1, 2, CONVERT(DATE, '2010-07-23'), 'USA', 21000000, 56000000),
(1, 3, CONVERT(DATE, '2010-07-30'), 'USA', 14000000, 70000000),
(1, 1, CONVERT(DATE, '2010-07-16'), 'UK', 8000000, 8000000),
(2, 1, CONVERT(DATE, '2008-07-18'), 'USA', 158000000, 158000000),
(2, 2, CONVERT(DATE, '2008-07-25'), 'USA', 75000000, 233000000),
(2, 3, CONVERT(DATE, '2008-08-01'), 'USA', 42000000, 275000000),
(8, 1, CONVERT(DATE, '1994-07-06'), 'USA', 24000000, 24000000),
(8, 2, CONVERT(DATE, '1994-07-13'), 'USA', 18000000, 42000000),
(12, 1, CONVERT(DATE, '2009-12-18'), 'USA', 75000000, 75000000),
(12, 2, CONVERT(DATE, '2009-12-25'), 'USA', 77000000, 152000000),
(12, 3, CONVERT(DATE, '2010-01-01'), 'USA', 68000000, 220000000);

USE MovieAnalysisDB;

SELECT 'Genres' AS Table_Name, COUNT(*) AS Records FROM genres
UNION ALL
SELECT 'Directors', COUNT(*) FROM directors
UNION ALL
SELECT 'Actors', COUNT(*) FROM actors
UNION ALL
SELECT 'Movies', COUNT(*) FROM movies
UNION ALL
SELECT 'Movie_Cast', COUNT(*) FROM movie_cast
UNION ALL
SELECT 'Reviews', COUNT(*) FROM reviews
UNION ALL
SELECT 'Box_Office', COUNT(*) FROM box_office;

USE MovieAnalysisDB;

-- Drop old indexes
DROP INDEX IF EXISTS idx_movie_genre ON movies;
DROP INDEX IF EXISTS idx_movie_director ON movies;
DROP INDEX IF EXISTS idx_movie_release ON movies;
DROP INDEX IF EXISTS idx_movie_rating ON movies;
DROP INDEX IF EXISTS idx_cast_movie ON movie_cast;
DROP INDEX IF EXISTS idx_cast_actor ON movie_cast;
DROP INDEX IF EXISTS idx_reviews_movie ON reviews;
DROP INDEX IF EXISTS idx_boxoffice_movie ON box_office;

-- Create new indexes
CREATE INDEX idx_movie_genre ON movies(genre_id);
CREATE INDEX idx_movie_director ON movies(director_id);
CREATE INDEX idx_movie_release ON movies(release_date);
CREATE INDEX idx_movie_rating ON movies(imdb_rating);
CREATE INDEX idx_cast_movie ON movie_cast(movie_id);
CREATE INDEX idx_cast_actor ON movie_cast(actor_id);
CREATE INDEX idx_reviews_movie ON reviews(movie_id);
CREATE INDEX idx_boxoffice_movie ON box_office(movie_id);



-- Question: Which 10 movies earned the most revenue worldwide?
SELECT TOP 10
    movie_id,
    movie_title,
    worldwide_revenue_usd AS Revenue,
    imdb_rating AS Rating,
    release_date
FROM movies
ORDER BY worldwide_revenue_usd DESC;


-- Question: Which genre has the highest average rating and revenue?
SELECT 
    g.genre_name,
    COUNT(m.movie_id) AS Total_Movies,
    ROUND(AVG(m.imdb_rating), 2) AS Avg_Rating,
    ROUND(AVG(m.worldwide_revenue_usd), 0) AS Avg_Revenue
FROM movies m
INNER JOIN genres g ON m.genre_id = g.genre_id
GROUP BY g.genre_name
ORDER BY Avg_Rating DESC;


-- Question: Which director has made the most movies and what's their average revenue?
SELECT 
    d.director_name,
    COUNT(m.movie_id) AS Total_Films,
    ROUND(AVG(m.worldwide_revenue_usd), 0) AS Avg_Revenue,
    ROUND(AVG(m.imdb_rating), 2) AS Avg_Rating,
    MAX(m.worldwide_revenue_usd) AS Highest_Grossing
FROM movies m
INNER JOIN directors d ON m.director_id = d.director_id
GROUP BY d.director_id, d.director_name
ORDER BY Total_Films DESC;



-- Question: Which actors appeared in the most movies and what's their average movie rating?
SELECT 
    a.actor_name,
    COUNT(DISTINCT m.movie_id) AS Movies_Count,
    ROUND(AVG(m.imdb_rating), 2) AS Avg_Movie_Rating,
    ROUND(AVG(m.worldwide_revenue_usd), 0) AS Avg_Revenue_Per_Movie
FROM actors a
INNER JOIN movie_cast mc ON a.actor_id = mc.actor_id
INNER JOIN movies m ON mc.movie_id = m.movie_id
GROUP BY a.actor_id, a.actor_name
HAVING COUNT(DISTINCT m.movie_id) >= 2
ORDER BY Movies_Count DESC;



-- Question: Which movies had the best Return on Investment (ROI)?
SELECT 
    movie_title,
    budget_usd AS Budget,
    worldwide_revenue_usd AS Revenue,
    (worldwide_revenue_usd - budget_usd) AS Profit,
    ROUND(((worldwide_revenue_usd - budget_usd) / budget_usd * 100), 2) AS ROI_Percentage
FROM movies
WHERE budget_usd > 0 AND worldwide_revenue_usd > 0
ORDER BY ROI_Percentage DESC;



-- Question: How many movies made profit vs loss, and what's the average rating?
SELECT 
    CASE 
        WHEN (worldwide_revenue_usd - budget_usd) > 0 THEN 'Profitable'
        ELSE 'Loss/Break-even'
    END AS Status,
    COUNT(*) AS Movie_Count,
    ROUND(AVG(worldwide_revenue_usd), 0) AS Avg_Revenue,
    ROUND(AVG(imdb_rating), 2) AS Avg_Rating
FROM movies
WHERE budget_usd > 0
GROUP BY 
    CASE 
        WHEN (worldwide_revenue_usd - budget_usd) > 0 THEN 'Profitable'
        ELSE 'Loss/Break-even'
    END;


-- Question: What are the highest rated movies and who acted in them?
SELECT TOP 10
    m.movie_title,
    m.imdb_rating,
    g.genre_name,
    d.director_name,
    STRING_AGG(a.actor_name, ', ') AS Cast_Members
FROM movies m
INNER JOIN genres g ON m.genre_id = g.genre_id
INNER JOIN directors d ON m.director_id = d.director_id
LEFT JOIN movie_cast mc ON m.movie_id = mc.movie_id
LEFT JOIN actors a ON mc.actor_id = a.actor_id
GROUP BY m.movie_id, m.movie_title, m.imdb_rating, g.genre_name, d.director_name
ORDER BY m.imdb_rating DESC;




-- Question: Which genre is most efficient in terms of budget vs revenue?
SELECT 
    g.genre_name,
    COUNT(m.movie_id) AS Movie_Count,
    ROUND(AVG(m.budget_usd), 0) AS Avg_Budget,
    ROUND(AVG(m.worldwide_revenue_usd), 0) AS Avg_Revenue,
    ROUND(AVG((m.worldwide_revenue_usd - m.budget_usd) / m.budget_usd * 100), 2) AS Avg_ROI
FROM movies m
INNER JOIN genres g ON m.genre_id = g.genre_id
WHERE m.budget_usd > 0
GROUP BY g.genre_id, g.genre_name
ORDER BY Avg_ROI DESC;


-- Question: What was the week-by-week box office collection for each movie?
SELECT 
    m.movie_title,
    bo.collection_week,
    bo.collection_date,
    bo.country,
    bo.weekend_collection_usd,
    bo.total_collection_usd,
    ROUND((bo.weekend_collection_usd / bo.total_collection_usd * 100), 2) AS Weekend_Percentage
FROM movies m
INNER JOIN box_office bo ON m.movie_id = bo.movie_id
WHERE bo.country = 'USA'
ORDER BY m.movie_id, bo.collection_date;



-- Question: Which movies have the most helpful reviews?
SELECT TOP 15
    m.movie_title,
    COUNT(r.review_id) AS Total_Reviews,
    ROUND(AVG(r.rating_out_of_10), 2) AS Avg_Review_Rating,
    SUM(r.helpful_count) AS Total_Helpful_Votes,
    ROUND(AVG(r.helpful_count), 0) AS Avg_Helpful_Per_Review
FROM movies m
INNER JOIN reviews r ON m.movie_id = r.movie_id
GROUP BY m.movie_id, m.movie_title
ORDER BY Total_Helpful_Votes DESC;


-- Question: Which actor pairs worked together the most?
SELECT TOP 10
    a1.actor_name AS Actor_1,
    a2.actor_name AS Actor_2,
    COUNT(DISTINCT mc1.movie_id) AS Movies_Together,
    ROUND(AVG(m.imdb_rating), 2) AS Avg_Movie_Rating
FROM movie_cast mc1
INNER JOIN movie_cast mc2 ON mc1.movie_id = mc2.movie_id 
    AND mc1.actor_id < mc2.actor_id
INNER JOIN actors a1 ON mc1.actor_id = a1.actor_id
INNER JOIN actors a2 ON mc2.actor_id = a2.actor_id
INNER JOIN movies m ON mc1.movie_id = m.movie_id
GROUP BY mc1.actor_id, mc2.actor_id, a1.actor_name, a2.actor_name
ORDER BY Movies_Together DESC;



-- Question: Which director-actor pair collaborated the most?
SELECT TOP 10
    d.director_name,
    a.actor_name,
    COUNT(DISTINCT m.movie_id) AS Collaborations,
    ROUND(AVG(m.worldwide_revenue_usd), 0) AS Avg_Revenue,
    ROUND(AVG(m.imdb_rating), 2) AS Avg_Rating
FROM directors d
INNER JOIN movies m ON d.director_id = m.director_id
INNER JOIN movie_cast mc ON m.movie_id = mc.movie_id
INNER JOIN actors a ON mc.actor_id = a.actor_id
GROUP BY d.director_id, d.director_name, a.actor_id, a.actor_name
HAVING COUNT(DISTINCT m.movie_id) > 1
ORDER BY Collaborations DESC;




-- Question: Does movie length affect its rating and revenue?
SELECT 
    CASE 
        WHEN runtime_minutes < 90 THEN 'Under 90 min'
        WHEN runtime_minutes BETWEEN 90 AND 120 THEN '90-120 min'
        WHEN runtime_minutes BETWEEN 121 AND 150 THEN '121-150 min'
        ELSE 'Over 150 min'
    END AS Runtime_Category,
    COUNT(m.movie_id) AS Movie_Count,
    ROUND(AVG(m.imdb_rating), 2) AS Avg_Rating,
    ROUND(AVG(m.worldwide_revenue_usd), 0) AS Avg_Revenue,
    ROUND(AVG(m.budget_usd), 0) AS Avg_Budget
FROM movies m
WHERE runtime_minutes IS NOT NULL
GROUP BY 
    CASE 
        WHEN runtime_minutes < 90 THEN 'Under 90 min'
        WHEN runtime_minutes BETWEEN 90 AND 120 THEN '90-120 min'
        WHEN runtime_minutes BETWEEN 121 AND 150 THEN '121-150 min'
        ELSE 'Over 150 min'
    END
ORDER BY MIN(runtime_minutes);



-- Question: Which actors are most valuable based on their movie ratings and revenue?
WITH actor_stats AS (
    SELECT 
        a.actor_id,
        a.actor_name,
        COUNT(DISTINCT m.movie_id) AS Movies,
        ROUND(AVG(m.imdb_rating), 2) AS Avg_Rating,
        ROUND(AVG(m.worldwide_revenue_usd), 0) AS Avg_Revenue
    FROM actors a
    INNER JOIN movie_cast mc ON a.actor_id = mc.actor_id
    INNER JOIN movies m ON mc.movie_id = m.movie_id
    GROUP BY a.actor_id, a.actor_name
)
SELECT TOP 15
    actor_name,
    Movies,
    Avg_Rating,
    Avg_Revenue,
    ROUND((Movies * Avg_Rating * (Avg_Revenue / 1000000)), 0) AS Cast_Strength_Index
FROM actor_stats
WHERE Movies >= 2
ORDER BY Cast_Strength_Index DESC;




-- Question: Which directors are most consistent in their ratings?
WITH director_stats AS (
    SELECT 
        d.director_id,
        d.director_name,
        COUNT(m.movie_id) AS Total_Films,
        ROUND(AVG(m.imdb_rating), 2) AS Avg_Rating,
        ROUND(STDEV(m.imdb_rating), 2) AS Rating_Variance
    FROM directors d
    INNER JOIN movies m ON d.director_id = m.director_id
    GROUP BY d.director_id, d.director_name
    HAVING COUNT(m.movie_id) >= 2
)
SELECT 
    director_name,
    Total_Films,
    Avg_Rating,
    Rating_Variance,
    CASE 
        WHEN Rating_Variance < 1 THEN 'Very Consistent'
        WHEN Rating_Variance < 1.5 THEN 'Consistent'
        ELSE 'Variable'
    END AS Consistency_Level
FROM director_stats
ORDER BY Rating_Variance ASC;