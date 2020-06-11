<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<div class="header opacity" id="header">
	<a href="#" class="header-logo">
		<img src= "<c:url value="/resources/assets/css/main/images/logo01.png"/>" alt="Douzone">
	</a>
	<div class="container-fluid">
		<ul class="navbar-nav align-items-center d-none d-md-flex">
         <li class="nav-item dropdown">
           <a class="nav-link2 pr-0" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
             <div class="media align-items-center header-media">
               <!-- 
               <span class="avatar avatar-sm rounded-circle">
                 <img class = "header-image" alt="Image placeholder" src= "<c:url value="/resources/assets/css/main/images/team-4-800x800.jpg"/>">
               </span>
                -->
               <div class="media-body ml-2 d-none d-lg-block header-media-body">
                 <span class="mb-0 text-sm  font-weight-bold header-name">${currentUser.USER_NAME}</span>
               </div>
             </div>
           </a>
           <div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right">
             <div class=" dropdown-header noti-title">
               <h6 class="text-overflow m-0">회사코드 : ${currentUser.COMPANY_CODE }</h6>
             </div>
             <div class=" dropdown-header noti-title">
               <h6 class="text-overflow m-0">사용자 아이디 : ${currentUser.USER_ID }</h6>
             </div>
             <!-- 
             <div class="dropdown-divider"></div>
             <a href="#!" class="dropdown-item">
               <i class="ni" data-feather="log-out"></i>
               <span>Logout</span>
             </a>
              -->
           </div>
         </li>
       </ul>
	</div>
</div>

<!-- 
<div class="header opacity">
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
 -->