SELECT *
FROM TEST_USER;

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

commit;

--�� �н����� �˻�
SELECT USERPASSWORD 
FROM TEST_USER
WHERE USERID = 'duswn1995';

DROP TABLE TEST_USER;

