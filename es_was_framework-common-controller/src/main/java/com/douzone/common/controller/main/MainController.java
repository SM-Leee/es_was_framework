package com.douzone.common.controller.main;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.douzone.common.service.login.Menu;

@Controller
public class MainController {
	
	@Autowired
	private Menu menu;
	
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
	
	@ResponseBody
	@RequestMapping(value="/module_menu", method = RequestMethod.POST)
	public String module_menu() {
		System.out.println("11111");
		System.out.println(menu);
		JSONObject jo = menu.getMenu("1000");
		System.out.println(jo);
		System.out.println("33333");
		return String.valueOf(jo);
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
