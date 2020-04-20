<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
  <head>

	    <!-- ==============================================
		Title and Meta Tags
		=============================================== -->
		<meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">  
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>KIITO - 君がいるとごろ</title>
		<meta name="description" content="" />
        <meta name="keywords" content="" />
        <meta property="og:title" content="" />
        <meta property="og:url" content="" />
		
		<!-- ==============================================
		Favicons
		=============================================== --> 
		<link rel="icon" href="../resources/assets/img/logo.jpg">
		<link rel="apple-touch-icon" href="../img/favicons/apple-touch-icon.png">
		<link rel="apple-touch-icon" sizes="72x72" href="../img/favicons/apple-touch-icon-72x72.png">
		<link rel="apple-touch-icon" sizes="114x114" href="../img/favicons/apple-touch-icon-114x114.png">
		
	    <!-- ==============================================
		CSS
		=============================================== -->
        <link type="text/css" href="../resources/assets/css/demos/photo.css" rel="stylesheet" />
       	<link rel="stylesheet" href="../resources/writef/css/main.css">
       	<link rel="stylesheet" type="text/css" href="../resources/writef/css/kakaomap.css">
			
		<!-- ==============================================
		Feauture Detection
		=============================================== -->
		<script src="../resources/assets/js/modernizr-custom.js"></script>
		

		<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->	
		
  </head>

<body style = "overflow : scroll">

     <!-- ==============================================
     Navigation Section
     =============================================== -->  
     <header class="tr-header">
     <img alt="" src="../resources/login/images/bgimg4.png" class="main-img">
		 <a class="navbar-brand" href="/kiito/home">KIITO</a>
      <nav class="navbar navbar-default">
       <div class="container-fluid">
	    <div class="navbar-header">
	    
		</div><!-- /.navbar-header -->
		<div class="navbar-left">
		 <div class="collapse navbar-collapse" id="navbar-collapse">
		  <ul class="nav navbar-nav">
		  </ul>
		 </div>
		</div><!-- /.navbar-left -->
		<div class="navbar-right">                          
		 <ul class="nav navbar-nav">
		   <li>
		   <div class="search-dashboard">
               <form>
                    <input placeholder="Search here" type="text">
                    <button type="submit"><i class="fa fa-search"></i></button>
               </form>
          </div>							
		   </li>

		   <li class="dropdown notification-list">
		    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
			 <i class="fa fa-bell noti-icon"></i>
			 <span class="badge badge-danger badge-pill noti-icon-badge">4</span>
			</a>
			<div class="dropdown-menu dropdown-menu-right dropdown-lg">
             
			 <div class="dropdown-item noti-title">
			  <h6 class="m-0">
			   <span class="pull-right">
			    <a href="" class="text-dark"><small>Clear All</small></a> 
			   </span>Notification
			  </h6>
			 </div>

			 <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 416.983px;">
			  <div class="slimscroll" style="max-height: 230px; overflow: hidden; width: auto; height: 416.983px;">
			   <div id="Slim">
			    <a href="javascript:void(0);" class="dropdown-item notify-item">
				 <div class="notify-icon bg-success"><i class="fa fa-comment"></i></div>
				 <p class="notify-details">Caleb Flakelar commented on Admin<small class="text-muted">1 min ago</small></p>
				</a><!--/ dropdown-item-->
				<a href="javascript:void(0);" class="dropdown-item notify-item">
				 <div class="notify-icon bg-success"><i class="fa fa-user-plus"></i></div>
				 <p class="notify-details">Grace Flake followed you.<small class="text-muted">5 hours ago</small></p>
				</a><!--/ dropdown-item-->
				<a href="javascript:void(0);" class="dropdown-item notify-item">
				 <div class="notify-icon bg-success"><i class="fa fa-heart"></i></div>
				 <p class="notify-details">Carlos Crouch liked your photo.<small class="text-muted">3 days ago</small></p>
				</a><!--/ dropdown-item-->
				<a href="javascript:void(0);" class="dropdown-item notify-item">
				 <div class="notify-icon bg-success"><i class="fa fa-comment"></i></div>
				 <p class="notify-details">Caleb Flakelar commented on Admin<small class="text-muted">4 days ago</small></p>
				</a><!--/ dropdown-item-->
				<a href="javascript:void(0);" class="dropdown-item notify-item">
				 <div class="notify-icon bg-success"><i class="fa fa-user-plus"></i></div>
				 <p class="notify-details">Maureen Hilda followed you.<small class="text-muted">7 days ago</small></p>
				</a><!--/ dropdown-item-->
				<a href="javascript:void(0);" class="dropdown-item notify-item">
				 <div class="notify-icon bg-success"><i class="fa fa-heart"></i></div>
				 <p class="notify-details">Carlos Crouch liked your photo.<small class="text-muted">13 days ago</small></p>
				</a><!--/ dropdown-item-->
			   </div><!--/ .Slim-->
			   <div class="slimScrollBar" style="background: rgb(158, 165, 171) none repeat scroll 0% 0%; width: 8px; position: absolute; top: 0px; opacity: 0.4; display: block; border-radius: 7px; z-index: 99; right: 1px;"></div>
			   <div class="slimScrollRail" style="width: 8px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51) none repeat scroll 0% 0%; opacity: 0.2; z-index: 90; right: 1px;"></div>
			  </div><!--/ .slimscroll-->
			 </div><!--/ .slimScrollDiv-->
			 <a href="photo_notifications.html" class="dropdown-item text-center notify-all">
			  View all <i class="fa fa-arrow-right"></i>
			 </a><!-- All-->
            </div><!--/ dropdown-menu-->
		   </li>

		   <li class="dropdown notification-list">
			<a class="nav-link dropdown-toggle arrow-none waves-effect" data-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
			 <i class="fa fa-envelope noti-icon"></i>
			 <span class="badge badge-success badge-pill noti-icon-badge">6</span>
			</a>
			<div class="dropdown-menu dropdown-menu-right dropdown-lg dropdown-new">
             <div class="dropdown-item noti-title">
			  <h6 class="m-0">
			   <span class="float-right">
			    <a href="" class="text-dark"><small>Clear All</small></a> 
			   </span>Chat
			  </h6>
			 </div>

			 <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 416.983px;">
			  <div class="slimscroll" style="max-height: 230px; overflow: hidden; width: auto; height: 416.983px;">
			   <div id="Slim2">
				<a href="javascript:void(0);" class="dropdown-item notify-item nav-user">
				 <div class="notify-icon"><img src="resources/assets/img/users/1.jpg" class="img-responsive img-circle" alt=""> </div>
				 <p class="notify-details">Cristina Pride</p>
				 <p class="text-muted font-13 mb-0 user-msg">Hi, How are you? What about our next meeting</p>
				</a><!--/ dropdown-item-->
				<a href="javascript:void(0);" class="dropdown-item notify-item nav-user">
				 <div class="notify-icon"><img src="resources/assets/img/users/2.jpg" class="img-responsive img-circle" alt=""> </div>
				 <p class="notify-details">Sam Garret</p>
				 <p class="text-muted font-13 mb-0 user-msg">Yeah everything is fine</p>
				</a><!--/ dropdown-item-->
				<a href="javascript:void(0);" class="dropdown-item notify-item nav-user">
				 <div class="notify-icon"><img src="resources/assets/img/users/3.jpg" class="img-responsive img-circle" alt=""> </div>
				 <p class="notify-details">Karen Robinson</p>
				 <p class="text-muted font-13 mb-0 user-msg">Wow that's great</p>
				</a><!--/ dropdown-item-->
				<a href="javascript:void(0);" class="dropdown-item notify-item nav-user">
				 <div class="notify-icon"><img src="resources/assets/img/users/4.jpg" class="img-responsive img-circle" alt=""> </div>
				 <p class="notify-details">Sherry Marshall</p>
				 <p class="text-muted font-13 mb-0 user-msg">Hi, How are you? What about our next meeting</p>
				</a><!--/ dropdown-item-->
				<a href="javascript:void(0);" class="dropdown-item notify-item nav-user">
				 <div class="notify-icon"><img src="resources/assets/img/users/5.jpg" class="img-responsive img-circle" alt=""> </div>
				 <p class="notify-details">Shawn Millard</p>
				 <p class="text-muted font-13 mb-0 user-msg">Yeah everything is fine</p>
				</a><!--/ dropdown-item-->
			   </div><!--/ .Slim-->
			   <div class="slimScrollBar" style="background: rgb(158, 165, 171) none repeat scroll 0% 0%; width: 8px; position: absolute; top: 0px; opacity: 0.4; display: block; border-radius: 7px; z-index: 99; right: 1px;"></div>
			   <div class="slimScrollRail" style="width: 8px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51) none repeat scroll 0% 0%; opacity: 0.2; z-index: 90; right: 1px;"></div>
			  </div><!--/ slimscroll-->
			 </div> <!--/ slimScrollDiv-->
			 <a href="photo_chat.html" class="dropdown-item text-center notify-all">
			  View all <i class="fa fa-arrow-right"></i>
			 </a>
            </div><!--/ dropdown-menu-->
		   </li>
		  
		 <li class="dropdown mega-avatar">
		  <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
		   <span class="avatar w-32">
		   	<c:if test="${sessionScope.customer.profileImg == null }">
								<img src="resources/login/images/profileImg_null2.png" class="img-resonsive img-circle" width="25" height="25" alt="..."/>
			</c:if>
			<c:if test="${sessionScope.customer.profileImg != null }">
				<img src="${sessionScope.customer.profileImg }" class="img-resonsive img-circle" width="25" height="25" alt="..."/>
			</c:if>
		   </span>
		   <!-- hidden-xs hides the username on small devices so only the image appears. -->
		   <span class="hidden-xs">
			${sessionScope.customer.name }
		   </span>
		  </a>
		  <div class="dropdown-menu w dropdown-menu-scale pull-right">
		   <a class="dropdown-item" href="#"><span>New Story</span></a> 
		 <!--   <a class="dropdown-item" href="#"><span>Become a Member</span></a>  -->
		   <div class="dropdown-divider"></div>
		   <a class="dropdown-item" href="customer/profile"><span>Profile</span></a> 
		   <a class="dropdown-item" href="#"><span>Settings</span></a> 
		   <a class="dropdown-item" href="#">Need help?</a> 
		   <div class="dropdown-divider"></div>
		   <a class="dropdown-item" href="customer/logout">Sign out</a>
		  </div>
		 </li><!-- /navbar-item -->	
		 
		 </ul><!-- /.sign-in -->   
		</div><!-- /.nav-right -->
       </div><!-- /.container -->
      </nav><!-- /.navbar -->
     </header><!-- Page Header --> 
  
	 <!-- ==============================================
	 Navbar Second Section
	 =============================================== -->
	<section class="nav-sec">
	  <div class="d-flex justify-content-between">
	   <div class="p-2 nav-icon-lg dark-black">
	   <a class="nav-icon" href="/kiito/home"><em class="fa fa-home"></em>
		<span>Home</span>
	   </a>
	   </div>
	   <div class="p-2 nav-icon-lg clean-black">
	   <a class="nav-icon" href="/kiito/feed/explore"><em class="fa fa-crosshairs"></em>
		<span>Explore</span>
	   </a>
	   </div>
	   <div class="p-2 nav-icon-lg dark-black">
	   <a class="nav-icon" onclick = "writeBt()" style="cursor:pointer"><em class="fab fa-instagram"  ></em>
		<span>Upload</span>
	   </a>
	   </div>
	   <div class="p-2 nav-icon-lg clean-black">
	   <a class="nav-icon" href="photo_stories.html"><em class="fa fa-align-left"></em>
		<span>Stories</span>
	   </a>
	   </div>
	   <div class="p-2 nav-icon-lg mint-green">
	   <a class="nav-icon" href="profile"><em class="fa fa-user"></em>
		<span>Profile</span>
	   </a>
	   </div>
	  </div>
	</section>	
  
	 <!-- ==============================================
	 News Feed Section
	 =============================================== --> 
	 <section class="profile-two">
	  <div class="container-fluid">
	   <div class="row">

		<div class="col-lg-3">
         <aside id="leftsidebar" class="sidebar">		  
		  <ul class="list">
           <li>
			<div class="user-info">			<!-- 	자기 프로필 -->
			 <div class="image">
		       <a href="#preview" data-toggle="modal" rel="modal:open">
			   <img src="${sessionScope.customer.profileImg }" class="img-responsive img-circle" alt="User">	<br>	
			   <span class="online-status online"></span>
			  </a>
			 </div>
		     <div class="detail">
			  <h4>${sessionScope.customer.name }</h4><br>
			  <small>@${sessionScope.customer.nick }</small>                        
			 </div>
			 <div class="row">
			  <div class="col-12">
			   <a title="facebook" href="#" class=" waves-effect waves-block"><i class="fab fa-facebook"></i></a>
			   <a title="twitter" href="#" class=" waves-effect waves-block"><i class="fab fa-twitter"></i></a>
			   <a title="instagram" href="#" class=" waves-effect waves-block"><i class="fab fa-instagram"></i></a>
			  </div>                                
			 </div>
			</div>
           </li>
           <li>
            <small class="text-muted"><a href="profile">320 Posts <em class="fa fa-angle-right pull-right"></em></a> </small><br/>
            <small class="text-muted"><a href="followers">2456 Followers <em class="fa fa-angle-right pull-right"></em></a> </small><br/>
            <small class="text-muted"><a href="followers">456 Following <em class="fa fa-angle-right pull-right"></em></a> </small>
            <hr>
<!--             <small class="text-muted">Bio: </small>
            <p>795 Folsom Ave, Suite 600 San Francisco, CADGE 94107</p>
            <hr> -->
            <small class="text-muted">E-mail: </small>
            <p>${sessionScope.customer.email } </p> 
            <hr>                      
           </li>                    
          </ul>
         </aside>				
		</div><!--/ col-lg-3-->
		
		
		<!-- 자기가 쓴 글 -->
		
		<div class="col-lg-6" style="background: #fff;">
		 
		 <div class="row">
		 <c:forEach var="s" items="${feed}">
		  <div class="col-lg-6">
		  
		     
			 <a href="#myModal" data-toggle="modal">
			 <div class="explorebox" 
			   style="background: linear-gradient( rgba(34,34,34,0.2), rgba(34,34,34,0.2)), url('assets/img/posts/6.jpg') no-repeat;
					  background-size: cover;
					  background-position: center center;
					  -webkit-background-size: cover;
					  -moz-background-size: cover;
					  -o-background-size: cover;">
			  <div class="explore-top">
			   <div class="explore-like"><i class="fa fa-heart"></i> <span>${s.likes}</span></div>
			   			<p>체크인 : ${s.checkin}</p>
									<p>번호 : ${s.feed_seq}</p>
								<p>혼잡도 : ${s.congestion} </p>
			   <div class="explore-circle pull-right"><i class="far fa-bookmark"></i></div>
			  </div>		  
			 </div>
			 </a>
			 
			 	
		  </div>
		 </c:forEach> 
	<!-- 	  <div class="col-lg-6">
			 <a href="#myModal" data-toggle="modal">
			 <div class="explorebox" 
			   style="background: linear-gradient( rgba(34,34,34,0.2), rgba(34,34,34,0.2)), url('assets/img/posts/9.jpg') no-repeat;
					  background-size: cover;
					  background-position: center center;
					  -webkit-background-size: cover;
					  -moz-background-size: cover;
					  -o-background-size: cover;">
			  <div class="explore-top">
			   <div class="explore-like"><i class="fa fa-heart"></i> <span>624</span></div>
			   <div class="explore-circle pull-right"><i class="far fa-bookmark"></i></div>
			  </div>		  
			 </div>
			 </a>
		  </div> -->
		  
		 </div><!--/ row -->
		 
		 <div class="row">
		 
		<!--   <div class="col-lg-6">
			 <a href="#myModal" data-toggle="modal">
			 <div class="explorebox" 
			   style="background: linear-gradient( rgba(34,34,34,0.2), rgba(34,34,34,0.2)), url('assets/img/posts/32.jpg') no-repeat;
					  background-size: cover;
					  background-position: center center;
					  -webkit-background-size: cover;
					  -moz-background-size: cover;
					  -o-background-size: cover;">
			  <div class="explore-top">
			   <div class="explore-like"><i class="fa fa-heart"></i> <span>12</span></div>
			   <div class="explore-circle pull-right"><i class="far fa-bookmark"></i></div>
			  </div>		  
			 </div>
			 </a>
		  </div> -->
		 
	<!-- 	  <div class="col-lg-6">
			 <a href="#myModal" data-toggle="modal">
			 <div class="explorebox" 
			   style="background: linear-gradient( rgba(34,34,34,0.2), rgba(34,34,34,0.2)), url('assets/img/posts/30.jpg') no-repeat;
					  background-size: cover;
					  background-position: center center;
					  -webkit-background-size: cover;
					  -moz-background-size: cover;
					  -o-background-size: cover;">
			  <div class="explore-top">
			   <div class="explore-like"><i class="fa fa-heart"></i> <span>1499</span></div>
			   <div class="explore-circle pull-right"><i class="far fa-bookmark"></i></div>
			  </div>		  
			 </div>
			 </a>
		  </div> -->
		  
		 </div><!--/ row -->
		 
		<!--  <div class="row">
		 
		  <div class="col-lg-6">
			 <a href="#myModal" data-toggle="modal">
			 <div class="explorebox" 
			   style="background: linear-gradient( rgba(34,34,34,0.2), rgba(34,34,34,0.2)), url('assets/img/posts/19.jpg') no-repeat;
					  background-size: cover;
					  background-position: center center;
					  -webkit-background-size: cover;
					  -moz-background-size: cover;
					  -o-background-size: cover;">
			  <div class="explore-top">
			   <div class="explore-like"><i class="fa fa-heart"></i> <span>1742</span></div>
			   <div class="explore-circle pull-right"><i class="far fa-bookmark"></i></div>
			  </div>		  
			 </div>
			 </a>
		  </div>
		 
		  <div class="col-lg-6">
			 <a href="#myModal" data-toggle="modal">
			 <div class="explorebox" 
			   style="background: linear-gradient( rgba(34,34,34,0.2), rgba(34,34,34,0.2)), url('assets/img/posts/8.jpg') no-repeat;
					  background-size: cover;
					  background-position: center center;
					  -webkit-background-size: cover;
					  -moz-background-size: cover;
					  -o-background-size: cover;">
			  <div class="explore-top">
			   <div class="explore-like"><i class="fa fa-heart"></i> <span>1269</span></div>
			   <div class="explore-circle pull-right"><i class="far fa-bookmark"></i></div>
			  </div>		  
			 </div>
			 </a>
		  </div>
		  
		 </div>/ row -->
		 
		 <div class="row">
		 
		<!--   <div class="col-lg-6">
			 <a href="#myModal" data-toggle="modal">
			 <div class="explorebox" 
			   style="background: linear-gradient( rgba(34,34,34,0.2), rgba(34,34,34,0.2)), url('assets/img/posts/36.jpg') no-repeat;
					  background-size: cover;
					  background-position: center center;
					  -webkit-background-size: cover;
					  -moz-background-size: cover;
					  -o-background-size: cover;">
			  <div class="explore-top">
			   <div class="explore-like"><i class="fa fa-heart"></i> <span>12456</span></div>
			   <div class="explore-circle pull-right"><i class="far fa-bookmark"></i></div>
			  </div>		  
			 </div>
			 </a>
		  </div> -->
		 
	<!-- 	  <div class="col-lg-6">
			 <a href="#myModal" data-toggle="modal">
			 <div class="explorebox" 
			   style="background: linear-gradient( rgba(34,34,34,0.2), rgba(34,34,34,0.2)), url('assets/img/posts/25.jpg') no-repeat;
					  background-size: cover;
					  background-position: center center;
					  -webkit-background-size: cover;
					  -moz-background-size: cover;
					  -o-background-size: cover;">
			  <div class="explore-top">
			   <div class="explore-like"><i class="fa fa-heart"></i> <span>10945</span></div>
			   <div class="explore-circle pull-right"><i class="far fa-bookmark"></i></div>
			  </div>		  
			 </div>
			 </a>
		  </div> -->
		  
		 </div><!--/ row -->
		
		</div>
		<div class="col-lg-3">
		
         <div class="suggestion-box full-width">
			<div class="suggestions-list">
				<div class="suggestion-body">
					<img class="img-responsive img-circle" src="../resources/assets/img/users/1.jpg" alt="">
					<div class="name-box">
						<h4>Vanessa Wells</h4>
						<span>@vannessa</span>
					</div>
					<span><i class="fa fa-plus"></i></span>
				</div>
				<div class="suggestion-body">
					<img class="img-responsive img-circle" src="../resources/assets/img/users/2.jpg" alt="">
					<div class="name-box">
						<h4>Anthony McCartney</h4>
						<span>@antony</span>
					</div>
					<span><i class="fa fa-plus"></i></span>
				</div>
				<div class="suggestion-body">
					<img class="img-responsive img-circle" src="../resources/assets/img/users/3.jpg" alt="">
					<div class="name-box">
						<h4>Anna Morgan</h4>
						<span>@anna</span>
					</div>
					<span><i class="fa fa-plus"></i></span>
				</div>
				<div class="suggestion-body">
					<img class="img-responsive img-circle" src="../resources/assets/img/users/4.jpg" alt="">
					<div class="name-box">
						<h4>Sean Coleman</h4>
						<span>@sean</span>
					</div>
					<span><i class="fa fa-plus"></i></span>
				</div>
				<div class="suggestion-body">
					<img class="img-responsive img-circle" src="../resources/assets/img/users/5.jpg" alt="">
					<div class="name-box">
						<h4>Grace Karen</h4>
						<span>@grace</span>
					</div>
					<span><i class="fa fa-plus"></i></span>
				</div>
				<div class="suggestion-body">
					<img class="img-responsive img-circle" src="../resources/assets/img/users/6.jpg" alt="">
					<div class="name-box">
						<h4>Clifford Graham</h4>
						<span>@clifford</span>
					</div>
					<span><i class="fa fa-plus"></i></span>
				</div>
			</div><!--suggestions-list end-->
		</div>	

        <div class="trending-box">
		 <div class="row">
		  <div class="col-lg-12">
		    <h4>Trending Photos</h4>
		  </div>
		 </div>
        </div>
		
        <div class="trending-box">
		 <div class="row">
		  <div class="col-lg-6">
		   <a href="#"><img src="../resources/assets/img/posts/17.jpg" class="img-responsive" alt="Image"/></a>
		  </div>
		  <div class="col-lg-6">
		   <a href="#"><img src="../resources/assets/img/posts/12.jpg" class="img-responsive" alt="Image"/></a>
		  </div>
		 </div>
		 <div class="row">
		  <div class="col-lg-6">
		   <a href="#"><img src="../resources/assets/img/posts/21.gif" class="img-responsive" alt="Image"/></a>
		  </div>
		  <div class="col-lg-6">
		   <a href="#"><img src="../resources/assets/img/posts/23.gif" class="img-responsive" alt="Image"/></a>
		  </div>
		 </div>
		 <div class="row">
		  <div class="col-lg-6">
		   <a href="#"><img src="../resources/assets/img/posts/11.jpg" class="img-responsive" alt="Image"/></a>
		  </div>
		  <div class="col-lg-6">
		   <a href="#"><img src="../resources/assets/img/posts/20.jpg" class="img-responsive" alt="Image"/></a>
		  </div>
		 </div>
        </div>		
		
		
		</div>
		
       </div><!--/ row-->	
	  </div><!--/ container -->
	 </section><!--/ profile -->
  
	 <!-- ==============================================
	 Modal Section
	 =============================================== -->
     <div id="myModal" class="modal fade">
      <div class="modal-dialog">
       <div class="modal-content">
        <div class="modal-body">
		
         <div class="row">
		 
          <div class="col-md-8 modal-image">
           <img class="img-responsive" src="../resources/assets/img/posts/9.jpg" alt="Image"/>
          </div><!--/ col-md-8 -->
          <div class="col-md-4 modal-meta">
           <div class="modal-meta-top">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
			 <span aria-hidden="true">×</span><span class="sr-only">Close</span>
			</button><!--/ button -->
            <div class="img-poster clearfix">
             <a href=""><img class="img-responsive img-circle" src="${sessionScope.customer.profileImg }" alt="Image"/></a>
             <strong><a href="">${sessionScope.customer.nick }</a></strong>
             <span>12 minutes ago</span><br/>
		     <a href="" class="kafe kafe-btn-mint-small"><i class="fa fa-check-square"></i> Following</a>
            </div><!--/ img-poster -->
			  
            <ul class="img-comment-list">
             <li>
              <div class="comment-img">
               <img src="../resources/assets/img/users/17.jpeg" class="img-responsive img-circle" alt="Image"/>
              </div>
              <div class="comment-text">
               <strong><a href="">Anthony McCartney</a></strong>
               <p>Hello this is a test comment.</p> <span class="date sub-text">on December 5th, 2016</span>
              </div>
             </li><!--/ li -->
             <li>
              <div class="comment-img">
               <img src="../resources/assets/img/users/15.jpg" class="img-responsive img-circle" alt="Image"/>
              </div>
              <div class="comment-text">
               <strong><a href="">Vanessa Wells</a></strong>
               <p>Hello this is a test comment and this comment is particularly very long and it goes on and on and on.</p> <span>on December 5th, 2016</span>
              </div>
             </li><!--/ li -->
             <li>
              <div class="comment-img">
               <img src="../resources/assets/img/users/14.jpg" class="img-responsive img-circle" alt="Image"/>
              </div>
              <div class="comment-text">
               <strong><a href="">Sean Coleman</a></strong>
               <p class="">Hello this is a test comment.</p> <span class="date sub-text">on December 5th, 2016</span>
              </div>
             </li><!--/ li -->
             <li>
              <div class="comment-img">
               <img src="../resources/assets/img/users/13.jpeg" class="img-responsive img-circle" alt="Image"/>
              </div>
              <div class="comment-text">
               <strong><a href="">Anna Morgan</a></strong>
               <p class="">Hello this is a test comment.</p> <span class="date sub-text">on December 5th, 2016</span>
              </div>
             </li><!--/ li -->
             <li>
              <div class="comment-img">
               <img src="../resources/assets/img/users/3.jpg" class="img-responsive img-circle" alt="Image"/>
              </div>
              <div class="comment-text">
               <strong><a href="">Allison Fowler</a></strong>
               <p class="">Hello this is a test comment.</p> <span class="date sub-text">on December 5th, 2016</span>
              </div>
             </li><!--/ li -->
            </ul><!--/ comment-list -->
			  
            <div class="modal-meta-bottom">
			 <ul>
			  <li><a class="modal-like" href="#"><i class="fa fa-heart"></i></a><span class="modal-one"> 786,286</span> | 
			      <a class="modal-comment" href="#"><i class="fa fa-comments"></i></a><span> 786,286</span> </li>
			  <li>
			   <span class="thumb-xs">
				<img class="img-responsive img-circle" src="../resources/assets/img/users/13.jpeg" alt="Image">
			   </span>
			   <div class="comment-body">
				 <input class="form-control input-sm" type="text" placeholder="Write your comment...">
			   </div><!--/ comment-body -->	
              </li>				
             </ul>				
            </div><!--/ modal-meta-bottom -->
			  
           </div><!--/ modal-meta-top -->
          </div><!--/ col-md-4 -->
		  
         </div><!--/ row -->
        </div><!--/ modal-body -->
		
       </div><!--/ modal-content -->
      </div><!--/ modal-dialog -->
     </div><!--/ modal -->	 
	   
     <!-- ==============================================
	 Scripts
	 =============================================== -->
	<script src="../resources/assets/js/jquery.min.js"></script>
	<script src="../resources/assets/js/bootstrap.min.js"></script>
	<script src="../resources/assets/js/base.js"></script>
	<script src="../resources/assets/plugins/slimscroll/jquery.slimscroll.js"></script>
	<script>
	$('#Slim,#Slim2').slimScroll({
	        height:"auto",
			position: 'right',
			railVisible: true,
			alwaysVisible: true,
			size:"8px",
		});		
	</script>


<!-- write form -->
		<div class="container-contact100">
		<div class="wrap-contact100">
			<form class="contact100-form validate-form" id = "writeForm" action = "feed/insertFeed" method = "POST" enctype="multipart/form-data" >
			<input type = "hidden" name = "customer_seq" value = "${sessionScope.customer.customer_seq }" id="cs">
				<span class="contact100-form-title">Upload</span>
				<div class="wrap-input100 validate-input" data-validate = "이거 왜뜨지 씨발">
					<input class="input100" type="text" id="checkin" placeholder = "Please enter a search term">
					
					<input class = "input100" id = "checkinBt" type = "button" value = "search">
					<!-- 같은 이름 ㄴㄴ -->
					<span class="focus-input100"></span>
				</div>
				<input type = "text" id = "dataSelected" name = "checkin" style = "display : none;">
				
				<div class="map_wrap">
				    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
				
				    <div id="menu_wrap" class="bg_white">
				        <hr>
				        <ul id="placesList"></ul>
				        <div id="pagination"></div>
				    </div>
				</div>
				<div class = "wrap-input100">
					<input type = "radio" name = "congestion" value = "3" checked = "checked" style = "margin-left : 20px;">congestion
					<input type = "radio" name = "congestion" value = "2">smoothness
					<input type = "radio" name = "congestion" value = "1">dullness
				</div>
						
				<div class="wrap-input100 validate-input" data-validate = "Please enter your message">
					<textarea id = "contents" class="input100" name="contents" placeholder="Your Message" style = "resize : none"></textarea>
					<span class="focus-input100"></span>
				</div>
				
				<div class="wrap-input100 validate-input" data-validate = "이거 왜뜨지 씨발">
				<br>
					<input class="input100" type="file" name="upload" id="file" value="파일선택" size="30">
					<span class="focus-input100"></span>
				</div>
				
				
				<div class="wrap-input100 validate-input" data-validate = "이거 왜뜨지 씨발">
				<br>
						<input type="text" id="tag" class="input100" placeholder="tag" />
					<span class="focus-input100"></span>
				</div>
	

				
			<ul id="tag-list">
       		 </ul>


			<input type="hidden" value="" name="arr" id="rdTag" />
			
		

				<div class="container-contact100-form-btn">
					<button type = "button" id = "submitFeed"class="contact100-form-btn">
						<span>
							<i class="fa fa-paper-plane-o m-r-6" aria-hidden="true"></i>
							submit
						</span>
					</button>
					　　
					<button type = "button" id = "closeWrite"class="contact100-form-btn">
						<span>
							<i class="fa fa-paper-plane-o m-r-6" aria-hidden="true"></i>
							close
						</span>
					</button>
				</div>
			</form>
		</div>
	</div>
	
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cab38e188d1015fa32fe5df13ab040fa&libraries=services,clusterer,drawing"></script>
		<script src = "../resources/writef/js/kakaomap.js"></script>
		
		<script src="../resources/writef/js/main.js"></script>
		
		
		
		<div id="preview" class="modal">
		<input type="file" name="" class="inp-img" accept=".gif, .jpg, .png"> 
				  
		<span class="btn-delete">delete</span>
		<div class="modal-meta-top">
	            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
			 <span aria-hidden="true">×xxxxxxxxxx</span><span class="sr-only">Close</span>
			</button><!--/ button --></div>
			<div id="ssss">
				   <img src="${sessionScope.customer.profileImg }" class="img-responsive img-circle" alt="User">
			
			</div> 
			
			</div>
		<script src="lib/jquery/2.2.3/jquery.min.js"></script>
		<script type="text/javascript">
          
// 등록 이미지 등록 미리보기
function readInputFile(input) {
    if(input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $('#ssss').html("<img src="+ e.target.result +">");
        }
        reader.readAsDataURL(input.files[0]);
    }
}
 
$(".inp-img").on('change', function(){
    readInputFile(this);
});
 
 
// 등록 이미지 삭제 ( input file reset )
function resetInputFile($input, $preview) {
    var agent = navigator.userAgent.toLowerCase();
    if((navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (agent.indexOf("msie") != -1)) {
        // ie 일때
        $input.replaceWith($input.clone(true));
        $preview.empty();
    } else {
        //other
        $input.val("");
        $preview.empty();
    }       
}
 
$(".btn-delete").click(function(event) {
    var $input = $(".inp-img");
    var $preview = $('#preview');
    resetInputFile($input, $preview);
});
</script>



		
		

  </body>
</html>
