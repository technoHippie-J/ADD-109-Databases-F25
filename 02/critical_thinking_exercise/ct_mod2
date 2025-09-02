/*
I was thinking about what I wanted to do for this assignment and, 
knowing we'll be building something using a higher level language,
I though I would use an assignment I've been working on in 
Intermediate Python. It's an address book class, but I've been building
it more like a module or API. I think there's a possibility I may
try to use that concept and work in the final project since it's 
much more complex than the assignment required and seems like a perfect
fit for this application. I'm guessing the assignment requires somewhere
between 100-150 lines of code, and mine is 750 lines and still not done.
Since I've designed it for extensibility (that a word?), it makes sense
that I should be efficient with my work if I can, and perhaps even
structure all (or most) of my work towards a larger platform incorporating
all of these modules. I will likely email you the file tonight, as I
wanted to ask your opinion whether that's a good idea or not, and
if there are any adjustments I should make to its structure in 
preparation of incorporating it into a larger, final project in 
this class. I'm not sure if I'll keep it as an address book, but the
structure of it can be repurposed into other cases where the 
relationships between concepts are the same. 
*/

/*
Like last semester, I'll be generating my own db, especially given my intentions
to possibly use this in the final project, as simple as it may be.
*/

-- W3Schools used heavily in creating the table to comply somewhat closely with constraints of the python class
-- https://www.w3schools.com/sql/sql_datatypes.asp
-- https://www.w3schools.com/sql/sql_constraints.asp

CREATE TABLE entries (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,                   -- I used this (AUTOINCREMENT) in my work last semester, went to https://www.w3schools.com/sql/sql_autoincrement.asp to refresh, and I like it.
    FirstName TEXT NOT NULL,                                -- https://www.w3schools.com/sql/sql_notnull.asp
    LastName TEXT NOT NULL,
    Birthday DATE,                                          -- YYYY-MM-DD format
    Email TEXT UNIQUE,                                      -- https://www.w3schools.com/sql/sql_unique.asp
    Street TEXT,
    City TEXT,
    State TEXT,
    Country TEXT,
    ZipCode TEXT,
    Phone TEXT UNIQUE,
    Relation TEXT,
    Active BOOLEAN,
    Added TEXT NOT NULL DEFAULT (date('now','localtime'))   -- https://www.w3schools.com/sql/sql_default.asp (seems sqlite.org is better, w3scools is confusing with all the variants 
);                                                          -- this was frustrating. DATE didn't work, LOCALTIME() didn't work... too many variants of SQL lol
                                                            -- https://sqlite.org/lang_datefunc.html, "now" @ https://sqlite.org/lang_datefunc.html#time_values 

-- Inserting entries and their values

-- Rick Deckard, Blade Runner
INSERT INTO entries (FirstName, LastName, Birthday, Email, Street, City, State, Country, ZipCode, Phone, Relation, Active, Added)
    VALUES ('Rick', 'Deckard', '1979-01-08', 'bladerunner.rd@lapd.gov', 'Apt #9732', 'Los Angeles', 'CA', 'USA', '90009', '213-082-1119', 'Professional Contact - B.R.', 1, date('now','localtime'));
    
-- Judge Cassandra Anderson, Dredd
INSERT INTO entries (FirstName, LastName, Birthday, Email, Street, City, State, Country, ZipCode, Phone, Relation, Active, Added)
    VALUES ('Cassandra', 'Anderson', '1987-09-07', 'psi.anderson@mc1-justice.gov', 'Peach Trees Apt #0907', 'New York', 'NY', 'USA', '10001', '212-907-1212', 'Client - Judge', 1, date('now','localtime'));

-- Max Rockatansky, Mad Max
INSERT INTO entries (FirstName, LastName, Birthday, Email, Street, City, State, Country, ZipCode, Phone, Relation, Active, Added)
    VALUES ('Max', 'Rockatansky', '1979-04-12', 'mfp.max@mfp.gov.au', 'MFP Highway Patrol #44', 'Melbourne', 'VIC', 'AUS', '03000', '613-412-1979', 'Acquaintance - Vagabond', 0, date('now','localtime'));

-- Shaun Riley, Shaun of the Dead
INSERT INTO entries (FirstName, LastName, Birthday, Email, Street, City, State, Country, ZipCode, Phone, Relation, Active, Added)
    VALUES ('Shaun', 'Riley', '1978-09-24', 'shaun.riley@foree.co.uk', 'Flat #2B, 42 Nelson Road', 'London', 'N/A', 'ENG', 'NW5 2QH', '020-924-2004', 'Guy with red on his shirt', 1, date('now','localtime'));

-- SELECT: check table to see what is recorded
SELECT ID, FirstName, LastName, Birthday, Email, Active, Added
FROM entries
ORDER BY ID;

-- UPDATE: marking Rick Deckard as inactive
UPDATE entries
SET Active = 0
WHERE Email = 'bladerunner.rd@lapd.gov';        -- Email is used for WHERE in these examples because it is marked UNIQUE, while ID is assigned by AUTOINCREMENT and isn't known without fetching

-- SELECT: verify update
SELECT ID, FirstName, LastName, Active
FROM entries
WHERE Email = 'bladerunner.rd@lapd.gov';

-- DELETE: remove Judge Anderson
DELETE FROM entries
WHERE email = 'psi.anderson@mc1-justice.gov';

-- SELECT: check the final state of the table
SELECT ID, FirstName, LastName, Active, Added
FROM entries
ORDER BY ID;