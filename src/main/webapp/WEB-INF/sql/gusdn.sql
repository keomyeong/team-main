-- Gohome 데이터베이스 만들기 
CREATE DATABASE Gohome;

use Gohome;
drop DATABASE Gohome;
SELECT * FROM GH_User;
drop table GH_User;
drop table GH_auth;
-- 사용자정보 테이블 만들기
CREATE table GH_User(
    userid VARCHAR(50) PRIMARY KEY,
    userpw VARCHAR(100) NOT NULL,
    username VARCHAR(100) NOT NULL,
    userPhone VARCHAR(15) NOT NULL,
    userEmail VARCHAR(254) NOT NULL,
    useradd VARCHAR(50) ,
    CompanyRegistrationNumber VARCHAR(15) Null, 
    regdate TIMESTAMP DEFAULT NOW(),
    updateDate TIMESTAMP DEFAULT NOW(),
    enabled TINYINT(1) DEFAULT 1
);

-- 권한 테이블 만들기 
CREATE TABLE GH_auth(
    id INT PRIMARY KEY AUTO_INCREMENT,
    userid VARCHAR(50) NOT NULL,
    auth VARCHAR(50) NOT NULL,
    FOREIGN KEY (userid) REFERENCES GH_User(userid) ON DELETE CASCADE
);


-- 컬럼명 변경 및 타입 변경
-- alter table [테이블명] change [컬럼명] [변경할컬럼명] varchar(값);
ALTER TABLE GH_User CHANGE userphone userPhone VARCHAR(15);
ALTER TABLE GH_User CHANGE userem userEmail VARCHAR(254);

drop table C_board;
drop table C_board_file;

-- 커뮤니티 자유 게시판
CREATE table C_board(
	 bno INT PRIMARY KEY AUTO_INCREMENT,
	 title VARCHAR(255) NOT NULL,
	 content VARCHAR(2000) NOT NULL,
	 writer VARCHAR(50) NOT NULL,
   	 regdate TIMESTAMP DEFAULT NOW(),
   	 updatedate TIMESTAMP DEFAULT NOW(),
	 cbcategory varchar(15),
   	 FOREIGN KEY (writer) REFERENCES GH_User(userid) ON DELETE CASCADE
);


-- 커뮤니티 자유게시판 첨부파일  
CREATE TABLE C_board_file (
	id INT PRIMARY KEY AUTO_INCREMENT,
	bno INT REFERENCES C_board(bno),
	fileName VARCHAR(200) not null,
	FOREIGN KEY (bno) REFERENCES C_board(bno) ON DELETE CASCADE
);
-- 자유게시판 댓글 테이블 
CREATE TABLE cb_reply (
	rno INT PRIMARY KEY AUTO_INCREMENT,
    bno INT NOT NULL,
    reply VARCHAR(512) NOT NULL,
    replyer VARCHAR(50) NOT NULL,
    replyDate TIMESTAMP DEFAULT now(),
    updateDate TIMESTAMP DEFAULT now(),
    FOREIGN KEY (bno) REFERENCES C_board(bno)
);


SELECT * FROM C_board;
SELECT * FROM C_board_file;
SELECT * FROM cb_reply;

SELECT * FROM GH_User;
SELECT * FROM GH_auth;

DESC market;
DESC wishlist;
DESC market_file;

SELECT * FROM market;
SELECT * FROM wishlist;
SELECT * FROM market_file;

DELETE FROM GH_User;

DROP TABLE market;
DROP TABLE market_file;
DROP TABLE wishlist;

-- 사용자정보 테이블 만들기
CREATE TABLE market(
    mno INT PRIMARY KEY AUTO_INCREMENT, -- 상품번호 
    mwriter VARCHAR(50) NOT NULL, -- 작성자
    mtitle VARCHAR(255) NOT NULL, -- 상품제목
    mprice INT NOT NULL, -- 상품가격
    mdetail VARCHAR(2000) NOT NULL, -- 상세설명
    mstate VARCHAR(50) NOT NULL, -- 상품 상태 
    msold VARCHAR(10) NOT NULL, -- 판매 분류
    mregdate TIMESTAMP DEFAULT NOW(), -- 상품 등록일
    maddress VARCHAR(50), -- 주소        
    FOREIGN KEY (mwriter) REFERENCES GH_User(userid) ON DELETE CASCADE
);

-- 이미지파일 업로드
CREATE TABLE market_file( 
id INT PRIMARY KEY AUTO_INCREMENT, -- 파일 아이디 식별자
mno INT NOT NULL, -- 상품번호 (글번호)
fileName VARCHAR(256), -- 파일이름
FOREIGN KEY (mno) REFERENCES market(mno) ON DELETE CASCADE-- 상품번호
);


-- 찜목록 
CREATE TABLE wishlist(
	wno INT PRIMARY KEY AUTO_INCREMENT,
	mwriter VARCHAR(50) NOT NULL,
    mno INT NOT NULL,
    FOREIGN KEY (mwriter) REFERENCES GH_User(userid),
    FOREIGN KEY (mno) REFERENCES market(mno)
);




INSERT INTO market 
(mwriter, mtitle, mprice, mdetail, mstate, maddress)
VALUES ('qaqa12', 'test', 100000, '2만원에 급처', '새상품', '서울대입구');


SELECT * FROM GH_Message;
DESC GH_Message;

DELETE FROM GH_Message;

DROP TABLE GH_Message;

CREATE TABLE GH_Message (
   mno INT PRIMARY KEY AUTO_INCREMENT,
    writer varchar(50) ,
    reader varchar(50) ,
    content varchar(256) ,
   regdate TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (writer) REFERENCES GH_User(userid)
);

SELECT * from market;

select * from market_file;