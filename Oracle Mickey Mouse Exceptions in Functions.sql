--exceptions in functions
--get edates from same tables as above using sname

CREATE OR REPLACE FUNCTION fn_get_edate1 (
    p_sname VARCHAR2
) RETURN DATE AS
    v_edate DATE;
BEGIN
    SELECT
        edate
    INTO v_edate
    FROM
        mm_student
    WHERE
        sname = p_sname;

    RETURN v_edate;
END fn_get_edate1;
/

SHOW ERRORS;

--WHAT IS THERE IS NO STUDENT RECORD WE ARE LOOKING FOR???
CREATE OR replace FUNCTION fn_get_edate2 (
    p_sname VARCHAR2
) RETURN DATE AS
    v_edate   DATE;
    v_count   NUMBER(1);
BEGIN SELECT
          nvl(COUNT(sid), 0)
      INTO v_count
      FROM
          mm_student
      WHERE
          sname = p_sname; IF v_count = 1 THEN
    SELECT
        edate
    INTO v_edate
    FROM
        mm_student
    WHERE
        lower(sname) = lower(p_sname);
    ELSE
        IF v_count = 0 THEN
            v_edate := TO_DATE('31-12-9999', 'dd-mm-yyyy');
        ELSE
            v_edate := TO_DATE('01-01-0001', 'dd-mm-yyyy');
        END IF;
        RETURN v_edate;
END fn_get_edate2;
/
SHOW ERRORS;

--another example

CREATE OR REPLACE FUNCTION fn_get_edate3 (
    p_sname VARCHAR2
) RETURN DATE AS
    v_edate DATE;
BEGIN
    SELECT
        edate
    INTO v_edate
    FROM
        mm_student
    WHERE
        lower(sname) = lower(p_sname);

    RETURN v - edate;
EXCEPTION
    WHEN no_date_found THEN
        RETURN TO_DATE('21-12-9999', 'dd-mm-yyyy');
    WHEN too_many_rows THEN
        RETURN TO_DATE('01-01-0001', 'dd-mm-yyyy');
    WHEN OTHERS THEN
        RETURN TO_DATE('04-03-0403', 'dd-mm-yyyy');
END fn_get_edates3;
/

SHOW ERRORS;