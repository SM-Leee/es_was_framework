<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script src="https://unpkg.com/feather-icons"></script>
<style>
  body {
    	background-color: white;
  }
  .menu_tree_main{
  	height : 25px;
  	width: calc(100% - 20px);
  	/* margin-left: 20px;
    margin-top: 10px; */
    padding-left : 20px;
    padding-top: 10px;
    padding-bottom : 5px;
    background-color : #C0E0FF;
    
  }
  .menu_tree{
  	display : inline-block;
  	margin-left : 3px;
  	margin-right: 6px;
  	font-family: 'Exo', sans-serif;
  	
  }
  .menu_tree_bookmark{
 	color: gray;
    width: 20px;
    height: 20px;
    
 
  }
  .menu_title_main {
  	margin-top: 10px;
    margin-left: 30px;
    font-size: 25px;
    font-family: 'Exo', sans-serif;
    font-weight: bold;
  }
  /* .menu_tree::before{
  	background: url(images/blt-folder-closed.png) center center no-repeat;
  	vertical-align: middle;
    display: inline-block;
  	
  		
  } */
</style>
<div class="menu_tree_main">
	<!-- <i class="menu_tree_bookmark" data-feather = 'bookmark'></i> -->
</div>
<div class="menu_title_main">
	<span></span>
</div>
 <script type="text/javascript">
 	$(document).ready(function(){
 		console.log("123123", "1234");
 		var selector = parent.document.querySelectorAll('.menu-link.nav-link.selected');
 		var selector2 = parent.document.querySelector('.menu-link');
 		var selector2_title = $(selector2).attr('title');
 		var main_title = $(selector).attr('title');
 		console.log(selector2);
 		console.log(selector);
 		var selector4 = "<img src='resources/assets/css/main/images/blt-folder-closed.png' alt='MenuTree'/><div class='menu_tree'>"+$(selector).attr('title')+"</div>";
 		while(true){
 			selector = $(selector).parent().parent().prev();
 			selector4 = "<img src='resources/assets/css/main/images/blt-folder-closed.png' alt='MenuTree'/><div class='menu_tree'>"+$(selector).attr('title')+"</div>" + selector4;
 			
 			var selector_title = $(selector).attr('title');
 			if(selector2_title === selector_title){
 				break;
 			}
 		}
 		$('.menu_tree_main').append(selector4);
 		$('.menu_title_main span').text(main_title);
 		feather.replace();
 	});
 </script>