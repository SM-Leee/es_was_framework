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
				<form class="login100-form validate-form" id="login-form" method="post" action="${pageContext.servletContext.contextPath }/user/auth">
					<span class="login100-form-title p-b-70">
						Douzone
					</span>
					<span class="txt1">
						Email
					</span>
					<div class="wrap-input100 validate-input m-b-35" data-validate = "Enter username">
						<input class="input100" type="text" name="email" id="email">
						<span class="focus-input100"></span>
					</div>
					
					<span class="txt1">
						Password
					</span>
					<div class="wrap-input100 validate-input m-b-50" data-validate="Enter password">
						<input class="input100" type="password" name="password" id="password">
						<span class="focus-input100"></span>
					</div>

					<div class="container-login100-form-btn m-b-20">
						<button class="login100-form-btn">
							로그인
						</button>
					</div>
				</form>
				</c:when>
				<c:otherwise>
				<span class="login100-form-title p-b-70">
					로그인 되어 있습니다.
				</span>
				<li>
					<a href="${pageContext.servletContext.contextPath }/user/logout" class="txt2">
						로그아웃(세션 해제)
					</a>
				</li>
				</c:otherwise>
				</c:choose>
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