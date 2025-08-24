-- let's look at some options for the SELECT statement and WHERE expressions

-- Select everything with *
SELECT * FROM Zelda;

-- Select specific fields (columns) 
SELECT Timeline, Title, ReleaseYear FROM Zelda;

-- results will appear in the order given for the SELECT
SELECT ReleaseYear, Timeline, Title FROM Zelda;

-- the AS clause allows you to assign an 'alias' used as the column title
SELECT ReleaseYear AS 'Year', Timeline, Title FROM Zelda;

-- change the order display for the results
SELECT ReleaseYear AS 'Year', Timeline, Title FROM Zelda 
    ORDER BY ReleaseYear;
    
-- once the alias is defined, it can be used in other parts of the statement
SELECT ReleaseYear AS 'Year', Timeline, Title FROM Zelda 
    ORDER BY Year;
    
-- take a quick look at the data
SELECT * FROM Zelda;

-- see only games available for handheld 
-- when using LIKE the percent sign matches zero or more characters
--      using the underscore matches any one character
-- by default, LIKE ignores case (matches either upper or lower case)
SELECT ReleaseYear AS 'Year', Timeline, Title, Systems FROM Zelda 
    WHERE Systems LIKE '%DS%' OR Systems LIKE 'Game Boy%';
    
-- sort the results -- keywords ASC or DESC are optional (ASCending or DESCending)
SELECT ReleaseYear AS 'Year', Timeline, Title, Systems FROM Zelda 
    WHERE Systems LIKE '%DS%' OR Systems LIKE 'Game Boy%'
    ORDER BY Year DESC;
    
-- fields used to filter and order by do not need to be in the results
SELECT Systems, Title FROM Zelda
    WHERE ReleaseYear BETWEEN 2010 AND 2025
    ORDER BY ReleaseYear;
    
-- Try some Pokemon searches...
SELECT * FROM Pokemon;

-- combine multiple criteria
-- the IN keyword looks for an exact match to any item in the list
-- the AND keyword requires both criteria to be matched
SELECT Name, NationalDex FROM Pokemon
    WHERE TypeI IN ('Fire', 'Water') AND Color IN ('Red', 'Blue');
    
-- narrow to original Pokemon by using NationalDex number
SELECT Name, NationalDex FROM Pokemon
    WHERE TypeI IN ('Fire', 'Water') AND Color IN ('Red', 'Blue') AND NationalDex <= 151;
    
-- get rid of Mega versions of basic Pokemon
SELECT Name, NationalDex FROM Pokemon
    WHERE TypeI IN ('Fire', 'Water') AND Color IN ('Red', 'Blue') AND NationalDex <= 151 AND Name NOT LIKE '%(Mega%';
    
-- order by name
SELECT Name, NationalDex FROM Pokemon
    WHERE TypeI IN ('Fire', 'Water') AND Color IN ('Red', 'Blue') 
        AND NationalDex <= 151 AND Name NOT LIKE '%(Mega%'
    ORDER BY Name;
    
-- I used a left parenthesis in the pattern match string '%(Mega%' because some Pokemon have 'Mega' or 'mega' in their base names
SELECT * FROM Pokemon
    WHERE Name LIKE '%Mega%';