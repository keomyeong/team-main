package org.zerock.mapper;

import org.zerock.domain.AuthVO;
import org.zerock.domain.UserVO;

public interface UserMapper {
	public int insert(UserVO vo);
	public int insertAuth(AuthVO vo);
	public UserVO read(String userid);

}
