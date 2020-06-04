package com.douzone.common.controller.main;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
	
	@RequestMapping({"", "/main"})
	public String main(Model model) {
		System.out.println("main controller");
		return "/login/login";
	}

	// (1) 로그인
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public void login() {
		System.out.println("/login");
	}

	@RequestMapping(value="/login", method=RequestMethod.GET)
	public void loginGet() {
		System.out.println("duzon-was/login");
	}

	// (1) 로그아웃
	@RequestMapping(value="/logout", method=RequestMethod.POST)
	public void logout() {
		System.out.println("duzon-was/logout");
	}

	// (1) 로그아웃
	@RequestMapping(value="/maintest", method=RequestMethod.GET)
	public String mainTest() {
		System.out.println("/duzon-was/main");
		return "/main/maintest";
	}
	
	@RequestMapping({"/html123"})
	public String html123(Model model) {
		
		return "/user/html123";
	}
	@RequestMapping({"/html1234"})
	public String html1234(Model model) {
		return "/user/html1234";
	}

}
