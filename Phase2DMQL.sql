CREATE TABLE Crime_Incidents (
    DR_NO VARCHAR PRIMARY KEY,
    Crm_Cd INT,
    AREA INT,
    Vict_Age INT,
    Vict_Sex VARCHAR(10),
    Vict_Descent VARCHAR(10),
    Premis_Cd INT,
    Status VARCHAR(10),
    Rpt_Dist_No INT,
    Crm_Cd_1 INT,
    LOCATION TEXT,
    LAT FLOAT,
    LON FLOAT
);

CREATE TABLE Crime_Types (
    Crm_Cd INT PRIMARY KEY,
    Crm_Cd_Desc TEXT
);

CREATE TABLE Areas (
    AREA INT PRIMARY KEY,
    AREA_NAME TEXT
);

CREATE TABLE Victims (
    Vict_Age INT,
    Vict_Sex VARCHAR(10),
    Vict_Descent VARCHAR(10),
    PRIMARY KEY (Vict_Age, Vict_Sex, Vict_Descent)
);

CREATE TABLE Premises (
    Premis_Cd INT PRIMARY KEY,
    Premis_Desc TEXT
);

CREATE TABLE Crime_Status (
    Status VARCHAR(10) PRIMARY KEY,
    Status_Desc TEXT
);

CREATE TABLE Mocodes (
    DR_NO VARCHAR PRIMARY KEY,
    Mocodes TEXT
);

CREATE TABLE Crime_Locations (
    LOCATION TEXT PRIMARY KEY,
    Cross_Street TEXT,
    LAT FLOAT,
    LON FLOAT
);

CREATE TABLE Reporting_Districts (
    Rpt_Dist_No INT PRIMARY KEY,
    AREA INT,
    FOREIGN KEY (AREA) REFERENCES Areas(AREA)
);

CREATE TABLE Date_Time (
    DR_NO VARCHAR PRIMARY KEY,
    Date_Rptd DATE,
    DATE_OCC DATE,
    TIME_OCC VARCHAR(10),
    FOREIGN KEY (DR_NO) REFERENCES Crime_Incidents(DR_NO)
);

CREATE TABLE Crime_Classifications (
    Part_1_2 INT,
    Crm_Cd INT,
    PRIMARY KEY (Part_1_2, Crm_Cd),
    FOREIGN KEY (Crm_Cd) REFERENCES Crime_Types(Crm_Cd)
);


SELECT * FROM Crime_Incidents;
-- COPY Crime_Incidents FROM '/Users/rajashree/Downloads/Crime_Incidents.csv' WITH CSV HEADER;
\copy Crime_Types FROM '/Users/rajashree/Downloads/Crime_Types.csv' WITH CSV HEADER;
-- \copy Areas FROM '/Users/rajashree/Downloads/Areas.csv' WITH CSV HEADER;
-- \copy Victims FROM '/Users/rajashree/Downloads/Victims.csv' WITH CSV HEADER;
-- \copy Premises FROM '/Users/rajashree/Downloads/Premises.csv' WITH CSV HEADER;
-- \copy Crime_Status FROM '/Users/rajashree/Downloads/Crime_Status.csv' WITH CSV HEADER;
-- \copy Mocodes FROM '/Users/rajashree/Downloads/Mocodes.csv' WITH CSV HEADER;
-- \copy Crime_Locations FROM '/Users/rajashree/Downloads/Crime_Locations.csv' WITH CSV HEADER;
-- \copy Reporting_Districts FROM '/Users/rajashree/Downloads/Reporting_Districts.csv' WITH CSV HEADER;
-- \copy Date_Time FROM '/Users/rajashree/Downloads/Date_Time.csv' WITH CSV HEADER;
-- \copy Crime_Classifications FROM '/Users/rajashree/Downloads/Crime_Classifications.csv' WITH CSV HEADER;














