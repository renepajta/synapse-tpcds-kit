-- Load table 1 using template inventory.tpl
TRUNCATE TABLE inventory;


COPY INTO inventory
FROM 'DATA_URL/inventory/*.dat'
WITH (
       FILE_TYPE = 'CSV'
       ,CREDENTIAL = (IDENTITY = 'Managed Identity')
       ,FIELDTERMINATOR =  '|'
       ,ROWTERMINATOR='0X0A'
       ,FIRSTROW = 1
       ,ENCODING = 'UTF8' 
);


