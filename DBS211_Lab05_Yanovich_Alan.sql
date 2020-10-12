/* Alan Yanovich, STD ID: 021278106, Date: Jun 7, DBS211 –Lab 04 */

SET AUTOCOMMIT ON;
/* 1. */

/* 
CREATE TABLE L5_MOVIES (
mid    INT     PRIMARY KEY,
title       VARCHAR(35)     NOT NULL,
releaseYear      INT         NOT NULL,
director        INT         NOT NULL,
score       DECIMAL(3,2),
CONSTRAINT  score_chk CHECK (score BETWEEN 0.0 and 5.00)
);


CREATE TABLE L5_ACTORS (
aid     INT        PRIMARY KEY,
firsName    VARCHAR(20)      NOT NULL,
lastName    VARCHAR (30)     NOT NULL
);

CREATE TABLE L5_CASTINGS (
movieid     INT,       
actorid     INT, 
PRIMARY KEY (movieid, actorid),
CONSTRAINT  movieid_fk  FOREIGN KEY (movieid)   REFERENCES L5_MOVIES (mid),
CONSTRAINT  actorid_fk  FOREIGN KEY (actorid)   REFERENCES L5_ACTORS (aid)
);

CREATE TABLE L5_DIRECTORS (
directorid      INT         PRIMARY KEY,
firstName       VARCHAR(20)     NOT NULL,
lastName        VARCHAR(30)     NOT NULL
);

*/


/* 2. */

/*
ALTER TABLE L5_MOVIES
    ADD CONSTRAINT director_fk FOREIGN KEY (director) REFERENCES L5_DIRECTORS (directorid);
*/ 


/* 3. */

/*
ALTER TABLE L5_MOVIES
    ADD CONSTRAINT title_fk UNIQUE (title);
    
*/ 
   
   
/* 4. */ 
/*
INSERT ALL 
    INTO L5_DIRECTORS VALUES (1010, 'Rob', 'Minkoff')
    INTO L5_DIRECTORS VALUES (1020, 'Bill', 'Condon')
    INTO L5_DIRECTORS VALUES (1050, 'Josh', 'Cooley')
    INTO L5_DIRECTORS VALUES (2010, 'Brad', 'Bird')
    INTO L5_DIRECTORS VALUES (3020, 'Lake', 'Bell')
    SELECT * FROM dual;
    
    
INSERT ALL 
    INTO L5_MOVIES VALUES (100, 'The Lion King', 2019, 3020, 3.50)
    INTO L5_MOVIES VALUES (200, 'Beauty and the Beast', 2017, 1050, 4.20)
    INTO L5_MOVIES VALUES (300, 'Toy Story 4', 2019, 1020, 4.50)
    INTO L5_MOVIES VALUES (400, 'Mission Impossible', 2018, 2010, 5.00)
    INTO L5_MOVIES VALUES (500, 'The Secret Life of Pets', 2016, 1010, 3.90)
    SELECT * FROM dual;
  
  */  
/* 5. */ 

/*
DROP TABLE L5_CASTINGS CASCADE CONSTRAINTS;
DROP TABLE L5_ACTORS CASCADE CONSTRAINTS;
DROP TABLE L5_MOVIES CASCADE CONSTRAINTS;
DROP TABLE L5_DIRECTORS CASCADE CONSTRAINTS;
*/

/* it is important to remove tables in order because the table may have associated constraints to it,
such as primary key/foreign key relationship with another table. In order to avoid leaving orphaned
records it is important to remove the child table before the parent table.
*/

/* 6. */ 

/*
CREATE TABLE employee2 AS (SELECT * FROM employees where rownum = 0);
*/

/* 7. */
/*
ALTER TABLE employee2
    ADD username VARCHAR2(15);
  */  
/* 8. */


/*
DROP TABLE employee2 CASCADE CONSTRAINTS;
*/

/* 9. */

/*
CREATE TABLE employee2 AS (SELECT * FROM employees);
*/
/* 10. */

/*
UPDATE employee2 SET lastname = 'Yanovich' WHERE employeenumber = 1002;
UPDATE employee2 SET firstname = 'Alan' WHERE employeenumber = 1002;
*/

/* 11. */
/*
UPDATE employee2
SET username = LOWER(SUBSTR(firstname, 1, 1))|| LOWER(lastname);
*/
/* 12. */

/*
DELETE FROM employee2
WHERE officecode = 4;
 */   
 
/* 13. */

/*
DROP TABLE employee2;
*/