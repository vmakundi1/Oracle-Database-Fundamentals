--Triggers
--hints: do not put transaction commit or rollback etc on triggers
--lets look an example of NAIT, assuming NAIT had an old course that starts with 'BCS' (in upper case), clearly a current student will not have an old course
--trigger is put so that everytime there is an insert or update, a message will be raised
--note that we did not put trigger on table mm_course because this trigger is about new records

--a trigger is an PL/SQL block that executes in response to a specific event. Purpose: to maintain data integrity, enforce business rules, auditing information
--(who changed what and when)
--trigger events: insert, update, delete
--triggers can fire: before the event, after the event, once for the event, once for each row affected by the event

CREATE OR REPLACE TRIGGER tr_biur_mm_grade_bcs_course_bad BEFORE
    INSERT ON mm_grade
    FOR EACH ROW
BEGIN
    IF upper(subtr(:new.cid, 1, 3)) = 'bcs' THEN
        raise_application_error(-20099, 'bcs courses are not current');
    END IF;
END tr_biur_mm_grade_bcs_course_bad;
/

SHOW ERRORS;

--another example
CREATE OR REPLACE TRIGGER tr_bir_mm_student_insert_sid BEFORE
    INSERT ON mm_student
    FOR EACH ROW

declare v_sid NUMBER(8, 0)
begin
select sid seq.NEXTVAL
INTO v_sid
from
    dual;
    :new.sid := v_sid;
END tr_bir_mm_student_insert_sid;
/
SHOW ERRORS;