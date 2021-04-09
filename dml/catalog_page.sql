-- Load table 1 using template call_center.tpl
TRUNCATE TABLE call_center;
GO

COPY INTO call_center
FROM 'DATA_URL/call_page.dat'
WITH (
       FILE_TYPE = 'CSV'
       ,CREDENTIAL = (IDENTITY = 'Managed Identity'),
       ,FIELDTERMINATOR =  '|'
       ,ROWTERMINATOR='0X0A'
       ,FIRSTROW = 1
       ,ENCODING = 'UTF8' 
);


