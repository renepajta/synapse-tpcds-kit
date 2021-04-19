-- Load table 1 using template store_returns.tpl
TRUNCATE TABLE store_returns;


COPY INTO store_returns
FROM 'DATA_URL/store_returns/*.dat'
WITH (
       FILE_TYPE = 'CSV'
       ,CREDENTIAL = (IDENTITY = 'Managed Identity')
       ,FIELDTERMINATOR =  '|'
       ,ROWTERMINATOR='0X0A'
       ,FIRSTROW = 1
       ,ENCODING = 'UTF8' 
);


