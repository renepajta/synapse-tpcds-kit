-- Load table 1 using template catalog_sales.tpl
TRUNCATE TABLE catalog_sales;


COPY INTO catalog_sales
FROM 'DATA_URL/catalog_sales.dat'
WITH (
       FILE_TYPE = 'CSV'
       ,CREDENTIAL = (IDENTITY = 'Managed Identity')
       ,FIELDTERMINATOR =  '|'
       ,ROWTERMINATOR='0X0A'
       ,FIRSTROW = 1
       ,ENCODING = 'UTF8' 
);


