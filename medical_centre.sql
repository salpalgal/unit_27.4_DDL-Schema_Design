
DROP DATABASE IF EXISTS medical_centre;

CREATE DATABASE medical_centre;

\c medical_centre

CREATE TABLE doctors
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

INSERT INTO doctors
(first_name, last_name)
VALUES
('Sam','Smith'),
('Vera','Tang'),
('Morse','Mode');

CREATE TABLE patients
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

INSERT INTO patients
(first_name, last_name)
VALUES
('Din','Sine'),
('Matt','Mine'),
('Pratt','Hat'),
('Maddy','Paddy'),
('Wendy','Times'),
('Lora','Peters');

CREATE TABLE diagnoses
(   
    id SERIAL PRIMARY KEY,
    disease TEXT NOT NULL
);

INSERT INTO diagnoses 
(disease)
VALUES
('Chest Cold'),
('Common Cold'),
('Ear Infection'),
('Sinus Infection'),
('Sore Throat');

CREATE TABLE doctors_patients
(
    id SERIAL PRIMARY KEY,
    doctor_id INTEGER REFERENCES doctors ON DELETE CASCADE,
    patient_id INTEGER REFERENCES patients ON DELETE CASCADE
);

INSERT INTO doctors_patients
(doctor_id, patient_id)
VALUES
(1,1),
(1,2),
(1,3),
(2,4),
(3,5),
(3,6);

CREATE TABLE patients_diagnoses
(
    id SERIAL PRIMARY KEY,
    patient_id INTEGER REFERENCES patients ON DELETE CASCADE,
    diagnose_id INTEGER REFERENCES diagnoses ON DELETE CASCADE
);

INSERT INTO patients_diagnoses
(patient_id, diagnose_id)
VALUES
(1,2),
(1,5),
(2,3),
(3,4),
(3,1),
(4,2),
(5,3),
(6,5),
(6,5);
