/*
 * 작 성 자  : 이성민
 * 작 성 일  : 2020.06.11
 * 수 정 자  :
 * 수 정 일  : 
 * 수정내용 :  
 */

$(document).ready(function () {
var module_menu_data;
	
	$.ajax({
		url : "module_menu",
		type : "POST",
		data : {cdCompany : "1000"},
		success : function(data) {
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
              
              for(var i = 0; i < module_menu_data[1].length; i++)
              {
              	var module_type_menu = module_menu_data[1][i].FG_MODULE;
              	//첫번째의 경우 모듈의 메뉴를 생성해야되므로 생성
              	if(i === 0)
          		{
          			$('.menus').append('<li class="folder"><a class="menu-link" href="#" title="'+module_type+'"><span>'+$(this).text()+'</span></a><ul data-level="'+module_type+'" style="display:none;"></ul></li>');
          		}
              	if(module_type === module_type_menu)
              	{
	                    	var menu;
	                    	//해당 위치를 확인해서 그 tag에 저장할 수 있도록 수정필요함
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
			
			//progressbar 숨기기
			$("#Progress_Loading").css("display", "none");
			$(".header, .menu, .tab-control, .body-frame, .footer").removeClass("opacity");
			$(".header, .menu, .tab-control, .body-frame, .footer").addClass("nonopacity");
			
		},
		error : function(){
			alert("실패");
		}
	});
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
		});

