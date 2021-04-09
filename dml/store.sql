-- Load table 1 using template store.tpl
TRUNCATE TABLE store;
GO

COPY INTO store
FROM 'DATA_URL/store.dat'
WITH (
       FILE_TYPE = 'CSV'
       ,CREDENTIAL = (IDENTITY = 'Managed Identity'),
       ,FIELDTERMINATOR =  '|'
       ,ROWTERMINATOR='0X0A'
       ,FIRSTROW = 1
       ,ENCODING = 'UTF8' 
);


