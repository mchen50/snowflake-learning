list @LIKE_A_WINDOW_INTO_AN_S3_BUCKET;
list @LIKE_A_WINDOW_INTO_AN_S3_BUCKET/this_;
list @LIKE_A_WINDOW_INTO_AN_S3_BUCKET/THIS_;

create or replace table vegetable_details_soil_type
( plant_name varchar(25)
 ,soil_type number(1,0)
);

copy into vegetable_details_soil_type
from @util_db.public.like_a_window_into_an_s3_bucket
files = ( 'VEG_NAME_TO_SOIL_TYPE_PIPE.txt')
file_format = ( format_name=GARDEN_PLANTS.VEGGIES.PIPECOLSEP_ONEHEADROW );


select row_count 
from GARDEN_PLANTS.INFORMATION_SCHEMA.TABLES 
where table_name = 'VEGETABLE_DETAILS_SOIL_TYPE';

select * from vegetable_details_soil_type limit 10;


--The data in the file, with no FILE FORMAT specified
select $1
from @util_db.public.like_a_window_into_an_s3_bucket/LU_SOIL_TYPE.tsv;

--Same file but with one of the file formats we created earlier  
select $1, $2, $3
from @util_db.public.like_a_window_into_an_s3_bucket/LU_SOIL_TYPE.tsv
(file_format => garden_plants.veggies.COMMASEP_DBLQUOT_ONEHEADROW);

--Same file but with the other file format we created earlier
select $1, $2, $3
from @util_db.public.like_a_window_into_an_s3_bucket/LU_SOIL_TYPE.tsv
(file_format => garden_plants.veggies.PIPECOLSEP_ONEHEADROW );

-- Create L8 file format that works
create or replace file format garden_plants.veggies.L8_CHALLENGE_FF 
    TYPE = 'CSV'
    FIELD_DELIMITER = '\t'
    SKIP_HEADER = 1
    ;

select $1, $2, $3
from @util_db.public.like_a_window_into_an_s3_bucket/LU_SOIL_TYPE.tsv
(file_format => garden_plants.veggies.L8_CHALLENGE_FF);

create or replace table LU_SOIL_TYPE(
SOIL_TYPE_ID number,	
SOIL_TYPE varchar(15),
SOIL_DESCRIPTION varchar(75)
 );

copy into LU_SOIL_TYPE
from @util_db.public.like_a_window_into_an_s3_bucket
files = ( 'LU_SOIL_TYPE.tsv')
file_format = ( format_name=GARDEN_PLANTS.VEGGIES.L8_CHALLENGE_FF );

select * from LU_SOIL_TYPE;


create or replace table GARDEN_PLANTS.VEGGIES.VEGETABLE_DETAILS_PLANT_HEIGHT(
PLANT_NAME varchar(25),
UOM varchar(1),	
LOW_END_OF_RANGE number(2),
HIGH_END_OF_RANGE number(2)
 );

copy into GARDEN_PLANTS.VEGGIES.VEGETABLE_DETAILS_PLANT_HEIGHT
from @util_db.public.like_a_window_into_an_s3_bucket
files = ( 'veg_plant_height.csv')
file_format = ( format_name=GARDEN_PLANTS.VEGGIES.COMMASEP_DBLQUOT_ONEHEADROW );

select * from GARDEN_PLANTS.VEGGIES.VEGETABLE_DETAILS_PLANT_HEIGHT;


create or replace external function util_db.public.greeting(
      email varchar
    , firstname varchar
    , middlename varchar
    , lastname varchar)
returns variant
api_integration = dora_api_integration
context_headers = (current_timestamp,current_account, current_statement) 
as 'https://awy6hshxy4.execute-api.us-west-2.amazonaws.com/dev/edu_dora/greeting'
;

-- PLEASE EDIT THIS TO PUT YOUR EMAIL, FIRST, MIDDLE, & LAST NAMES 
--(remove the angle brackets and put single quotes around each value)
select util_db.public.greeting('saicmsaicm@gmail.com', 'Ming', '', 'Chen');