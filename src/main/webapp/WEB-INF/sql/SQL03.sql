use Gohome;
drop table carts;

create table carts (
  id INT PRIMARY KEY AUTO_INCREMENT,
  status integer default 0,
  userid VARCHAR(50) references GH_User
);  

create table items (
  cartid INT UNIQUE,
  productid INT UNIQUE,
  FOREIGN KEY (cartid)  references carts(id),
  FOREIGN KEY (productid)  references product(id),
  amount integer not null
);

create table product (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title varchar(50) not null,
    price varchar(50) not null,
    content varchar(256),
    image varchar(255)
);


CREATE TABLE GH_auth(
id INT PRIMARY KEY AUTO_INCREMENT,
userid VARCHAR(50) NOT NULL,
auth VARCHAR(50) NOT NULL,
FOREIGN KEY (userid) REFERENCES GH_User(userid)
);
CREATE TABLE GH_Message (
	mno INT PRIMARY KEY AUTO_INCREMENT,
    writer varchar(50) ,
    reader varchar(50) ,
    content varchar(256) ,
	regdate TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (writer) REFERENCES GH_User(userid)
);
ALTER TABLE GH_Message ADD COLUMN FOREIGN KEY (reader) REFERENCES GH_User(userid);
-- 이거 왜 안됨??? 나중에 찾아보기 

CREATE table GH_User(
	userid VARCHAR(50) PRIMARY key,
	userpw VARCHAR(100) not null,
	username VARCHAR(100) NOT NULL,
    userEmail VARCHAR(100) NOT NULL,
    userPhone VARCHAR(50) NOT NULL,
    useradd varchar(100),
    CompanyRegistrationNumber varchar(100),
    regdate TIMESTAMP DEFAULT NOW(),
    updateDate TIMESTAMP DEFAULT NOW(),
    enabled TINYINT(1) DEFAULT 1
);
