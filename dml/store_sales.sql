-- Load table 1 using template store_sales.tpl
TRUNCATE TABLE store_sales;


COPY INTO store_sales
FROM 'DATA_URL/store_sales.dat'
WITH (
       FILE_TYPE = 'CSV'
       ,CREDENTIAL = (IDENTITY = 'Managed Identity')
       ,FIELDTERMINATOR =  '|'
       ,ROWTERMINATOR='0X0A'
       ,FIRSTROW = 1
       ,ENCODING = 'UTF8' 
);


