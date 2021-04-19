-- Load table 1 using template date_dim.tpl
TRUNCATE TABLE date_dim;


COPY INTO date_dim
FROM 'DATA_URL/date_dim/*.dat'
WITH (
       FILE_TYPE = 'CSV'
       ,CREDENTIAL = (IDENTITY = 'Managed Identity')
       ,FIELDTERMINATOR =  '|'
       ,ROWTERMINATOR='0X0A'
       ,FIRSTROW = 1
       ,ENCODING = 'UTF8' 
);


