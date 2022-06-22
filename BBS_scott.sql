SELECT USER
FROM DUAL;

CREATE TABLE TEST_USER
(
	userId	            VARCHAR(20)	            PRIMARY KEY,
	userPassword	        VARCHAR(20)	            NULL,
	userName            VARCHAR(20)	            NULL,
	userGender          VARCHAR(20)	            NULL,
	userEmail	        VARCHAR(50)	            NULL
);

--==>> Table TEST_USER��(��) �����Ǿ����ϴ�.

DESC TEST_USER;
/*
�̸�           ��?       ����           
------------ -------- ------------ 
USERID       NOT NULL VARCHAR2(20) 
USERPASSWORD          VARCHAR2(20) 
USERNAME              VARCHAR2(20) 
USERGENDER            VARCHAR2(20) 
USEREMAIL             VARCHAR2(50) 
*/

--�� ������ ����
INSERT INTO TEST_USER(USERID,USERPASSWORD,USERNAME,USERGENDER,USEREMAIL) VALUES('duswn1995','1234', '�̿���', '����', 'duswn1995@naver.com')
;
INSERT INTO TEST_USER(USERID,USERPASSWORD,USERNAME,USERGENDER,USEREMAIL) VALUES('1234','1234', '�̺���', '����', 'duswn1994@naver.com')
;
commit;

select *
from Test_user;

SELECT userPassword 
FROM TEST_USER
WHERE userId = 'duswn1995';
--> �� �� ����
SELECT userPassword FROM TEST_USER WHERE userId = 'duswn1995'
;
select *
from TEST_USER;


--�� �Խ��� �����ͺ��̽� ����
CREATE TABLE TEST_BBS
(
	bbsID	            INT	                    PRIMARY KEY, -- �Խù� ��ȣ
	bbsTitle	            VARCHAR(50)	            NULL,
	userID              VARCHAR(20)	            NULL,
	bbsDate             DATE                    NULL,
	bbsContent	        VARCHAR(2048)	        NULL,
    bbsAvailable        INT                          -- ���� ���� ����(1 ����X, 0����o)
);
-->Table TEST_BBS��(��) �����Ǿ����ϴ�.

--�� ���� ��¥�� �ҷ����� �Լ�
SELECT SYSDATE
FROM DUAL;
--> �� �� ����
SELECT SYSDATE FROM DUAL
;

--�� bbsID �� �������� �Լ�
SELECT bbsID
FROM TEST_BBS
ORDER BY bbsID;
-->
SELECT bbsID FROM TEST_BBS ORDER BY bbsID
;

INSERT INTO TEST_BBS(bbsID, bbsTitle, userID, bbsDate, bbsContent, bbsAvailable) VALUES(1,'bbsTitle','userID','2022-05-06','bbsContent',1)
;

INSERT INTO TEST_BBS(bbsID, bbsTitle, userID, bbsContent, bbsAvailable, bbsDate) VALUES(3,'bbsTitle','userID','bbsContent',1 ,SYSDATE)
;
select *
from TEST_BBS;

SELECT bbsID FROM TEST_BBS ORDER BY bbsID DESC;

--�� ������ ����
CREATE SEQUENCE TEST_SEQ --�������̸� EX_SEQ
INCREMENT BY 1 --�������� 1
START WITH 1 --���ۼ��� 1
MINVALUE 1 --�ּҰ� 1
MAXVALUE 1000;
-->Sequence TEST_SEQ��(��) �����Ǿ����ϴ�.

TEST_SEQ.NEXTVAL;


SELECT *
FROM TEST_BBS
WHERE bbsID < 1;
-->
SELECT * FROM TEST_BBS WHERE bbsID < 1 AND bbsAvailable = 1
;

SELECT * FROM (SELECT * FROM TEST_BBS WHERE bbsID > 1 AND bbsAvailable = 1 ORDER BY bbsID DESC) WHERE ROWNUM <= 2
;


SELECT bbsID, bbsTitle, userID, bbsDate, bbsContent, bbsAvailable
FROM TEST_BBS
WHERE bbsID<10
ORDER BY bbsID DESC
;


SELECT *
FROM TEST_BBS
WHERE bbsID = 1;
-->>
SELECT * FROM TEST_BBS WHERE bbsID = 1
;

UPDATE TEST_BBS
SET bbsTitle = '����', bbsContent = '������ �����̿���'
WHERE bbsID = '1';
-->
UPDATE TEST_BBS SET bbsTitle = '����', bbsContent = '������ �����̿���' WHERE bbsID = '1'
;

COMMIT;

DELETE 
FROM TEST_BBS
WHERE bbsID = '1';
-->
DELETE FROM TEST_BBS WHERE bbsID = '1'
;
