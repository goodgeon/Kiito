<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>

		<title>KIITO</title>
		
		

		<link href="resources/css/style.css" rel='stylesheet' type='text/css' />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="shortcut icon" type="image/x-icon" href="resources/images/fav-icon.png" />
		<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
		
		
		

		<!----webfonts---->
		<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
		<!----//webfonts---->
		<!-- Global CSS for the page and tiles -->
  		<link rel="stylesheet" href="resources/css/main.css">
  		<!-- //Global CSS for the page and tiles -->
		<!---start-click-drop-down-menu----->
		<script src="resources/js/jquery.min.js"></script>
        <!----start-dropdown--->
         <script type="text/javascript">
			var $ = jQuery.noConflict();
				$(function() {
					$('#activator').click(function(){
						$('#box').animate({'top':'0px'},500);
					});
					$('#boxclose').click(function(){
					$('#box').animate({'top':'-700px'},500);
					});
				});
				$(document).ready(function(){
				//Hide (Collapse) the toggle containers on load
				$(".toggle_container").hide(); 
				//Switch the "Open" and "Close" state per click then slide up/down (depending on open/close state)
				$(".trigger").click(function(){
					$(this).toggleClass("active").next().slideToggle("slow");
						return false; //Prevent the browser jump to the link anchor
				});
									
			});
				
			function good() {location.href = '/kiito/';};
				var fs;
				var str='';
			$(document).ready(function() {
				var cs= $("#cs").val();
							//씨발 왜 다 똑깥ㅇ누
				
				$('.good').on('click', function(){
					fs = $(this).parents('li').attr("data-feedId");
					var lik = $('li[data-feedId="'+fs+'"]').attr("data-likes");
				  $.ajax({
				    	url : "feed/likes",
				    	type : "POST",
				    	data : {
				    		feed_seq : fs,
				    		customer_seq : cs 
				    	},
				    	success : function(result){
				    		$('li[data-feedId="'+fs+'"] .likes').html(result);
					    	
				    		/* if(result=="up"){
				    			alert("조아영");
				    			
				    			lik++;
				    			//str += '씨발ㅈ';
				    		 
					    		$('#goods').html(lik);
					    		console.log(lik);
					    		console.log($('li[data-feedId="'+fs+'"] .likes').html(lik));
					    		}
							
				    		else{
				    			alert("조아여취소");
				    			lik--;
				    			str = '${likes}';
				    			//str = 'ㅡㅡ';
				    			$('#goods').html('');
					    		$('#goods').html(str);
					    		} */
					    		
						}
				    }) 
					
					
				});
					})
			
				
		</script>
		
		
        <!----//End-dropdown--->
		<!---//End-click-drop-down-menu----->
		
		<!-- write Form  -->
		<!--===============================================================================================-->
	<link rel="icon" type="image/png" href="resources/writef/images/icons/favicon.ico"/>
	<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="resources/writef/vendor/bootstrap/css/bootstrap.min.css">
	<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="resources/writef/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="resources/writef/vendor/animate/animate.css">
	<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="resources/writef/vendor/css-hamburgers/hamburgers.min.css">
	<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="resources/writef/vendor/animsition/css/animsition.min.css">
	<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="resources/writef/vendor/select2/select2.min.css">
	<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="resources/writef/vendor/daterangepicker/daterangepicker.css">
	<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="resources/writef/css/util.css">
		<link rel="stylesheet" type="text/css" href="resources/writef/css/main.css">
		<link rel="stylesheet" type="text/css" href="resources/writef/css/kakaomap.css">
	<!--===============================================================================================-->
	<script type="text/javascript">
	</script>
	
	</head>
	<body>
	
		<!---start-wrap---->
			<!---start-header---->
			<div class="header" >
				<div class="header-wrap">
				<div>
					<a href="/kiito/home"><img src="resources/images/logo.png" title="pinbal" /></a>
				</div>     	  
				<div class="top-searchbar">
					<form class = "search-form">
						<input type="text" /><input type="submit" value="" />
					</form>
					
				</div>
				<div class="userinfo">
					<div class="user">
						<ul>
							<li><img id = "writeBt" src="resources/images/upload.png" style = "cursor: pointer;"> </li>
							<li><a href="#">
							<c:if test="${sessionScope.customer.profileImg == null }">
								<img src="resources/login/images/profileImg_null2.png" style = "width : 43px; height : 43px;"/>
							</c:if>
							<c:if test="${sessionScope.customer.profileImg != null }">
								<img src="${sessionScope.customer.profileImg }" title="user-name" style = "width : 43px; height : 43px;"/>
							</c:if>
							
							
							<span>${sessionScope.customer.name }</span></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		
		<!---//End-header---->
		<!---start-content---->
		
		
		
		<div class="content">
			<div class="wrap">
			 <div id="main" role="main">
			      <ul id="tiles">
			        <!-- These are our grid blocks -->
			        <c:forEach var="s" items="${feed}">

			        <li  data-feedId="${s.feed_seq}" data-likes="${s.likes}">

			        	<img src="resources/images/img1.jpg" width="282" height="118">
			        	<div class="post-info">
			        		<div class="post-basic-info">
				        		<h3><a href="#">콘텐츠 : ${s.contents}</a></h3>
				        		<span><a href="#"><label> </label>${s.checkin}</a></span>
				        		

							
								<p>좋아요 : <span class = 'likes'>${s.likes}</span></p>
								<p>체크인 : ${s.checkin}</p>
									<p>번호 : ${s.feed_seq}</p>
								<p>혼잡도 : ${s.congestion} </p>
								<p>
								해시태그 : <c:forEach var = "hashtag" items="${hashtag}">
									<c:if test="${hashtag.feed_seq == s.feed_seq}">
										<span>#${hashtag.contents}</span>
									</c:if>
								</c:forEach> 
								</p>

		
							
			        		</div>
			        		<div class="post-info-rate-share">
			        			<div class="rateit">
			        				<span> </span>
			        			</div>
			        			<div class="post-share">		
			        				<span> </span>	
			        				<input type="button" class="good" value="조아요">		
			        				<div id="goods"></div>	
			        				
			        			</div>
			        			
			        			<div class="clear"> </div>
			        		</div>
			        	</div>
			        </li>
				</c:forEach>
			        <!-- End of grid blocks -->
			      </ul>
			    </div>
			</div>
		</div>
	
			
			
		
		<!-- write form -->
		<div class="container-contact100">
		<div class="wrap-contact100">
			<form class="contact100-form validate-form" id = "writeForm" action = "feed/insertFeed" method = "POST" enctype="multipart/form-data" >
			<input type = "hidden" name = "customer_seq" value = "${sessionScope.customer.customer_seq }" id="cs">
				<span class="contact100-form-title">私がいるとごろ</span>
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
				<img src='resources/images/picture.png' border='0' onclick='document.all.imagefile.click(); document.all.imagefile2.value=document.all.imagefile.value'> 
				<input type = "file" id = "input_video" name = "videofile" multiple accept="video/*" style="display:none" />
					<input type='text' name='videofile2' id='videofile2' style="display:none;"> 
				<img src='resources/images/video.png' border='0' onclick='document.all.videofile.click(); document.all.videofile2.value=document.all.videofile.value'> 

				
				
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
	
	
	
	<!-- kakao map -->
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cab38e188d1015fa32fe5df13ab040fa&libraries=services,clusterer,drawing"></script>
	
		<!---//End-content---->
		
		
		
		<!----wookmark-scripts---->
		  <script src="resources/js/jquery.imagesloaded.js"></script>
		  <script src="resources/js/jquery.wookmark.js"></script>
		  <script type="text/javascript">
		    (function ($){
		      var $tiles = $('#tiles'),
		          $handler = $('li', $tiles),
		          $main = $('#main'),
		          $window = $(window),
		          $document = $(document),
		          options = {
		            autoResize: true, // This will auto-update the layout when the browser window is resized.
		            container: $main, // Optional, used for some extra CSS styling
		            offset: 20, // Optional, the distance between grid items
		            itemWidth:280 // Optional, the width of a grid item
		          };
		      /**
		       * Reinitializes the wookmark handler after all images have loaded
		       */
		      function applyLayout() {
		        $tiles.imagesLoaded(function() {
		          // Destroy the old handler
		          if ($handler.wookmarkInstance) {
		            $handler.wookmarkInstance.clear();
		          }
		
		          // Create a new layout handler.
		          $handler = $('li', $tiles);
		          $handler.wookmark(options);
		        });
		      }
		      /**
		       * When scrolled all the way to the bottom, add more tiles
		       */
		      function onScroll() {
		        // Check if we're within 100 pixels of the bottom edge of the broser window.
		        var winHeight = window.innerHeight ? window.innerHeight : $window.height(), // iphone fix
		            closeToBottom = ($window.scrollTop() + winHeight > $document.height() - 100);
		
		        if (closeToBottom) {
		          // Get the first then items from the grid, clone them, and add them to the bottom of the grid
		          var $items = $('li', $tiles),
		              $firstTen = $items.slice(0, 10);
		          $tiles.append($firstTen.clone());
		
		          applyLayout();
		        }
		      };
		
		      // Call the layout function for the first time
		      applyLayout();
		
		      // Capture scroll event.
		      $window.bind('scroll.wookmark', onScroll);
		    })(jQuery);
		  </script>
		<!----//wookmark-scripts---->

		<!----start-footer--->
		<div class="footer">
			<p>Go to <a href="http://google.com/"> Google</a></p>
		</div>
		<!----//End-footer--->


		<!---//End-wrap---->
		
		<!-- writeForm -->
		<!--===============================================================================================-->
	<script src="resources/writef/vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
		<script src="resources/writef/vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
		<script src="resources/writef/vendor/bootstrap/js/popper.js"></script>
		<script src="resources/writef/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
		<script src="resources/writef/vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
		<script src="resources/writef/vendor/daterangepicker/moment.min.js"></script>
		<script src="resources/writef/vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
		<script src="resources/writef/vendor/countdowntime/countdowntime.js"></script>
	<!--===============================================================================================-->
		<script src="resources/writef/js/main.js"></script>
		<script src="resources/writef/js/kakaomap.js"></script>

	
	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
	<script>
	  window.dataLayer = window.dataLayer || [];
	  function gtag(){dataLayer.push(arguments);}
	  gtag('js', new Date());
	
	  gtag('config', 'UA-23581568-13');
	</script>
	
	<script>
		
		
		for ( var i = 0; i < $("#tiles").children().length; i++ ){
		    var feedId = $("#tiles").children().eq(i).attr("data-feedId");
		    
		    
		}
		
	</script>
	</body>
</html>