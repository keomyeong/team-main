-- Gohome 데이터베이스 만들기 
CREATE DATABASE Gohome;
use Gohome;
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
SELECT*from GH_User;
-- 컬럼명 변경 및 타입 변경
-- alter table [테이블명] change [컬럼명] [변경할컬럼명] varchar(값);
ALTER TABLE GH_User CHANGE userphone userPhone VARCHAR(15);
ALTER TABLE GH_User CHANGE userem userEmail VARCHAR(254);
INSERT INTO GH_auth(userid, auth)
VALUES ('admin', 'ROLE_ADMIN');

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

CREATE TABLE GH_Message (
   mno INT PRIMARY KEY AUTO_INCREMENT,
    writer varchar(50) ,
    reader varchar(50) ,
    content varchar(256) ,
   regdate TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (writer) REFERENCES GH_User(userid)
);

create table carts (
  id INT PRIMARY KEY AUTO_INCREMENT,
  status integer default 0,
  userid VARCHAR(50) references GH_User
);

-- 스토어 상품 테이블 
CREATE TABLE S_product(
    pno INT PRIMARY KEY AUTO_INCREMENT,
    category varchar(15) NOT NULL, -- 카테고리
    userid VARCHAR(50) NOT NULL, -- 작성자
    title VARCHAR(255) NOT NULL, -- 상품제목
    price INT NOT NULL, -- 상품가격
    stock INT, -- 상품수량
    delivery varchar(15) NOT NULL, -- 배송
    detail VARCHAR(2000), -- 상세설명
    keyword VARCHAR(10), -- 상품 키워드
    regdate TIMESTAMP DEFAULT NOW(), -- 상품 등록일
    updatedate TIMESTAMP DEFAULT NOW(), -- 상품 업데이트일
    FOREIGN KEY (userid) REFERENCES GH_User(userid) ON DELETE CASCADE
);
-- 이미지파일 업로드
CREATE TABLE S_product_file( 
    id INT PRIMARY KEY AUTO_INCREMENT, -- 파일 아이디 식별자
    pno INT NOT NULL, -- 상품번호 (글번호)
    fileName VARCHAR(256), -- 파일이름
    FOREIGN KEY (pno) REFERENCES S_product(pno) ON DELETE CASCADE-- 상품번호
);
-- 찜
CREATE TABLE wish( 
    wno INT PRIMARY KEY AUTO_INCREMENT, -- 찜 넘버
    userid VARCHAR(50) NOT NULL, -- 소비자
    pno INT NOT NULL, -- 상품번호 (글번호)
    adddate TIMESTAMP DEFAULT NOW(), -- 찜 담은 날짜
    FOREIGN KEY (pno) REFERENCES S_product(pno) ON DELETE CASCADE, -- 상품번호
    FOREIGN KEY (userid) REFERENCES GH_User(userid) ON DELETE CASCADE -- 고객정보
);
-- 장바구니
CREATE TABLE cart( 
    cno INT PRIMARY KEY AUTO_INCREMENT, -- 카트 상품 넘버
    userid VARCHAR(50) NOT NULL, -- 소비자
    pno INT NOT NULL, -- 상품번호 (글번호)
    cartstock int NOT NULL, -- 주문 수량
    adddate TIMESTAMP DEFAULT NOW(), -- 장바구니에 담은 날짜
    FOREIGN KEY (pno) REFERENCES S_product(pno) ON DELETE CASCADE, -- 상품번호
    FOREIGN KEY (userid) REFERENCES GH_User(userid) ON DELETE CASCADE -- 고객정보
);
-- 유저구매정보 아직안함
CREATE TABLE userorder_info(     
ono INT PRIMARY KEY AUTO_INCREMENT,
userid VARCHAR(50) NOT NULL, -- 주문자
userAddr1 VARCHAR(50) NOT NULL, -- 우편번호
userAddr2 VARCHAR(50) NOT NULL, -- 기본주소
userAddr3 VARCHAR(30) NOT NULL, -- 상세주소
orderphone VARCHAR(15) NOT NULL, -- 연락처
FOREIGN KEY (userid) REFERENCES GH_User(userid) ON DELETE CASCADE -- 고객정보
);
-- 주문번호 아직안함
CREATE TABLE order_detail(
dno INT PRIMARY KEY AUTO_INCREMENT, -- 주문 상세 고유번호
orderno INT NOT NULL, -- 주문번호
pno INT NOT NULL, -- 상품 번호
cno INT NOT NULL, -- 장바구니 번호
cartcount INT NOT NULL, -- 장바구니 수량
FOREIGN KEY (pno) REFERENCES S_product(pno) ON DELETE CASCADE, -- 제품에서 바로 할때
FOREIGN KEY (cno) REFERENCES cart(cno) ON DELETE CASCADE -- 장바구니 번호 
);
-- 업체게시판 테이블 만들기 
CREATE table E_board(
eno INT PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(255) NOT NULL,
content VARCHAR(2000) NOT NULL,
writer VARCHAR(50) NOT NULL,
addRegion VARCHAR(15),
addCi VARCHAR(15),
addGu VARCHAR(15),
regdate TIMESTAMP DEFAULT NOW(),
updatedate TIMESTAMP DEFAULT NOW(),
FOREIGN KEY (writer) REFERENCES GH_User(userid) ON DELETE CASCADE);
--  업체게시판  파일 테이블 
CREATE TABLE E_board_file (
id INT PRIMARY KEY AUTO_INCREMENT,
eno INT REFERENCES E_board(eno),
fileName VARCHAR(200) not null,
FOREIGN KEY (eno) REFERENCES E_board(eno) ON DELETE CASCADE

);
SELECT * FROM E_board;
SELECT * FROM E_board_file;
-- 업체 예약 																						
CREATE TABLE E_rezmsg (
rno INT PRIMARY KEY AUTO_INCREMENT,
eno INT REFERENCES E_board(eno),
reader varchar(50),
rezdate varchar(50),
reztime varchar(50),
writer varchar(50),																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																				
content varchar(256) ,
regdate TIMESTAMP DEFAULT NOW(),
FOREIGN KEY (eno) REFERENCES E_board(eno),
FOREIGN KEY (writer) REFERENCES GH_User(userid) ON DELETE CASCADE
);
-- 따로
-- cs의 공지사항 파일테이블 생성
CREATE TABLE notice_file(
nfno INT PRIMARY KEY AUTO_INCREMENT,
nno INT NOT NULL,
fileName VARCHAR(50) NOT NULL,
FOREIGN KEY (nno) REFERENCES notice (nno) ON DELETE CASCADE
);

-- cs의 1:1 이용자 질문 테이블 생성
-- one to one의 o사용
CREATE TABLE oto(
qono INT PRIMARY KEY AUTO_INCREMENT,
otitle VARCHAR(50) NOT NULL,
userid  VARCHAR(50),
odetail VARCHAR(900) NOT NULL,
oregdate  TIMESTAMP DEFAULT NOW() NOT NULL,
FOREIGN KEY (userid) REFERENCES GH_User(userid) ON DELETE CASCADE
);

-- cs의 1:1 관리자 답변 테이블 생성
CREATE TABLE otoanswer(
aono INT PRIMARY KEY AUTO_INCREMENT,
qono INT NOT NULL,
content VARCHAR(900) Not null,
userid  VARCHAR(50),
regdate  TIMESTAMP DEFAULT NOW() NOT NULL,
FOREIGN KEY (qono) REFERENCES oto(qono) ON DELETE CASCADE,
FOREIGN KEY (userid) REFERENCES GH_User(userid) ON DELETE CASCADE
);

-- 1:1 게시판 파일테이블
CREATE TABLE otofile (
id INT PRIMARY KEY AUTO_INCREMENT,
qono INT,
fileName VARCHAR(200),
FOREIGN KEY (qono) REFERENCES oto(qono) ON DELETE CASCADE
);

-- cs의 공지사항 테이블 생성
-- notice의 n사용
CREATE TABLE notice(
nno INT PRIMARY KEY AUTO_INCREMENT,
ntitle VARCHAR(50) NOT NULL,
userid  VARCHAR(50) NOT NULL,
ndetail VARCHAR(900) NOT NULL,
nregdate  TIMESTAMP DEFAULT NOW() NOT NULL,
FOREIGN KEY (userid) REFERENCES GH_User(userid) ON DELETE CASCADE
);
