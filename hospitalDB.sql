CREATE SCHEMA hospital;

CREATE TABLE hospital.Patient (
    patient_id SERIAL PRIMARY KEY ,
    patient_name VARCHAR(50)  NOT NULL ,
    dob          DATE         NOT NULL ,
    gender        VARCHAR(10) CHECK (gender IN ('MALE', 'FEMALE', 'OTHER')),
    address      VARCHAR(150),
    phone_number VARCHAR(20),
    insurance_number VARCHAR(50)
);
CREATE TABLE hospital.departments (
     department_id SERIAL PRIMARY KEY,
     department_name VARCHAR(100) NOT NULL UNIQUE,
     head_of_department VARCHAR(100),
     phone_number VARCHAR(20),
     location VARCHAR(100)
);

CREATE TABLE hospital.doctor(
    doctor_id    SERIAL PRIMARY KEY,
    full_name    VARCHAR(100) NOT NULL,
    dob DATE,
    gender       VARCHAR(10) CHECK (gender IN ('MALE', 'FEMALE', 'OTHER')),
    specialization VARCHAR(100),
    phone_number VARCHAR(20),
    email        VARCHAR(100) UNIQUE,
    department_id  INT   REFERENCES hospital.departments(department_id)
);
CREATE TABLE hospital.medical_records(
   record_id SERIAL PRIMARY KEY,
   examination_datetime DATE,
   symptoms TEXT,
   conclusion TEXT,
   patient_id INT NOT NULL REFERENCES hospital.Patient(patient_id),
   doctor_id INT REFERENCES hospital.doctor(doctor_id),
   department_id INT REFERENCES hospital.departments(department_id)
)
