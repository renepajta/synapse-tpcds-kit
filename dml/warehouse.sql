-- Load table 1 using template warehouse.tpl
TRUNCATE TABLE warehouse;
GO

COPY INTO warehouse
FROM 'DATA_URL/warehouse.dat'
WITH (
       FILE_TYPE = 'CSV'
       ,CREDENTIAL = (IDENTITY = 'Managed Identity'),
       ,FIELDTERMINATOR =  '|'
       ,ROWTERMINATOR='0X0A'
       ,FIRSTROW = 1
       ,ENCODING = 'UTF8' 
);


