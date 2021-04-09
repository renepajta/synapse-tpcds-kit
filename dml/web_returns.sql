-- Load table 1 using template web_returns.tpl
TRUNCATE TABLE web_returns;


COPY INTO web_returns
FROM 'DATA_URL/web_returns.dat'
WITH (
       FILE_TYPE = 'CSV'
       ,CREDENTIAL = (IDENTITY = 'Managed Identity')
       ,FIELDTERMINATOR =  '|'
       ,ROWTERMINATOR='0X0A'
       ,FIRSTROW = 1
       ,ENCODING = 'UTF8' 
);


