package com.douzone.exception;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.StringWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

// 모든 컨트롤러의 메소드가 exception이 발생했을 때, 동작하는 클래스
// 예외가 동일하므로 전역으로 예외를 처리하는 클래스를 만듦
// AOP 코드가 작동하여 컨트롤러 메소드가 작동하는 시점을 기록해놓는다.
// @ControllerAdvice도 스캐닝 동작을 하므로 스캐닝이 이루어지게 해야한다.
@ControllerAdvice
public class GlobalExceptionHandler {
	
	private static final Log LOG = LogFactory.getLog(GlobalExceptionHandler.class);
	
	@ExceptionHandler(Exception.class)
	public void handlerException(
			HttpServletRequest request,
			HttpServletResponse response,
			Exception e) throws Exception {
		
		StringWriter errors = new StringWriter();
		e.printStackTrace(new PrintWriter(errors));
		
		String accept = request.getHeader("accept");
		
		if(accept.matches(".*application/json.*")) {
			response.setStatus(HttpServletResponse.SC_OK);
			
			// byte로 출력
			OutputStream out = response.getOutputStream();
			//out.write(new ObjectMapper().writeValueAsString(JSONResult.fail("0", errors.toString())).getBytes("utf-8"));
			out.flush();
			out.close();
		}
		// html로 응답
		else {
			// uri는 어디에서 에러가 발생했는지
			request.setAttribute("uri", request.getRequestURI());
			request.setAttribute("exception", errors.toString());
			request.getRequestDispatcher("/WEB-INF/views/error/exception.jsp").forward(request, response);
		}
	}
}