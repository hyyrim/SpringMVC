SELECT USER
FROM DUAL;
--==> SCOTT

--�� ���̺� ���� (TBL_STUDENT)

CREATE TABLE TBL_STUDENT
( SID   NUMBER
, NAME  VARCHAR2(30)
, TEL   VARCHAR2(40)
, CONSTRAINT STUDENT_SID_PK PRIMARY KEY(SID)
);
--==> Table TBL_STUDENT��(��) �����Ǿ����ϴ�.

--�� ���̺� ���� (TBL_GRADE)
CREATE TABLE TBL_GRADE
( SID   NUMBER
, SUB1  NUMBER(3)
, SUB2  NUMBER(3)
, SUB3  NUMBER(3)
, CONSTRAINT GRADE_SID_PK PRIMARY KEY(SID)
, CONSTRAINT GRADE_SID_FK FOREIGN KEY(SID)
             REFERENCES TBL_STUDENT(SID)
);
--==> Table TBL_GRADE��(��) �����Ǿ����ϴ�.

--�� �������� �߰�
ALTER TABLE tbl_grade ADD CONSTRAINT sub1_ck CHECK(sub1 BETWEEN 0 AND 100);
ALTER TABLE tbl_grade ADD CONSTRAINT sub2_ck CHECK(sub2 BETWEEN 0 AND 100);
ALTER TABLE tbl_grade ADD CONSTRAINT sub3_ck CHECK(sub3 BETWEEN 0 AND 100);

--�� ������ ���� (TBL_STUDENT)
CREATE SEQUENCE SEQ_STUDENT
NOCACHE;
--==> Sequence SEQ_STUDENT��(��) �����Ǿ����ϴ�.

DROP SEQUENCE SEQ_GRADE;

CREATE SEQUENCE SEQ_GRADE
NOCACHE;
--==> Sequence SEQ_GRADE��(��) �����Ǿ����ϴ�.

--�� ���� ������ �Է� 
INSERT INTO TBL_STUDENT(SID, NAME, TEL)
VALUES(SEQ_STUDENT.NEXTVAL, '������', '010-1111-1111');
--==> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_STUDENT(SID, NAME, TEL)
VALUES(SEQ_STUDENT.NEXTVAL, '�̹���', '010-2222-2222');
--==> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_STUDENT(SID, NAME, TEL)
VALUES(SEQ_STUDENT.NEXTVAL, '�길��', '010-3333-3333');
--==> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_STUDENT(SID, NAME, TEL)
VALUES(SEQ_STUDENT.NEXTVAL, '������', '010-4444-4444');
--==> 1 �� ��(��) ���ԵǾ����ϴ�.


INSERT INTO TBL_GRADE(SID, SUB1, SUB2, SUB3)
VALUES(SEQ_GRADE.NEXTVAL, 100, 50, 90);
--==> 1 �� ��(��) ���ԵǾ����ϴ�.


INSERT INTO TBL_GRADE(SID, SUB1, SUB2, SUB3)
VALUES(SEQ_GRADE.NEXTVAL, 80, 90, 70);
--==> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_GRADE(SID, SUB1, SUB2, SUB3)
VALUES(SEQ_GRADE.NEXTVAL, 20, 100, 40);
--==> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_GRADE(SID, SUB1, SUB2, SUB3)
VALUES(SEQ_GRADE.NEXTVAL, 80, 90, 100);
--==> 1 �� ��(��) ���ԵǾ����ϴ�.


--�� Ŀ��
COMMIT;
--==> Ŀ�� �Ϸ�.


--�� ������ ����
DELETE
FROM TBL_STUDENT
WHERE SID=1;

DELETE
FROM TBL_GRADE
WHERE SID=1;


--�� ���̺� ��ȸ
SELECT SID, NAME, TEL
FROM TBL_STUDENT;

SELECT *
FROM TBL_GRADE;

--�� �� ���� (STUDENTVIEW)
CREATE OR REPLACE VIEW STUDENTVIEW
AS
SELECT SID, NAME, TEL
      , (SELECT COUNT(*)
         FROM TBL_GRADE
         WHERE SID = S.SID) AS SUB
FROM TBL_STUDENT S;
--==> View STUDENTVIEW��(��) �����Ǿ����ϴ�.

--�� �� ���� (GRADEVIEW)
CREATE OR REPLACE VIEW GRADEVIEW
AS
SELECT S.SID AS SID
     , S.NAME AS NAME
     , G.SUB1 AS SUB1
     , G.SUB2 AS SUB2
     , G.SUB3 AS SUB3
     , (G.SUB1 + G.SUB2 + G.SUB3) AS TOT
     , ROUND((G.SUB1 + G.SUB2 + G.SUB3)/3,2) AS AVG
     , (CASE WHEN (G.SUB1 + G.SUB2 + G.SUB3)/3 < 60 THEN '���հ�'
             WHEN (G.SUB1<=40) OR (G.SUB2<=40) OR (G.SUB3<=40)  THEN '����'
             ELSE '�հ�'
             END) AS CH
FROM TBL_STUDENT S LEFT JOIN TBL_GRADE G
ON S.SID = G.SID;
--==> View GRADEVIEW��(��) �����Ǿ����ϴ�.


--�� �� ��ȸ
SELECT SID, NAME, TEL, SUB
FROM STUDENTVIEW
ORDER BY SID;
--==> 
/*
1	������	010-1111-1111	1
2	�̹���	010-2222-2222	1
3	�길��	010-3333-3333	1
4	������	010-4444-4444	1
*/

SELECT SID, NAME, SUB1, SUB2, SUB3, TOT, AVG, CH
FROM GRADEVIEW;
--==>
/*
1	������	100	50	90	240	80	�հ�
2	�̹���	80	90	70	240	80	�հ�
3	�길��	20	100	40	160	53.33	���հ�
4	������	80	90	100	270	90	�հ�
*/

-- ���� �Ǽ��ϴ� �κ�
-- �̷��� ���̺��� ����������� �� ������
-- �̷��� �ϸ� �ȵȴ�.
-- ������ �� �÷��� �հ�/���հ�/���� ���� ���ִ°Ŷ� �ٸ��Ծ���.
-- ������� ����� ���°��̱� ������ �ǹ̾���.
-- ���Ἲ�� ���� �� �ִ�. �� 90 90 90���� ������ ����Ǿ��µ�
-- �հݿ��δ� 3��(����) - (��)
-- �̷��� �Ǹ� ���� �ٲ� �� ���� �հݿ��θ� Ȯ���������
--�� ������ �����ͷ� �� �� �ִ� ������ ���̺�ȭ/�÷�ȭ ���� �ʴ´�.
/*
GRADERESULT
1 �հ�
2 ���հ�
3 ����
*/

--�� ī��Ʈ
SELECT COUNT(*) AS COUNT
FROM TBL_STUDENT;

SELECT COUNT(*) AS COUNT
FROM TBL_GRADE;