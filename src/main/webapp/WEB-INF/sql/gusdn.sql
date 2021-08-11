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
SELECT 
		  		bno bno,
		  		title title,
		  		content content,
		  		writer writer,
		  		regdate regdate,
		  		updatedate updatedate, 
		  		cbcategory cbcategory
		  	FROM C_board
		  	ORDER BY bno DESC;

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
INSERT INTO S_product (category, userid, title, price, stock, delivery, detail, keyword)
VALUES ('가구', 'poi0909', '침대', '100000', '10', '일반배송', '침대를 팝니다', '#침실');
-- 이미지파일 업로드
CREATE TABLE S_product_file( 
    id INT PRIMARY KEY AUTO_INCREMENT, -- 파일 아이디 식별자
    pno INT NOT NULL, -- 상품번호 (글번호)
    fileName VARCHAR(256), -- 파일이름
    FOREIGN KEY (pno) REFERENCES S_product(pno) ON DELETE CASCADE-- 상품번호
);
CREATE TABLE cart( 
    cno INT PRIMARY KEY AUTO_INCREMENT, -- 카트 상품 넘버
    userid VARCHAR(50) NOT NULL, -- 소비자
    pno INT NOT NULL, -- 상품번호 (글번호)
    cartstock int NOT NULL, -- 주문 수량
    adddate TIMESTAMP DEFAULT NOW(), -- 장바구니에 담은 날짜
    FOREIGN KEY (pno) REFERENCES S_product(pno) ON DELETE CASCADE, -- 상품번호
    FOREIGN KEY (userid) REFERENCES GH_User(userid) ON DELETE CASCADE -- 고객정보
);
select*from S_product;
SELECT*from cart;
INSERT INTO cart (userid, pno, cartstock)
VALUES ('poi0909', '4', '3');
select
c.cno as cno,
c.userid as userid,
s.pno as pno,
u.userid as userid,
c.cartstock as cartstock,
s.title as title,
s.detail as detail,
s.price as price,
(price * cartstock) money
from GH_User u, S_product s, cart c where u.userid = c.userid and s.pno = c.pno and c.userid = 'poi0909' 
order by c.cno;
delete from cart WHERE cno = "6";
SELECT COUNT(*)
FROM cart
WHERE userid = 'poi0909'
AND pno = '4';
SELECT NVL(SUM(price * cartstock), 0) money 
FROM cart c, S_product s 
WHERE c.pno = s.pno and c.userid = 'poi0909';
UPDATE cart
SET cartstock = cartstock + '3'
WHERE userid = 'poi0909'
AND pno = '4';

CREATE TABLE userorder_info(     
    ono INT PRIMARY KEY AUTO_INCREMENT,
    userid VARCHAR(50) NOT NULL, -- 주문자
    userAddr1 VARCHAR(50) NOT NULL, -- 우편번호
    userAddr2 VARCHAR(50) NOT NULL, -- 기본주소
    userAddr3 VARCHAR(30) NOT NULL, -- 상세주소
    orderphone VARCHAR(15) NOT NULL, -- 연락처
    FOREIGN KEY (userid) REFERENCES GH_User(userid) ON DELETE CASCADE -- 고객정보
);

CREATE TABLE order_detail(
    dno INT PRIMARY KEY AUTO_INCREMENT, -- 주문 상세 고유번호
    orderno INT NOT NULL, -- 주문번호
    pno INT NOT NULL, -- 상품 번호
    cno INT NOT NULL, -- 장바구니 번호
    cartcount INT NOT NULL, -- 장바구니 수량
    FOREIGN KEY (pno) REFERENCES S_product(pno) ON DELETE CASCADE, -- 제품에서 바로 할때
    FOREIGN KEY (cno) REFERENCES cart(cno) ON DELETE CASCADE -- 장바구니 번호 
);
