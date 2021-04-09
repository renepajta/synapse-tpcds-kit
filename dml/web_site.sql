-- Load table 1 using template web_site.tpl
TRUNCATE TABLE web_site;


COPY INTO web_site
FROM 'DATA_URL/web_site.dat'
WITH (
       FILE_TYPE = 'CSV'
       ,CREDENTIAL = (IDENTITY = 'Managed Identity')
       ,FIELDTERMINATOR =  '|'
       ,ROWTERMINATOR='0X0A'
       ,FIRSTROW = 1
       ,ENCODING = 'UTF8' 
);


