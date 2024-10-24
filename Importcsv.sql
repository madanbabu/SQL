-- Create a new database if it doesn't exist
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'NewDB')
BEGIN
    CREATE DATABASE NewDB;
END

-- Switch to the new database
USE NewDB;

-- Create a new table to hold the imported data
CREATE TABLE ImportedData (
    Column1 INT,
    Column2 VARCHAR(50),
    -- Add more columns as needed
);

-- Use OPENROWSET to import the CSV file
INSERT INTO ImportedData
SELECT *
FROM OPENROWSET('MicrosoftAccess.Text', 'Text;FMT=Delimited(;HDR=YES;IMEX=1)', 'C:\temp\YourFileName.csv');

-- Verify the import
SELECT * FROM ImportedData;
