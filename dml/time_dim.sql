-- Load table 1 using template time_dim.tpl
TRUNCATE TABLE time_dim;


COPY INTO time_dim
FROM 'DATA_URL/time_dim/*.dat'
WITH (
       FILE_TYPE = 'CSV'
       ,CREDENTIAL = (IDENTITY = 'Managed Identity')
       ,FIELDTERMINATOR =  '|'
       ,ROWTERMINATOR='0X0A'
       ,FIRSTROW = 1
       ,ENCODING = 'UTF8' 
);


