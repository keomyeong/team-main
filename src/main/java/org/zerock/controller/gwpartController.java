package org.zerock.controller;

import java.security.Principal;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.service.UserService;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/gwpart")
public class gwpartController {
	
	@Setter(onMethod_ = @Autowired)
	private UserService userservice;
	
	@RequestMapping("/carts")
	public void carts() {
		
	}
	@RequestMapping("/product")
	public void product() {
		
	}
	@RequestMapping("/orders")
	public void orders() {
		
	}
	
	

}
