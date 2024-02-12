-- Creating dim_groups table

CREATE TABLE training_data.dim_groups 
(
	group_id	BIGSERIAL	PRIMARY KEY,
	group_member 	INTEGER		NOT NULL,
	creation_year 	INTEGER		DEFAULT EXTRACT(YEAR FROM current_date) NOT NULL,
	disband_year 	INTEGER	
);


-- Adding values to the dim_groups table

INSERT INTO training_data.dim_groups (group_member)
VALUES (101);


SELECT	* 
FROM	training_data.dim_groups;


-- Creating dim_trainees table

CREATE TABLE training_data.dim_trainees
(
	trainee_id		BIGSERIAL	PRIMARY KEY,
	group_id		BIGINT		NOT NULL REFERENCES training_data.dim_groups,
	first_name		TEXT		NOT NULL,
	last_name		TEXT		NOT NULL,
	full_name		TEXT 		GENERATED ALWAYS AS (first_name || ' ' || last_name) STORED NOT NULL,
	birth_date		DATE		NOT NULL,
	enrollment_year		INTEGER		DEFAULT EXTRACT (YEAR FROM CURRENT_DATE) NOT NULL,
	graduation_year		INTEGER
);


-- Populating dim_trainees table

INSERT INTO training_data.dim_trainees (group_id, first_name, last_name, birth_date)
VALUES	
(	
	1,
	'John',
	'Doe',
	'1993-03-02'::DATE
);
		
SELECT	* 
FROM	training_data.dim_trainees;

ALTER TABLE training_data.dim_trainees -- Adding education column
ADD COLUMN	education TEXT;


ALTER TABLE training_data.dim_trainees -- Adding a CHECK constraint
ADD CHECK (education IN ('completed', 'incomplete'));


UPDATE training_data.dim_trainees 
SET education = 'completed'
WHERE group_id = 1;
