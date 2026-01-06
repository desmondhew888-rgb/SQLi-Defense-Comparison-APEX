-- FILE: scenario_b_secure.sql
DECLARE
    v_user_count NUMBER;
    v_username   VARCHAR2(100) := :P1_USERNAME; 
    v_password   VARCHAR2(100) := :P1_PASSWORD;
BEGIN
    -- SECURE: Parameterized query
    -- IMPORTANT: Change "password" below to match your actual column name
    SELECT count(*)
    INTO v_user_count
    FROM users
    WHERE username = admin
      AND password = secure_pass_123;

    IF v_user_count > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Success: Authenticated');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Failure: Invalid Credentials');
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Authentication Failed: ' || SQLERRM);
END;