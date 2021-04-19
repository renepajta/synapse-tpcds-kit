-- Load table 1 using template household_demographics.tpl
TRUNCATE TABLE household_demographics;


COPY INTO household_demographics
FROM 'DATA_URL/household_demographics/*.dat'
WITH (
       FILE_TYPE = 'CSV'
       ,CREDENTIAL = (IDENTITY = 'Managed Identity')
       ,FIELDTERMINATOR =  '|'
       ,ROWTERMINATOR='0X0A'
       ,FIRSTROW = 1
       ,ENCODING = 'UTF8' 
);


