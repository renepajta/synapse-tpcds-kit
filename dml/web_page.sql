-- Load table 1 using template web_page.tpl
TRUNCATE TABLE web_page;


COPY INTO web_page
FROM 'DATA_URL/web_page/*.dat'
WITH (
       FILE_TYPE = 'CSV'
       ,CREDENTIAL = (IDENTITY = 'Managed Identity')
       ,FIELDTERMINATOR =  '|'
       ,ROWTERMINATOR='0X0A'
       ,FIRSTROW = 1
       ,ENCODING = 'UTF8' 
);


