-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/

CREATE TABLE "Incident_Data" (
    "Incident_ID" INT   NOT NULL,
    "Company" VARCHAR(100)   NOT NULL,
    "Incident_Date" DATE   NOT NULL,
    "Ride_Name" VARCHAR(100)   NOT NULL,
    "Theme_Park" VARCHAR(100)   NOT NULL,
    "Age" INT   NOT NULL,
    "Gender" VARCHAR(1)   NOT NULL,
    "Description" VARCHAR(255)   NOT NULL,
    "Pre_Existing_Condition" VARCHAR(1)   NOT NULL,
    "Passed_Away" VARCHAR(1)   NOT NULL,
    "Before_During_After" VARCHAR(100)   NOT NULL,
    CONSTRAINT "pk_Incident_Data" PRIMARY KEY (
        "Incident_ID"
     )
);

CREATE TABLE "Lat_and_Long" (
    "Ride_Name" VARCHAR(100)   NOT NULL,
    "Lat_Long" VARCHAR(100)   NOT NULL,
    "Lat" FLOAT   NOT NULL,
    "Long" FLOAT   NOT NULL,
    CONSTRAINT "pk_Lat_and_Long" PRIMARY KEY (
        "Ride_Name"
     )
);

ALTER TABLE "Incident_Data" ADD CONSTRAINT "fk_Incident_Data_Ride_Name" FOREIGN KEY("Ride_Name")
REFERENCES "Lat_and_Long" ("Ride_Name");

DROP TABLE "Incident_Data";
DROP TABLE "Lat_and_Long";

CREATE TABLE "Combined_Data" AS
SELECT i."Incident_ID", i."Company", i."Incident_Date", i."Ride_Name", i."Theme_Park", i."Age", i."Gender", i."Description", i."Pre_Existing_Condition", i."Passed_Away", i."Before_During_After", l."Lat_Long", l."Lat", l."Long"
FROM "Lat_and_Long" l
JOIN "Incident_Data" i ON i."Ride_Name" = l."Ride_Name";