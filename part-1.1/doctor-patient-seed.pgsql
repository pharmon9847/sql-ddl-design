DROP DATABASE medical_center_db;

CREATE DATABASE medical_center_db;

\c medical_center_db;

CREATE TABLE Doctors (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    phone_number VARCHAR NOT NULL,
    email VARCHAR NOT NULL,
    specialty VARCHAR NOT NULL
);

CREATE TABLE Patients (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    gender VARCHAR NOT NULL,
    primary_doctor INTEGER NOT NULL REFERENCES Doctors,
    birthday DATE NOT NULL,
    insurance VARCHAR NOT NULL
);

CREATE TABLE Visits (
    id SERIAL PRIMARY KEY,
    doctor_id INTEGER NOT NULL REFERENCES Doctors,
    patient_id INTEGER NOT NULL REFERENCES Patients ON DELETE CASCADE,
    visit_date DATE NOT NULL
);

CREATE TABLE Diseases (
    id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL,
    description TEXT NOT NULL
);

CREATE TABLE Diagnoses (
    id SERIAL PRIMARY KEY,
    visit_id INTEGER NOT NULL REFERENCES Visits,
    disease_id INTEGER NOT NULL REFERENCES Diseases,
    patient_id INTEGER NOT NULL REFERENCES Patients ON DELETE CASCADE,
    notes VARCHAR NOT NULL
);

INSERT INTO Doctors (first_name, last_name, phone_number, email, specialty)
VALUES
('Robert', 'Jones', '919-555-6789', 'bobjones@dr.com', 'primary care'),
('Stanley', 'Tucci', '919-555-9876', 'stanleytucci@dr.com', 'OB/GYN'),
('Brad', 'Pitt', '919-555-1234', 'bradpitt@dr.com', 'ENT'),
('Beth', 'Littleton', '919-555-4321', 'bethlittleton@dr.com', 'Dermatology'),
('Sarah', 'McMillan', '919-555-4567', 'sarahmcmillan@dr.com', 'Oncology');

INSERT INTO Patients (first_name, last_name, gender, primary_doctor, birthday, insurance)
VALUES
('Herbert', 'Von Nostren', 'male', 1, '1962-10-01', 'Steal Your Money Insurance Co.'),
('Abercrombie', 'Fitzsimmons', 'female',  2, '1975-04-15', 'Complete Criminals Insurance Co.'),
('Appleby', 'Steinbeck', 'male', 3, '1985-12-27', 'Fraudsters Insurance Co.'),
('Miranda', 'Fitzpatrick', 'female', 4, '1979-03-22', 'Overpriced Insurance Co.'),
('Fernando', 'Guetenburg', 'male', 5, '1955-07-07', 'Complete Waste Insurance Co.');

INSERT INTO Visits (doctor_id, patient_id, visit_date)
VALUES
(1, 1, '2023-04-10'),
(2, 2, '2023-05-05'),
(3, 3, '2023-06-06'),
(4, 4, '2023-07-07'),
(5, 5, '2023-08-08');

INSERT INTO Diseases (name, description)
VALUES
('Terrible-itis', 'This really sucks'),
('Horrible-itis', 'This really, really sucks'),
('Wretched-itis', 'This is really sucky'),
('Miserable-itis', 'This is really, really sucky'),
('The-worst-itis', 'This is the worst');

INSERT INTO Diagnoses (visit_id, disease_id, patient_id, notes)
VALUES
(1, 1, 1, 'Sucks to be you'),
(2, 2, 2,  'Sucks to be you'),
(3, 3, 3, 'Sucks to be you'),
(4, 4, 4, 'Sucks to be you'),
(5, 5, 5,  'Sucks to be you');

