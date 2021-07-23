package org.zerock.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class UserVO {
	
	private String userid;
	private String userpw;
	private String userName;
	private String userEmail;
	private String userPhone;
	private String useradd;
	private String CompanyRegistrationNumber;
	private Date regdate;
	private Date updateDate;
	private boolean enabled;
	
	private String userpwck;

	
	//유저에있는권한들 
	private List<AuthVO> authList;
	
}
