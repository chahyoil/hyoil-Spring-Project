------------------------------관리자 테이블 생성------------------------------- 부모!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
DROP TABLE ADMIN cascade Constraints;
CREATE TABLE ADMIN(          
    AID VARCHAR2(10) PRIMARY KEY,
    APW VARCHAR2(10) NOT NULL
    );

INSERT INTO ADMIN VALUES('AA','AA');


 --------------------------------회원등급----------------------------------//부모!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
DROP TABLE MEMBERGRADE cascade Constraints;
CREATE TABLE MEMBERGRADE(
    MLEVELNO NUMBER(2) PRIMARY KEY,
    MLEVELNAME VARCHAR2(30),
    MLEVELDC NUMERIC(10)
    );

Insert into MemberGrade values(0,'a',0.1);
Insert into MemberGrade values(1,'b',0.2);
Insert into MemberGrade values(2,'c',0.3);
Insert into MemberGrade values(3,'d',0.4);

commit;


 --------------------------------제품----------------------------------//부모!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
DROP TABLE PRODUCT cascade Constraints;
DROP SEQUENCE PRODUCT_SEQ;
Create Sequence PRODUCT_SEQ;
CREATE TABLE PRODUCT(
    PID VARCHAR2(30) PRIMARY KEY,
    PNAME VARCHAR2(30) NOT NULL,
    PCAL NUMERIC(5),
    PMEGAPICK NUMERIC(1),
    PMDPICK NUMERIC(1),
    PMAIN VARCHAR2(20),
    PSTOCK NUMERIC(5),
    PPRICE NUMERIC(6),
    PCONTENT VARCHAR2(1000),
    PRATE NUMERIC(2),
    PIMAGE VARCHAR2(50) DEFAULT 'NOIMAGE.PNG',
    PHIREDATE DATE DEFAULT SYSDATE,
    PHIT NUMERIC(9)
    );



------------------------------회원 테이블 생성------------------------------- 
DROP TABLE MEMBER cascade Constraints;
CREATE TABLE MEMBER(      
    MID VARCHAR2(20) PRIMARY KEY,
    MPW VARCHAR2(10) NOT NULL,
    MBLOCK NUMERIC(2) DEFAULT 0,
    MNAME VARCHAR2(20) NOT NULL,
    MGENDER VARCHAR2(10),
    MTEL VARCHAR2(20),
    MEMAIL VARCHAR2(50),
    MPOSTNUM VARCHAR2(20),
    MADDRESS VARCHAR2(200),
    MJOINDATE DATE DEFAULT SYSDATE,   
    MTOTAL NUMERIC(10),
    MLEVELNO NUMERIC(2),
    FOREIGN KEY (MLEVELNO) REFERENCES MEMBERGRADE(MLEVELNO)
    );

 --------------------------------공지사항게시판----------------------------------
DROP TABLE NBOARD cascade Constraints;
CREATE TABLE NBOARD(          
    NBNO NUMBER(5) PRIMARY KEY,
    AID VARCHAR2(10),
    NBTITLE VARCHAR2(200) NOT NULL,
    NBCONTENT VARCHAR2(1000),
    NBHIT NUMERIC(4) NOT NULL,
    NBFILE VARCHAR2(50),
    NBTIME DATE DEFAULT SYSDATE,
    FOREIGN KEY (AID) REFERENCES ADMIN(AID)
    );

INSERT INTO NBOARD VALUES(1,'AA','첫 번째 공지사항','아직 아무내용 없어',0,'DD',SYSDATE);

----------------------------------리뷰게시판----------------------------------- 
DROP TABLE RBOARD cascade Constraints;
CREATE TABLE RBOARD(              
    RBNO NUMBER(5) PRIMARY KEY,
    AID VARCHAR2(10),
    MID VARCHAR2(20),
    RBTITLE VARCHAR2(100) NOT NULL,
    RBCONTENT VARCHAR2(1000) NOT NULL,
    RBHIT NUMERIC(4) NOT NULL,
    RBFILE VARCHAR2(50),
    RBREF NUMERIC(3),
    RBSTEP NUMERIC(3),
    RBLEVEL NUMERIC(3),
    RBTIME DATE DEFAULT SYSDATE,
    FOREIGN KEY (AID) REFERENCES ADMIN(AID),
    FOREIGN KEY (MID) REFERENCES MEMBER(MID)
    );
SELECT * FROM (
SELECT ROWNUM RN, A.*
    FROM (SELECT RBHIT, M.MID, M.MPW FROM RBOARD r, MEMBER M WHERE R.MID=M.MID ORDER BY RBHIT DESC) a)
        WHERE RN <=5;
        
--------------------------------Q&A게시판---------------------------------     
DROP TABLE QBOARD cascade Constraints;
CREATE TABLE QBOARD(              
    QBNO NUMBER(5) PRIMARY KEY,
    AID VARCHAR2(10),
    MID VARCHAR2(20),
    QBTITLE VARCHAR2(100) NOT NULL,
    QBCONTENT VARCHAR2(1000) NOT NULL,
    QBHIT NUMERIC(4) NOT NULL,
    QBFILE VARCHAR2(50),
    QBREF NUMERIC(3),
    QBSTEP NUMERIC(3),
    QBLEVEL NUMERIC(3),
    QBTIME DATE DEFAULT SYSDATE,
    FOREIGN KEY (AID) REFERENCES ADMIN(AID),
    FOREIGN KEY (MID) REFERENCES MEMBER(MID)
    );
    
commit;
    
    
---------------------------------장바구니 테이블 생성-----------------------
DROP TABLE BASKET cascade Constraints;
CREATE TABLE BASKET(      
    BNO NUMBER(5),
    MID VARCHAR2(20),
    PID VARCHAR2(30),
    BCOUNT NUMERIC(3),
    BTOTAL NUMERIC(9),
    Primary key(BNO,MID),
    FOREIGN KEY (MID) REFERENCES MEMBER(MID),
    FOREIGN KEY (PID) REFERENCES PRODUCT(PID)
    );

---------------------------------최근본 제품 테이블 생성-----------------------     
DROP TABLE CURRENTPRODUCT cascade Constraints;    
drop sequence CURR_SEQ;
CREATE SEQUENCE CURR_SEQ;
CREATE TABLE CURRENTPRODUCT(
    Currid number(30),
    MID VARCHAR2(20),
    PID VARCHAR2(30),
    CTIME DATE DEFAULT SYSDATE,
    FOREIGN KEY(MID) REFERENCES MEMBER(MID),
    FOREIGN KEY(PID) REFERENCES PRODUCT(PID),
    PRIMARY KEY (Currid)
    );
    
    
---------------------------------주문-----------------------     
DROP TABLE ORDERS cascade Constraints;
CREATE TABLE ORDERS(
    ONO VARCHAR2(20) PRIMARY KEY,
    MID VARCHAR2(20) NOT NULL,
    ODATE DATE DEFAULT SYSDATE,
    OADDRESS VARCHAR2(255) NOT NULL,
    OPHONE VARCHAR2(30),
    OCOMPLETEALL NUMBER(2) DEFAULT 0,  -- 주문 완료를 위해서 추가 했음
    FOREIGN KEY (MID) REFERENCES MEMBER(MID)
    );
    
---------------------------------주문내역-----------------------  
DROP TABLE ORDER_DETAIL cascade Constraints;
CREATE TABLE ORDER_DETAIL(
    ONO VARCHAR2(20),
    PID VARCHAR2(30),
    QTY NUMERIC(3),
    TOTALPRICE NUMERIC(8),
    OCOMPLETEONE NUMBER(2) DEFAULT 0,  -- 주문 완료를 위해서 추가했음
    FOREIGN KEY (ONO) REFERENCES ORDERS(ONO),
    FOREIGN KEY (PID) REFERENCES PRODUCT(PID),
    PRIMARY KEY (ONO, PID)
    );
    
---------------------------------예약----------------------- 
DROP TABLE RESERVATION cascade Constraints;
CREATE TABLE RESERVATION(    
    ONO VARCHAR2(20) PRIMARY KEY,
    OSHIPDATE VARCHAR2(30),
    FOREIGN KEY (ONO) REFERENCES ORDERS(ONO)
    );
    
---------------------------------TEST------------------------------------------
select * from member;
SELECT * FROM PRODUCT;
UPDATE PRODUCT SET PHIT=6 WHERE PID=2;
commit;