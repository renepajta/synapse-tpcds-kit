-- Load table 1 using template catalog_returns.tpl
TRUNCATE TABLE catalog_returns;
GO

COPY INTO catalog_returns
FROM 'DATA_URL/catalog_returns.dat'
WITH (
       FILE_TYPE = 'CSV'
       ,CREDENTIAL = (IDENTITY = 'Managed Identity'),
       ,FIELDTERMINATOR =  '|'
       ,ROWTERMINATOR='0X0A'
       ,FIRSTROW = 1
       ,ENCODING = 'UTF8' 
);


