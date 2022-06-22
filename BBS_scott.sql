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

--==>> Table TEST_USER이(가) 생성되었습니다.

DESC TEST_USER;
/*
이름           널?       유형           
------------ -------- ------------ 
USERID       NOT NULL VARCHAR2(20) 
USERPASSWORD          VARCHAR2(20) 
USERNAME              VARCHAR2(20) 
USERGENDER            VARCHAR2(20) 
USEREMAIL             VARCHAR2(50) 
*/

--○ 데이터 삽입
INSERT INTO TEST_USER(USERID,USERPASSWORD,USERNAME,USERGENDER,USEREMAIL) VALUES('duswn1995','1234', '이연주', '여자', 'duswn1995@naver.com')
;
INSERT INTO TEST_USER(USERID,USERPASSWORD,USERNAME,USERGENDER,USEREMAIL) VALUES('1234','1234', '이브이', '여자', 'duswn1994@naver.com')
;
commit;

select *
from Test_user;

SELECT userPassword 
FROM TEST_USER
WHERE userId = 'duswn1995';
--> 한 줄 구성
SELECT userPassword FROM TEST_USER WHERE userId = 'duswn1995'
;
select *
from TEST_USER;


--○ 게시판 데이터베이스 구성
CREATE TABLE TEST_BBS
(
	bbsID	            INT	                    PRIMARY KEY, -- 게시물 번호
	bbsTitle	            VARCHAR(50)	            NULL,
	userID              VARCHAR(20)	            NULL,
	bbsDate             DATE                    NULL,
	bbsContent	        VARCHAR(2048)	        NULL,
    bbsAvailable        INT                          -- 글의 삭제 여부(1 삭제X, 0삭제o)
);
-->Table TEST_BBS이(가) 생성되었습니다.

--○ 현재 날짜를 불러오는 함수
SELECT SYSDATE
FROM DUAL;
--> 한 줄 구성
SELECT SYSDATE FROM DUAL
;

--○ bbsID 를 가져오는 함수
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

--○ 시퀀스 생성
CREATE SEQUENCE TEST_SEQ --시퀀스이름 EX_SEQ
INCREMENT BY 1 --증감숫자 1
START WITH 1 --시작숫자 1
MINVALUE 1 --최소값 1
MAXVALUE 1000;
-->Sequence TEST_SEQ이(가) 생성되었습니다.

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
SET bbsTitle = '수정', bbsContent = '수정한 내용이에요'
WHERE bbsID = '1';
-->
UPDATE TEST_BBS SET bbsTitle = '수정', bbsContent = '수정한 내용이에요' WHERE bbsID = '1'
;

COMMIT;

DELETE 
FROM TEST_BBS
WHERE bbsID = '1';
-->
DELETE FROM TEST_BBS WHERE bbsID = '1'
;
