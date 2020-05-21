package com.douzone.common.service.interceptor;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.douzone.common.model.user.LoginUser;
import com.douzone.common.service.login.LoginService;


public class AuthLoginInterceptor extends HandlerInterceptorAdapter {
	
	@Autowired
	private LoginService loginService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		String companyCode = request.getParameter("company_code");
		String groupCode = request.getParameter("group_code");
		String userId = request.getParameter("userId");
		String password = request.getParameter("password");
		
		System.out.println("[AuthLoginInterceptor]");
		System.out.println("Company Code: " + companyCode);
		System.out.println("Group Code: " + groupCode);
		System.out.println("User Id: " + userId);
		System.out.println("Password: " + password);
		System.out.println("=========================================================================");
		
		LoginUser result = loginService.getUser(companyCode, groupCode, userId, password);

		System.out.println("[AuthLoginInterceptor]");
		System.out.println("Company Code: " + companyCode);
		System.out.println("Group Code: " + groupCode);
		System.out.println("User Id: " + userId);
		System.out.println("Password: " + password);
		System.out.println("=========================================================================");
		
		if(result == null) {
			response.sendRedirect(request.getContextPath() + "/");
			return false;
		}
		
		HttpSession session = request.getSession(true);		
		session.setAttribute("authuser", result);
		
		response.sendRedirect(request.getContextPath() + "/main/maintest");
		
		return false;
	}

}
