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
        <meta property="og:description" content="" />		
		
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
       	<link rel="stylesheet" type="text/css" href="../resources/writef/css/kakaomap.css">
       	<link rel="stylesheet" href="../resources/writef/css/main.css">
				
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

<body>

     <!-- ==============================================
     Navigation Section
     =============================================== -->  
     <header class="tr-header">
      <nav class="navbar navbar-default">
       <div class="container-fluid">
	    <div class="navbar-header">
		 <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse">
		  <span class="sr-only">Toggle navigation</span>
		  <span class="icon-bar"></span>
		  <span class="icon-bar"></span>
		  <span class="icon-bar"></span>
		 </button>
		 <a class="navbar-brand" href="index.html"><i class="fab fa-instagram"></i> KIITO</a>
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
				 <div class="notify-icon"><img src="assets/img/users/1.jpg" class="img-responsive img-circle" alt=""> </div>
				 <p class="notify-details">Cristina Pride</p>
				 <p class="text-muted font-13 mb-0 user-msg">Hi, How are you? What about our next meeting</p>
				</a><!--/ dropdown-item-->
				<a href="javascript:void(0);" class="dropdown-item notify-item nav-user">
				 <div class="notify-icon"><img src="assets/img/users/2.jpg" class="img-responsive img-circle" alt=""> </div>
				 <p class="notify-details">Sam Garret</p>
				 <p class="text-muted font-13 mb-0 user-msg">Yeah everything is fine</p>
				</a><!--/ dropdown-item-->
				<a href="javascript:void(0);" class="dropdown-item notify-item nav-user">
				 <div class="notify-icon"><img src="assets/img/users/3.jpg" class="img-responsive img-circle" alt=""> </div>
				 <p class="notify-details">Karen Robinson</p>
				 <p class="text-muted font-13 mb-0 user-msg">Wow that's great</p>
				</a><!--/ dropdown-item-->
				<a href="javascript:void(0);" class="dropdown-item notify-item nav-user">
				 <div class="notify-icon"><img src="assets/img/users/4.jpg" class="img-responsive img-circle" alt=""> </div>
				 <p class="notify-details">Sherry Marshall</p>
				 <p class="text-muted font-13 mb-0 user-msg">Hi, How are you? What about our next meeting</p>
				</a><!--/ dropdown-item-->
				<a href="javascript:void(0);" class="dropdown-item notify-item nav-user">
				 <div class="notify-icon"><img src="assets/img/users/5.jpg" class="img-responsive img-circle" alt=""> </div>
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
		   <span class="avatar w-32"><img src="${sessionScope.customer.profileImg }" class="img-resonsive img-circle" width="25" height="25" alt="..."></span>
		   <!-- hidden-xs hides the username on small devices so only the image appears. -->
		   <span class="hidden-xs">
			${sessionScope.customer.nick }
		   </span>
		  </a>
		  <div class="dropdown-menu w dropdown-menu-scale pull-right">
		   <a class="dropdown-item" href="#"><span>New Story</span></a> 
<!-- 		   <a class="dropdown-item" href="#"><span>Become a Member</span></a>  -->
		   <div class="dropdown-divider"></div>
		   <a class="dropdown-item" href="/kiito/customer/profile"><span>Profile</span></a> 
		   <a class="dropdown-item" href="#"><span>Settings</span></a> 
		   <a class="dropdown-item" href="#">Need help?</a> 
		   <div class="dropdown-divider"></div>
		   <a class="dropdown-item" href="/kiito/customer/logout">Sign out</a>
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
	   <div class="p-2 nav-icon-lg mint-green">
	   <a class="nav-icon" href="explore"><em class="fa fa-crosshairs"></em>
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
	   <div class="p-2 nav-icon-lg dark-black">
	   <a class="nav-icon" href="/kiito/customer/profile"><em class="fa fa-user"></em>
		<span>Profile</span>
	   </a>
	   </div>
	  </div>
	</section>	
  
	 <!-- ==============================================
	 News Feed Section
	 =============================================== --> 
	 <section class="newsfeed">
	  <div class="container">
	  
	   <div class="row one-row">
	    <div class="col-lg-12">
	     <a href=""><h4>See All</h4></a>
		</div>
	   </div>
	  
	   <div class="row top-row">
	   
	    <div class="col-lg-3">
		 <div class="tr-section">
		  <div class="tr-post">
		   <div class="entry-header">
		    <div class="entry-thumbnail">
		     <a href="#"><img class="img-fluid" src="assets/img/posts/30.jpg" alt="Image"></a>
		    </div><!-- /entry-thumbnail -->
	       </div><!-- /entry-header -->
		   <div class="post-content">
		    <div class="author-post text-center">
		     <a href="#"><img class="img-fluid rounded-circle" src="assets/img/users/2.jpg" alt="Image"></a>
		    </div><!-- /author -->
			<div class="card-content">
			 <h4>Alex Grantte</h4>
		     <span>@alex</span>
			</div>
			 <a href="" class="kafe-btn kafe-btn-mint-small full-width"> Follow
			 </a>		  
		   </div><!-- /.post-content -->									
		  </div><!-- /.tr-post -->	
	     </div><!-- /.tr-post -->	
		</div><!-- /col-sm-3 -->
	   
	    <div class="col-lg-3">
		 <div class="tr-section">
		  <div class="tr-post">
		   <div class="entry-header">
		    <div class="entry-thumbnail">
		     <a href="#"><img class="img-fluid" src="assets/img/posts/27.jpg" alt="Image"></a>
		    </div><!-- /entry-thumbnail -->
	       </div><!-- /entry-header -->
		   <div class="post-content">
		    <div class="author-post text-center">
		     <a href="#"><img class="img-fluid rounded-circle" src="assets/img/users/3.jpg" alt="Image"></a>
		    </div><!-- /author -->
			<div class="card-content">
			 <h4>Anna Morgan</h4>
		     <span>@anna</span>
			</div>
			 <a href="" class="kafe-btn kafe-btn-mint-small full-width"> Follow
			 </a>		  
		   </div><!-- /.post-content -->									
		  </div><!-- /.tr-post -->	
	     </div><!-- /.tr-post -->	
		</div><!-- /col-sm-3 -->
	   
	    <div class="col-lg-3">
		 <div class="tr-section">
		  <div class="tr-post">
		   <div class="entry-header">
		    <div class="entry-thumbnail">
		     <a href="#"><img class="img-fluid" src="assets/img/posts/28.jpg" alt="Image"></a>
		    </div><!-- /entry-thumbnail -->
	       </div><!-- /entry-header -->
		   <div class="post-content">
		    <div class="author-post text-center">
		     <a href="#"><img class="img-fluid rounded-circle" src="assets/img/users/6.jpg" alt="Image"></a>
		    </div><!-- /author -->
			<div class="card-content">
			 <h4>Sean Coleman</h4>
		     <span>@sean</span>
			</div>
			 <a href="" class="kafe-btn kafe-btn-mint-small full-width"> Follow
			 </a>		  
		   </div><!-- /.post-content -->									
		  </div><!-- /.tr-post -->	
	     </div><!-- /.tr-post -->	
		</div><!-- /col-sm-3 -->
	   
	    <div class="col-lg-3">
		 <div class="tr-section">
		  <div class="tr-post">
		   <div class="entry-header">
		    <div class="entry-thumbnail">
		     <a href="#"><img class="img-fluid" src="assets/img/posts/31.jpg" alt="Image"></a>
		    </div><!-- /entry-thumbnail -->
	       </div><!-- /entry-header -->
		   <div class="post-content">
		    <div class="author-post text-center">
		     <a href="#"><img class="img-fluid rounded-circle" src="assets/img/users/15.jpg" alt="Image"></a>
		    </div><!-- /author -->
			<div class="card-content">
			 <h4>Vanessa Wells</h4>
		     <span>@vanessa</span>
			</div>
			 <a href="" class="kafe-btn kafe-btn-mint-small full-width"> Follow
			 </a>		  
		   </div><!-- /.post-content -->									
		  </div><!-- /.tr-post -->	
	     </div><!-- /.tr-post -->	
		</div><!-- /col-sm-3 -->
		
	   </div>
	  
	   <div class="row one-row">
	    <div class="col-lg-12">
	     <h4>Explore Section</h4>
		</div>
	   </div>
	  
	   <div class="row">
	   
	    <div class="col-lg-4">
		 <a href="#myModal" data-toggle="modal">
		 <div class="explorebox" 
		   style="background: linear-gradient( rgba(34,34,34,0.2), rgba(34,34,34,0.2)), url('assets/img/posts/22.gif') no-repeat;
		          background-size: cover;
                  background-position: center center;
                  -webkit-background-size: cover;
                  -moz-background-size: cover;
                  -o-background-size: cover;">
		  <div class="explore-top">
		   <div class="explore-like"><i class="fa fa-heart"></i> <span>14,100</span></div>
		   <div class="explore-circle pull-right"><i class="far fa-bookmark"></i></div>
          </div>		  
          <div class="explore-body">
           <div class=""><img class="img-circle" src="assets/img/users/13.jpeg" alt="user"></div>
          </div>		  
		 </div>
		 </a>
		</div><!--/ col-lg-4 -->
	   
	    <div class="col-lg-4">
		 <a href="#myModal" data-toggle="modal">
		 <div class="explorebox" 
		   style="background: linear-gradient( rgba(34,34,34,0.2), rgba(34,34,34,0.2)), url('assets/img/posts/7.jpg') no-repeat;
		          background-size: cover;
                  background-position: center center;
                  -webkit-background-size: cover;
                  -moz-background-size: cover;
                  -o-background-size: cover;">
		  <div class="explore-top">
		   <div class="explore-like"><i class="fa fa-heart"></i> <span>100,100</span></div>
		   <div class="explore-circle pull-right"><i class="far fa-bookmark"></i></div>
          </div>		  
          <div class="explore-body">
           <div class=""><img class="img-circle" src="assets/img/users/1.jpg" alt="user"></div>
          </div>		  
		 </div>
		 </a>
		</div><!--/ col-lg-4 -->
	   
	    <div class="col-lg-4">
		 <a href="#myModal" data-toggle="modal">
		 <div class="explorebox" 
		   style="background: linear-gradient( rgba(34,34,34,0.2), rgba(34,34,34,0.2)), url('assets/img/posts/19.jpg') no-repeat;
		          background-size: cover;
                  background-position: center center;
                  -webkit-background-size: cover;
                  -moz-background-size: cover;
                  -o-background-size: cover;">
		  <div class="explore-top">
		   <div class="explore-like"><i class="fa fa-heart"></i> <span>100</span></div>
		   <div class="explore-circle pull-right"><i class="far fa-bookmark"></i></div>
          </div>		  
          <div class="explore-body">
           <div class=""><img class="img-circle" src="assets/img/users/2.jpg" alt="user"></div>
          </div>		  
		 </div>
		 </a>
		</div><!--/ col-lg-4 -->
		
	   </div><!--/ row -->
	   
	   <div class="row">
	   
	    <div class="col-lg-4">
		 <a href="#myModal" data-toggle="modal">
		 <div class="explorebox" 
		   style="background: linear-gradient( rgba(34,34,34,0.2), rgba(34,34,34,0.2)), url('assets/img/posts/16.jpg') no-repeat;
		          background-size: cover;
                  background-position: center center;
                  -webkit-background-size: cover;
                  -moz-background-size: cover;
                  -o-background-size: cover;">
		  <div class="explore-top">
		   <div class="explore-like"><i class="fa fa-heart"></i> <span>324</span></div>
		   <div class="explore-circle pull-right"><i class="far fa-bookmark"></i></div>
          </div>		  
          <div class="explore-body">
           <div class=""><img class="img-circle" src="assets/img/users/3.jpg" alt="user"></div>
          </div>		  
		 </div>
		 </a>
		</div><!--/ col-lg-4 -->
	   
	    <div class="col-lg-4">
		 <a href="#myModal" data-toggle="modal">
		 <div class="explorebox" 
		   style="background: linear-gradient( rgba(34,34,34,0.2), rgba(34,34,34,0.2)), url('assets/img/posts/17.jpg') no-repeat;
		          background-size: cover;
                  background-position: center center;
                  -webkit-background-size: cover;
                  -moz-background-size: cover;
                  -o-background-size: cover;">
		  <div class="explore-top">
		   <div class="explore-like"><i class="fa fa-heart"></i> <span>1023</span></div>
		   <div class="explore-circle pull-right"><i class="far fa-bookmark"></i></div>
          </div>		  
          <div class="explore-body">
           <div class=""><img class="img-circle" src="assets/img/users/4.jpg" alt="user"></div>
          </div>		  
		 </div>
		 </a>
		</div><!--/ col-lg-4 -->
	   
	    <div class="col-lg-4">
		 <a href="#myModal" data-toggle="modal">
		 <div class="explorebox" 
		   style="background: linear-gradient( rgba(34,34,34,0.2), rgba(34,34,34,0.2)), url('assets/img/posts/20.jpg') no-repeat;
		          background-size: cover;
                  background-position: center center;
                  -webkit-background-size: cover;
                  -moz-background-size: cover;
                  -o-background-size: cover;">
		  <div class="explore-top">
		   <div class="explore-like"><i class="fa fa-heart"></i> <span>40</span></div>
		   <div class="explore-circle pull-right"><i class="far fa-bookmark"></i></div>
          </div>		  
          <div class="explore-body">
           <div class=""><img class="img-circle" src="assets/img/users/5.jpg" alt="user"></div>
          </div>		  
		 </div>
		 </a>
		</div><!--/ col-lg-4 -->
		
	   </div><!--/ row -->
	   
	   <div class="row">
	   
	    <div class="col-lg-4">
		 <a href="#myModal" data-toggle="modal">
		 <div class="explorebox" 
		   style="background: linear-gradient( rgba(34,34,34,0.2), rgba(34,34,34,0.2)), url('assets/img/posts/8.jpg') no-repeat;
		          background-size: cover;
                  background-position: center center;
                  -webkit-background-size: cover;
                  -moz-background-size: cover;
                  -o-background-size: cover;">
		  <div class="explore-top">
		   <div class="explore-like"><i class="fa fa-heart"></i> <span>63,453</span></div>
		   <div class="explore-circle pull-right"><i class="far fa-bookmark"></i></div>
          </div>		  
          <div class="explore-body">
           <div class=""><img class="img-circle" src="assets/img/users/6.jpg" alt="user"></div>
          </div>		  
		 </div>
		 </a>
		</div><!--/ col-lg-4 -->
	   
	    <div class="col-lg-4">
		 <a href="#myModal" data-toggle="modal">
		 <div class="explorebox" 
		   style="background: linear-gradient( rgba(34,34,34,0.2), rgba(34,34,34,0.2)), url('assets/img/posts/9.jpg') no-repeat;
		          background-size: cover;
                  background-position: center center;
                  -webkit-background-size: cover;
                  -moz-background-size: cover;
                  -o-background-size: cover;">
		  <div class="explore-top">
		   <div class="explore-like"><i class="fa fa-heart"></i> <span>1243</span></div>
		   <div class="explore-circle pull-right"><i class="far fa-bookmark"></i></div>
          </div>		  
          <div class="explore-body">
           <div class=""><img class="img-circle" src="assets/img/users/7.jpg" alt="user"></div>
          </div>		  
		 </div>
		 </a>
		</div><!--/ col-lg-4 -->
	   
	    <div class="col-lg-4">
		 <a href="#myModal" data-toggle="modal">
		 <div class="explorebox" 
		   style="background: linear-gradient( rgba(34,34,34,0.2), rgba(34,34,34,0.2)), url('assets/img/posts/10.jpg') no-repeat;
		          background-size: cover;
                  background-position: center center;
                  -webkit-background-size: cover;
                  -moz-background-size: cover;
                  -o-background-size: cover;">
		  <div class="explore-top">
		   <div class="explore-like"><i class="fa fa-heart"></i> <span>645</span></div>
		   <div class="explore-circle pull-right"><i class="far fa-bookmark"></i></div>
          </div>		  
          <div class="explore-body">
           <div class=""><img class="img-circle" src="assets/img/users/8.jpg" alt="user"></div>
          </div>		  
		 </div>
		 </a>
		</div><!--/ col-lg-4 -->
		
	   </div><!--/ row -->
	   
	  </div><!--/ container -->
	 </section><!--/ newsfeed -->
  
	 <!-- ==============================================
	 Modal Section
	 =============================================== -->
     <div id="myModal" class="modal fade">
      <div class="modal-dialog">
       <div class="modal-content">
        <div class="modal-body">
		
         <div class="row">
		 
          <div class="col-md-8 modal-image">
           <img class="img-responsive" src="assets/img/posts/6.jpg" alt="Image"/>
          </div><!--/ col-md-8 -->
          <div class="col-md-4 modal-meta">
           <div class="modal-meta-top">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
			 <span aria-hidden="true">×</span><span class="sr-only">Close</span>
			</button><!--/ button -->
            <div class="img-poster clearfix">
             <a href=""><img class="img-responsive img-circle" src="assets/img/users/18.jpg" alt="Image"/></a>
             <strong><a href="">Benjamin</a></strong>
             <span>12 minutes ago</span><br/>
		     <a href="" class="kafe kafe-btn-mint-small"><i class="fa fa-check-square"></i> Following</a>
            </div><!--/ img-poster -->
			  
            <ul class="img-comment-list">
             <li>
              <div class="comment-img">
               <img src="assets/img/users/17.jpeg" class="img-responsive img-circle" alt="Image"/>
              </div>
              <div class="comment-text">
               <strong><a href="">Anthony McCartney</a></strong>
               <p>Hello this is a test comment.</p> <span class="date sub-text">on December 5th, 2016</span>
              </div>
             </li><!--/ li -->
             <li>
              <div class="comment-img">
               <img src="assets/img/users/15.jpg" class="img-responsive img-circle" alt="Image"/>
              </div>
              <div class="comment-text">
               <strong><a href="">Vanessa Wells</a></strong>
               <p>Hello this is a test comment and this comment is particularly very long and it goes on and on and on.</p> <span>on December 5th, 2016</span>
              </div>
             </li><!--/ li -->
             <li>
              <div class="comment-img">
               <img src="assets/img/users/14.jpg" class="img-responsive img-circle" alt="Image"/>
              </div>
              <div class="comment-text">
               <strong><a href="">Sean Coleman</a></strong>
               <p class="">Hello this is a test comment.</p> <span class="date sub-text">on December 5th, 2016</span>
              </div>
             </li><!--/ li -->
             <li>
              <div class="comment-img">
               <img src="assets/img/users/13.jpeg" class="img-responsive img-circle" alt="Image"/>
              </div>
              <div class="comment-text">
               <strong><a href="">Anna Morgan</a></strong>
               <p class="">Hello this is a test comment.</p> <span class="date sub-text">on December 5th, 2016</span>
              </div>
             </li><!--/ li -->
             <li>
              <div class="comment-img">
               <img src="assets/img/users/3.jpg" class="img-responsive img-circle" alt="Image"/>
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
				<img class="img-responsive img-circle" src="assets/img/users/13.jpeg" alt="Image">
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
					<span><input type = "button" id = "closeWrite" value = "close"></span>
				</div>
			</form>
		</div>
	</div>
	
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cab38e188d1015fa32fe5df13ab040fa&libraries=services,clusterer,drawing"></script>
		<script src = "../resources/writef/js/kakaomap.js"></script>
		
		<script src="../resources/writef/js/main.js"></script>

  </body>
</html>