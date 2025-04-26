/* Problematic Query1 */
EXPLAIN ANALYZE
SELECT ci.DR_NO, ct.Crm_Cd_Desc, a.AREA_NAME
FROM Crime_Incidents ci
JOIN Crime_Types ct ON ci.Crm_Cd = ct.Crm_Cd
JOIN Areas a ON ci.AREA = a.AREA
WHERE a.AREA_NAME = 'Hollywood' AND ct.Crm_Cd_Desc LIKE '%BURGLARY%';

/* Solution using Indexing */
CREATE INDEX idx_area_name ON Areas (AREA_NAME);
CREATE INDEX idx_crm_cd_desc ON Crime_Types (Crm_Cd_Desc text_pattern_ops);

EXPLAIN ANALYZE
SELECT ci.DR_NO, ct.Crm_Cd_Desc, a.AREA_NAME
FROM Crime_Incidents ci
JOIN Crime_Types ct ON ci.Crm_Cd = ct.Crm_Cd
JOIN Areas a ON ci.AREA = a.AREA
WHERE a.AREA_NAME = 'Hollywood' AND ct.Crm_Cd_Desc LIKE '%BURGLARY%';

/* Problematic Query2 */
EXPLAIN ANALYZE
SELECT DR_NO, LAT, LON
FROM Crime_Incidents
WHERE LAT BETWEEN 34.05 AND 34.10
AND LON BETWEEN -118.30 AND -118.20;

/* Solution using Indexing */
CREATE INDEX idx_lat_lon ON Crime_Incidents (LAT, LON);


EXPLAIN ANALYZE
SELECT DR_NO, LAT, LON
FROM Crime_Incidents
WHERE LAT BETWEEN 34.05 AND 34.10
AND LON BETWEEN -118.30 AND -118.20;

/* Problematic Query3 */
EXPLAIN ANALYZE
SELECT ct.Crm_Cd_Desc, COUNT(*) AS total_crimes
FROM Crime_Incidents ci
JOIN Crime_Types ct ON ci.Crm_Cd = ct.Crm_Cd
JOIN Areas a ON ci.AREA = a.AREA
WHERE a.AREA_NAME = 'Downtown'
GROUP BY ct.Crm_Cd_Desc
ORDER BY total_crimes DESC
LIMIT 5;



/* Solution using Indexing */
CREATE INDEX idx_crime_incidents_area ON Crime_Incidents(AREA);
CREATE INDEX idx_crime_types_crmcd ON Crime_Types(Crm_Cd);


EXPLAIN ANALYZE
SELECT ct.Crm_Cd_Desc, COUNT(*) AS total_crimes
FROM Crime_Incidents ci
JOIN Crime_Types ct ON ci.Crm_Cd = ct.Crm_Cd
JOIN Areas a ON ci.AREA = a.AREA
WHERE a.AREA_NAME = 'Downtown'
GROUP BY ct.Crm_Cd_Desc
ORDER BY total_crimes DESC
LIMIT 5;

