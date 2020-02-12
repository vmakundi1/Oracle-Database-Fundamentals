--Oracle Packages
--every select statement in oracle must have an into clause

--first example
CREATE OR REPLACE PACKAGE pkg_student AS
    FUNCTION pkg_fn_get_edate (
        p_sid NUMBER
    ) RETURN DATE;

    FUNCTION pkg_fn_get_edate (
        p_sname VARCHAR2
    ) RETURN DATE;

END pkg_student;
/

SHOW ERRORS;

--second example
--basic theme of package below is that user has 2 options to get date from the DB. either using student id or their surname
--in both cases the v_edate represents the data to be obtained from the database after the parameter p_sid or parameter p_sname has been entered
--difference with above syntax is that this one has more than one variable
-- now how to execute these packages??
--from notes, something like 'EXEC PKG_STUDENT (XXX, 'XXX')
CREATE OR REPLACE PACKAGE BODY pkg_student IS

    FUNCTION pkg_fn_get_edate (
        p_sid NUMBER
    ) RETURN DATE IS
        v_edate DATE;
    BEGIN
        SELECT
            edate
        INTO v_edate
        FROM
            mm_student
        WHERE
            sid = p_sid;

        RETURN v_edate;
    END pkg_fn_get_edate;

    FUNCTION pkg_fn_get_edate (
        p_sname VARCHAR2
    ) RETURN DATE IS
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
    END pkg_fn_get_edate;

END pkg_student;
/

SHOW ERRORS;














