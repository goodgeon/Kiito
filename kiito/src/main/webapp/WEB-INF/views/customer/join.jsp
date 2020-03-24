<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>

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

<title>Insert title here</title>

<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="../resources/login/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../resources/login/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../resources/login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../resources/login/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../resources/login/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="../resources/login/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../resources/login/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../resources/login/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="../resources/login/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../resources/login/css/util.css">
	<link rel="stylesheet" type="text/css" href="../resources/login/css/main.css">
<!--===============================================================================================-->



<script src="../resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript">


$(document).ready(function() {		
		$("#euse").hide();$("#gologin").hide();
		$("#submit").attr("disabled", "disabled");
		$("#div8").hide();
		$("#div9").hide();
		$("#div6").hide();
		$("#in").hide();
		$("#div11").hide();$("#div12").hide();$("#div13").hide();$("#div14").hide();
		$("#div0").hide();
		$("#esubmit").hide();
		$("#div1").hide();
		$("#div2").hide();
		$("#div3").hide();
		$("#div4").hide();
		$("input").keyup(function() {//비밀번호 유효성
			var password = $("#password").val();
			var password1 = $("#password1").val();
			if (password != "" || password1 != "") {
				if (password == password1) {
				
					$("#div1").show();
					$("#div2").hide();
					$("#submit").removeAttr("disabled");
					presult="ok";

				} else {
					presult="no";
					$("#div1").hide();
					$("#div2").show();
					$("#submit").attr("disabled", "disabled");}}});

		$("#email").keyup(function() { //이메일 유효성
			var email = $("#email").val();
			$("#div11").hide();$("#div12").hide();$("#div13").hide();
			if(chkValEmail(email)){$("#errMsg_02").hide();$("#submit").removeAttr("disabled");
			

			$.ajax({
				url : 'findE',
				type : 'POST',
				data : {
					email : email
				},
				dataType:'text',
				success : function(b) {
					if(b=="nai"){		
						$("#in").hide();
						$("#div3").show();
						$("#div4").hide();
						$("#esubmit").show();
						$("#submit").attr("disabled", "disabled");$("#div0").hide();
						
						
					}
					else{
						$("#div3").hide();
						$("#div4").show();
						$("#esubmit").hide();
						$("#in").hide();
						$("#submit").attr("disabled", "disabled");$("#div0").hide();
					
				

				}
				},
				error : function(o) {
					$("#div6").show();
					$("#div4").hide();
					$("#esubmit").show();
					
				}
			});
	
			}
			else{$("#errMsg_02").show();$("#errMsg_02").text("이메일 형식이 올바르지 않습니다");
			event.preventDefault();	$("#submit").attr("disabled", "disabled");
			$("#in").hide();
			$("#esubmit").hide();
			$("#div3").hide();$("#div0").hide();
			$("#div4").hide();}});

		var dicetest;
		var email;
		var presult;

		
		$("#esubmit").click(function() { //이메일 인증 받기 버튼 누르면
			
			email = $("#email").val();

			$.ajax({
				url : 'auth.do',
				type : 'POST',
				data : {
					e_mail : email
				},
				dataType:'text',
				success : function(b) {
					$("#in").show();
					$("#eeii").show();
					$('#email_injeung').val('');
					$("#div8").hide();
					$("#div9").hide();
					$("#euse").hide();
					$("#div0").show();
					
				
					dicetest = b;
					
				},
				error : function(o) {
					alert("실패");
					$("#in").hide();$("#reesubmit").hide();
				}
			});});

			
		var result;
		
		
	$("#eeii").click(function() { //이메일 인증 번호 누르면
			
			var email_injeung = $("#email_injeung").val();

			$.ajax({
				url : 'join_injeung.do',
				type : 'POST',
				data : {
					email_injeung : email_injeung,
					dice : dicetest
				},
				dataType:'text',
				success : function(b) {

					if(b=="good"){$("#div8").show();$("#div9").hide();$("#eeii").hide();$("#euse").show();$("#div0").hide();}
					else{$("#div9").show();$("#div8").hide();$('#email_injeung').val('');$("#euse").hide();$("#div0").hide();}
				},
				error : function(o) {result = "bad";$("#div9").show();$("#div8").hide();$('#email_injeung').val('');}
			});});


	$("#euse").click(function() { //사용하기 누르면
		$('#email').prop('readonly', true);result = "ok";
		$("#div8").hide();$("#div3").hide();$("#esubmit").hide();$("#eeii").hide();$("#email_injeung").hide();$("#euse").hide();
		
	});

	$("#gologin").click(function() { //회원 가입 완료 후 로그인 화면으로 이동
		location.href = '/kiito/';});

	
	$("#submit").click(function() { //가입 버튼

		if(result != "ok"){$("#div11").show();return;}
		if(presult != "ok"){$("#div12").show();return;}
		if(nresult != "ok"){$("#div13").show();return;}

		var email = $('#email').val();var password = $('#password').val();var name = $('#name').val();
		
		$.ajax({
			url : 'insertC',
			type : 'POST',
			data : {
				email : email,
				pw : password,
				name : name,
			},
			dataType:'text',
			success : function(b) {
				$("#div14").show();$("#div00").hide();$("#submit").hide();$("#gologin").show()
			},
			error : function(o) {}
		});});


	var nresult;

	
		$("#name").keyup(function() { //이름 유효성
			var name = $("#name").val();
			$("#div11").hide();$("#div12").hide();$("#div13").hide();
			if(chkValName(name)){$("#errMsg_01").hide();$("#submit").removeAttr("disabled");nresult="ok";}
			else{$("#errMsg_01").show();$("#errMsg_01").text("이름는 오직 한글만 입력가능");nresult="no";
			event.preventDefault();	$("#submit").attr("disabled", "disabled");}});});


	var chkValName = function(name){var patt = new RegExp(/^[가-힣]+$/);return patt.test(name);}		//이름 유효성
	var chkValEmail = function(email){var patt = new RegExp(/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/);
	return patt.test(email);} //이멜 유효성


	function main() {location.href = '/kiito/';}
	

</script>

</head>
<body style="background-color: #f7f7f7;">
<body>



	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100"  style="background-image: url('../resources/login/images/bgimg4.png');">
			<form class="login100-form validate-form" >
			<span class="login100-form-title p-b-43">회원가입</span>
				<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
 				<input type="email" name="e_mail" id="email" class="input100"> 
 				<span class="focus-input100"></span>
				<span class="label-input100">Email</span>
 				</div>
				<span class="error" id="errMsg_02"></span>
				<div id="div3">사용가능한 이메일입니다.</div>
				<div id="div4">이미등록되어있슴</div>
				<div id="div6">씨발</div>
				<button type="submit" name="submit" id="esubmit">이메일 인증받기</button>
				<div id="div0">전송되었습니다.</div>
			<div id="in">      
			<br> 
                  <div><input type="number" name="email_injeung" id="email_injeung" 
                  class="wrap-input100 validate-input" placeholder="인증번호를 입력하셍"> </div>                                      
                        <button type="submit" name="submit" id="eeii">확인</button>
                        	<div id="div8">일치합니다.</div> <button type="submit" name="euse" id="euse">사용하기</button>
							<div id="div9">일치하지 않습니다.</div>
            
            </div>
			
			
		

				<br>
			<div class="wrap-input100 validate-input" data-validate="Password is required">
			<input type="password" name="password" id="password" class="input100">
				<span class="focus-input100"></span>
				<span class="label-input100">Password</span>
					</div>
				<div class="wrap-input100 validate-input" data-validate="Password is required">
				<input type="password" class="input100"
				name="password1" id="password1" > 
				<span class="focus-input100"></span>
				<span class="label-input100">Password</span>
				</div>

			<div id="div1">비밀번호가 일치합니다.</div>
			<div id="div2">비밀번호가 일치하지 않습니다.</div>

			<div class="wrap-input100 validate-input" data-validate="Name is required">
			<input type="text" name="name" id="name" class="input100">
							<span class="focus-input100"></span>
				<span class="label-input100">Name</span>
			</div>
			<span class="error" id="errMsg_01"></span>

			<br> <br>
			<br> 
			<div id="div11">이메일을 확인해주세요.</div>
			<div id="div12">비밀번호를을 확인해주세요.</div>
			<div id="div13">이름을 확인해주세요.</div>
			<div id="div14">가입 완료</div>
			<div class="container-login100-form-btn">
				<input type="submit" value="JOIN" id="submit" class="login100-form-btn">
				</div>
		
			<input type="submit" value="로그인하러가기" id="gologin"> 
			
			<div id="div00" class="text-center p-t-46 p-b-20">계정이 있으신 가요? <a href="#" class="txt1" id="aaa" 
				onclick="main()">로그인</a></div>
				</form>


		</div>
		</div></div>
	</body>		
<!--===============================================================================================-->
	<script src="../resources/login/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="../resources/login/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="../resources/login/vendor/bootstrap/js/popper.js"></script>
	<script src="../resources/login/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="../resources/login/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="../resources/login/vendor/daterangepicker/moment.min.js"></script>
	<script src="../resources/login/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="../resources/login/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="../resources/login/js/main.js"></script>

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