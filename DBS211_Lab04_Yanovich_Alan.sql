/* Alan Yanovich, STD ID: 021278106, Date: Jun 7, DBS211 –Lab 04 */
SET AUTOCOMMIT ON;
/* 1. a)*/
/*
SELECT employeenumber, lastname, firstname, city, phone, postalcode
    FROM employees, offices
    WHERE offices.country = 'France';
*/
    
/* 1. b)*/
/* SELECT employeenumber, lastname, firstname, city, phone, postalcode
    FROM employees LEFT OUTER JOIN offices ON offices.country = 'France';
*/

/* 2. */

/* SELECT customernumber, contactfirstname || '' || contactlastname CustomerName, to_char(paymentdate, 'Mon dd,yyyy') paymentdate, amount
    FROM dual LEFT OUTER JOIN customers RIGHT OUTER JOIN payments USING (customernumber) 
    ON country = 'Canada';
*/

/* 3. */

/* SELECT customernumber, contactfirstname || '' || contactlastname CustomerName
    FROM customers LEFT OUTER JOIN payments USING (customernumber)
    WHERE country = 'USA' AND creditlimit = 0;
*/


/* 4. */

/* CREATE VIEW vwCustomerOrder AS
    SELECT o.customernumber, o.ordernumber, o.orderdate, p.productname, r.quantityordered, r.priceeach
    FROM orders o FULL OUTER JOIN orderdetails r ON o.ordernumber = r.ordernumber
    LEFT OUTER JOIN products p ON p.productcode = r.productcode;
/*
/*
SELECT * FROM vwCustomerOrder;
*/

/* 5. */ --- ????????????
/*CREATE VIEW vwCustomerOrder AS
    SELECT o.customernumber, o.ordernumber, o.orderdate, p.productname, r.quantityordered, r.priceeach, r.orderlinenumber
    FROM orders o FULL OUTER JOIN orderdetails r ON o.ordernumber = r.ordernumber
    LEFT OUTER JOIN products p ON p.productcode = r.productcode;
   
SELECT * FROM vwCustomerOrder
    WHERE customernumber = 124
    ORDER BY ordernumber, orderlinenumber;
 */   
   
/* 6. */  

/*
SELECT customernumber, contactfirstname, contactlastname, phone, creditlimit
FROM customers LEFT OUTER JOIN orders USING (customernumber)
WHERE ordernumber IS NULL;
*/

/* 7. */  

/*
CREATE VIEW vwEmployeeManager AS
    SELECT e.employeenumber, e.lastname, e.firstname, e.extension, e.email, e.officecode, e.reportsto, e.jobtitle, s.lastname ||' '|| s.firstname manager
    FROM employees e FULL OUTER JOIN employees s ON e.reportsto = s.employeenumber;
    
SELECT * FROM vwEmployeeManager
WHERE employeenumber IS NOT NULL;
*/

/* 8. */  

/*
CREATE OR REPLACE VIEW vwEmployeeManager AS
    SELECT e.employeenumber, e.lastname, e.firstname, e.extension, e.email, e.officecode, e.reportsto, e.jobtitle, s.lastname ||' '|| s.firstname manager
    FROM employees e FULL OUTER JOIN employees s ON e.reportsto = s.employeenumber;
    
SELECT * FROM vwEmployeeManager
WHERE reportsto IS NOT NULL;

*/

/* 9. */
/*
DROP VIEW vwEmployeeManager;
DROP VIEW vwCustomerOrder;
*/
