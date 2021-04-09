-- Load table 1 using template customer_address.tpl
TRUNCATE TABLE customer_address;
GO

COPY INTO customer_address
FROM 'DATA_URL/customer_address.dat'
WITH (
       FILE_TYPE = 'CSV'
       ,CREDENTIAL = (IDENTITY = 'Managed Identity'),
       ,FIELDTERMINATOR =  '|'
       ,ROWTERMINATOR='0X0A'
       ,FIRSTROW = 1
       ,ENCODING = 'UTF8' 
);


