CREATE TABLE audit_log (
    log_id SERIAL PRIMARY KEY,
    action TEXT,
    employee_id BIGINT,
    action_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE FUNCTION insert_into_audit_log()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO audit_log (action, employee_id, action_time)
    VALUES ('INSERT', NEW.dr_no::BIGINT, NOW());  
    RETURN NEW;
END;
$$;

CREATE TRIGGER after_crime_insert
AFTER INSERT ON crime_incidents
FOR EACH ROW
EXECUTE FUNCTION insert_into_audit_log();

INSERT INTO crime_incidents (dr_no, crm_cd, area, vict_age, vict_sex, vict_descent, premis_cd, status, rpt_dist_no, crm_cd_1, location, lat, lon)
VALUES ('888888887', 420, 6, 25, 'M', 'W', 101, 'IC', 1234, 420, 'TEST LOCATION FINAL FINAL', 34.0522, -118.2437);

SELECT * FROM audit_log;
















































