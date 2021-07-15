package org.zerock.controller.lecture;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;
@Controller
@RequestMapping("/board/*")
@Log4j
public class BoardController {
	
	@RequestMapping("/main")
	public void main() {
		
	}
}
