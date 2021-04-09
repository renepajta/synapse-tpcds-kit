-- Load table 1 using template ship_mode.tpl
TRUNCATE TABLE ship_mode;
GO

COPY INTO ship_mode
FROM 'DATA_URL/ship_mode.dat'
WITH (
       FILE_TYPE = 'CSV'
       ,CREDENTIAL = (IDENTITY = 'Managed Identity'),
       ,FIELDTERMINATOR =  '|'
       ,ROWTERMINATOR='0X0A'
       ,FIRSTROW = 1
       ,ENCODING = 'UTF8' 
);


