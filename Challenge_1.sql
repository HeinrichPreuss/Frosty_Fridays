create or replace stage frosty_friday_1
url='s3://frostyfridaychallenges/challenge_1/';

List @frosty_friday_1;

create file format Variant_Format
TYPE='CSV',FIELD_DELIMITER=none;

select $1,METADATA$FILENAME from @frosty_friday_1 (file_format=>'VARIANT_FORMAT');

create or replace table CSVWeek1 (
COLUMN1 TEXT,
FROM_FILE TEXT);

COPY INTO csvweek1
FROM 
(SELECT $1, METADATA$FILENAME FROM @frosty_friday_1)
FILE_FORMAT='VARIANT_FORMAT';

Select * from csvweek1;
