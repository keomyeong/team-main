package org.zerock.service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.zerock.domain.UserDAO;
import org.zerock.domain.UserVO;
import org.zerock.mapper.UserMapper;

import lombok.Setter;

@Service
public class UserServiceImpl implements UserService {
	
	@Setter(onMethod_ = @Autowired)
	private UserMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder encoder;
	
	@Inject
	UserDAO userDao;
	
	@Override
	public boolean insert(UserVO vo) {
		// 패스워드 암호화
		vo.setUserpw(encoder.encode(vo.getUserpw()));
		int cnt = mapper.insert(vo);
		return cnt == 1;
		}



	@Override
	public String loginCheck(UserVO vo, HttpSession session) {
		
		 String name = userDao.loginCheck(vo);
		 
	        if (name != null) {// 맞으면
	            // 세션변수 등록
	            session.setAttribute("userid", vo.getUserid());
	            // VO에 저장된 회원의 아이디를 userid라는 이름으로 세션에 저장
	 
	            session.setAttribute("name", name);
	            // 위에서 로그인체크를 할때 받은 name를 세션에 저장하고 이 이름을 name라고 저장한다.
	        }
	 
	        return name;
	 
	    }
	



	@Override
	public void logout(HttpSession session) {
		// 세션을 모두 초기화시킴 (로그아웃이므로 세션에 저장된 회원정보를 없애야 한다.)
        // invalidate( )메소드를 사용하면 사용자의 id까지 바뀌어버린다.
		session.invalidate();
		
	}

	

}
