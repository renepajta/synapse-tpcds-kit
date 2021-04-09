-- Load table 1 using template web_sales.tpl
TRUNCATE TABLE web_sales;
GO

COPY INTO web_sales
FROM 'DATA_URL/web_sales_.dat'
WITH (
       FILE_TYPE = 'CSV'
       ,CREDENTIAL = (IDENTITY = 'Managed Identity'),
       ,FIELDTERMINATOR =  '|'
       ,ROWTERMINATOR='0X0A'
       ,FIRSTROW = 1
       ,ENCODING = 'UTF8' 
);


