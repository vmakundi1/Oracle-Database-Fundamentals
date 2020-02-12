--Creating Normal Procedures and Functions using Mickey Mouse Database (that has MM_course, student and graded)
--P_ stands for parameters
--our first procedure below has no error check

--before we start, what are we doing here is called 'PL/SQL'
--pl/sql is a procedural programming language, allows creation of scripts that have variables, if-then-else, loops and function/
--procedure calls, can execute DML and not DDL
--allows for error handling
--what is a program unit? a block of PL/SQL code that is stored, pre-compiled in the database. there are 3 types: 
--Procedure: can manipulate and change multiple values
--Function: returns a single value
--Package: provides a way to manage large numbers of related procedures and functions (stored and executed from the server)
--benefits of using these f(x) and procedures: reusability, ease of maintenance, data integrity, data security\
--procedures vs functions: f(x) 'directly' returns a value while a procedure does not.
--function can appear in an SQL statement but procedure cannot
--procedure cannot appear in an assignment statement while a function can appear (on right hand side of an assignment)

CREATE OR REPLACE PROCEDURE pr_update_mark1 (
    p_sid    NUMBER,
    p_cid    CHAR,
    p_mark   NUMBER
) AS
BEGIN
    UPDATE mm_grade
    SET
        mark = p_mark
    WHERE
        sid = p_sid
        AND cid = p_cid;

END pr_update_mark1;
/

SHOW ERRORS;

--second example of a procedure which shows how input parameters are treated vs how local variables are treated!!

CREATE OR REPLACE PROCEDURE pr_update_mark2 (
    p_sname   VARCHAR2,
    p_cname   VARCHAR2,
    p_mark    NUMBER
) AS
    v_sid   NUMBER(8, 0);
    v_cid   CHAR(8);
BEGIN
    SELECT
        sid
    INTO v_sid
    FROM
        mm_student
    WHERE
        sname = p_sname;

    SELECT
        cid
    INTO v_cid
    FROM
        mm_course
    WHERE
        cname = p_cname;

    UPDATE mm_grade
    SET
        mark = p_mark
    WHERE
        sid = v_sid
        AND cid = v_cid;

END pr_update_mark2;
/

SHOW ERRORS;

--How to run this procedure above? run this example query?
--using an execute command, for example
SELECT
    sid,
    cid,
    mark
FROM
    mm_grade;

EXECUTE pr_update_mark1(111111, 'dmit2019', 80);

end;


