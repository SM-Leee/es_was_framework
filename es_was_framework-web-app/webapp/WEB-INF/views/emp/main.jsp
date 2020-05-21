<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Login V6</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="${pageContext.servletContext.contextPath }/assets/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath }/assets/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath }/assets/assets/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath }/assets/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath }/assets/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath }/assets/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath }/assets/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath }/assets/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath }/assets/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath }/assets/css/login/util.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath }/assets/css/login/main.css">
<!--===============================================================================================-->
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-t-85 p-b-20">
			<c:choose>
			<c:when test="${empty authuser }">
				<span class="login100-form-title p-b-70">
					세션 없음
				</span>
			</c:when>
			<c:otherwise>
				<span class="login100-form-title p-b-70">
					세션 존재
				</span>
			</c:otherwise>
			</c:choose>
				<ul>
					<li>
						<span class="txt1">
							MA_EMP Table JSON으로 조회
						</span>
						<div class="wrap-login100 p-b-20">
							<form class="login100-form validate-form" id="login-form" method="post" action="${pageContext.servletContext.contextPath }/emp/listJdbc">
								<span class="txt1">
								procname	
								</span>
								<div class="wrap-input100 validate-input m-b-35" data-validate = "Enter procname">
									<input class="input100" type="text" name="procname" id="procname">
									<span class="focus-input100"></span>
								</div>
								<span class="txt1">
								company	
								</span>
								<div class="wrap-input100 validate-input m-b-35" data-validate="Enter company">
									<input class="input100" type="text" name="company" id="company">
									<span class="focus-input100"></span>
								</div>
			
								<div class="container-login100-form-btn">
									<button class="login100-form-btn">
										POST 방식 조회하기
									</button>
								</div>
			
							</form>
						</div>
					</li>
					
					<li>
						<span class="txt1">
							MA_EMP Table Json으로 출력
						</span>
	
						<a href="${pageContext.servletContext.contextPath }/emp/listMyBatisMs" class="txt2">
							조회(MyBatis - MsSql방식)
						</a>
					</li>
					
					<li>
						<span class="txt1">
							MA_EMP Table Json으로 출력
						</span>
	
						<a href="${pageContext.servletContext.contextPath }/emp/listMyBatisOra" class="txt2">
							조회(MyBatis - Oracle방식)
						</a>
					</li>
					
					<li>
						<span class="txt1">
							Session 값 Json으로 출력
						</span>
	
						<a href="${pageContext.servletContext.contextPath }/emp/getSessionValue" class="txt2">
							조회(Session)
						</a>
					</li>
					<li>
						<span class="txt1">
							트랜잭션 테스트
						</span>
	
						<a href="${pageContext.servletContext.contextPath }/emp/transactionTest" class="txt2">
							테스트 하기
						</a>
					</li>
					<li>
						<span class="txt1">
							로그인 화면 이동
						</span>
	
						<a href="${pageContext.servletContext.contextPath }/" class="txt2">
							페이지 이동
						</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	
<!--===============================================================================================-->
	<script src="${pageContext.servletContext.contextPath }/assets/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.servletContext.contextPath }/assets/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.servletContext.contextPath }/assets/vendor/bootstrap/js/popper.js"></script>
	<script src="${pageContext.servletContext.contextPath }/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.servletContext.contextPath }/assets/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.servletContext.contextPath }/assets/vendor/daterangepicker/moment.min.js"></script>
	<script src="${pageContext.servletContext.contextPath }/assets/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.servletContext.contextPath }/assets/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.servletContext.contextPath }/asstes/js/main.js"></script>

</body>
</html>