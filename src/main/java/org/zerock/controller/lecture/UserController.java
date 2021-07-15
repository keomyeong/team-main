package org.zerock.controller.lecture;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.UserVO;
import org.zerock.service.UserService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/user/*")
@Log4j
public class UserController {

	@Setter(onMethod_ = @Autowired)
	private UserService service;

	@Inject
	UserService userservice;

	@RequestMapping("/login")
	public String login() {
		return "user/login";

	}
	

	@RequestMapping("logout") // logout에 매핑
	public ModelAndView logout(HttpSession session, ModelAndView mav) {
//		UserService.logout(session); // 세션 초기화 작업
		mav.setViewName("user/login"); // 이동할 페이지의 이름
		mav.addObject("message", "logout"); // 변수 저장
		return mav; // 페이지로 이동
	}

	@RequestMapping("loginCheck")
	public ModelAndView login_check(@ModelAttribute UserVO vo, HttpSession session) {
		// login페이지에서 넘어와서 VO에 저장된 아이디와 비밀번호를 @ModeAttribute어노테이션을 사용해서 한꺼번에 2개를 다 받는다.
		// 사용자가 로그인한 정보를 계속 가지고 있게 하기 위해서 세션도 받는다.
		// 로그인 성공 => 이름이 넘어옴, 실패 => NULL이 넘어옴

//		String name = UserService.loginCheck(vo, session);
		// 서비스 계층에 loginCheck메소드의 매개값으로 vo (아이디, 비밀번호, 세션) 변수 name에 저장

		ModelAndView mav = new ModelAndView();
		// 데이터를 보낼 뷰와 데이터를 동시에 설정하기 위해 ModelAndView타입의 객체를 생성한다.

//		if (name != null) { // 로그인이 성공하면 시작페이지로 이동함.
//
//			mav.setViewName("main");
//
//		} else {// 로그인이 실패하면 login 페이지로 다시 돌아감
//			mav.setViewName("user/login");
//
//			mav.addObject("message", "error"); // 로그인 페이지에 에러라는 값을 준다. 그러면 그 에러메시지를 값으로 받아서 경고메시지 출력
//		}
		return mav;
	}

	@PostMapping("/signup")
	public String signupPost(UserVO vo, RedirectAttributes rttr) {
		log.info(vo);

		boolean ok = service.insert(vo);

		if (ok) {
			return "redirect:/user/main";
		} else {
			return "redirect:/user/login";
		}
	}

}
