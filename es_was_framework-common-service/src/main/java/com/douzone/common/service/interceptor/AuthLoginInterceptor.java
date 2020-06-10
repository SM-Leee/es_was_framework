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
		
		System.out.println("[AuthLoginInterceptor 실행]");
		String companyCode = request.getParameter("company_code");
		String groupCode = request.getParameter("group_code");
		String userId = request.getParameter("userId");
		String password = request.getParameter("password");
		
		LoginUser result = loginService.getUser(companyCode, groupCode, userId, password);
		
		if(result == null) {
			response.sendRedirect(request.getContextPath() + "/");
			return false;
		}
		
		HttpSession session = request.getSession(true);		
		session.setAttribute("currentUser", result);
		
		response.sendRedirect(request.getContextPath() + "/maintest");
		
		return false;
	}

}
