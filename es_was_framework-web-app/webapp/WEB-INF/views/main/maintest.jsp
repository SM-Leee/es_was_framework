<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!--
		  �ۼ��� : �� �� ��
		  �ۼ��� : 2020.03.09
		  �޴��� : Big FrameWork
		  ������ : 
		  ������ :
		  �������� :
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
	<c:import url="/WEB-INF/views/main/header.jsp"/>
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
				 <li class="folder"><a class="menu-link" href="#" title="�λ����"><span>�λ����</span></a>
            	<ul style="display:none;">
	            	<li class="page"><a class="menu-link nav-link" data-id="login2" href="#1" title="�������������û"><span>�������������û</span></a></li>
	            	<li class="page"><a class="menu-link nav-link" data-id = "html123" href="#2" title="��󿬶���"><span>��󿬶���</span></a></li>
	            	<li class="page"><a class="menu-link nav-link" data-id = "html1234" href="#3" title="�����߱޽�û"><span>�����߱޽�û</span></a></li>
	            	<li class="page"><a class="menu-link nav-link" href="#4" title="�λ�������ȸ"><span>�λ�������ȸ</span></a></li>
	            	<li class="page"><a class="menu-link nav-link" href="#5" title="�μ����޺��ο���Ȳ"><span>�μ����޺��ο���Ȳ</span></a></li>
	            	<li class="page"><a class="menu-link nav-link" href="#6" title="�μ������ο���Ȳ"><span>�μ������ο���Ȳ</span></a></li>
	            	<li class="page"><a class="menu-link nav-link" href="#7" title="ȭ��������"><span>ȭ��������</span></a></li>
	            </ul>
	          	</li>
	          	<li class="folder">
				<a class="menu-link" href="#" title="�������"><span>�������</span></a>
            	<ul style="display:none;">
	            	<li class="page"><a href="${pageContext.servletContext.contextPath }/main/login2.jsp" class="menu-link nav-link"  title="�μ������ο���Ȳ"><span>�μ������ο���Ȳ</span></a></li>
	            	<li class="folder"><a class="menu-link" href="#" title="�޷ո޷�"><span>�޷ո޷�</span></a>
	            	<ul style="display:none;">
	            		<li class="page"><a class="menu-link nav-link" href="#" title="�λ�������ȸ"><span>�λ�������ȸ</span></a></li>
		            	<li class="page"><a class="menu-link nav-link" href="#" title="�μ����޺��ο���Ȳ"><span>�μ����޺��ο���Ȳ</span></a></li>
		            	<li class="page"><a class="menu-link nav-link" href="#" title="�μ������ο���Ȳ"><span>�μ������ο���Ȳ</span></a></li>
	            	</ul>
	            	</li>
	            	<li class="page"><a class="menu-link nav-link" href="#" title="ȭ��������"><span>ȭ��������</span></a></li>
	            </ul>
	            </li>
          	</ul>
		</div>
	</div>
	<div class = "tab-control">
		
		<ul class="tabs">
			 <!-- <li class="tab-link current"  data-tab="tab-1">
				<span class='tab-name'>�ٺ�</span>
				<span class="tab-close-main"><i class="tab-close" data-feather='x'></i></span>
			</li>  -->
		</ul>
	</div>
	<div class="body-frame hide">
		<!-- <h3>�ȳ��ϼ���</h3>	
	 	<h3 style="text-align:right">�ȳ��ϼ���</h3>	 -->
	 	<%-- <iframe class ="iframe-control" src="${pageContext.servletContext.contextPath }/login2"></iframe> --%>
	</div>
	<div class="footer">
		Douzone FrameWork in LeeSeongMin / KangJaeSeong / LeeSoHyun
	</div>
	<script type="text/javascript" src= "<c:url value="/resources/assets/js/jquery/jquery-1.9.0.js"/>"></script>

</head>
<script type="text/javascript">
		var module_menu_data;
		$.ajax({
			url : "module_menu",
			type : "POST",
			data : {cdCompany : "1000"},
			success : function(data) {
				//alert("����");
				//var module_menu = JSON.parse(data);
				//console.log(module_test);
				module_menu_data = JSON.parse(data);
				
				for(var i = 1; i <= module_menu_data[0].length/* module_menu_data.module.length */; i++)
				{
					var feather_item;
					switch(/* module_menu_data.module[i-1].FG_MODULE */module_menu_data[0][i-1].FG_MODULE){
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
					
					$(".sidebar-nav").append('<div class="sidebar-nav-item" data-module="'+/* module_menu_data.module[i-1].FG_MODULE */module_menu_data[0][i-1].FG_MODULE+'"><a href="#"'+
												'class="sidebar-nav-link"> <span class="sidebar-nav-icon">'+
												'<i data-feather="'+feather_item+'"></i>' +
												'</span> <span class="sidebar-nav-name">'+ module_menu_data[0][i-1].MODULE_NAME +'</span>'+
											 '</a></div>');
				}
				
				feather.replace();
				//module menu click
	            $(".sidebar-nav-link").each(function () {
	                $(this).click(function () {
	                    $(".sidebar-nav-link").removeClass("active");                      //Ŭ���� �κ��� ��ܿ� ���ǵ� CCS�� selectedŬ������ ����
	                    $(this).addClass("active");  //siblings:������ҵ�,    removeClass:���õ� Ŭ������ Ư���� ����
	                    $(".submenu, .submenu-title, .menu, .menus, .body-frame, .tab-control").removeClass("hide");
	                    $(".submenu, .submenu-title, .menu, .menus, .body-frame, .tab-control").addClass("show");
	                    //hover event ��������
	                    $(".adminx-sidebar.expand-hover").addClass("hoverstop");
	                    $(".submenu-title").text($(this).text());
	                    
	                    //�޴�����
	                    $('.menus').empty();
	                    var module_type = $(this).parent().data("module");
	                    
	                    for(var i = 0; i < module_menu_data[1].length; i++)
	                    {
	                    	var module_type_menu = module_menu_data[1][i].FG_MODULE;
	                    	//ù��°�� ��� ����� �޴��� �����ؾߵǹǷ� ����
	                    	if(i === 0)
	                		{
	                			$('.menus').append('<li class="folder"><a class="menu-link" href="#" title="'+module_type+'"><span>'+$(this).text()+'</span></a><ul data-level="'+module_type+'" style="display:none;"></ul></li>');
	                		}
	                    	if(module_type === module_type_menu)
	                    	{
		                    	var menu;
		                    	//�ش� ��ġ�� Ȯ���ؼ� �� tag�� ������ �� �ֵ��� �����ʿ���
		                    	if(module_menu_data[1][i].FG_TYPE === "MEN")
		                    	{
		                    		$('ul[data-level='+module_menu_data[1][i].UP_MENU+']').append('<li class="folder"><a class="menu-link" href="#" title="'+module_menu_data[1][i].NM_KR+'"><span>'+module_menu_data[1][i].NM_KR+'</span></a><ul data-level="'+module_menu_data[1][i].ID_NAME+'" style="display:none;"></ul></li>');
		                    	}
		                    	else
		                    	{
		                    		$('ul[data-level='+module_menu_data[1][i].UP_MENU+']').append('<li class="page"><a class="menu-link nav-link" data-id="'+module_menu_data[1][i].ID_NAME+'" href="#" title="'+module_menu_data[1][i].NM_KR+'"><span>'+module_menu_data[1][i].NM_KR+'</span></a></li>');
		                    	}
	                    	}
	                    }
	                    
	                    feather.replace();
	                    
	                });
	            });
				
			},
			error : function(){
				alert("����");
			}
		});
		//json data
		/* var module_menu = '{ "module" : [' +
								'{"FG_MODULE" : "MA", "MODULE_NAME" : "������"},' +
								'{"FG_MODULE" : "HR", "MODULE_NAME" : "�λ����"},'+
								'{"FG_MODULE" : "CO", "MODULE_NAME" : "��������"},'+
								'{"FG_MODULE" : "FI", "MODULE_NAME" : "ȸ�����"},'+
								'{"FG_MODULE" : "PR", "MODULE_NAME" : "�������"},'+
								'{"FG_MODULE" : "PU", "MODULE_NAME" : "�����������"},'+
								'{"FG_MODULE" : "SA", "MODULE_NAME" : "��������"},'+
								'{"FG_MODULE" : "SU", "MODULE_NAME" : "���ְ���"},'+
								'{"FG_MODULE" : "TR", "MODULE_NAME" : "��������"},' +
								'{"FG_MODULE" : "PM", "MODULE_NAME" : "������Ʈ����"},' +
								'{"FG_MODULE" : "HH", "MODULE_NAME" : "��Ÿ"}' +
							  '],' +
							  '"menu" : [' +
								'{"ID_NAME" : "M_HR_1", "UP_MENU" : "HR", "FG_MODULE" : "HR", "FG_TYPE" : "MEN", "NM_KR" : "�λ�_1"},' +
								'{"ID_NAME" : "login2", "UP_MENU" : "M_HR_1", "FG_MODULE" : "HR", "FG_TYPE" : "PAG", "NM_KR" : "�α���ȭ��"},' +
								'{"ID_NAME" : "M_HR_2", "UP_MENU" : "M_HR_1", "FG_MODULE" : "HR", "FG_TYPE" : "MEN", "NM_KR" : "�λ�_2"},' +
								'{"ID_NAME" : "M_HR_3", "UP_MENU" : "M_HR_2", "FG_MODULE" : "HR", "FG_TYPE" : "MEN", "NM_KR" : "�λ�_3"},' +
								'{"ID_NAME" : "M_HR_4", "UP_MENU" : "M_HR_3", "FG_MODULE" : "HR", "FG_TYPE" : "MEN", "NM_KR" : "�λ�_4"},' +
							    '{"ID_NAME" : "html123", "UP_MENU" : "M_HR_4", "FG_MODULE" : "HR", "FG_TYPE" : "PAG", "NM_KR" : "html123"},' +
								'{"ID_NAME" : "M_HR_5", "UP_MENU" : "HR", "FG_MODULE" : "HR", "FG_TYPE" : "MEN", "NM_KR" : "�λ�_5"},' +
								'{"ID_NAME" : "html1234", "UP_MENU" : "M_HR_5", "FG_MODULE" : "HR", "FG_TYPE" : "PAG", "NM_KR" : "html1234"}' +
							']}'; */
			
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
         // �޴� Ʈ�� �̺�Ʈ
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
            	//���� ���ý� event
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
	                  //tab �߰�
	                  $(".tab-link.current").removeClass("current");
	                  $(".tab-control .tabs").append("<li class='tab-link current' data-tab='"+id+"'>" +
	                		  							"<span class='tab-name'>"+$a.attr("title")+"</span>" +
	                		  							"<span class='tab-close-main'><i class='tab-close' data-feather='x'></i></span>" +
	                		  							
	                		  						 "</li>");
	                  //iframe �߰�
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
            //hover event ���� ����
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