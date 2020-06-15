<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!--
		  작성자 : 이 성 민
		  작성일 : 2020.03.09
		  메뉴명 : Big FrameWork
		  수정자 : 
		  수정일 :
		  수정내용 :
	  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>TestPage</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/assets/css/main/maintest.css"/>">
<script src="https://unpkg.com/feather-icons"></script>
<script type="text/javascript" src= "<c:url value="/resources/assets/js/jquery/jquery-1.9.0.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/assets/js/main/maintest.js"/>"></script>

</head>
<body>
	<c:import url="/WEB-INF/views/main/header.jsp"/>
	
	<!-- menu -->
	<div class="menu hide opacity">
				 <div class="adminx-sidebar expand-hover push">
					<div class="sidebar-nav">
						<!-- <div class="sidebar-nav-item"><a href="#"
							class="sidebar-nav-link active"> <span
								class="sidebar-nav-icon"> <i data-feather="home"></i>
							</span> <span class="sidebar-nav-name"> Dashboard </span>
						</a></div> -->

					</div>
				</div> 
		
		<!-- submenu -->
		<div class="submenu hide">
			<div class = "submenu-title hide">
				
			</div>
			<div class= "submenu-cancel"><i data-feather="x"></i></div>
			<ul class="menus hide">
          	</ul>
		</div>
	</div>
	<!-- tab-control -->
	<div class = "tab-control opacity">
		
		<ul class="tabs">

		</ul>
	</div>
	<!-- iframe -->
	<div class="body-frame hide opacity">
	</div>
	
	
	<c:import url="/WEB-INF/views/main/footer.jsp"/>
	
	<div id = "Progress_Loading">
		<img src = "<c:url value="/resources/assets/images/loading.gif"/>"/>
	</div>
	 <div class = "main_popup">
	 	<div class = "header_popup">
	 		<div class='header-name-main'>공지사항</div>
	 		<span class='popup-close-main'><i class='popup-close' data-feather='x-circle'></i></span>
	 	</div>
	 	<div class = "main_text_popup">
	 		<div class = "main_text_part1">
	 		
	 		</div>
	 		<div class = "main_text_part2">
	 		
	 		</div>
	 	</div>
	 	<div class = "footer_popup">
	 		<div class="footer_popup_col">				
					<a href="#" class="footer_popup_confirm footer_popup_comfirm_color"> 확인 </a>			
			</div>
		 	<div class = "footer_popup_close">
		 		<input type="checkbox" name="close" value="OK"/>  하루동안 이 창을 열지 않음
		 		<!-- <input class = "footer_popup_confirm" type="button" name="confirm" value="확인"/> -->
		 	</div>
		 	
	 	</div>
	</div>
	
</body>


 <script type="text/javascript">
 
	$(document).ready(function(){
	// 메뉴 트리 이벤트
	    $('.menus', self.container).on('click', '.menu-link', function(e) {
	      e.preventDefault();
	
	      var $a = $(e.target).closest('.menu-link');
	      var $container = $a.parents('.menus');
	      var $li = $a.parent('li');
	
	      if ($li.hasClass('folder')) {
	        if (!$a.hasClass('selected')) {
	          $a.addClass('selected');
	          //$a.parent().next().css("display" , "block");
	          $('> ul', $li).slideDown(100);
	        } else {
	          $a.removeClass('selected');
	          //$a.parent().next().css("display" , "none");
	          $('> ul', $li).slideUp(100);
	        }
	      } else {
	    	//파일 선택시 event
	        if ($a.hasClass('selected')) {
	          $a.removeClass('selected');
	        } else {
	       	  var tab_id = $a.attr("data-id");
	       	//$('li[data-tab='+tab_id+']')
	       	  if($('li[data-tab='+tab_id+']').length < 1)
	       	  {
	              $('li.page .menu-link.selected', $container).removeClass('selected');
	              $a.addClass('selected');
	              var id = $a.attr("data-id");
	              //tab 추가
	              $(".tab-link.current").removeClass("current");
	              $(".tab-control .tabs").append("<li class='tab-link current' data-tab='"+id+"'>" +
	            		  							"<span class='tab-name'>"+$a.attr("title")+"</span>" +
	            		  							"<span class='tab-close-main'><i class='tab-close' data-feather='x'></i></span>" +
	            		  							
	            		  						 "</li>");
	              //iframe 추가
	              $(".iframe-control.show").removeClass("show");
	              $(".body-frame").append("<iframe class ='iframe-control show' id='"+id+"' frameborder=0 framespacing=0 marginheight=0 marginwidth=0 src='${pageContext.servletContext.contextPath }/"+id+"'></iframe>");
	              feather.replace();
	            //progressbar 숨기기
	  			$("#Progress_Loading").css("display", "block");
	  			$(".body-frame").removeClass("nonopacity");
				$(".body-frame").addClass("opacity");
	              $(function(){
	            	 $("#"+id).load(function(){
	            		$("#Progress_Loading").css("display", "none");
	     	  			$(".body-frame").removeClass("opacity");
	     				$(".body-frame").addClass("nonopacity");
	            		
	            	 });
	              });
	              
	       	  }
	       	  else
	          {
	       		  $('li.page .menu-link.selected', $container).removeClass('selected');
	       		  $(".tab-link.current").removeClass("current");
	       		  $(".iframe-control.show").removeClass("show");
	              
	       		  $a.addClass('selected'); 
	              $('li[data-tab='+tab_id+']').addClass("current");
	  			  $("#"+tab_id).addClass("show");
	              
	       	  }
	        }
	      }
	    });
	
		$('.popup-close-main').each(function(){
			$(this).click(function(){
				$('.main_popup').addClass("hide2");
		    	console.log("123123", '123123');
			});
		});
		$('.footer_popup_col').each(function(){
			$(this).click(function(){
				if($("input:checkbox[name='close']").is(":checked")){
					//check되었을때
					$('.main_popup').addClass("hide2");
				} else {
					$('.main_popup').addClass("hide2");
				}
				$("input:checkbox[name='close']").attr("checked", false);
				console.log("123", $("input:checkbox[name='close']").is(":checked"));
			});
		});
		$('.empty_test').each(function(){
			$(this).click(function(){
				$('.main_popup').removeClass("hide2");
				$('.main_popup').addClass("show2");
			});
		});
	    
	});
		//json data
		/* var module_menu = '{ "module" : [' +
								'{"FG_MODULE" : "MA", "MODULE_NAME" : "마스터"},' +
								'{"FG_MODULE" : "HR", "MODULE_NAME" : "인사관리"},'+
								'{"FG_MODULE" : "CO", "MODULE_NAME" : "원가관리"},'+
								'{"FG_MODULE" : "FI", "MODULE_NAME" : "회계관리"},'+
								'{"FG_MODULE" : "PR", "MODULE_NAME" : "생산관리"},'+
								'{"FG_MODULE" : "PU", "MODULE_NAME" : "구매자재관리"},'+
								'{"FG_MODULE" : "SA", "MODULE_NAME" : "영업관리"},'+
								'{"FG_MODULE" : "SU", "MODULE_NAME" : "외주관리"},'+
								'{"FG_MODULE" : "TR", "MODULE_NAME" : "무역관리"},' +
								'{"FG_MODULE" : "PM", "MODULE_NAME" : "프로젝트관리"},' +
								'{"FG_MODULE" : "HH", "MODULE_NAME" : "기타"}' +
							  '],' +
							  '"menu" : [' +
								'{"ID_NAME" : "M_HR_1", "UP_MENU" : "HR", "FG_MODULE" : "HR", "FG_TYPE" : "MEN", "NM_KR" : "인사_1"},' +
								'{"ID_NAME" : "login2", "UP_MENU" : "M_HR_1", "FG_MODULE" : "HR", "FG_TYPE" : "PAG", "NM_KR" : "로그인화면"},' +
								'{"ID_NAME" : "M_HR_2", "UP_MENU" : "M_HR_1", "FG_MODULE" : "HR", "FG_TYPE" : "MEN", "NM_KR" : "인사_2"},' +
								'{"ID_NAME" : "M_HR_3", "UP_MENU" : "M_HR_2", "FG_MODULE" : "HR", "FG_TYPE" : "MEN", "NM_KR" : "인사_3"},' +
								'{"ID_NAME" : "M_HR_4", "UP_MENU" : "M_HR_3", "FG_MODULE" : "HR", "FG_TYPE" : "MEN", "NM_KR" : "인사_4"},' +
							    '{"ID_NAME" : "html123", "UP_MENU" : "M_HR_4", "FG_MODULE" : "HR", "FG_TYPE" : "PAG", "NM_KR" : "html123"},' +
								'{"ID_NAME" : "M_HR_5", "UP_MENU" : "HR", "FG_MODULE" : "HR", "FG_TYPE" : "MEN", "NM_KR" : "인사_5"},' +
								'{"ID_NAME" : "html1234", "UP_MENU" : "M_HR_5", "FG_MODULE" : "HR", "FG_TYPE" : "PAG", "NM_KR" : "html1234"}' +
							']}'; */
			
		    
         				
		 $(document).on("click", ".tab-name", function(){
       		var tab_id = $(this).parent().attr("data-tab");
       		$(".tab-link.current").removeClass("current");
       		$(this).parent().addClass("current");
       		$(".iframe-control.show").removeClass("show");
       		$("#"+tab_id).addClass("show");
    	});
		
		$(document).on("click", ".tab-close-main", function(){
			var tab_id2 = $(this).parent().data("tab");
			var tab_id3 = $(this).parent().prev().data("tab");
			
			$('li[data-tab='+tab_id3+']').addClass("current");
			$("#"+tab_id3).addClass("show");
			$('li[data-tab='+tab_id2+']').remove();
			$("#"+tab_id2).remove();
			
			$('.menu-link').removeClass("selected");
			$('a[data-id='+tab_id3+']').addClass("selected");
		});		 
		
	</script>

</html>