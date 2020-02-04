CREATE TABLE mm_student (
    sid      NUMBER(8, 0)
        CONSTRAINT pk_mm_student_sid PRIMARY KEY
        CONSTRAINT nn_mm_student_sid NOT NULL,
    sname    VARCHAR2(50) DEFAULT 'UNKNOWN'
        CONSTRAINT n_mm_student_sname NULL,
    gender   CHAR(1)
        CONSTRAINT ck_mm_student_gender_mfn CHECK ( gender IN (
            'M',
            'F',
            'N'
        ) )
        CONSTRAINT nn_mm_student_gender NOT NULL,
    edate    DATE DEFAULT sysdate
        CONSTRAINT nn_mm_student_edate NOT NULL
);

CREATE TABLE mm_course (
    cid        CHAR(8)
        CONSTRAINT pk_mm_course_cid PRIMARY KEY
        CONSTRAINT nn_mm_course_cid NOT NULL,
    cname      VARCHAR2(50)
        CONSTRAINT n_mm_course_cname NULL,
    location   VARCHAR2(20)
        CONSTRAINT n_mm_course_location NULL,
    ccost      NUMBER(6, 2) DEFAULT 575.00
        CONSTRAINT n_mm_course_ccost NULL
);

create table mm_grade
( sid number(8,0) constraint FK_mm_grade_sid FOREIGN KEY references mm_student(sid)
  constraint NN_mm_grade_sid not null,
  cid char(8, 0) constraint FK_mm_course_cid FOREIGN KEY references mm_course(cid)
  constraint nn_mm_grade_sid not null,
  constraint mm_grade_sid_cid_PK PRIMARY KEY (sid, cid),
  
);