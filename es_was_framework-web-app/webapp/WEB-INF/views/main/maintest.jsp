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

<body>
	<div class="header">
			<a href="#" class="header-logo">
				<img src= "<c:url value="/resources/assets/css/main/images/logo01.png"/>" alt="Douzone">
			</a>

			<div class="container-fluid">
			<ul class="navbar-nav align-items-center d-none d-md-flex">
          <li class="nav-item dropdown">
            <a class="nav-link2 pr-0" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <div class="media align-items-center header-media">
                <span class="avatar avatar-sm rounded-circle">
                  <img class = "header-image" alt="Image placeholder" src= "<c:url value="/resources/assets/css/main/images/team-4-800x800.jpg"/>">
                </span>
                <div class="media-body ml-2 d-none d-lg-block header-media-body">
                  <span class="mb-0 text-sm  font-weight-bold header-name">Jessica Jones</span>
                </div>
              </div>
            </a>
            <div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right">
              <div class=" dropdown-header noti-title">
                <h6 class="text-overflow m-0">Welcome!</h6>
              </div>
              <a href="#" class="dropdown-item">
                <i class="ni" data-feather="user"></i>
                <span>My profile</span>
              </a>
              <a href="#" class="dropdown-item">
                <i class="ni" data-feather="settings"></i>
                <span>Settings</span>
              </a>
              <a href="#" class="dropdown-item">
                <i class="ni" data-feather="calendar"></i>
                <span>Activity</span>
              </a>
              
              <div class="dropdown-divider"></div>
              <a href="#" class="dropdown-item">
                <i class="ni" data-feather="fast-forward"></i>
                <span>Session</span>
              </a>
              <a href="#!" class="dropdown-item">
                <i class="ni" data-feather="log-out"></i>
                <span>Logout</span>
              </a>
            </div>
          </li>
        </ul>
		</div>
	</div>

	<div class="menu hide">
				 <div class="adminx-sidebar expand-hover push">
					<div class="sidebar-nav">
						<div class="sidebar-nav-item"><a href="#"
							class="sidebar-nav-link active"> <span
								class="sidebar-nav-icon"> <i data-feather="home"></i>
							</span> <span class="sidebar-nav-name"> Dashboard </span>
						</a></div>

						<!-- <div class="sidebar-nav-item"><a href="#"
							class="sidebar-nav-link"> <span class="sidebar-nav-icon">
									<i data-feather="layout"></i>
							</span> <span class="sidebar-nav-name"> Layout Options </span>
						</a></div>

						<div class="sidebar-nav-item"><a class="sidebar-nav-link"
							href="#example"> <span class="sidebar-nav-icon"> <i
									data-feather="pie-chart"></i>
							</span> <span class="sidebar-nav-name"> Charts </span>
						</a>
						</div>

						<div class="sidebar-nav-item"><a class="sidebar-nav-link"
							href="#navTables"> <span class="sidebar-nav-icon"> <i
									data-feather="align-justify"></i>
							</span> <span class="sidebar-nav-name"> Tables </span>
						</a></div>

						<div class="sidebar-nav-item"><a class="sidebar-nav-link"
							href="#navForms"> <span class="sidebar-nav-icon"> <i
									data-feather="edit"></i>
							</span> <span class="sidebar-nav-name"> Forms </span>
						</a></div>

						<div class="sidebar-nav-item"><a class="sidebar-nav-link"
							href="#navUI"> <span class="sidebar-nav-icon"> <i
									data-feather="grid"></i>
							</span> <span class="sidebar-nav-name"> UI Elements </span>
						</a></div>

						<div class="sidebar-nav-item"><a
							class="sidebar-nav-link"
							href="#navExtra"><span class="sidebar-nav-icon"> <i data-feather="layers"></i>
							</span> <span class="sidebar-nav-name"> Other Layouts </span>
						</a></div> -->
					</div>
				</div> 

		<div class="submenu hide">
			<div class = "submenu-title hide">
				
			</div>
			<div class= "submenu-cancel"><i data-feather="x"></i></div>
			<ul class="menus hide">
				 <li class="folder"><a class="menu-link" href="#" title="인사관리"><span>인사관리</span></a>
            	<ul style="display:none;">
	            	<li class="page"><a class="menu-link nav-link" data-id="login2" href="#1" title="개인정보변경신청"><span>개인정보변경신청</span></a></li>
	            	<li class="page"><a class="menu-link nav-link" data-id = "html123" href="#2" title="비상연락망"><span>비상연락망</span></a></li>
	            	<li class="page"><a class="menu-link nav-link" data-id = "html1234" href="#3" title="증명서발급신청"><span>증명서발급신청</span></a></li>
	            	<li class="page"><a class="menu-link nav-link" href="#4" title="인사정보조회"><span>인사정보조회</span></a></li>
	            	<li class="page"><a class="menu-link nav-link" href="#5" title="부서직급별인원현황"><span>부서직급별인원현황</span></a></li>
	            	<li class="page"><a class="menu-link nav-link" href="#6" title="부서별총인원현황"><span>부서별총인원현황</span></a></li>
	            	<li class="page"><a class="menu-link nav-link" href="#7" title="화상조직도"><span>화상조직도</span></a></li>
	            </ul>
	          	</li>
	          	<li class="folder">
				<a class="menu-link" href="#" title="생산관리"><span>생산관리</span></a>
            	<ul style="display:none;">
	            	<li class="page"><a href="${pageContext.servletContext.contextPath }/main/login2.jsp" class="menu-link nav-link"  title="부서별총인원현황"><span>부서별총인원현황</span></a></li>
	            	<li class="folder"><a class="menu-link" href="#" title="메롱메롱"><span>메롱메롱</span></a>
	            	<ul style="display:none;">
	            		<li class="page"><a class="menu-link nav-link" href="#" title="인사정보조회"><span>인사정보조회</span></a></li>
		            	<li class="page"><a class="menu-link nav-link" href="#" title="부서직급별인원현황"><span>부서직급별인원현황</span></a></li>
		            	<li class="page"><a class="menu-link nav-link" href="#" title="부서별총인원현황"><span>부서별총인원현황</span></a></li>
	            	</ul>
	            	</li>
	            	<li class="page"><a class="menu-link nav-link" href="#" title="화상조직도"><span>화상조직도</span></a></li>
	            </ul>
	            </li>
          	</ul>
		</div>
	</div>
	<div class = "tab-control">
		
		<ul class="tabs">
			 <!-- <li class="tab-link current"  data-tab="tab-1">
				<span class='tab-name'>바보</span>
				<span class="tab-close-main"><i class="tab-close" data-feather='x'></i></span>
			</li>  -->
		</ul>
	</div>
	<div class="body-frame hide">
		<!-- <h3>안녕하세요</h3>	
	 	<h3 style="text-align:right">안녕하세요</h3>	 -->
	 	<%-- <iframe class ="iframe-control" src="${pageContext.servletContext.contextPath }/login2"></iframe> --%>
	</div>
	<div class="footer">
		Douzone FrameWork in LeeSeongMin / KangJaeSeong / LeeSoHyun
	</div>
	<script type="text/javascript" src= "<c:url value="/resources/assets/js/jquery/jquery-1.9.0.js"/>"></script>

</head>
<script type="text/javascript">
		//json data
		var module_menu = '{ "module" : [' +
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
						']}';
		var module_menu_data = JSON.parse(module_menu);
		
		for(var i = 1; i <= module_menu_data.module.length; i++)
		{
			var feather_item;
			switch(module_menu_data.module[i-1].FG_MODULE){
			case "MA" :
				feather_item = "settings";
				break;
			case "HR" :
				feather_item = "user";
				break;
			case "CO" :
				feather_item = "credit-card";
				break;
			case "FI" :
				feather_item = "dollar-sign";
				break;
			case "PR" :
				feather_item = "tool";
				break;
			case "PU" :
				feather_item = "gift";
				break;
			case "SA" :
				feather_item = "briefcase";
				break;
			case "SU" :
				feather_item = "user-minus";
				break;
			case "TR" :
				feather_item = "truck";
				break;
			case "PM" :
				feather_item = "monitor";
				break;
			default :
				feather_item = "clipboard";
				break;
			}
			
			$(".sidebar-nav").append('<div class="sidebar-nav-item" data-module="'+module_menu_data.module[i-1].FG_MODULE+'"><a href="#"'+
										'class="sidebar-nav-link"> <span class="sidebar-nav-icon">'+
										'<i data-feather="'+feather_item+'"></i>' +
										'</span> <span class="sidebar-nav-name">'+ module_menu_data.module[i-1].MODULE_NAME +'</span>'+
									 '</a></div>');
		}
		
		feather.replace();
		
		$(document).ready(function () {
			
			$(this).click(function(e){
				if($(e.target).hasClass("header-image")){
				}else if($(e.target).hasClass("header-name")){
				}else if($(e.target).hasClass("header-media")){	
				}else if($(e.target).hasClass("header-media-doby")){
				}else if($(e.target).hasClass("container-fluid")){
				}else if($(e.target).hasClass("nav-link2")){
				}else{
					$(".dropdown-menu").removeClass("show");
				}
				//console.log("123123", e.target);
			});
			
			//module menu click
            $(".sidebar-nav-link").each(function () {
                $(this).click(function () {
                    $(".sidebar-nav-link").removeClass("active");                      //클릭된 부분을 상단에 정의된 CCS인 selected클래스로 적용
                    $(this).addClass("active");  //siblings:형제요소들,    removeClass:선택된 클래스의 특성을 없앰
                    $(".submenu, .submenu-title, .menu, .menus, .body-frame, .tab-control").removeClass("hide");
                    $(".submenu, .submenu-title, .menu, .menus, .body-frame, .tab-control").addClass("show");
                    //hover event 강제종료
                    $(".adminx-sidebar.expand-hover").addClass("hoverstop");
                    $(".submenu-title").text($(this).text());
                    
                    //메뉴삭제
                    $('.menus').empty();
                    var module_type = $(this).parent().data("module");
                    
                    for(var i = 0; i < module_menu_data.menu.length; i++)
                    {
                    	var module_type_menu = module_menu_data.menu[i].FG_MODULE;
                    	//첫번째의 경우 모듈의 메뉴를 생성해야되므로 생성
                    	if(i === 0)
                		{
                			$('.menus').append('<li class="folder"><a class="menu-link" href="#" title="'+module_type+'"><span>'+$(this).text()+'</span></a><ul data-level="'+module_type+'" style="display:none;"></ul></li>');
                		}
                    	if(module_type === module_type_menu)
                    	{
	                    	var menu;
	                    	//해당 위치를 확인해서 그 tag에 저장할 수 있도록 수정필요함
	                    	if(module_menu_data.menu[i].FG_TYPE === "MEN")
	                    	{
	                    		$('ul[data-level='+module_menu_data.menu[i].UP_MENU+']').append('<li class="folder"><a class="menu-link" href="#" title="'+module_menu_data.menu[i].NM_KR+'"><span>'+module_menu_data.menu[i].NM_KR+'</span></a><ul data-level="'+module_menu_data.menu[i].ID_NAME+'" style="display:none;"></ul></li>');
	                    	}
	                    	else
	                    	{
	                    		$('ul[data-level='+module_menu_data.menu[i].UP_MENU+']').append('<li class="page"><a class="menu-link nav-link" data-id="'+module_menu_data.menu[i].ID_NAME+'" href="#" title="'+module_menu_data.menu[i].NM_KR+'"><span>'+module_menu_data.menu[i].NM_KR+'</span></a></li>');
	                    	}
                    	}
                    }
                    
                    feather.replace();
                    
                });
            });
			//submenu cancel
            $(".submenu-cancel").each(function(){
            	$(this).click(function(){
            		if($(".submenu").hasClass("show") === true) {
            			$(".submenu, .submenu-title, .menu, .menus, .body-frame, .tab-control").removeClass("show");
                        $(".submenu, .submenu-title, .menu, .menus, .body-frame, .tab-control").addClass("hide");
            		} else {
            			$(".submenu, .submenu-title, .menu, .menus, .body-frame, .tab-control").removeClass("hide");
                        $(".submenu, .submenu-title, .menu, .menus, .body-frame, .tab-control").addClass("show");
            		}
            	});
            });
            //hover event 강제 실행
            $(".submenu").mouseover(function(){
            	$(".adminx-sidebar.expand-hover").removeClass("hoverstop");
            });
            
            $(".nav-link2").each(function(){
         		$(this).click(function(){
         			if($(".dropdown-menu").hasClass("show") === true){
         				$(".dropdown-menu").removeClass("show");
         			}else {
         				$(".dropdown-menu").addClass("show");
         			}
         		});
         	});
            
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
	
	
</body>
</html>