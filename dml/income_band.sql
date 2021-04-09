-- Load table 1 using template income_band.tpl
TRUNCATE TABLE income_band;


COPY INTO income_band
FROM 'DATA_URL/income_band.dat'
WITH (
       FILE_TYPE = 'CSV'
       ,CREDENTIAL = (IDENTITY = 'Managed Identity')
       ,FIELDTERMINATOR =  '|'
       ,ROWTERMINATOR='0X0A'
       ,FIRSTROW = 1
       ,ENCODING = 'UTF8' 
);


