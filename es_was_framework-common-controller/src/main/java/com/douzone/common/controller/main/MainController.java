package com.douzone.common.controller.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.douzone.common.service.login.Menu;
import com.douzone.common.model.user.LoginUser;

@Controller
public class MainController {
	
	@Autowired
	private Menu menu;
	
	@RequestMapping({"", "/", "/main"})
	public String main(HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		if((LoginUser)session.getAttribute("currentUser") != null)
		{
			return "/main/maintest";
		}
		
		return "/login/login";
	}

	// (1) 로그인
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public void login() {
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

	@RequestMapping(value="/maintest", method=RequestMethod.GET)
	public String mainTest(HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		if((LoginUser)session.getAttribute("currentUser") == null)
		{
			return "/login/login";
		}
		return "/main/maintest";
	}
	
	@ResponseBody
	@RequestMapping(value="/module_menu", method = RequestMethod.POST)
	public String module_menu(String cdCompany) {
		JSONObject jo = menu.getMenu(cdCompany);
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

	@RequestMapping({"/P_HR_Z_LSH_GRID_TEST"})
	public String hrmSingleGrid(Model model) {
		System.out.println("P_HR_Z_LSH_GRID_TEST");
		return "/user/p_hr_z_lsh_grid_test";
	}

}
