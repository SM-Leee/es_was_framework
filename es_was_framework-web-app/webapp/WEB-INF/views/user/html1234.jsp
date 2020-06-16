<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src= "<c:url value="/resources/assets/js/jquery/jquery-1.9.0.js"/>"></script>

</head>
<style>
  body {
    background-color: white;
  }
</style>
<body>
	<p>1234</p>
</body>
 <script type="text/javascript">
 	$(document).ready(function(){
 		
 		<%-- console.log(<%=name  %>); --%>
 		var selector = parent.document.querySelector('.menu-link.nav-link.selected');
 		var selector2 = parent.document.querySelector('.menu-link');
 		console.log("1", selector);
 		console.log("2", selector2);
 		console.log("3", $(selector).attr('title'));
 	});
 </script>
</html>