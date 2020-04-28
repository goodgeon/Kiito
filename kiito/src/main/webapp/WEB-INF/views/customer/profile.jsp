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
        <title>KIITO - 君がいるところ</title>
      <meta name="description" content="" />
        <meta name="keywords" content="" />
        <meta property="og:title" content="" />
        <meta property="og:url" content="" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
      <meta name="description" content="Simple ideas for enhancing text input interactions" />
      <meta name="keywords" content="input, text, effect, focus, transition, interaction, inspiration, web design" />
      <meta name="author" content="Codrops" />
      <link rel="shortcut icon" href="../favicon.ico">
      <meta charset="UTF-8" />
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
              <meta name="description" content="Simple ideas for enhancing text input interactions" />
      <meta name="keywords" content="input, text, effect, focus, transition, interaction, inspiration, web design" />
      <meta name="author" content="Codrops" />
      <link rel="shortcut icon" href="../favicon.ico">
      <link rel="stylesheet" type="text/css" href="../resources/nick/css/normalize.css" />
      <link rel="stylesheet" type="text/css" href="../resources/nick/fonts/nick/css/font-awesome.min.css" />
      <link rel="stylesheet" type="text/css" href="../resources/nick/css/demo.css" />
      <link rel="stylesheet" type="text/css" href="../resources/nick/css/set1.css" />
          <!-- bxSlider -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
        <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
        <script src = "../resources/modal/js/modal.js"></script>   
   
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
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
      
        
        
        
      
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
     <div class="d-flex justify-content-between">
      <div class="p-2 nav-icon-lg mint-green">
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

      <div class="p-2 nav-icon-lg dark-black">
      <a class="nav-icon" href="profile?profileImg=${sessionScope.customer.profileImg }"><em class="fa fa-user"></em>
      <span>Profile</span>
      </a>
      </div>
     </div>

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
<!--          <a class="dropdown-item" href="#"><span>New Story</span></a>  -->
       <!--   <a class="dropdown-item" href="#"><span>Become a Member</span></a>  -->
         <div class="dropdown-divider"></div>
         <a class="dropdown-item" href="profile?profileImg=${sessionScope.customer.profileImg }"><span>Profile</span></a> 
         <a class="dropdown-item" href="#editp" data-toggle="modal" rel="modal:open"><span>Settings</span></a> 
<!--          <a class="dropdown-item" href="#">Need help?</a>  -->
         <div class="dropdown-divider"></div>
         <a class="dropdown-item" href="logout">Sign out</a>
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
    <section class="profile-two">
     <div class="container-fluid">
      <div class="row">

      <div class="col-lg-3">
         <aside id="leftsidebar" class="sidebar">        
        <ul class="list">
           <li>
         <div class="user-info">         <!--    자기 프로필 -->
          <div class="image">
             <a href="#preview" data-toggle="modal" rel="modal:open">
             <c:if test="${sessionScope.customer.profileImg.substring(0,4) == 'http' }">
            <img src="<c:url value = '${ccc.profileImg }'/>" class="img-resonsive img-circle" alt="..."/>
            </c:if>
            <c:if test="${sessionScope.customer.profileImg.substring(0,4) != 'http' }">
               <img src="<c:url value = '/img/${ccc.profileImg }'/>" class="img-resonsive img-circle" alt="..."/>
            </c:if>
                  
            <span class="online-status online"></span>
           </a>
          </div>
           <div class="detail" style = "margin-top : 20px;">
           <h4>${ccc.nick }</h4>

          </div>
          
           <c:if test="${sessionScope.customer.customer_seq == ccc.customer_seq }">
          
          <div class="row">
           <div class="col-12">
            <a title="개인정보수정" href="#editp" data-toggle="modal" rel="modal:open" class=" waves-effect waves-block"><img src="../resources/images/setting.png"></a>
         
           </div>                                
          </div>
          
          </c:if>
          
         </div>
           </li>
           <li>
            <small class="text-muted"><a href="profile">${countf} Posts <em class="fa fa-angle-right pull-right"></em></a> </small><br/>
            <small class="text-muted"><a href="followers?type=1">${fn:length(sessionScope.customer.follower)} Followers <em class="fa fa-angle-right pull-right"></em></a> </small><br/>
            <small class="text-muted"><a href="followers?type=2">${fn:length(sessionScope.customer.follow)} Following <em class="fa fa-angle-right pull-right"></em></a> </small>
            <hr>
<!--             <small class="text-muted">Bio: </small>
            <p>795 Folsom Ave, Suite 600 San Francisco, CADGE 94107</p>
            <hr> -->
            <small class="text-muted">E-mail: </small>
            <p>${ccc.email } </p> 
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
        
           
          <a href="" data-toggle="modal" onclick = "openModal(${s.feed_seq },${sessionScope.customer.customer_seq},${s.customer.customer_seq})" >
          <div class="explorebox" 
            style="background: linear-gradient( rgba(34,34,34,0.2), rgba(34,34,34,0.2)), url('assets/img/posts/6.jpg') no-repeat;
                 background-size: cover;
                 background-position: center center;
                 -webkit-background-size: cover;
                 -moz-background-size: cover;
                 -o-background-size: cover;
                
                 background-image : url(/kiito/img/${s.imageFile[0].savedFilename})">
            
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
        
        <!-- ==============================================
    Modal Section
    =============================================== -->
       <div id="myModal${s.feed_seq }" class="modal fade" style = "z-index : 99999;">
      <div class="modal-dialog">
       <div class="modal-content">
        <div class="modal-body">
      
         <div class="row">
       
          <div class="col-md-8 modal-image">
             <c:if test="${fn:length(s.imageFile) > 0 || fn:length(s.videoFile) > 0}">
                    <ul id = "sliderId${s.feed_seq}" class = "bxsliderModal">
                       <c:forEach var ="i" items = "${s.imageFile}">
                     <li >
                     <img class="img-responsive" src="<c:url value = '/img/${i.savedFilename}'/>" alt="Image">
                     </li>             
                         </c:forEach>
                         
                         <c:forEach var ="i" items = "${s.videoFile}">
                     <li>
                     <video width="500" height="500" src="<c:url value = '/img/${i.savedFilename}'/>" controls></video>
                     </li>             
                         </c:forEach>
               </ul>      
               </c:if>
               <div id = "modalContents${s.feed_seq }">${s.contents }</div>
               <div id = "modalCheckin${s.feed_seq }">${s.checkin }</div>
               <div id = "modalCongestion${s.feed_seq }">${s.congestion }</div>
          
         
          
         <!--  
           <img class="img-responsive" src="../resources/assets/img/posts/9.jpg" alt="Image"/> -->
          </div><!--/ col-md-8 -->
          <div class="col-md-4 modal-meta">
           <div class="modal-meta-top">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
          <span aria-hidden="true">×</span><span class="sr-only">Close</span>
         </button>
            <div class="img-poster clearfix">
             <a href=""><img class="img-responsive img-circle" src="${sessionScope.customer.profileImg }" alt="Image"/></a>
             <strong><a href="">${sessionScope.customer.nick }</a></strong>
             <br>
             <span>${s.inputdate }</span><br/>
          <a href="javascript:void(0)" onclick = "showInputNumber(${s.feed_seq })" class="kafe kafe-btn-mint-small"><i class="fas fa-envelope-open"></i>문자전송</a>
            </div><!--/ img-poster -->
            
              <div id = "smsInput${s.feed_seq }" class = "smsInput">
                 전화번호를 입력해 주세요 : 
               <div style = "display : flex;">
                  <input id = "smsPhoneNumber${s.feed_seq }" type = "text" class = "form-control input-sm">
                  <button type = "button" class="kafe kafe-btn-mint-small" onclick = "sendSms(${s.feed_seq })">전송</button>
               </div>
               
            </div>
           
           
            <ul id = "commentListUl${s.feed_seq }" class="img-comment-list">
          
 
            </ul><!--/ comment-list -->
           
        <div class="modal-meta-bottom">
          <ul>
           <li><a class="modal-like" href="#"><i class="fa fa-heart"></i></a><span class="modal-one"> ${s.likes }</span> | 
               <a class="modal-comment" href="#"><i class="fa fa-comments"></i></a><span id = "modalCommentsCount${s.feed_seq }"> </span> </li>
           <li>
            <span class="thumb-xs">
            <img class="img-responsive img-circle"  src="<c:url value = '/img/${sessionScope.customer.profileImg }'/>"  alt="Image">
            </span>
            <div class="comment-body">
               <div id = "commentForm">
                  <input id = "inputComment${s.feed_seq}" class="form-control input-sm" type="text" name = "text" placeholder="Write your comment..." data-customer="${sessionScope.customer.customer_seq}" data-feed="${s.feed_seq}">
                  <a href = "javacsript:void(0)" class="kafe kafe-btn-mint-small" id = "commentSubmit" onclick = "submitComment(${s.feed_seq}, ${sessionScope.customer.customer_seq})">Submit</a>
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
   
        
       </div><!--/ row -->
       
       <div class="row">
       
   
       

        
       </div><!--/ row -->
       
   
       
       <div class="row">
       
   
        
       </div><!--/ row -->
      
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
         <c:forEach var = "p" items="${bestp}">
         <c:if test="${fn:length(p.savedFilename) > 0 }">
        <div class="col-lg-6">
         <a href="#"><img src="<c:url value = '../img/${p.savedFilename}'/>" class="img-responsive" alt="Image"/></a>
        </div>
        </c:if>
        </c:forEach>
       </div>
      <!--  <div class="row">
        <div class="col-lg-6">
         <a href="#"><img src="../resources/assets/img/posts/21.gif" class="img-responsive" alt="Image"/></a>
        </div>
        <div class="col-lg-6">
         <a href="#"><img src="../resources/assets/img/posts/23.gif" class="img-responsive" alt="Image"/></a>
        </div>
       </div> -->
   <!--     <div class="row">
        <div class="col-lg-6">
         <a href="#"><img src="../resources/assets/img/posts/11.jpg" class="img-responsive" alt="Image"/></a>
        </div>
        <div class="col-lg-6">
         <a href="#"><img src="../resources/assets/img/posts/20.jpg" class="img-responsive" alt="Image"/></a>
        </div>
       </div> -->
        </div>      
      
      
      </div>
      
       </div><!--/ row-->   
     </div><!--/ container -->
    </section><!--/ profile -->
  
    
      
     <!-- ==============================================
    Scripts
    =============================================== -->
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
            <img src='../resources/images/picture.png' border='0' onclick='document.all.imagefile.click(); document.all.imagefile2.value=document.all.imagefile.value'> 
            <input type = "file" id = "input_video" name = "videofile" multiple accept="video/*" style="display:none" />
               <input type='text' name='videofile2' id='videofile2' style="display:none;"> 
            <img src='../resources/images/video.png' border='0' onclick='document.all.videofile.click(); document.all.videofile2.value=document.all.videofile.value'> 

            
            
               <!-- <input class="input100" multiple = "multiple" type="file" name="upload" id="file" value="파일선택" size="30">
               <span class="focus-input100"></span> -->
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
      <script src = "../resources/writef/js/kakaomap.js"></script>
      
      <script src="../resources/writef/js/main.js"></script>





    <script type="text/javascript">


    $(document).ready(function() {
      $('#sub').on('click', submit1);
      $('#bt3').on('click',submit4);
      $('#bt7').on('click',submit7);})

   function submit1() {
   
       var form = $('#changef')[0];
        var formData = new FormData(form);

      $.ajax({
         url : 'changef',
         type : 'POST',
         data : formData,
           contentType : false,
           processData : false, 
         success : function(a) {if(a=="ok"){alert("수정성공");location.href="profile?profileImg=${sessionScope.customer.profileImg }";}
            else{alert("개씨발");}},
         error : function(a) {alert("걍 에러");},
         async : false
      });}

    function submit4() {
       var pw = $('#password').val();  var p1 = $('#password1').val();  var nick = $('#nick').val();
       if (pw != p1) {alert('비밀번호가 일치하지 않아요');return;}
       if (nick.length < 2) {alert('닉네임을 다시 입력해주세요');return;}
       $.ajax({
          url : 'editP',
          type : 'POST',
          data : {nick : nick,pw : pw},
          success : function(a) {if(a=="ok"){alert("수정성공");location.reload();}
            else{alert("개씨발");}},
          error : function(a) {alert("걍 에러");}});}

    function submit7(){

       var pw = $('#password').val(); var p1 = $('#password1').val();
       if (pw.length <1 || p1.length<1 || pw != p1) {alert('비밀번호 제대로 입력해주세요.');return;}

       $.ajax({
          url:'deru',
          type:'POST',
          data:{pw:pw},
          dataType:'text',
          success : function(e){
             if(e=="ok"){
                alert("탈퇴성공");location.href="/kiito";}else{alert("다시입력해주세요");};},
          error : function(n){alert("걍오류")}})}

    </script>


<!-- 프로필 사진 바꾸기 -->
                 <script src="../resources/nick/js/classie.js"></script>
      <script>
         (function() {
            // trim polyfill : https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/Trim
            if (!String.prototype.trim) {
               (function() {
                  // Make sure we trim BOM and NBSP
                  var rtrim = /^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g;
                  String.prototype.trim = function() {
                     return this.replace(rtrim, '');
                  };
               })();
            }

            [].slice.call( document.querySelectorAll( 'input.input__field' ) ).forEach( function( inputEl ) {
               // in case the input is already filled..
               if( inputEl.value.trim() !== '' ) {
                  classie.add( inputEl.parentNode, 'input--filled' );
               }

               // events:
               inputEl.addEventListener( 'focus', onInputFocus );
               inputEl.addEventListener( 'blur', onInputBlur );
            } );

            function onInputFocus( ev ) {
               classie.add( ev.target.parentNode, 'input--filled' );
            }

            function onInputBlur( ev ) {
               if( ev.target.value.trim() === '' ) {
                  classie.remove( ev.target.parentNode, 'input--filled' );
               }
            }
         })();
      </script>

   <div id="preview" class="modal">
<br><br><br><br>
      <form id = "changef" style="text-align: -webkit-center;">
      <span style="font-size: 70px; font-family: fantasy; font-style: italic; color: antiquewhite;">Profile img</span>
        <br />
        <div style="background-color: #daf6ffa6; width: 400px; min-height: 47vh; border-radius: 30px;">
        <br>
<img style = "border:1px solid #642EFE; width : 150px; height : 150px;" src="../img/${sessionScope.customer.profileImg }" class="img-responsive img-circle" id="base">
<br>
               <input type = "file" id = "image" name = "upload"  multiple accept="image/gif, image/jpeg, image/png" style="display:none" />
               <input type='text' name='upload2' id='image2' style="display:none;"> 
            <img src='../resources/images/picture.png' border='0' onclick='document.all.upload.click(); document.all.upload2.value=document.all.upload.value'> 
            <br><br>
                     <div style="display: -webkit-inline-box;">
               <button type = "button" id = "sub"class="contact100-form-btn">
                  <span>
                     <i class="fa fa-paper-plane-o m-r-6" aria-hidden="true"></i>
                     submit
                  </span>
               </button>
               　　<div class="modal-meta-top">
               <button type = "button" id = "closeWrite" data-dismiss="modal" class="contact100-form-btn">
                  <span>
                     <i class="fa fa-paper-plane-o m-r-6" aria-hidden="true"></i>
                     close
                  </span>
               </button>
               </div>
            </div>
</div>
 
       </form>
   
  </div>
</div>
</div>
      </div>
      
      <script src="lib/jquery/2.2.3/jquery.min.js"></script>


    <script type="text/javascript">
    var base = $("#base");

    /** 
    onchange event handler for the file input field.
    It emplements very basic validation using the file extension.
    If the filename passes validation it will show the image using it's blob URL  
    and will hide the input field and show a delete button to allow the user to remove the image
    */

    $('#image').on('change', function() {
        
        ext = $(this).val().split('.').pop().toLowerCase(); //확장자
        
        //배열에 추출한 확장자가 존재하는지 체크
        if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
            resetFormElement($(this)); //폼 초기화
            window.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
        } else {
            file = $('#image').prop("files")[0];
            blobURL = window.URL.createObjectURL(file);
            $("#base").attr('src',blobURL);
            $("#ssss").css('display','block');
            //$('#image_preview img').attr('src', blobURL);
            //$('#base').slideDown(); //업로드한 이미지 미리보기 
            $(this).slideUp(); //파일 양식 감춤

           //base.hide();
        }
    });

    /**
    onclick event handler for the delete button.
    It removes the image, clears and unhides the file input field.
    */
    $('#ssss a').bind('click', function() {
       
        resetFormElement($('#image')); //전달한 양식 초기화
        $('#image').slideDown(); //파일 양식 보여줌
        $(this).parent().slideUp(); //미리 보기 영역 감춤
        return false; //기본 이벤트 막음
       
    });
        

    /** 
    * 폼요소 초기화 
    * Reset form element
    * 
    * @param e jQuery object
    */
    function resetFormElement(e) {
        e.wrap('<form>').closest('form').get(0).reset(); 
        //리셋하려는 폼양식 요소를 폼(<form>) 으로 감싸고 (wrap()) , 
        //요소를 감싸고 있는 가장 가까운 폼( closest('form')) 에서 Dom요소를 반환받고 ( get(0) ),
        //DOM에서 제공하는 초기화 메서드 reset()을 호출
        e.unwrap(); //감싼 <form> 태그를 제거

     
    }
    </script>
    
    
    
    
 <!--    개인정보수정 -->
    <div id="editp" class="modal">
<<<<<<< HEAD
	<form id="editForm" style="text-align: -webkit-center;">
	<span style="font-size: 70px; font-family: fantasy; font-style: italic; color: antiquewhite;">Info.</span><br>
	<div style="background-color: #daf6ffa6; width: 400px; min-height: 45vh; border-radius: 30px;">
	<section class="content bgcolor-1" style="border-radius: 30px;">
	<img style = "border:1px solid #642EFE; width : 150px; height : 150px;" src="../img/${sessionScope.customer.profileImg }" class="img-responsive img-circle" id="base">
	<a>${sessionScope.customer.nick }</a><br>

			<span class="input input--haruki">
					<input class="input__field input__field--haruki" type="text"  id="nick" />
					<label class="input__label input__label--haruki" for="input-1">
						<span class="input__label-content input__label-content--haruki">NickName</span>
					</label>
				</span>
				<button id="bt3" value="수정" ><img src="../resources/images/check.png"></button>
				
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
				<button id="bt7" value="탈퇴" >delete<img src="../resources/images/check.png"></button>
				<br>
=======
   <form id="editForm" style="text-align: -webkit-center;">
   <span style="font-size: 70px; font-family: fantasy; font-style: italic; color: antiquewhite;">Info.</span><br>
   <div style="background-color: #daf6ffa6; width: 400px; min-height: 45vh; border-radius: 30px;">
   <section class="content bgcolor-1" style="border-radius: 30px;">
   <img style = "border:1px solid #642EFE; width : 150px; height : 150px;" src="../img/${sessionScope.customer.profileImg }" class="img-responsive img-circle" id="base">
   <a>${sessionScope.customer.nick }</a><br>

         <span class="input input--haruki">
               <input class="input__field input__field--haruki" type="text"  id="nick" />
               <label class="input__label input__label--haruki" for="input-1">
                  <span class="input__label-content input__label-content--haruki">NickName</span>
               </label>
            </span>
            <button id="bt3" value="수정" ><img src="../resources/images/check.png"></button>
            
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
            <button id="bt7" value="탈퇴" >delete<img src="../resources/images/check.png"></button>
            <br>
>>>>>>> 70b00b34a1b798132aa16fa6b7060d44961620c3
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