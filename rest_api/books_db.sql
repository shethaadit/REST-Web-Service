CREATE TABLE `book` (
  `bookid` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `year` char(4) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`bookid`)
);

CREATE TABLE authors (
  `authorid` int(11) NOT NULL,
  `authorname` varchar(100) NOT NULL,
  PRIMARY KEY (`authorid`)
);

CREATE TABLE `bookauthors` (
  `book_id` int(11) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL
);


INSERT INTO `authors` VALUES (111,'Giada De Laurentiis'),(112,'J K Rowling'),(113,'James McGovern'),(114,'Per Bothner'),(115,'Kurt Cagle'),(116,'James Linn'),(117,'Vaidyanathan Nagarajan'),(118,'Erik T Ray');

INSERT INTO `book` VALUES (1,'Everyday Italian','2005',30.00,'cooking'),(2,'Harry Potter','2005',29.99,'children'),(3,'XQuery Kick Start','2003',49.99,'web'),(4,'Learning XML','2003',39.95,'paperback');

INSERT INTO `bookauthors` VALUES (1,111),(2,112),(3,113),(3,114),(3,115),(3,116),(3,117),(4,118);

create view bookauthorinfo as
select b.bookid as bookid, b.title as title, GROUP_CONCAT(distinct a.authorname) as authors, b.year as year, b.price as price, b.category as category from book b, authors a, bookauthors ba where b.bookid = ba.book_id and ba.author_id = a.authorid group by b.bookid;

