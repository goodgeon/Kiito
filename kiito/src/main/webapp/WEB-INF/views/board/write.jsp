<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
	<title>Create Board V10</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
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
<!--===============================================================================================-->
<script src="resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript">

function checki() {location.href = 'customer/agree';}	

$(document).ready(function() {	

	$("#tag1").hide();$("#tag2").hide();$("#tag3").hide();$("#tag4").hide();$("#tag5").hide();$("#tag6").hide();$("#tag7").hide();

	$("#tag").click(function() { 
		$("#tag1").show();
		$("#tag").click(function() {
			$("#tag2").show();
			 $("#tag").click(function() {
				 $("#tag3").show();
				 $("#tag").click(function() {
					 $("#tag4").show(); 
					 $("#tag").click(function() {
						 $("#tag5").show(); 
						 $("#tag").click(function() {
							 $("#tag6").show();
							 $("#tag").click(function() {
								 $("#tag7").show();
								 })
							 })
						 })
					 })
				 })


				 })
		
	
});})


</script>


</head>
<body>


	<div class="container-contact100">

		<div class="wrap-contact100">
			<form class="contact100-form validate-form">
				<span class="contact100-form-title">
					글쓰기 
				</span>
				
				<div class="wrap-input100 validate-input" data-validate = "Please enter your message">
					<textarea class="input100" name="message" placeholder="Your Message"></textarea>
					<span class="focus-input100"></span>
				</div>
				

				<div class="wrap-input100 validate-input" data-validate = "이거 왜뜨지 씨발">
				<br>
					<input class="input100" type="file" name="upload" id="file" value="파일선택" size="30">
					<span class="focus-input100"></span>
				</div>
				
				<div class="wrap-input100 validate-input" data-validate = "이거 왜뜨지 씨발">
					<input class="input100" type="button" name="checkin" id="checkin" value="checkin" onclick="checki()">
					<!-- 같은 이름 ㄴㄴ -->
					<span class="focus-input100"></span>
				</div>
				
					

				<div class="wrap-input100 validate-input" data-validate="이거 왜뜨지 씨발">
					<input class="input100" type="button" name="tag" id="tag" value="tag">
					<span class="focus-input100"></span>
				</div>
				
				<input type="text" name="tag1" id="tag1" class="input100" placeholder="tag입력">
				<input type="text" name="tag2" id="tag2" class="input100" placeholder="tag입력">
				<input type="text" name="tag3" id="tag3" class="input100" placeholder="tag입력">
				<input type="text" name="tag4" id="tag4" class="input100" placeholder="tag입력">
				<input type="text" name="tag5" id="tag5" class="input100" placeholder="tag입력">
				<input type="text" name="tag6" id="tag6" class="input100" placeholder="tag입력">
				<input type="text" name="tag7" id="tag7" class="input100" placeholder="tag입력">
				
				
				

				<div class="container-contact100-form-btn">
					<button class="contact100-form-btn">
						<span>
							<i class="fa fa-paper-plane-o m-r-6" aria-hidden="true"></i>
							게시
						</span>
					</button>
				</div>
			</form>
		</div>
	</div>



	<div id="dropDownSelect1"></div>

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

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-23581568-13');
</script>

</body>
</html>
