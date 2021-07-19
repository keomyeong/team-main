package org.zerock;

import static org.junit.Assert.*;	



import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.AuthVO;
import org.zerock.domain.UserVO;
import org.zerock.mapper.UserMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		{"file:src/main/webapp/WEB-INF/spring/root-context.xml", 
			"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class UserMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private UserMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder encoder;
	
	@Test
	public void test() {
		assertNotNull(mapper);
		
		
	}
	@Test
	public void testInsert1() {
		UserVO vo1 = new UserVO();
		vo1.setUserid("user");
		vo1.setUserpw(encoder.encode("user")); // encode
		vo1.setUserName("유저");
		
		mapper.insert(vo1);
	}
	
	@Test
	public void testInsert2() {
		UserVO vo1 = new UserVO();
		vo1.setUserid("admin");
		vo1.setUserpw(encoder.encode("admin")); // encode
		vo1.setUserName("어드민");
		
		mapper.insert(vo1);
	}
	
	@Test
	public void testInsertAuth() {
		
		AuthVO vo1 = new AuthVO();
		vo1.setAuth("ROLE_User");
		vo1.setUserid("user");
		mapper.insertAuth(vo1);
		
		vo1.setAuth("ROLE_User");
		vo1.setUserid("admin");
		mapper.insertAuth(vo1);
		
		vo1.setAuth("ROLE_ADMIN");
		vo1.setUserid("admin");
		mapper.insertAuth(vo1);
		
	}
	@Test
	public void testRead() {
		UserVO vo = mapper.read("admin");
		
		assertEquals(2, vo.getAuthList().size());
		assertEquals("admin", vo.getUserid());
		assertEquals("어드민", vo.getUserName());
		assertTrue(encoder.matches("admin", vo.getUserpw()));
		assertTrue(vo.isEnabled());
	}
}
