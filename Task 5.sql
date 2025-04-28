INSERT INTO Crime_Incidents (dr_no, crm_cd, area, vict_age, vict_sex, vict_descent, premis_cd, status, rpt_dist_no, crm_cd_1, location, lat, lon)
VALUES (999999999, 420, 6, 25, 'M', 'W', 101, 'IC', 1234, 420, 'TEST LOCATION', 34.0522, -118.2437);
UPDATE Victims
SET vict_descent = 'WX'
WHERE vict_age = 25 AND vict_sex = 'M' AND vict_descent = 'W'
RETURNING vict_age, vict_sex, vict_descent;

DELETE FROM Crime_Incidents
WHERE dr_no = '999999999'
RETURNING *;

SELECT ci.dr_no, ct.crm_cd_desc
FROM Crime_Incidents ci
JOIN Crime_Types ct ON ci.crm_cd = ct.crm_cd
LIMIT 10;

SELECT dr_no, vict_age
FROM Crime_Incidents
ORDER BY vict_age DESC
LIMIT 10;

SELECT area, COUNT(*) AS total_crimes
FROM Crime_Incidents
GROUP BY area
ORDER BY total_crimes DESC
LIMIT 10;

SELECT dr_no, vict_age
FROM Crime_Incidents
WHERE vict_age > (SELECT AVG(vict_age) FROM Crime_Incidents)
LIMIT 10;

CREATE OR REPLACE PROCEDURE insert_premises(
    p_premis_cd INT,
    p_premis_desc TEXT
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Premises(premis_cd, premis_desc)
    VALUES (p_premis_cd, p_premis_desc);
END;
$$;

CALL insert_premises(999, 'Test Premises Inserted');

CREATE OR REPLACE PROCEDURE delete_premises(
    p_premis_cd INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM Premises
    WHERE premis_cd = p_premis_cd;
END;
$$;
CALL delete_premises(999);

CREATE OR REPLACE PROCEDURE select_crimes_by_area(
    p_area INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    -- Just raising a notice for the demo
    RAISE NOTICE 'Showing crimes for Area: %', p_area;
END;
$$;

CALL select_crimes_by_area(6);



















