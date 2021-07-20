package org.zerock.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.UserVO;
import org.zerock.service.UserService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/main")

//질문 : view -> main 폴더? /home 루트 ,@RequestMapping 검색해보기 
public class MainController {
	
	// 너가 알아서 맵핑 해줘 
	@Setter(onMethod_ = @Autowired)
	private UserService service;
	
	
	//메인 홈 
	@RequestMapping("/home")
	public void main() {
		log.info("home method");
	}
	
	@RequestMapping("/mypage")
	public void mypage() {
		log.info("mypage method");
	}
	
	//로그인 
	@RequestMapping("/login")
	public void login() {
		log.info("login method");
	}
	
	//약관동의  
	@RequestMapping("/tos")
	public void tos() {
		log.info(" Terms of service method");
	}
	
	//회원가입 
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public void signup() {
		log.info(" singup method");
	}
	
	//회원가입 
		@RequestMapping(value = "/signup", method = RequestMethod.POST)
		public String signupPost(UserVO vo, RedirectAttributes rttr) {
			log.info(" singupPost method");
			
			boolean ok = service.insert(vo);
			
			if (ok) {
				return "redirect:/main/home";
			} else {
				return "redirect:/main/signup?error";
			}
			
		}
}






