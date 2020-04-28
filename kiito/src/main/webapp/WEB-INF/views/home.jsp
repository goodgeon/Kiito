<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
  <head>

	    <!-- ==============================================
		Title and Meta Tags
		=============================================== -->
		<meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">  
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>KIITO - 君がいるところ</title>
		<meta name="description" content="" />
        <meta name="keywords" content="" />
        <meta property="og:title" content="" />
        <meta property="og:url" content="" />
        <meta property="og:description" content="" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        
        
        <!-- bxSlider -->
		  <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">

		  <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
		  <script>
		  function following(feed_seq, customer_seq, following_seq){
				$.ajax({
					type : "POST",
					url : "customer/follow",
					data : {
						follower_seq : customer_seq,
						following_seq : following_seq
					},
					success : function(){
						alert("팔로우 성공");
						$("#followBt"+feed_seq).css('background-color','gray');
						$("#followBt"+feed_seq).attr('onclick','cancleFollowing('+feed_seq+','+customer_seq+','+following_seq+')');
						$("#followSpan"+feed_seq).text("UNFOLLOW");
					}
				})
				
			}

			function cancleFollowing(feed_seq, customer_seq, following_seq){
				$.ajax({
					type : "POST",
					url : "customer/cancleFollow",
					data : {
						customer_seq : customer_seq,
						following_seq : following_seq
					},
					success : function(){
						alert("팔로우 취소");
						$("#followBt"+feed_seq).css('background-color','#1fa881');
						$("#followBt"+feed_seq).attr('onclick','following('+feed_seq+','+customer_seq+','+following_seq+')');
						$("#followSpan"+feed_seq).text("FOLLOW");
					}
				})
			}



			function showInputNumber(feed_seq){
				$("#smsInput"+feed_seq).toggle();
			}

			function sendSms(feed_seq){
				var phoneNumber = $("#smsPhoneNumber"+feed_seq).val();
				var checkin = $("#modalCheckin"+feed_seq).html();
				var congestion = $("#modalCongestion"+feed_seq).html();
				var contents = $("#modalContents"+feed_seq).html();
				
				console.log(phoneNumber);
				console.log(checkin);
				console.log(congestion);
				console.log(contents);

				$.ajax({
					type : "POST",
					url : "feed/sendSms",
					data : {
						phoneNumber : phoneNumber,
						checkin : checkin,
						congestion : congestion,
						contents : contents
					},
					success : function(){
						alert("문자전송번호 : " + phoneNumber);
					}
				})
			}


			function submitComment(feed_seq, customer_seq){
					var text = $("#inputComment"+feed_seq).val();
					console.log(text);
					$.ajax({
						type : "POST",
						url : "comment/insertComment",
						data : {
							feed_seq : feed_seq,
							customer_seq : customer_seq,
							text : text
						},
						success : function(){
							$("#inputComment"+feed_seq).val('');
							getCommentList(feed_seq);
						}
					})
			}
			//<c:url value = '/img/item.customer.profileImg'/>
			function getCommentList(feed_seq){
				var commentList = [];
				$.ajax({
					type : "GET",
					url : "comment/getCommentList",
					data : {
						feed_seq : feed_seq
					},
					success : function(list){
						var html = '';
						$.each(list, function(key,item){
							html += '<li>';
							html += '<div class = "comment-img">';
							if(item.customer.profileImg.substring(0,4) == 'http'){
								html += '<img src = "'+item.customer.profileImg+'" class = "img-responsive img-circle" alt="Image"/>';
							}else{
								html += '<img src = "<c:url value = "/img/'+item.customer.profileImg+'" />" class = "img-responsive img-circle" alt="Image"/>';
							}
							html += '</div>';
							html += '<div class = "comment-text">';
							html += '<strong><a href="">' + item.customer.nick + '</a></strong>';
							html += '<p>' + item.text + '</p> <span class="date sub-text">' + item.inputdate + '</span>';
							html += '</div></li>';
						})
						
						$("#commentListUl"+feed_seq).html(html);
						$("#commentsCount"+feed_seq).html(list.length);
						$("#modalCommentsCount"+feed_seq).html(list.length);
					}
				})
			}
		  </script>	
		  <script>
		  	var slider = '';
			 $(document).ready(function(){
			    slider = $('.bxslider').bxSlider({
				    adaptiveHeight: true
				});
				

			}); 

			function openModal(feedNum,customer_seq,following_seq){
				var modalId = "#myModal"+feedNum;
				$(modalId).modal("show");

				$.ajax({
					type : "POST",
					url : "customer/checkFollowing",
					data : {
						customer_seq : customer_seq,
						following_seq : following_seq
					},
					success : function(result){
						if(result == 1){
							$("#followBt"+feedNum).css('background-color','#1fa881');
							$("#followBt"+feedNum).attr('onclick','following('+feedNum+','+customer_seq+','+following_seq+')');
							$("#followSpan"+feedNum).text("FOLLOW");
						}else if(result == 0){
							$("#followBt"+feedNum).css('background-color','gray');
							$("#followBt"+feedNum).attr('onclick','cancleFollowing('+feedNum+','+customer_seq+','+following_seq+')');
							$("#followSpan"+feedNum).text("UNFOLLOW");
						}
					}
				})

	
				var config = {
					adaptiveHeight : true
				}
	
				var ulId = "#sliderId" + feedNum;

				sliderModal = $(ulId).bxSlider({
					adaptiveHeight : true
			  	});

			  	//sliderModal.reloadSlider();
	
				 setTimeout(function(){
					sliderModal.reloadSlider(config); 
				}, 300); 

				getCommentList(feedNum);
					 
			}
		  </script>
		  
		  <script>
			$(document).ready(function(){
				
				$("#search").on('keydown', function(key){
					var search = $("#search").val();
					if(key.keyCode == 13){
						location.href = "search?search="+search;
					
					}
				})
			})
		  </script>
		  
		  
		  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		
		<!-- ==============================================
		Favicons
		=============================================== --> 
		<link rel="icon" href="resources/assets/img/logo.jpg">
		<link rel="apple-touch-icon" href="resources/assets/img/favicons/apple-touch-icon.png">
		<link rel="apple-touch-icon" sizes="72x72" href="resources/assets/img/favicons/apple-touch-icon-72x72.png">
		<link rel="apple-touch-icon" sizes="114x114" href="resources/assets/img/favicons/apple-touch-icon-114x114.png">
		
	    <!-- ==============================================
		CSS
		=============================================== -->
        <link type="text/css" href="resources/assets/css/demos/photo.css" rel="stylesheet" />
		<link rel="stylesheet" href="resources/writef/css/main.css">
		<link rel="stylesheet" type="text/css" href="resources/writef/css/kakaomap.css">
		<link href="https://fonts.googleapis.com/css?family=Sawarabi+Mincho" rel="stylesheet">
		<!-- ==============================================
		Feauture Detection
		=============================================== -->
		<script src="resources/assets/js/modernizr-custom.js"></script>

		<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->	
		<!-- <script src="//code.jquery.com/jquery-3.3.1.min.js"></script> -->
	
		
  </head>
<body style = "overflow : auto">

     <!-- ==============================================
     Navigation Section
     =============================================== -->  
     <header class="tr-header">
     <img alt="" src="resources/login/images/bgimg4.png" class="main-img">
		 <a class="navbar-brand" href="/kiito/home">KIITO</a>
      <nav class="navbar navbar-default">
	  <div class="d-flex justify-content-between">
	   <div class="p-2 nav-icon-lg mint-green">
	   <a class="nav-icon" href="/kiito/home"><em class="fa fa-home"></em>
		<span>Home</span>
	   </a>
	   </div>
	   <div class="p-2 nav-icon-lg clean-black">
	   <a class="nav-icon" href="feed/explore"><em class="fa fa-crosshairs"></em>
		<span>Explore</span>
	   </a>
	   </div>
	   <div class="p-2 nav-icon-lg dark-black">
	   <a class="nav-icon" onclick = "writeBt()" style="cursor:pointer"><em class="fab fa-instagram"  ></em>
		<span>Upload</span>
	   </a>
	   </div>

	   <div class="p-2 nav-icon-lg dark-black">
	   <a class="nav-icon" href="customer/profile?profileImg=${sessionScope.customer.profileImg }"><em class="fa fa-user"></em>
		<span>Profile</span>
	   </a>
	   </div>
	  </div>

		<div class="navbar-right">                          
		 <ul class="nav navbar-nav">
		   <li>
		   <div class="search-dashboard">
               <form onSubmit="return false;">
                    <input id = "search" placeholder="Search here" type="text">
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
			<a class="nav-link dropdown-toggle arrow-none waves-effect" data-toggle="dropdown" href="customer/chat" role="button" aria-haspopup="false" aria-expanded="false">
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
			 <a href="customer/chat" class="dropdown-item text-center notify-all">
			  View all <i class="fa fa-arrow-right"></i>
			 </a>
            </div><!--/ dropdown-menu-->
		   </li>
		<!--   조금만 프로필 -->
		 <li class="dropdown mega-avatar">
		  <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
		   <span class="avatar w-32">
		   	<c:if test="${sessionScope.customer.profileImg == null }">
								<img src="resources/login/images/profileImg_null2.png" class="img-resonsive img-circle" width="25" height="25" alt="..."/>
			</c:if>
			<c:if test="${sessionScope.customer.profileImg.substring(0,4) == 'http' }">
				<img src="<c:url value = '${sessionScope.customer.profileImg }'/>" class="img-resonsive img-circle" width="25" height="25" alt="..."/>
			</c:if>
			<c:if test="${sessionScope.customer.profileImg.substring(0,4) != 'http' }">
				<img src="<c:url value = '/img/${sessionScope.customer.profileImg }'/>" class="img-resonsive img-circle" width="25" height="25" alt="..."/>
			</c:if>
		   </span>
		   <!-- hidden-xs hides the username on small devices so only the image appears. -->
		   <span class="hidden-xs"> 
			${sessionScope.customer.nick }
		   </span>
		  </a>
		  <div class="dropdown-menu w dropdown-menu-scale pull-right">

		   <div class="dropdown-divider"></div>
		   <a class="dropdown-item" href="customer/profile?profileImg=${sessionScope.customer.profileImg }"><span>Profile</span></a> 
		   <a class="dropdown-item" href="#editp" data-toggle="modal" rel="modal:open"><span>Settings</span></a> 

		   <div class="dropdown-divider"></div>
		   <a class="dropdown-item" href="customer/logout">Sign out</a>
		  </div>
		 </li><!-- /navbar-item -->	
		 
		 </ul><!-- /.sign-in -->   
		</div><!-- /.nav-right -->
      </nav><!-- /.navbar -->
     </header><!-- Page Header --> 
  		       <div class="container-fluid">
       </div><!-- /.container -->
	 <!-- ==============================================
	 Navbar Second Section
	 =============================================== -->
  
	 <!-- ==============================================
	 News Feed Section
	 =============================================== --> 
	 <section class="newsfeed">
	  <div class="container-fluid">
	   <div class="row">
	    <div class="col-lg-3">
		

		 
		</div><!--/ col-lg-3 -->
		
<!------------------------FEED---------------------------------->
	    <div class="col-lg-6">
		
		 
        <c:forEach var = "feed" items="${feed}">
         <div class="cardbox">
		 
          <div class="cardbox-heading">
           <!-- START dropdown-->
           
           <div class="dropdown pull-right">
            <button class="btn btn-secondary btn-flat btn-flat-icon" type="button" data-toggle="dropdown" aria-expanded="false">
		     <em class="fa fa-ellipsis-h"></em>
			</button>
            <div class="dropdown-menu dropdown-scale dropdown-menu-right" role="menu" style="position: absolute; transform: translate3d(-136px, 28px, 0px); top: 0px; left: 0px; will-change: transform;">
	         <a class="dropdown-item" href="#">Hide post</a>
			 <a class="dropdown-item" href="#">Stop following</a>
			 <a class="dropdown-item" href="#">Report</a>
            </div>
           </div>
           
           <!--/ dropdown -->
           <!-- END dropdown-->
           
           
           <div class="media m-0">
            <div class="d-flex mr-3">
			 <a href="customer/profile?profileImg=${feed.customer.profileImg }">
			 	<c:if test="${feed.customer.profileImg.substring(0,4) == 'http' }">
				<img src="<c:url value = '${feed.customer.profileImg }'/>" class="img-resonsive img-circle" width="25" height="25" alt="..."/>
				</c:if>
				<c:if test="${feed.customer.profileImg.substring(0,4) != 'http' }">
					<img src="<c:url value = '/img/${feed.customer.profileImg }'/>" class="img-resonsive img-circle" width="25" height="25" alt="..."/>
				</c:if>
			 </a>
			</div>
            <div class="media-body">
             <p class="m-0">${feed.customer.nick }</p>
             <p><img src="resources/images/map.png" style="max-width: 20px; max-height:20px">${feed.checkin}
             <p>
             <c:choose>
             	<c:when test="${feed.congestion == 3 }">혼잡</c:when>
             	<c:when test="${feed.congestion == 2 }">보통</c:when>
             	<c:when test="${feed.congestion == 1 }">여유</c:when>
             </c:choose>
             </p>
             </p>
			 <small><span>${feed.inputdate }</span></small>
            </div>
           </div><!--/ media -->
          </div><!--/ cardbox-heading -->
         
          
		  <div class="cardbox-item">
		   
		   	<c:if test="${fn:length(feed.imageFile) > 0 || fn:length(feed.videoFile) > 0}">
		   		<ul class = "bxslider">
	           	<c:forEach var ="i" items = "${feed.imageFile}">
	           		
					<li style = "display : flex; justify-content : center;">
					
					<img class="img-responsive" src="<c:url value = '/img/${i.savedFilename}'/>" alt="MaterialImg">
					</li>          	
	          	</c:forEach>
	          	
	          	<c:forEach var ="i" items = "${feed.videoFile}">
	           		
					<li style = "display : flex; justify-content : center;">
					
					<video width="500" height="500" src="<c:url value = '/img/${i.savedFilename}'/>" controls></video>
					</li>          	
	          	</c:forEach>
	          	</ul>
		   	</c:if>
		   	
		   	
	   			
		   	
		    
		   
		   <div style = "margin-left : 75px;">${feed.contents }</div>
	
          </div><!--/ cardbox-item -->
          
	      <div class="cardbox-base">
		   <ul>
		   	<c:forEach var="hashtag" items="${hashtag }">
		   		<c:if test="${feed.feed_seq == hashtag.feed_seq }">
		   			<li>#${hashtag.contents }</li>
		   		</c:if>
		   	</c:forEach> 
			<!-- <li><a href="#myModal" data-toggle="modal"><img src="resources/assets/img/users/1.jpg" class="img-responsive img-circle" alt="User"></a></li>
		    <li><a href="#myModal" data-toggle="modal"><img src="resources/assets/img/users/10.jpg" class="img-responsive img-circle" alt="User"></a></li> --> 
		   </ul>
		  </div><!--/ cardbox-base -->
          <div class="cardbox-like">
		   <ul style = "display : flex; justify-content : center">
			<li><a href="" style = "padding-top : 6px;"><i class="fa fa-heart"></i><span> ${feed.likes }</span></a></li>
		    <li onclick = "openModal(${feed.feed_seq },${sessionScope.customer.customer_seq},${feed.customer.customer_seq})"><a href="javascript:void()" title="" class="com"><i class="fa fa-comments"></i></a> <a href = "" onclick = "openModal(${feed.feed_seq },${sessionScope.customer.customer_seq},${feed.customer.customer_seq})" data-toggle="modal" style = "display : flex; justify-content : center"><span id = "commentsCount${feed.feed_seq}" class="span-last"> ${fn:length(feed.comments)}</span></a></li>
		   </ul>
          </div><!--/ cardbox-like -->			  
                
		 </div>
		
		 <!--/ cardbox -->	
		 
		 
		 
		 <!-- ==============================================
	 Modal Section
	 =============================================== -->
     <div id="myModal${feed.feed_seq }" class="modal fade" style = "z-index : 99999;">
      <div class="modal-dialog">
       <div class="modal-content">
        <div class="modal-body">
		
         <div class="row">
		 
          <div class="col-md-8 modal-image">
          	
	           <c:if test="${fn:length(feed.imageFile) > 0 || fn:length(feed.videoFile) > 0}">
	           		<ul id = "sliderId${feed.feed_seq}" class = "bxsliderModal">
			           	<c:forEach var ="i" items = "${feed.imageFile}">
							<li >
							<img class="img-responsive" src="<c:url value = '/img/${i.savedFilename}'/>" alt="Image">
							</li>          	
			   	       	</c:forEach>
			   	       	<c:forEach var ="i" items = "${feed.videoFile}">
							<li>
							<video width="500" height="500" src="<c:url value = '/img/${i.savedFilename}'/>" controls></video>
							</li>          	
			   	       	</c:forEach>
					</ul>   	
			   	</c:if>
			   	<div style="display: flex;">
			   	<img src="resources/images/map.png" style="max-width: 20px; max-height:20px">
			   	<div id = "modalCheckin${feed.feed_seq }">${feed.checkin }</div>
			   	　　혼잡도 : <div id = "modalCongestion${feed.feed_seq }">${feed.congestion }</div>
			</div>
			<div id = "modalContents${feed.feed_seq }">${feed.contents }</div>
          	
           <%--  <img class="img-responsive" src="<c:url value = '/img/20200415.png'/>" alt="Image"/>   --%>
          </div><!--/ col-md-8 -->
          <div class="col-md-4 modal-meta">
           <div class="modal-meta-top">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
			 <span aria-hidden="true">×</span><span class="sr-only">Close</span>
			</button><!--/ button -->
            <div class="img-poster clearfix">
             <a href="">
             	<c:if test="${feed.customer.profileImg.substring(0,4) == 'http' }">
				<img src="<c:url value = '${feed.customer.profileImg }'/>" class="img-resonsive img-circle" width="25" height="25" alt="..."/>
				</c:if>
				<c:if test="${feed.customer.profileImg.substring(0,4) != 'http' }">
					<img src="<c:url value = '/img/${feed.customer.profileImg }'/>" class="img-resonsive img-circle" width="25" height="25" alt="..."/>
				</c:if>
             </a>
             <strong><a href="">${feed.customer.nick }</a></strong>
             <br>
             <span>${feed.inputdate }</span><br/>
             <c:if test="${sessionScope.customer.customer_seq != feed.customer.customer_seq}">
            	<a href="javascript:void(0)" id = "followBt${feed.feed_seq}" onclick = "following(${feed.feed_seq},${sessionScope.customer.customer_seq},${feed.customer.customer_seq})" class="kafe kafe-btn-mint-small"><i class="fa fa-check-square"></i> <span id="followSpan${feed.feed_seq }" style = "color : white;">Following</span></a> 
             </c:if>
		     <a href="javascript:void(0)" onclick = "showInputNumber(${feed.feed_seq })" class="kafe kafe-btn-mint-small"><i class="fas fa-envelope-open"></i>문자전송</a>
            </div><!--/ img-poster -->
            
            <div id = "smsInput${feed.feed_seq }" class = "smsInput">
           		전화번호를 입력해 주세요 : 
            	<div style = "display : flex;">
            		<input id = "smsPhoneNumber${feed.feed_seq }" type = "text" class = "form-control input-sm">
            		<button type = "button" class="kafe kafe-btn-mint-small" onclick = "sendSms(${feed.feed_seq })">전송</button>
            	</div>
            	
            </div>
			  
            <ul id = "commentListUl${feed.feed_seq }" class="img-comment-list">
           
            </ul>
			  
            <div class="modal-meta-bottom">
			 <ul>
			  <li><a class="modal-like" href="#"><i class="fa fa-heart"></i></a><span class="modal-one"> ${feed.likes }</span> | 
			      <a class="modal-comment" href="#"><i class="fa fa-comments"></i></a><span id = "modalCommentsCount${feed.feed_seq }"> </span> </li>
			  <li>
			   <span class="thumb-xs">
			   	<c:if test="${sessionScope.customer.profileImg.substring(0,4) == 'http' }">
				<img src="<c:url value = '${sessionScope.customer.profileImg }'/>" class="img-resonsive img-circle" width="25" height="25" alt="..."/>
				</c:if>
				<c:if test="${sessionScope.customer.profileImg.substring(0,4) != 'http' }">
					<img src="<c:url value = '/img/${sessionScope.customer.profileImg }'/>" class="img-resonsive img-circle" width="25" height="25" alt="..."/>
				</c:if>

			   </span>
			   <div class="comment-body">
			   	<div id = "commentForm">
			   		<input id = "inputComment${feed.feed_seq}" class="form-control input-sm" type="text" name = "text" placeholder="Write your comment..." data-customer="${sessionScope.customer.customer_seq}" data-feed="${feed.feed_seq}">
			   		<a href = "javacsript:void(0)" class="kafe kafe-btn-mint-small" id = "commentSubmit" onclick = "submitComment(${feed.feed_seq}, ${sessionScope.customer.customer_seq})">Submit</a>
			   	</div>
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
		 
		 
		 
		</c:forEach>
		
		</div>


	
	 </section><!--/ newsfeed -->
  
	 
	 
	 
     <!-- ==============================================
	 Scripts
	 =============================================== -->
	 
	 
	<!-- <script src="resources/assets/js/jquery.min.js"></script> -->
	<script src="resources/assets/js/bootstrap.min.js"></script>
	<script src="resources/assets/js/base.js"></script>
	<script src="resources/assets/plugins/slimscroll/jquery.slimscroll.js"></script>
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
			<form class="contact100-form validate-form" id = "writeForm" action = "/kiito/feed/insertFeed" method = "POST" enctype="multipart/form-data" >
			<input type = "hidden" name = "customer_seq" value = "${sessionScope.customer.customer_seq }" id="cs">
				<span class="contact100-form-title">私がいるところ</span>
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
				<input id = "xLocation" type = "hidden" name = "xLocation">
				<input id = "yLocation" type = "hidden">
				
				<div class = "wrap-input100">
					<input type = "radio" name = "congestion" value = "3" checked = "checked" style = "margin-left : 20px;">congestion
					<input type = "radio" name = "congestion" value = "2">smoothness
					<input type = "radio" name = "congestion" value = "1">dullness
				</div>
						
				<div class="wrap-input100 validate-input" data-validate = "Please enter your message">
					<textarea id = "contents" class="input100" name="contents" placeholder="Your Message" style = "resize : none"></textarea>
					<span class="focus-input100"></span>
				</div>
				
				<div data-validate = "이거 왜뜨지 씨발">

					<input type = "file" id = "input_imgs" name = "imagefile"  multiple accept="image/gif, image/jpeg, image/png" style="display:none" />
					<input type='text' name='imagefile2' id='imagefile2' style="display:none;"> 
				<img src='resources/images/picture.png' border='0' onclick='document.all.imagefile.click(); document.all.imagefile2.value=document.all.imagefile.value'> 
				  
				<input type = "file" id = "input_video" name = "videofile" multiple accept="video/*" style="display:none" />
					<input type='text' name='videofile2' id='videofile2' style="display:none;"> 
				<img src='resources/images/video.png' border='0' onclick='document.all.videofile.click(); document.all.videofile2.value=document.all.videofile.value'> 

				
			
				</div>
				<div>
					<div class = "imgs_wrap" style = "margin-bottom : 10px;">
					
					</div>
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
		<script src="resources/writef/js/main.js"></script>
		<script src = "resources/writef/js/kakaomap.js"></script>
		
<!--    개인정보수정 -->
    <div id="editp" class="modal">
   <form id="editForm" style="text-align: -webkit-center;">
   <span style="font-size: 70px; font-family: fantasy; font-style: italic; color: antiquewhite;">Info.</span><br>
   <div style="background-color: #daf6ffa6; width: 400px; min-height: 45vh; border-radius: 30px;">
   <section class="content bgcolor-1" style="border-radius: 30px;">
   <img style = "border:1px solid #642EFE; width : 150px; height : 150px;" src="img/${sessionScope.customer.profileImg }" class="img-responsive img-circle" id="base">
   <a>${sessionScope.customer.nick }</a><br>

         <span class="input input--haruki">
               <input class="input__field input__field--haruki" type="text"  id="nick" value="${sessionScope.customer.nick }" />
               <label class="input__label input__label--haruki" for="input-1">
                  <span class="input__label-content input__label-content--haruki">NickName</span>
               </label>
            </span>
            <button id="bt3" value="수정" ><img src="resources/images/check.png"></button>
            
                     <span class="input input--haruki">
               <input type="password" class="input__field input__field--haruki"  id="password" />
               <label class="input__label input__label--haruki" for="input-1">
                  <span class="input__label-content input__label-content--haruki">password</span>
               </label>
            </span>
            
                     <span class="input input--haruki">
               <input type="password" class="input__field input__field--haruki"  id="password1"/>
               <label class="input__label input__label--haruki" for="input-1">
                  <span class="input__label-content input__label-content--haruki" id="password1">password check</span>
               </label>
            </span>
            <button id="bt7" value="탈퇴" >delete<img src="resources/images/check.png"></button>
            <br>
               　　<div class="modal-meta-top">
               <button type = "button" id = "closeWrite" data-dismiss="modal" class="contact100-form-btn">
                  <span>
                     <i class="fa fa-paper-plane-o m-r-6" aria-hidden="true"></i>
                     close
                  </span>
               </button>
               </div>
      </section>
      </div>
</form>
</div>
		
  </body>
</html>
