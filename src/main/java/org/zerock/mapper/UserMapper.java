package org.zerock.mapper;

import org.zerock.domain.AuthVO;
import org.zerock.domain.UserVO;

public interface UserMapper {
	//추가
	public int insert(UserVO vo);
	public int insertAuth(AuthVO vo);
	//조회
	public UserVO read(String userid);
	

}
