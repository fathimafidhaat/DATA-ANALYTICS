USE company_db;
SELECT*FROM supermarket_sales;

#DATA CLEANING
#Check for NULL values
SELECT 
 SUM(invoice_id IS NULL) AS Invoice_ID_nulls,
 SUM(date IS NULL) AS Date_nulls,
 SUM(customer_type IS NULL) AS Customer_Type_nulls,
 SUM(gender IS NULL)AS Gender_nulls,
 SUM(product_category IS NULL)AS Product_category_nulls,
 SUM(unit_price IS NULL)AS Unit_Price_nulls,
 SUM(quantity IS NULL)AS Qunatity_nulls,
 SUM(total_sales IS NULL)AS Total_Sales_nulls,
 SUM(payment_method IS NULL)AS Payment_Method_nulls
FROM supermarket_sales;

#checking for empty values
SELECT
    SUM(customer_type='')AS empty_customer_type,
    SUM(gender='')AS empty_gender,
    SUM(payment_method='')AS empty_payment_method
FROM supermarket_sales;

#check duplicate complete records
SELECT COUNT(*)-COUNT(DISTINCT CONCAT( 
         invoice_id, date, customer_type, gender,
         product_category, unit_price, quantity,
         total_sales,payment_method
))AS duplicate_count
FROM supermarket_sales;

#check unique values in categorical columns
SELECT DISTINCT customer_type
FROM supermarket_sales;

SELECT DISTINCT gender
FROM supermarket_sales;

SELECT DISTINCT product_category
FROM supermarket_sales;

SELECT DISTINCT payment_method
FROM supermarket_sales;

SET SQL_safe_updates=0;

#Handle missing values
UPDATE supermarket_sales
SET customer_type ='Unknown'
WHERE customer_type="";

UPDATE supermarket_sales
SET gender = 'Unknown'
WHERE gender = "" ;

UPDATE supermarket_sales
SET payment_method= 'Unknown'
WHERE payment_method="";

#Final check after cleaning
SELECT
    SUM(customer_type='')AS empty_customer_type,
    SUM(gender='')AS empty_gender,
    SUM(payment_method='')AS empty_payment_method
FROM supermarket_sales;


