use Gohome;

create DATABASE Gohome;

drop table GH_User;
drop table GH_User_auth;

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

CREATE TABLE GH_auth(
id INT PRIMARY KEY AUTO_INCREMENT,
userid VARCHAR(50) NOT NULL,
auth VARCHAR(50) NOT NULL,
FOREIGN KEY (userid) REFERENCES GH_User(userid)
);

SELECT * FROM GH_User;
SELECT * FROM GH_auth;

INSERT  GH_User (userid, userpw, username)
VALUEs ('admin', 'admin', 'admin');

desc GH_User_auth;

SELECT * FROM GH_User WHERE companyRegistrationNumber is NOT NULL;

 SELECT * FROM 
    GH_User g LEFT JOIN GH_User_auth a ON g.userid = a.userid
  WHERE
   a.auth = 'ROLE_BUSINESS';

insert into GH_User_auth (userid, auth) values ('admin', 'ROLE_USER');

SELECT 
	m.userid userid,
	m.userpw userpw,
	m.username username,
	m.enabled enabled,
	m.regdate regdate,
	m.updateDate updateDate,
	a.auth auth
  FROM 
    GH_User m LEFT JOIN GH_User_auth a ON m.userid = a.userid
  WHERE
    m.userid = 'user';

update GH_User_auth
set auth = 'ROLE_USER' where auth = 'ROLE_User';

create table persistent_logins (
    username varchar(64) not null,
    series varchar(64) primary key,
    token varchar(64) not null,
    last_used timestamp not null
);

DESC persistent_logins;
drop table GH_Message;
SELECT * FROM GH_Message;

CREATE TABLE GH_Message (
	mno INT PRIMARY KEY AUTO_INCREMENT,
    writer varchar(50) ,
    reader varchar(50) ,
    content varchar(256) ,
	regdate TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (writer) REFERENCES GH_User(userid)
);
insert into GH_Message (writer, reader, content) values ('qwert', 'admin', 'admin');
insert into GH_Message (writer, reader, content) values ('admin', 'admin', 'admin');
insert into GH_Message (writer, reader, content) values ('qwert', 'qwert', 'qwert');
insert into GH_Message (writer, reader, content) values ('admin', 'qwert', 'admin');
 SELECT * FROM GH_Message WHERE writer = "qwert" order by mno desc;
SELECT * FROM GH_Message WHERE reader = "qwert" order by mno desc;
