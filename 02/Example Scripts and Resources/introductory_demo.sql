-- a double dash begins an inline comment
/* a multiple line comment begins with slash-asterisk 
               and ends with asterisk-slash */

-- this statement demonstrates the flexibility of SELECT; 
 --     but not sure why you would use this in a real app 
SELECT 'Hello World';

-- SQL keywords are not case sensitive, so this works...
--      but they are usually entered in all caps for clarity
select 'Hello World';

-- the AS keyword designates an alias
-- when used with SELECT, AS provides an alias to use for the title of the result 
SELECT 'Hello World' AS 'Greeting';

/* 
    to run the following SQL commands in SQLite Studio:
       1. the coffee database must be open
       2. it must be "connected"
       3. and if multiple databases are available in the SQL editor pane, 
                it must be selected in the dropdown list
*/

-- The * is used to get all fields (columns)
SELECT * FROM Coffee;

-- The ORDER BY clause sorts the results
SELECT * FROM Coffee ORDER BY Product;

-- The WHERE clause filters results
SELECT * FROM Coffee WHERE Category = 'Coffee';

-- If both the WHERE clause and the ORDER BY clause are present, the WHERE clause must come first
SELECT * FROM Coffee WHERE Category = 'Coffee' ORDER BY Product ;

-- This SELECT statement shows us that there should be 6 records for Tea from the Supplier Organic Leaves
SELECT Product, Supplier FROM Coffee WHERE Category = 'Tea';

-- COUNT() is an aggregate function that returns a single result calculated from several records 
-- We will learn more about aggregate functions later... 
-- For now... we use COUNT() to get the number of records found
SELECT COUNT(Product) AS 'Number of Products' FROM Coffee WHERE Category = 'Tea';

-- This SELECT statement returns unexpected results because it performs an exact match and 
--    the alphabetic case of the values vary
SELECT COUNT(Product) AS 'Products from Organic Leaves' FROM Coffee WHERE Supplier = 'Organic Leaves';

-- This would select all of them as expected by matching all spellings individually
SELECT COUNT(Product) AS 'Products from Organic Leaves' FROM Coffee 
    WHERE Supplier = 'Organic Leaves' OR Supplier = 'Organic leaves';

-- Another way to select them would be to use the LIKE keyword to ignore inconsistencies with case
-- We will learn more about the options available when using the LIKE keyword later
SELECT COUNT(Product) AS 'Products from Organic Leaves' FROM Coffee 
    WHERE Supplier LIKE 'Organic Leaves';

-- We can "fix" the data using an UPDATE statement; 
--   using "Sentence case" for the Supplier would be consistent with the other supplier names
UPDATE Coffee SET Supplier = 'Organic leaves' WHERE Supplier = 'Organic Leaves';

-- Now the SELECT statement returns an accurate count because the data is consistent 
SELECT COUNT(Product) AS 'Products from Organic Leaves' FROM Coffee WHERE Supplier = 'Organic leaves';

-- We can add records to the table using the INSERT statement
INSERT INTO Coffee (Product, Category, Supplier)
    VALUES ('Vanilla Iced Coffee', 'Coffee', 'Starbucks');

-- Here are the results
SELECT * FROM Coffee WHERE Category = 'Coffee' ORDER BY Product;

-- What if I accidentally added the same record twice?
INSERT INTO Coffee (Product, Category, Supplier)
    VALUES ('Vanilla Iced Coffee', 'Coffee', 'Starbucks');
SELECT * FROM Coffee WHERE Category = 'Coffee' ORDER BY Product;

-- I can delete the extra record, but I need to make sure I only delete the one -- so I need a WHERE clause!
DELETE FROM Coffee WHERE ProductID = 24;


