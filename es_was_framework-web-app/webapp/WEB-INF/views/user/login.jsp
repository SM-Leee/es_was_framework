<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>DOUZONE</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<link rel="icon" type="image/png" href="${pageContext.servletContext.contextPath }/assets/images/icons/favicon.ico"/> <!-- 타이틀 아이콘 -->
	<script type="text/javascript" src="${pageContext.servletContext.contextPath }/assets/js/jquery/jquery-1.9.0.js"></script>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath }/assets/js/grid/grid.js"></script> <!-- 그리드 생성 js -->
	
    <!-- Wijmo references (required) -->
	<script src="http://cdn.wijmo.com/5.20151.48/controls/wijmo.min.js" type="text/javascript"></script>
	<link href="http://cdn.wijmo.com/5.20151.48/styles/wijmo.min.css" rel="stylesheet" type="text/css" />

	<!-- Wijmo controls (optional, include the controls you need) -->
	<script src="http://cdn.wijmo.com/5.20151.48/controls/wijmo.grid.min.js" type="text/javascript"></script>
   <!--      
	<script src="http://cdn.wijmo.com/5.20151.48/controls/wijmo.chart.min.js" type="text/javascript"></script>
	<script src="http://cdn.wijmo.com/5.20151.48/controls/wijmo.input.min.js" type="text/javascript"></script>
	<script src="http://cdn.wijmo.com/5.20151.48/controls/wijmo.gauge.min.js" type="text/javascript"></script> -->

	<!-- Wijmo custom theme (optional, include the theme you like) -->
	<!-- 
	<link href="http://cdn.wijmo.com/5.20151.48/styles/themes/wijmo.theme.modern.min.css" rel="stylesheet" type="text/css" /> 
	-->
	<!--  Wijmo custom culture (optional, include the culture you want)-->
	<!--  <script src="http://cdn.wijmo.com/5.20151.48/controls/cultures/wijmo.culture.ja.min.js " type="text/javascript"></script> --> 

	<%--
	<script src="${pageContext.servletContext.contextPath }/assets/js/grid/wijmo.chart.min.js"></script>
	<script src="${pageContext.servletContext.contextPath }/assets/js/grid/wijmo.grid.min.js"></script>
	<script src="${pageContext.servletContext.contextPath }/assets/js/grid/wijmo.input.min.js"></script> 
	<script src="${pageContext.servletContext.contextPath }/assets/js/grid/wijmo.min.js"></script>
	<link href="${pageContext.servletContext.contextPath }/assets/css/grid/wijmo.min.css" rel="stylesheet" type="text/css"> 
	--%>

</head>
<script>
	onload = function() {

		var dataSource = {
			url: "/user/getEmp",
			type: "POST",
			success: function(result) {
				console.log(result);
			}
		}
		// iu-web package소스 따라서 구현해본거...
		var grid = {
	    	dataSource: dataSource,
	    	columns: [
	    		{
					field: "S",
	        		title: "S",
	        		width: 20    				  
	    		},
	    		{
	        		field: "NO_EMP",
	        		title: "사번",
	        		width: 100    				  
	    		},
	    		{
	        		field: "NM_KOR",
	        		title: "이름",
	        		width: 100    				  
	    		}  	   			  
	    	]
	    }
		createGrid(grid, '#gridProps');
		
	}

</script>
<body>

	<div id="gridProps"></div>
	login page
</body>
</html>