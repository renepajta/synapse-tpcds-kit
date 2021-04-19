-- Load table 1 using template customer_demographics.tpl
TRUNCATE TABLE customer_demographics;


COPY INTO customer_demographics
FROM 'DATA_URL/customer_demographics/*.dat'
WITH (
       FILE_TYPE = 'CSV'
       ,CREDENTIAL = (IDENTITY = 'Managed Identity')
       ,FIELDTERMINATOR =  '|'
       ,ROWTERMINATOR='0X0A'
       ,FIRSTROW = 1
       ,ENCODING = 'UTF8' 
);


