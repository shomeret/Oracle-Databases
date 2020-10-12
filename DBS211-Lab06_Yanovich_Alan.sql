/* Alan Yanovich, STD ID: 021278106, Date: Jun 26, DBS211 –Lab 06 */

/*

PLEASE NOTE: some of the questions regarding rollback commands were confusing
I have tried explaining my knowledge as much as possible
Also questions 19 to 22 were NOT in the notes ( it says comming soon ) 
So I have looked it up on Google.

*/

/* 1.*/

/* 

    The user has established a new connection to the server and has a blank sheet ready to go, starts a new transaction
    The user uses the BEGIN statement in Oracle SQL, this will start a new transaction
    The user executes a COMMIT statement, the current transaction is commited, and a new transaction starts.
    The user executes ANY DDL statement.  This automatically triggers an auto-commit of the current transaction and starts a new transaction.
*/


/* 2.*/

/* CREATE TABLE newEmployees AS
        (SELECT * FROM employees WHERE 1=2);
*/


/* 3.*/     
    /*    
        SET AUTOCOMMIT OFF;
        SET TRANSACTION READ WRITE;
        
        */
        
/* 4.*/ 

/*
INSERT ALL
    INTO newEmployees VALUES (100, 'Patel', 'Ralph', 22333, 'rpatel@mail.com', 1, NULL, 'Sales Rep')
    INTO newEmployees VALUES (101, 'Denis', 'Betty', 33444, 'bdenis@mail.com', 4, NULL, 'Sales Rep')
    INTO newEmployees VALUES (102, 'Biri', 'Ben', 44555, 'bbirir@mail.com', 2, NULL, 'Sales Rep')
    INTO newEmployees VALUES (103, 'Newman', 'Chad', 66777, 'cnewman@mail.com', 3, NULL, 'Sales Rep')
    INTO newEmployees VALUES (104, 'Ropeburn', 'Audrey', 77888, 'aropebur@mail.com', 1, NULL, 'Sales Rep')
    SELECT * FROM dual;
  */  
  
  
/* 5.*/ 


/*
   SELECT * FROM newemployees;
    
    
    5 rows are selected
*/


/* 6.*/ 

/*
    COMMIT;
     
    SELECT * FROM newEmployees;
    
    ROLLBACK;
    
    SELECT * FROM newEmployees;
    
    5 rows are selected
  
*/
  
/* 7.*/ 

/*
COMMIT;

SELECT * FROM newEmployees;

SAVEPOINT A;

5 rows are selected

*/


/* 8.*/ 

/*

UPDATE newemployees
SET jobtitle = 'unknown';

*/


/* 9.*/ 

/*

COMMIT;

SELECT * FROM newEmployees;

SAVEPOINT B;

*/

/* 10.*/ 

/*a.*/

/*
COMMIT;

SELECT * FROM newEmployees WHERE jobtitle = 'unknown';

ROLLBACK;


5 results are displayed and still updated
*/

/*b.*/
/* The rollback command was not effective because I have made my changes permanent
previously. */

/*c.*/

/* No difference, there would only be a difference if I were to place an insert statement
before the rollback, it would then not show the inserted statement if I would not save it */


/* 11.*/ 

/*
BEGIN

DELETE FROM newEmployees;

COMMIT;

END;
*/

/* 12.*/ 
/*

CREATE VIEW vwNewEmps AS
    SELECT * FROM newEmployees
    ORDER BY lastname, firstname;

*/

/* 13.*/ 
/*

COMMIT;

DELETE FROM newEmployees;

ROLLBACK;

0 employees are now in employee table, rollback was "complete" but was not
effective because we placed a COMMIT after the delete statement.

*/

/* 14.*/ 

/*
BEGIN
INSERT ALL
    INTO newEmployees VALUES (100, 'Patel', 'Ralph', 22333, 'rpatel@mail.com', 1, NULL, 'Sales Rep')
    INTO newEmployees VALUES (101, 'Denis', 'Betty', 33444, 'bdenis@mail.com', 4, NULL, 'Sales Rep')
    INTO newEmployees VALUES (102, 'Biri', 'Ben', 44555, 'bbirir@mail.com', 2, NULL, 'Sales Rep')
    INTO newEmployees VALUES (103, 'Newman', 'Chad', 66777, 'cnewman@mail.com', 3, NULL, 'Sales Rep')
    INTO newEmployees VALUES (104, 'Ropeburn', 'Audrey', 77888, 'aropebur@mail.com', 1, NULL, 'Sales Rep')
    SELECT * FROM dual;


COMMIT;

END;

*/

/* 15.*/ 
/*

SELECT * FROM newemployees;

SAVEPOINT insertion;
/*

*/

/* 16. */
/*
UPDATE newemployees
SET jobtitle = 'unknown';
SELECT * FROM newEmployees;
*/

/* 17. */


/* ROLLBACK TO insertion; */

-- what happens is that it goes back to step 15 basically, where the jobtitle is Sales Rep
-- rather than unkown


/* 18. */

/* ROLLBACK; */

-- the result look the same as with #17. As the rollback undid all the statements
-- after the last rollback, since there were none, it did not do anything

/* 19. */
/*

REVOKE SELECT, UPDATE, INSERT, DELETE ON newemployees FROM public;

*/

/* 20. */

/* GRANT SELECT ON newEmployees TO swilliam; */

/* 21. */

/* GRANT INSERT, UPDATE, DELETE ON newEmployees TO swilliam; */

/* 22. */

/* REVOKE SELECT, INSERT, UPDATE, DELETE ON newEmployees FROM swilliam; */

/* 23. */

/*

DROP VIEW vwNewEmps;

DROP TABLE newEmployees;

*/


