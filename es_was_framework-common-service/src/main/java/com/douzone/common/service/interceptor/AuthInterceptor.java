package com.douzone.common.service.interceptor;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.douzone.common.model.user.LoginUser;
import com.douzone.common.service.interceptor.Auth.Role;


public class AuthInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(
			HttpServletRequest request, 
			HttpServletResponse response, 
			Object handler) throws Exception {
		
		System.out.println("[AuthInterceptor 실행]");
		
		// 1. Handler 종류 확인
		if(handler instanceof HandlerMethod == false) {
			return true;
		}
		
		// DefaultServlet메소드라면 캐스팅 작업에서 에러 발생
		// 2. Casting
		HandlerMethod handlerMethod = (HandlerMethod)handler;

		// 3. Method @Auth 받아오기
		Auth auth = handlerMethod.getMethodAnnotation(Auth.class);
		
		// 3-1. Method에 @Auth가 안 붙어 있으면 class(type)의 @Auth 받아오기
		if(auth == null) {
			auth = handlerMethod.getMethod().getDeclaringClass().getAnnotation(Auth.class);
		}
		// handlerMethod.getMethod().getDeclaringClass().geta
		// 4. Method @Auth가 안 붙어 있으면
		if(auth == null) {
			return true;
		}
		
		// 5. @Auth 붙어 있기 때문에 로그인 여부(인증여부)를 확인
		HttpSession session = request.getSession();
		LoginUser authUser = (session == null) ? null : (LoginUser)session.getAttribute("currentUser");
		
		
		// 인증이 안됨
		if(authUser == null) {
			response.sendRedirect(request.getContextPath() + "/duzon-was/login");
			return false;
		}
		
		// 5-1. Role 비교 작업
		Role role = auth.value();
		
		if("ADMIN".equals(role.toString())) {
			if("ADMIN".equals(authUser.getGRADE_USER()) == false) {
				response.sendRedirect(request.getContextPath());
				return false;
			}
		}
		// 6. 접근 허용
		return true;
	}

}