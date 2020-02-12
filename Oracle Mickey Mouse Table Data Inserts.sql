insert into mm_student
	(sid, sname, gender, edate)
values
	(333333, 'Elmer Fudd', 'M', TO_DATE('22-Oct-1967 08:05:00','DD-Mon-YYYY HH24:MI:SS'));

insert into mm_student
	(sid, sname, gender, edate)
values
	(111111, 'Donald Duck', 'M', TO_DATE('18-Dec-1992 15:45:00','DD-Mon-YYYY HH24:MI:SS'));

insert into mm_student
	(sid, sname, gender, edate)
values
	(555555, 'Bugs Bunny', 'M', TO_DATE('28-Feb-1972 10:50:00','DD-Mon-YYYY HH24:MI:SS'));

insert into mm_student
	(sid, sname, gender, edate)
values
	(222222, 'Minnie Mouse', 'F', TO_DATE('01-Mar-1986 16:20:06','DD-Mon-YYYY HH24:MI:SS'));

insert into mm_student
	(sid, sname, gender, edate)
values
	(444444, 'Pluto T. Dog', 'M', TO_DATE('09-Jul-1994 12:05:05','DD-Mon-YYYY HH24:MI:SS'));

-- table inserts into mm_course
insert into mm_course
	(cid, cname, location, ccost)
values
	('DMIT2019', 'Intermediate Database Programming', 'WA320', 999.99);

insert into mm_course
	(cid, cname, location, ccost)
values
	('CPSC1012', 'Programming Fundamentals', 'WA316', 888.88);

insert into mm_course
	(cid, cname, location, ccost)
values
	('DMIT1508', 'Database Fundamentals', 'WB320', 777.77);
    
    
-- table inserts into mm_grade

insert into mm_grade
	(sid, cid, mark)
values
	(333333, 'DMIT1508', 100.00);

insert into mm_grade
	(sid, cid, mark)
values
	(111111, 'DMIT2019', 95.50);

insert into mm_grade
	(sid, cid, mark)
values
	(333333, 'CPSC1012', 89.75);

insert into mm_grade
	(sid, cid, mark)
values
	(111111, 'DMIT1508', 86.00);

insert into mm_grade
	(sid, cid, mark)
values
	(333333, 'DMIT2019', 92.25);
    
commit;

SELECT*FROM MM_GRADE
