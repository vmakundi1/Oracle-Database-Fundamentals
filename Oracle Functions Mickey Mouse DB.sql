--FUNCTIONS ON MICKEY MOUSE DATABASE2
--p_ stands for parameter

CREATE OR REPLACE FUNCTION fn_get_sname (
    p_sid NUMBER
) RETURN VARCHAR2 AS
    v_sname VARCHAR2(50);
BEGIN
    SELECT
        sname
    INTO v_sname
    FROM
        mm_student
    WHERE
        sid = p_sid;

    RETURN v_sname;
END fn_get_sname;
/

SHOW ERRORS;

-- our second function
CREATE OR REPLACE FUNCTION fn_get_sname_and_edate (
    p_sid NUMBER
) RETURN VARCHAR2 AS
    v_sname    VARCHAR2(50);
    v_edate    DATE;
    v_output   VARCHAR2(75);
BEGIN
    SELECT
        sname,
        edate
    INTO
        v_sname,
        v_edate
    FROM
        mm_student
    WHERE
        sid = p_sid;

    v_output := v_sname || to_char(v_edate, 'dd-mon-yyyy');
    RETURN v_output;
END fn_get_sname_and_edate;
/

SHOW ERRORS;

--our third function
CREATE OR replace FUNCTION fn_show_course_information (
    p_cid CHAR
) RETURN VARCHAR2 AS
    v_count    NUMBER(3, 0);
    v_cname    VARCHAR2(50);
    v_output   VARCHAR2(80);
BEGIN
    SELECT
        cname
    INTO v_cname
    FROM
        mm_course
    WHERE
        cid = p_cid;

    SELECT
        COUNT(sid)
    INTO v_count
    FROM
        mm_grade
    WHERE
        cid = p_cid;

v_output := 'The course' || v_cname; IF v_count = 0 THEN
    v_output := v_output || 'is empty';
    ELSE
        IF v_count >= 25 THEN
            v_output := v_output || 'is full';
        ELSE
            v_output := v_output
                        || 'has'
                        || to_char(v_count)
                        || 'students';
        END IF;

        RETURN v_output;
END fn_show_course_information;
/
SHOW ERRORS;
