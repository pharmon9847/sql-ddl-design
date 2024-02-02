CREATE TABLE "visits"(
    "id" BIGINT NOT NULL,
    "doctor_id" BIGINT NOT NULL,
    "patient_id" BIGINT NOT NULL,
    "date" DATE NOT NULL
);
ALTER TABLE
    "visits" ADD PRIMARY KEY("id");
CREATE TABLE "diseases"(
    "id" BIGINT NOT NULL,
    "name" TEXT NOT NULL,
    "desription" BIGINT NOT NULL
);
ALTER TABLE
    "diseases" ADD PRIMARY KEY("id");
CREATE TABLE "patients"(
    "id" BIGINT NOT NULL,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "primary_doctor" BIGINT NOT NULL,
    "birthday" DATE NOT NULL,
    "insurance" TEXT NOT NULL
);
ALTER TABLE
    "patients" ADD PRIMARY KEY("id");
CREATE TABLE "Doctors"(
    "id" BIGINT NOT NULL,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "phone_number" BIGINT NOT NULL,
    "email" TEXT NOT NULL,
    "specialty" TEXT NOT NULL
);
ALTER TABLE
    "Doctors" ADD PRIMARY KEY("id");
CREATE TABLE "diagnoses"(
    "id" BIGINT NOT NULL,
    "visit_id" BIGINT NOT NULL,
    "disease_id" BIGINT NOT NULL,
    "notes" TEXT NOT NULL
);
ALTER TABLE
    "diagnoses" ADD PRIMARY KEY("id");
ALTER TABLE
    "visits" ADD CONSTRAINT "visits_patient_id_foreign" FOREIGN KEY("patient_id") REFERENCES "patients"("id");
ALTER TABLE
    "visits" ADD CONSTRAINT "visits_doctor_id_foreign" FOREIGN KEY("doctor_id") REFERENCES "Doctors"("id");
ALTER TABLE
    "diagnoses" ADD CONSTRAINT "diagnoses_disease_id_foreign" FOREIGN KEY("disease_id") REFERENCES "diseases"("id");
ALTER TABLE
    "diagnoses" ADD CONSTRAINT "diagnoses_visit_id_foreign" FOREIGN KEY("visit_id") REFERENCES "visits"("id");