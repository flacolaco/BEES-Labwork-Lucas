SELECT *
FROM products p
JOIN orderdetails od USING (productCode)
JOIN orders o USING (orderNumber)
JOIN customers c USING (customerNumber)
JOIN employees e ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN offices os USING (officeCode);

SELECT os.officeCode, os.territory AS officeRegion, os.country AS officeCountry, os.state AS officeState, os.city
AS officeCity,
CONCAT(e.firstName,' ', e.lastName) AS employeeFullName, e.jobTitle, e.reportsTo AS lineManager,
c.customerName, c.country AS customerCountry, c.state AS customerState, c.city AS customerCity, c.creditLimit,
o.orderNumber, o.orderDate, o.requiredDate, o.shippedDate, o.status AS orderStatus,
p.productName, p.productLine, p.productScale, p.productVendor, p.quantityInStock, od.quantityOrdered, p.buyPrice 
AS COGS, od.priceEach AS invoicingPrice, p.MSRP,
CASE
WHEN c.country IN ('France', 'Spain', 'Norway', 'Poland', 'Germany', 'Sweden', 'Denmark', 'Portugal', 'Finland', 'UK',
'Ireland', 'Italy', 'Switzerland', 'Netherlands', 'Belgium', 'Austria', 'Russia', 'South Africa', 'Israel') THEN 'EMEA'
WHEN c.country IN ('USA', 'Canada') THEN 'NA'
WHEN c.country IN ('Australia', 'Singapore', 'Japan', 'Hong Kong', 'New Zealand', 'Philippines') THEN 'APAC'
END AS customerRegion
FROM products p
JOIN orderdetails od USING (productCode)
JOIN orders o USING (orderNumber)
JOIN customers c USING (customerNumber)
JOIN employees e ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN offices os USING (officeCode);

SELECT DISTINCT country
FROM customers;

EMEA = France, Norway, Poland, Germany, Sweden, Denmark, Portugal, Finland, UK, Ireland, Italy, Switzerland, Netherlands, Belgium, Austria, Russia, South Africa, Israel
NA = USA, Canada
APAC = Australia, Singapore, Japan, Hong Kong, New Zealand, Philippines;

SELECT country,
CASE
WHEN country IN ('France', 'Spain', 'Norway', 'Poland', 'Germany', 'Sweden', 'Denmark', 'Portugal', 'Finland', 'UK', 'Ireland', 'Italy', 'Switzerland', 'Netherlands', 'Belgium', 'Austria', 'Russia', 'South Africa', 'Israel') THEN 'EMEA'
WHEN country IN ('USA', 'Canada') THEN 'NA'
WHEN country IN ('Australia', 'Singapore', 'Japan', 'Hong Kong', 'New Zealand', 'Philippines') THEN 'APAC'
END AS customerRegion
FROM customers;

SELECT *
FROM orders;