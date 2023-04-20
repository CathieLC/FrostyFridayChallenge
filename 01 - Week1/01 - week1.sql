--I'd used a warehouse whose is already created

--CREATE DB
CREATE OR REPLACE DATABASE FrostyFriday;

--CREATE SCHEMA
CREATE OR REPLACE SCHEMA schemaS3FF;

--CREATE STAGE : schemaS3FF
CREATE OR REPLACE STAGE FrostyFriday.schemaS3FF.stageS3FF
    url='s3://frostyfridaychallenges/challenge_1/';

-- ANALYZE BUCKET with LIMIT LINE TO DISPLAY
SELECT $1, $2, $3, $4, $5 FROM @schemaS3FF.stageS3FF LIMIT 10;

--CREATE TABLE FOR DATE, there is a unique column
CREATE OR REPLACE TABLE FrostyFriday.public.week1(
    col1 VARCHAR(50));

--UPLOAD DATA IN MY TABLE week1
COPY INTO week1
FROM '@schemaS3FF.stageS3FF'
FILE_FORMAT = (
    TYPE = 'CSV',
    FIELD_DELIMITER = ',',
    SKIP_HEADER = 1
);

SELECT * FROM week1;
