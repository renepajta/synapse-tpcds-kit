-- Load table 1 using template reason.tpl
TRUNCATE TABLE reason;
GO

COPY INTO reason
FROM 'DATA_URL/reason.dat'
WITH (
       FILE_TYPE = 'CSV'
       ,CREDENTIAL = (IDENTITY = 'Managed Identity'),
       ,FIELDTERMINATOR =  '|'
       ,ROWTERMINATOR='0X0A'
       ,FIRSTROW = 1
       ,ENCODING = 'UTF8' 
);


