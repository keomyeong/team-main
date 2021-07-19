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
    regdate TIMESTAMP DEFAULT NOW(),
    updateDate TIMESTAMP DEFAULT NOW(),
    enabled TINYINT(1) DEFAULT 1
);

CREATE TABLE GH_User_auth (
	id INT PRIMARY KEY AUTO_INCREMENT,
	userid VARCHAR(50) NOT NULL,
    auth VARCHAR(50) NOT NULL,
    FOREIGN KEY (userid) REFERENCES GH_User(userid)
);

SELECT * FROM GH_User;
SELECT * FROM GH_User_auth;

INSERT into GH_User (userid, userpw, username)
VALUEs ('admin', 'admin', 'admin');

desc GH_User_auth;

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

