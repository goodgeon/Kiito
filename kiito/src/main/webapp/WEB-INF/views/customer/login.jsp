<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<head>
	<title>Login KIITO</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="resources/login/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/login/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/login/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/login/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="resources/login/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/login/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/login/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="resources/login/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/login/css/util.css">
	<link rel="stylesheet" type="text/css" href="resources/login/css/main.css">
<!--===============================================================================================-->
<link href="https://fonts.googleapis.com/css?family=Sawarabi+Mincho" rel="stylesheet">
<link href="https://fonts.googleapis.com/earlyaccess/hannari.css" rel="stylesheet">
    <style>
      .title1 {
        display: none;
      }
       .title2 {
        display: none;
      }
    </style>
        <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

function join() {location.href = 'customer/agree';}	

$( document ).ready( function() {
    $( '.title1' ).fadeIn( 2000 );
  } );
$( document ).ready( function() {
    $( '.title2' ).fadeIn( 4000 );
  } );

</script>


</head>
<body>
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100"  style="background-image: url('resources/login/images/bgimg4.png');">
						<div class="title1"><span>君　が 　い　る　と　こ　ろ</span></div>
			<div class="title2"><span>キイト</span></div>
			<div>
				<form class="login100-form validate-form" action = "customer/login" method = "POST">
					<span class="login100-form-title p-b-43">
						Login to continue
					</span>
					
					
					<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
						<input id = "email" class="input100" type="text" name="email">
						<span class="focus-input100"></span>
						<span class="label-input100">Email</span>
					</div>
					
					
					<div class="wrap-input100 validate-input" data-validate="Password is required">
						<input id = "pw" class="input100" type="password" name="pw">
						<span class="focus-input100"></span>
						<span class="label-input100">Password</span>
					</div>

					<div class="flex-sb-m w-full p-t-3 p-b-32">
						<div class="contact100-form-checkbox">
							<input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me">
							<label class="label-checkbox100" for="ckb1">
								Remember me
							</label>
						</div>

						<div>
							<a href="#" class="txt1">
								Forgot Password
							</a>
						</div>
					</div>
			

					<div class="container-login100-form-btn">
						<button type = "button" id = "loginBt" class="login100-form-btn">
							Login
						</button>
					</div>
					
					<br>
					
					<div class="container-login100-form-btn">
						<button type = "button" class="login100-form-btn" onclick="join()">
							Join
						</button>
					</div>
					
					<div class="text-center p-t-46 p-b-20">
						<span class="txt2">
							or sign up using
						</span>
					</div>

					<div class="login100-form-social flex-c-m">
						<a href="${facebook_url}" class="login100-form-social-item flex-c-m bg1 m-r-5">
							<i class="fa fa-facebook-f" aria-hidden="true"></i>
						</a>

						<a href="${google_url}" class="login100-form-social-item flex-c-m bg2 m-r-5">
							<i class="fa fa-google" aria-hidden="true"></i>
						</a>
					</div>
				</form>
				</div>

				
			</div>
		</div>
	</div>
	
	
</body>
	
	
<!--===============================================================================================-->
	<script src="resources/login/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="resources/login/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="resources/login/vendor/bootstrap/js/popper.js"></script>
	<script src="resources/login/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="resources/login/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="resources/login/vendor/daterangepicker/moment.min.js"></script>
	<script src="resources/login/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="resources/login/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="resources/login/js/main.js"></script>

</html>	