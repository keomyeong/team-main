package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/secure")
@Log4j
public class SecureController {
	
	@GetMapping(value = "/all", produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String doAll() {
		
		log.info("secure all method");
		return "아무나 들어 오거라~";
	}
	
	@GetMapping(value = "/user", produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String doUser() {
		
		log.info("secure user method");
		return "유저만 들어 오거라~";
	}
	
	@GetMapping(value = "/admin", produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String doAdmin() {
		log.info("secure admin method");
		
		return "어드민만 접근 가능 경로";
	}
	
}
