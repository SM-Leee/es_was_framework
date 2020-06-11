<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>ERP-WEB</title>
	<script type="text/javascript" src="<c:url value="/resources/assets/js/jquery/jquery-1.9.0.js"/>"></script>
	<style>
		@import url(http://fonts.googleapis.com/css?family=Exo:100,200,400);
		@import url(http://fonts.googleapis.com/css?family=Source+Sans+Pro:700,400,300);
	
		body{
			margin: 0;
			padding: 0;
			background: #fff;
		
			color: #fff;
			font-family: Arial;
			font-size: 12px;
		}
	
		.body{
			position: absolute;
			top: -20px;
			left: -20px;
			right: -40px;
			bottom: -40px;
			width: auto;
			height: auto;
			background-image: url(http://ginva.com/wp-content/uploads/2012/07/city-skyline-wallpapers-008.jpg);
			background-size: cover;
			-webkit-filter: blur(5px);
			z-index: 0;
		}
	
		.grad{
			position: absolute;
			top: -20px;
			left: -20px;
			right: -40px;
			bottom: -40px;
			width: auto;
			height: auto;
			background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(0,0,0,0)), color-stop(100%,rgba(0,0,0,0.65))); /* Chrome,Safari4+ */
			z-index: 1;
			opacity: 0.7;
		}
	
		.header{
			position: absolute;
			top: calc(50% - 35px);
			left: calc(50% - 255px);
			z-index: 2;
		}
	
		.header div{
			float: left;
			color: #fff;
			font-family: 'Exo', sans-serif;
			font-size: 35px;
			font-weight: 200;
		}
	
		.header div span{
			color: #5379fa !important;
		}
	
		.login{
			position: absolute;
			top: calc(50% - 75px);
			left: calc(50% - 50px);
			height: 150px;
			width: 350px;
			padding: 10px;
			z-index: 2;
		}
	
		.login input[type=text]{
			width: 250px;
			height: 30px;
			background: transparent;
			border: 1px solid rgba(255,255,255,0.6);
			border-radius: 2px;
			color: #fff;
			font-family: 'Exo', sans-serif;
			font-size: 16px;
			font-weight: 400;
			padding: 4px;
			margin-top: 5px;
		}
	
		.login input[type=password]{
			width: 250px;
			height: 30px;
			background: transparent;
			border: 1px solid rgba(255,255,255,0.6);
			border-radius: 2px;
			color: #fff;
			font-family: 'Exo', sans-serif;
			font-size: 16px;
			font-weight: 400;
			padding: 4px;
			margin-top: 5px;
		}
	
		.login input[type=button]{
			width: 260px;
			height: 35px;
			background: #fff;
			border: 1px solid #fff;
			cursor: pointer;
			border-radius: 2px;
			color: #a18d6c;
			font-family: 'Exo', sans-serif;
			font-size: 16px;
			font-weight: 400;
			padding: 6px;
			margin-top: 10px;
		}
	
		.login input[type=button]:hover{
			opacity: 0.8;
		}
	
		.login input[type=button]:active{
			opacity: 0.6;
		}
		
		.login input[type=text]:focus{
			outline: none;
			border: 1px solid rgba(255,255,255,0.9);
		}
		
		.login input[type=password]:focus{
			outline: none;
			border: 1px solid rgba(255,255,255,0.9);
		}
		
		.login input[type=button]:focus{
			outline: none;
		}
		
		::-webkit-input-placeholder{
		   color: rgba(255,255,255,0.6);
		}
		
		::-moz-input-placeholder{
		   color: rgba(255,255,255,0.6);
		}
	</style>
<script src="<c:url value="/resources/assets/js/login/login.js"/>"></script>
</head>
<script type="text/javascript"></script>
<script>
/*
		$(document).ready(function() {
			$('#login_button').click(function() {
				console.log("�α��� ��ư Ŭ��");
				
				var companyCode = $("#company_code").val();
				var groupCode = $("#group_code").val();
				var userId = $("#userId").val();
				var password = $("#password").val();
				var database = $("#database").val();
				
				var user = {
					company_code : companyCode,
					group_code : groupCode,
					userId : userId,
					password : password
				};
				
				$.ajax({
					method : "post",
					dataType : "json",
					url : "duzon-was/login",
					data : user,
					success : function(data) {
					},
					error : function() {
						alert("�������� ���� ����� �Դϴ�.");
					}
				});
			});
		});
		sss
		*/
</script>
<body>
  <div class="body"></div>
		<div class="grad"></div>
		<div class="header">
			<div>DOUZONE<span>WEB</span></div>
		</div>
		<br>
		<div class="login">
			<form id="login-form" method="post" action="duzon-was/login">
			<span>ȸ���ڵ�</span>
			<input type="text" placeholder="CompanyCode" id="company_code" name="company_code"><br>
			<span>�׷��ڵ�</span>
			<input type="text" placeholder="GroupCode" id="group_code" name="group_code"><br>
			<span>���̵�&nbsp;&nbsp;&nbsp;&nbsp;</span>
			<input type="text" placeholder="UserId" id="userId" name="userId"><br>
			<span>��й�ȣ</span>
			<input type="password" placeholder="Password" id="password" name="password"><br>
			<button type="submit" id="login_button">Login</button>
			</form>
		</div>
  <!-- <script src='http://codepen.io/assets/libs/fullpage/jquery.js'></script> -->
</body>
</html>