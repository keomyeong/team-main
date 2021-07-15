package org.zerock.domain;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAOImpl implements UserDAO {
	
	
	@Inject
	SqlSessionFactory sqlSessionFactory;
//	SqlSession sqlSession;
	
	@Override
	public String loginCheck(UserVO vo) {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			
			return session.selectOne("user.login_check", vo);
		}
		
	}
}
