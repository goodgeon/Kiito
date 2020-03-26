
(function ($) {
    "use strict";
    
    
     
     


    /*==================================================================
    [ Focus Contact2 ]*/
    $('.input100').each(function(){
        $(this).on('blur', function(){
            if($(this).val().trim() != "") {
                $(this).addClass('has-val');
            }
            else {
                $(this).removeClass('has-val');
            }
        })    
    })
  
  
    /*==================================================================
    [ Validate ]*/
    var input = $('.validate-input .input100');

    $('#loginBt').on('click',function(){
        var check = true;
        var email = $('#email').val();
        var pw = $('#pw').val();

        for(var i=0; i<input.length; i++) {
            if(validate(input[i]) == false){
                showValidate(input[i]);
                check=false;
            }
        }
        
        if(check == true){
        	$.ajax({
        		url : "customer/login",
        		type : "post",
        		data : {
        			'email' : email,
        			'pw' : pw
        		},
        		success : function(result){
        			if(result == "success"){
        				location.href = "home";
        			}else if(result == "fail"){
        				alert("ID 또는 비밀번호가 틀립니다. 다시 입력해주세요");
        			}
        		}
        	});
        }

        return check;
    });
    
    $("#tag").on("keypress", function (e) {
    	
    	
    })


    $('.validate-form .input100').each(function(){
        $(this).focus(function(){
           hideValidate(this);
        });
    });

    function validate (input) {
        if($(input).attr('type') == 'email' || $(input).attr('name') == 'email') {
            if($(input).val().trim().match(/^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{1,5}|[0-9]{1,3})(\]?)$/) == null) {
                return false;
            }
        }
        else {
            if($(input).val().trim() == ''){
                return false;
            }
        }
    }

    function showValidate(input) {
        var thisAlert = $(input).parent();

        $(thisAlert).addClass('alert-validate');
    }

    function hideValidate(input) {
        var thisAlert = $(input).parent();

        $(thisAlert).removeClass('alert-validate');
    }
    

})(jQuery);