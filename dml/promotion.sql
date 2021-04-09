-- Load table 1 using template promotion.tpl
TRUNCATE TABLE promotion;


COPY INTO promotion
FROM 'DATA_URL/promotion.dat'
WITH (
       FILE_TYPE = 'CSV'
       ,CREDENTIAL = (IDENTITY = 'Managed Identity')
       ,FIELDTERMINATOR =  '|'
       ,ROWTERMINATOR='0X0A'
       ,FIRSTROW = 1
       ,ENCODING = 'UTF8' 
);


