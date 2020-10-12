/* Alan Yanovich, STD ID: 021278106, Date: Jun 3, DBS211 –Lab 03 */

SET AUTOCOMMIT ON;

/* 1. */

/* SELECT * FROM offices; */

/* 2. */

/* SELECT employeenumber FROM employees WHERE officecode = 1; */

/* 3. */

/* SELECT customernumber, customername, contactfirstname, contactlastname, phone 
FROM customers
WHERE city LIKE 'P%a%r%i%s'; */


/* 4. */

/* SELECT customernumber, customername, contactlastname || ',' || contactfirstname AS contactname, phone 
FROM customers
WHERE country LIKE 'C%a%n%a%d%a';  */

/* 5. */

/* SELECT customernumber FROM customers WHERE salesrepemployeenumber IS NOT NULL; */

/* 6. */

/* SELECT e.customernumber, checknumber, amount FROM customers e, payments
WHERE amount NOT BETWEEN (30000) and (65000) ORDER BY amount DESC; */

/* 7. */

/* SELECT * FROM orders WHERE status LIKE 'C%'; */

/* 8. */

/* SELECT productcode, productname, buyprice, msrp, msrp - buyprice AS markup,
round(100 * (msrp-buyprice) / buyprice,1) AS percmarkup
FROM products; */

/* 9. */ 

/* SELECT 'co' || productname AS productname FROM products; */


/* 10. */ 

/* SELECT contactfirstname FROM customers WHERE contactfirstname LIKE 'S%' || '%e%' 
OR contactfirstname LIKE 's%' || '%E%' OR contactfirstname LIKE 's%' || '%e%' OR 
contactfirstname LIKE 'S' || 'E'; */


/* 11. */

/* INSERT INTO employees (employeenumber, lastname, firstname, extension, email, officecode, reportsto, jobtitle) 
    VALUES (2020, 'Yanovich', 'Alan', '(null)' ,'ayanovich@myseneca.ca', 4, 1088, 'Cashier');
    */
    
/* 12. */  

/* SELECT * FROM employees WHERE employeenumber = 2020; */ 

/* 13. */

/* UPDATE employees SET jobtitle = 'Head Cashier' WHERE employeenumber = 2020; */

/* 14. */

/* INSERT INTO employees (employeenumber, lastname, firstname, extension, email, officecode, reportsto, jobtitle) 
    VALUES (1999, 'Smith', 'Don', 'x5789' ,'random@ran.ca', 1, 2020, 'Cashier'); */
    
/* 15. */

/* DELETE FROM employees
WHERE employeenumber = 2020;
    
    --> did not work because there is a child record connected to it, I have an employee
    --> which reports to me.
    
*/

/* 16. */

/* DELETE FROM employees
WHERE employeenumber = 1999;

DELETE FROM employees
WHERE employeenumber = 2020;

 --> It did work, surprisingly, after multiple attemps
 
 */

/* 17. */

/* INSERT ALL
    INTO employees VALUES (2020, 'Yanovich', 'Alan', '(null)' ,'ayanovich@myseneca.ca', 4, 1088, 'Head Cashier')
    INTO employees VALUES (1999, 'Smith', 'Don', 'x5789' ,'random@ran.ca', 1, 1088, 'Cashier')
    SELECT * FROM dual;
*/

/* 18. */
 
 /* DELETE FROM employees 
 WHERE employeenumber = 1999 or employeenumber = 2020; */
 
 
