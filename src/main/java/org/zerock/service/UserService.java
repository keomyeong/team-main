package org.zerock.service;

import javax.servlet.http.HttpSession;

import org.zerock.domain.UserVO;

public interface UserService {
	boolean insert(UserVO vo);
	public String loginCheck(UserVO vo, HttpSession session); //로그인 체크 메소드
    public void logout(HttpSession session); //로그아웃 체크 메소드


}
