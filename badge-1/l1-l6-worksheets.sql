select * from vegetable_details;

select * from vegetable_details
where plant_name='Spinach';

select * from vegetable_details
where plant_name='Spinach'
and root_depth_code='D';

delete from vegetable_details
where plant_name='Spinach'
and root_depth_code='D';

select * from vegetable_details;


create file format garden_plants.veggies.PIPECOLSEP_ONEHEADROW 
    TYPE = 'CSV'--csv is used for any flat file (tsv, pipe-separated, etc)
    FIELD_DELIMITER = '|' --pipes as column separators
    SKIP_HEADER = 1 --one header row to skip
    ;

create file format garden_plants.veggies.COMMASEP_DBLQUOT_ONEHEADROW 
    TYPE = 'CSV'--csv for comma separated files
    SKIP_HEADER = 1 --one header row  
    FIELD_OPTIONALLY_ENCLOSED_BY = '"' --this means that some values will be wrapped in double-quotes bc they have commas in them


SELECT
  *
FROM
  VEGETABLE_DETAILS
ORDER BY PLANT_NAME
DESC
LIMIT 10;


create table garden_plants.veggies.vegetable_details
(
plant_name varchar(25)
, root_depth_code varchar(1)    
);


--THESE ARE JUST EXAMPLES YOU SHOULD NOT RUN THIS CODE WITHOUT EDITING IT FOR YOUR NEEDS

--To add more than one row at a time
insert into root_depth (root_depth_id, root_depth_code
                        , root_depth_name, unit_of_measure
                        , range_min, range_max)  
values
 (5,'X','short','in',66,77)
,(8,'Y','tall','cm',98,99)
;

-- To remove a row you do not want in the table
delete from root_depth
where root_depth_id = 9;

--To change a value in a column for one particular row
update root_depth
set root_depth_id = 7
where root_depth_id = 9;

--To remove all the rows and start over
truncate table root_depth;


USE WAREHOUSE COMPUTE_WH;

INSERT INTO ROOT_DEPTH (
	ROOT_DEPTH_ID ,
	ROOT_DEPTH_CODE ,
	ROOT_DEPTH_NAME ,
	UNIT_OF_MEASURE ,
	RANGE_MIN ,
	RANGE_MAX 
)

VALUES
(
    1,
    'S',
    'Shallow',
    'cm',
    30,
    45
)
;

SELECT * FROM ROOT_DEPTH LIMIT 1;


INSERT INTO ROOT_DEPTH (
	ROOT_DEPTH_ID ,
	ROOT_DEPTH_CODE ,
	ROOT_DEPTH_NAME ,
	UNIT_OF_MEASURE ,
	RANGE_MIN ,
	RANGE_MAX 
)

VALUES
    (2,'M','Medium','cm',45,60),
    (3,'D','Deep','cm',60,90)
;

SELECT * FROM ROOT_DEPTH;


use role sysadmin;
create or replace table GARDEN_PLANTS.VEGGIES.ROOT_DEPTH (
   ROOT_DEPTH_ID number(1), 
   ROOT_DEPTH_CODE text(1), 
   ROOT_DEPTH_NAME text(7), 
   UNIT_OF_MEASURE text(2),
   RANGE_MIN number(2),
   RANGE_MAX number(2)
   ); 


select 'hello';
select 'hello' as "Greetings";
select 'hello' as "Greetings";

show databases;
show schemas;
show schemas in account;
