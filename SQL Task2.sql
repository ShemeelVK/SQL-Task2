select * from Books;
                                --CREATING TABLES

CREATE TABLE Authors (
    AuthorID INT IDENTITY(1,1) PRIMARY KEY,
    AuthorName NVARCHAR(200) NOT NULL,
    Country NVARCHAR(100)
);

CREATE TABLE Publishers (
    PublisherID INT IDENTITY(1,1) PRIMARY KEY,
    PublisherName NVARCHAR(200) NOT NULL,
    Location NVARCHAR(150)
);

ALTER TABLE Books
ADD AuthorID INT,
    PublisherID INT;

ALTER TABLE Books
ADD CONSTRAINT FK_Books_Authors
FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
ON UPDATE CASCADE
ON DELETE SET NULL;

ALTER TABLE Books
ADD CONSTRAINT FK_Books_Publishers
FOREIGN KEY (PublisherID) REFERENCES Publishers(PublisherID)
ON UPDATE CASCADE
ON DELETE SET NULL;

                                  --INSERTING DATA

INSERT INTO Authors (AuthorName, Country)
VALUES
('Paulo Coelho', 'Brazil'),
('Robert C. Martin', 'USA'),
('J.K. Rowling', 'UK'),
('Morgan Housel', 'USA');

INSERT INTO Publishers (PublisherName, Location)
VALUES
('HarperCollins', 'New York'),
('Pearson', 'London'),
('Bloomsbury', 'London'),
('Penguin Random House', 'Berlin');
                      --UPDATING DATA IN THE BOOKS TABLE

UPDATE Books SET AuthorID = 1, PublisherID = 1 WHERE Title = 'The Alchemist';
UPDATE Books SET AuthorID = 2, PublisherID = 2 WHERE Title = 'Clean Code';
UPDATE Books SET AuthorID = 3, PublisherID = 3 WHERE Title LIKE 'Harry Potter%';
UPDATE Books SET AuthorID = 4, PublisherID = 4 WHERE Title = 'The Psychology of Money';


                                 --Join Methods

--INNER JOIN
SELECT 
    Books.Title,
    Authors.AuthorName,
    Publishers.PublisherName
FROM Books
INNER JOIN Authors ON Books.AuthorID = Authors.AuthorID
INNER JOIN Publishers ON Books.PublisherID = Publishers.PublisherID;

--LEFT JOIN
SELECT 
    Books.Title,
    Authors.AuthorName,
    Publishers.PublisherName
FROM Books
LEFT JOIN Authors ON Books.AuthorID = Authors.AuthorID
LEFT JOIN Publishers ON Books.PublisherID = Publishers.PublisherID;

--RIGHT JOIN

SELECT 
    Books.Title,
    Authors.AuthorName
FROM Books
RIGHT JOIN Authors ON Books.AuthorID = Authors.AuthorID;

--FULL OUTER JOIN

SELECT 
    Books.Title,
    Authors.AuthorName,
    Publishers.PublisherName
FROM Books
FULL OUTER JOIN Authors ON Books.AuthorID = Authors.AuthorID
FULL OUTER JOIN Publishers ON Books.PublisherID = Publishers.PublisherID;


                            --CASCADING EXAMPLES
--UPDATE CASCADE
UPDATE Authors
SET AuthorID = 10
WHERE AuthorID = 1;

 --DELETE CASCADE

DELETE FROM Publishers WHERE PublisherID = 1;

 --UNION
SELECT AuthorName FROM Authors
UNION
SELECT PublisherName FROM Publishers;

 --UNION ALL
SELECT AuthorName FROM Authors
UNION ALL
SELECT PublisherName FROM Publishers;

select * from Authors;
select * from Publishers