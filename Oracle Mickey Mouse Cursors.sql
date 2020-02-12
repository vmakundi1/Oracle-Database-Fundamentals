--cursors
--we will create a procedure whereby if the mark is less than 50, it will go into the help table, if it is more than 80, it will go into honours table

--1st thing is to create these new tables

CREATE OR REPLACE PROCEDURE pr_populate_new_tables IS

    v_cid    CHAR(8);
    v_sid    NUMBER(8, 0);
    v_mark   NUMBER(5, 2);
    CURSOR c_grade IS
    SELECT
        cid,
        sid,
        mark
    FROM
        mm_grade
    WHERE
        mark < 50
        OR mark >= 80;

BEGIN
    OPEN c_grade;  --open cursor
    FETCH c_grade INTO
        v_cid,
        v_sid,
        v_mark;
    WHILE c_grade%found LOOP
        IF v_mark < 50 THEN
            INSERT INTO mm_help (
                cid,
                sid,
                mark
            ) --where there is an insert statement, there must be acolumn list
             VALUES (
                v_cid,
                v_sid,
                v_mark
            );

        ELSE
            INSERT INTO mm_honours (
                cid,
                sid,
                mark
            ) VALUES (
                v_cid,
                v_sid,
                v_mark
            );

        END IF;

        FETCH c_grade INTO
            v_cid,
            v_sid,
            v_mark;
    END LOOP;

    CLOSE c_grade;
END pr_populate_new_tables;
/

SHOW ERRORS;

--NB: double check if you have in infinite loop, you will notice it using the 'fetch'
--notice as per notes, cursor has 4 parts: declare, open, fetch, close

--2nd example of a cursor; this one returns a course name and marks for a student

--CREATE OR replace FUNCTION fn_show_names_marks (
--    p_sid NUMBER
--) RETURN VARCHAR2 AS
--
--    v_cname    VARCHAR2(50);
--    v_mark     NUMBER(5, 2);
--    v_output   VARCHAR2(1500);
--    CURSOR c_names IS
--    SELECT
--        mm_course.cname,
--        mm_grade.mark
--    FROM
--        mm_course,
--        mm_grade
--    WHERE
--        mm_grade.sid = p_sid
--        AND mm_grade.cid = mm_coourse.cid;
--
--BEGIN
--    OPEN c_names;
--    FETCH c_names INTO v_cname.v_mark;
--IF c_cnames%notfound THEN v_output := 'The student'