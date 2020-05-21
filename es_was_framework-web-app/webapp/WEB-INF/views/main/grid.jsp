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
	href="${pageContext.servletContext.contextPath }/assets/css/main/maintest.css">
<script src="https://unpkg.com/feather-icons"></script>

</head>
<body>
	<div class="header"></div>

	<div class="menu hide">
				 <div class="adminx-sidebar expand-hover push">
					<div class="sidebar-nav">
						<div class="sidebar-nav-item"><a href="#"
							class="sidebar-nav-link active"> <span
								class="sidebar-nav-icon"> <i data-feather="home"></i>
							</span> <span class="sidebar-nav-name"> Dashboard </span>
						</a></div>

						<div class="sidebar-nav-item"><a href="#"
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
							class="sidebar-nav-link collapsed" data-toggle="collapse"
							href="#navExtra" aria-expanded="false" aria-controls="navExtra">
								<span class="sidebar-nav-icon"> <i data-feather="layers"></i>
							</span> <span class="sidebar-nav-name"> Other Layouts </span>
						</a></div>
					</div>
				</div> 

		<div class="submenu hide">
			<div class = "submenu-title hide">
				인사모듈
			</div>
			<div class= "submenu-cancel"><i data-feather="x"></i></div>
			<ul class="menus hide">
				<li class="folder"><a class="menu-link" href="#" title="인사관리"><span>인사관리</span></a>
            	<ul style="display:none;">
	            	<li class="page"><a class="menu-link nav-link" href="#" title="개인정보변경신청"><span>개인정보변경신청</span></a></li>
	            	<li class="page"><a class="menu-link nav-link" href="#" title="비상연락망"><span>비상연락망</span></a></li>
	            	<li class="page"><a class="menu-link nav-link" href="#" title="증명서발급신청"><span>증명서발급신청</span></a></li>
	            	<li class="page"><a class="menu-link nav-link" href="#" title="인사정보조회"><span>인사정보조회</span></a></li>
	            	<li class="page"><a class="menu-link nav-link" href="#" title="부서직급별인원현황"><span>부서직급별인원현황</span></a></li>
	            	<li class="page"><a class="menu-link nav-link" href="#" title="부서별총인원현황"><span>부서별총인원현황</span></a></li>
	            	<li class="page"><a class="menu-link nav-link" href="#" title="화상조직도"><span>화상조직도</span></a></li>
	            </ul>
	          		
	          	<li class="folder">
				<a class="menu-link" href="#" title="생산관리"><span>생산관리</span></a>
            	<ul style="display:none;">
	            	<li class="page"><a class="menu-link nav-link" href="#" title="부서별총인원현황"><span>부서별총인원현황</span></a></li>
	            	<li class="folder"><a class="menu-link" href="#" title="메롱메롱"><span>메롱메롱</span></a>
	            	<ul style="display:none;">
	            		<li class="page"><a class="menu-link nav-link" href="#" title="인사정보조회"><span>인사정보조회</span></a></li>
		            	<li class="page"><a class="menu-link nav-link" href="#" title="부서직급별인원현황"><span>부서직급별인원현황</span></a></li>
		            	<li class="page"><a class="menu-link nav-link" href="#" title="부서별총인원현황"><span>부서별총인원현황</span></a></li>
	            	</ul>
	            	<li class="page"><a class="menu-link nav-link" href="#" title="화상조직도"><span>화상조직도</span></a></li>
	            </ul>
          	</ul>
		</div>
	</div>
	
	<iframe>
	</iframe>
	
	<div class="footer"></div>
	
	<script src="${pageContext.servletContext.contextPath }/assets/vendor/jquery/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
		feather.replace();
		
		$(document).ready(function () {
            $(".sidebar-nav-link").each(function () {
                $(this).click(function () {
                    $(".sidebar-nav-link").removeClass("active");                      //클릭된 부분을 상단에 정의된 CCS인 selected클래스로 적용
                    $(this).addClass("active");  //siblings:형제요소들,    removeClass:선택된 클래스의 특성을 없앰
                    $(".submenu, .submenu-title, .menu, .menus").removeClass("hide");
                    $(".submenu, .submenu-title, .menu, .menus").addClass("show");
                    //hover event 강제종료
                    $(".adminx-sidebar.expand-hover").addClass("hoverstop");
                });
            });
            $(".submenu-cancel").each(function(){
            	$(this).click(function(){
            		if($(".submenu").hasClass("show") === true) {
            			$(".submenu, .submenu-title, .menu, .menus").removeClass("show");
                        $(".submenu, .submenu-title, .menu, .menus").addClass("hide");
            		} else {
            			$(".submenu, .submenu-title, .menu, .menus").removeClass("hide");
                        $(".submenu, .submenu-title, .menu, .menus").addClass("show");
            		}
            	});
            });
            //hover event 강제 실행
            $(".submenu").mouseover(function(){
            	$(".adminx-sidebar.expand-hover").removeClass("hoverstop");
            });
            
         	// 메뉴 트리 이벤트
            $('.menus', self.container).on('click', '.menu-link', function(e) {
              e.preventDefault();

              var $a = $(e.target).closest('.menu-link');
              var $container = $a.parents('#menus');
              var $li = $a.parent('li');

              if ($li.hasClass('folder')) {
                if (!$a.hasClass('selected')) {
                  $a.addClass('selected');
                  $('> ul', $li).slideDown(100);
                } else {
                  $a.removeClass('selected');
                  $('> ul', $li).slideUp(100);
                }
              } else {
                if ($a.hasClass('selected')) {
                  $a.removeClass('selected');
                } else {
                  $('li.page .menu-link.selected', $container).removeClass('selected');
                  $a.addClass('selected');
                }
              }
            });
        });
	</script>
	
</body>
</html>