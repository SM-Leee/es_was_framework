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
	<div class = "tab-control hide opacity">
		
		<ul class="tabs">

		</ul>
	</div>
	<!-- iframe -->
	<div class="body-frame hide opacity">
	</div>
	
	<!-- footer -->
	<c:import url="/WEB-INF/views/main/footer.jsp"/>
	<!-- loading -->
	<div id = "Progress_Loading">
		<img src = "<c:url value="/resources/assets/images/loading.gif"/>"/>
	</div>
	<!-- notic(공지사항) -->
	<c:import url="/WEB-INF/views/main/notice_popup.jsp"/>
	
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
	              $(".body-frame").append("<iframe class ='iframe-control show' id='"+id+"' data-title='"+ $a.attr("title") +"' frameborder=0 framespacing=0 marginheight=0 marginwidth=0 src='${pageContext.servletContext.contextPath }/"+id+"'></iframe>");
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

	}); 
         				
		 $(document).on("click", ".tab-name", function(){
       		var tab_id = $(this).parent().attr("data-tab");
       		$(".tab-link.current").removeClass("current");
       		$(this).parent().addClass("current");
       		$(".iframe-control.show").removeClass("show");
       		$("#"+tab_id).addClass("show");
       		
       		$(".menu-link.nav-link.selected").removeClass("selected");
       		$('a[data-id='+tab_id+']').addClass("selected");
       		
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