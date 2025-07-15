DROP TABLE livelong_chargemaster;
DROP TABLE livelong_facility_info;
DROP TABLE livelong_healthcare_claims;

CREATE TABLE livelong_chargemaster( 
	diagnosis_code CHAR(7) PRIMARY KEY NOT NULL,
	diagnosis_description varchar(100),
	expected_avg_cost NUMERIC(7,2),
	expected_reimb_pct NUMERIC(3,2)	
);


CREATE TABLE livelong_facility_info( 
	facility_id VARCHAR(30) PRIMARY KEY NOT NULL,
	city VARCHAR(30),
	bed_count INTEGER,
	teaching_hospital VARCHAR(5) CHECK (teaching_hospital IN ('Yes','No'))
);

SELECT * FROM livelong_facility_info;
SELECT COUNT(*) FROM livelong_facility_info;

CREATE TABLE livelong_healthcare_claims( 
	claim_id INTEGER PRIMARY KEY NOT NULL,
	facility_id VARCHAR(30) REFERENCES livelong_facility_info(facility_id),
	diagnosis_code CHAR(7) REFERENCES livelong_diagnosis_reference(diagnosis_code),
	payer VARCHAR(20) CHECK (payer IN ('Other','Private','Medicaid','Self-pay','Medicare')),
	service_type VARCHAR(20) CHECK(service_type IN('Emergency','Inpatient','Outpatient')),
	billed_amount NUMERIC(9,2),
	reimbursed_amount NUMERIC(9,2),
	length_of_stay INTEGER,
	service_date DATE
);

SELECT * FROM livelong_healthcare_claims;
SELECT COUNT(*) FROM livelong_healthcare_claims;

ALTER TABLE livelong_diagnosis_reference
RENAME TO livelong_chargemaster;

