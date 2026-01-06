-- FILE: scenario_a_vulnerable.sql
-- Description: Insecure login logic using string concatenation.
-- Findings: This method allows administrative bypass and causes syntax errors.

DECLARE
    v_user_count NUMBER;
    v_username   VARCHAR2(100) := :P1_USERNAME; -- User input from APEX item
    v_password   VARCHAR2(100) := :P1_PASSWORD;
    v_sql        VARCHAR2(1000);
BEGIN
    -- VULNERABLE: Direct concatenation of user input into the SQL command
    v_sql := 'SELECT count(*) FROM users WHERE username = ''' || v_username || 
             ''' AND password = ''' || v_password || '''';
    
    -- Execution fails to distinguish between data and command logic
    EXECUTE IMMEDIATE v_sql INTO v_user_count;

    IF v_user_count > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Success: Authenticated');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Failure: Invalid Credentials');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        -- Malformed data (like a single quote) triggers an ORA-01756 error here
        DBMS_OUTPUT.PUT_LINE('Database Error: ' || SQLERRM);
END;