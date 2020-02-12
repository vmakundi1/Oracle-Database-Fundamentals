CREATE TABLE mm_grade (
    sid    NUMBER(8, 0)
        CONSTRAINT mm_grade_sid_fk
            REFERENCES mm_student ( sid ),
    cid    CHAR(8)
        CONSTRAINT mm_grade_cid_fk
            REFERENCES mm_course ( cid ),
    CONSTRAINT mm_grade_sid_cid_pk PRIMARY KEY ( sid,
                                                 cid ),
    mark   NUMBER(5, 2)
        CONSTRAINT ck_mm_grade_mark CHECK ( ( mark > 0 )
                                            AND ( mark < 100 ) )
);