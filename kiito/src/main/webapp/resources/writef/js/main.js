function checki() {}	

$(document).ready(function() {	
	
	$("#tag").on("click", function() {
		  $("#tagdiv").toggle();
		});
		

/*	$("#tag").click(function() { 
	
		
		$('#tagdiv').append('<input type="text" class="tag" placeholder="tag입력"><span class="sc">X</span>')
		$("#tag").click(function() { $('.tag').val('');$(".tag").hide();})
	
	
	});*/
	
	
	$("#tag1").keydown(function(e){if(e.keyCode == 13){
		$('#tagdiv').append('<input type="text" name="tag1" id="tag1" class="input100" placeholder="tag입력"><span id="sc1">X</span>')
		$('#tag1').prop('readonly', true);$("#tag2").show(); $("#tag2").focus();$("#sc2").show();
		event.preventDefault();}});
	
	$("#tag2").keydown(function(e){if(e.keyCode == 13){
		$('#tag2').prop('readonly', true);$("#tag3").show(); $("#tag3").focus();$("#sc3").show();
		event.preventDefault();}});
	
	$("#tag3").keydown(function(e){if(e.keyCode == 13){
		$('#tag3').prop('readonly', true);$("#tag4").show(); $("#tag4").focus();$("#sc4").show();
		event.preventDefault();}});
	
	$("#tag4").keydown(function(e){if(e.keyCode == 13){
		$('#tag4').prop('readonly', true);$("#tag5").show(); $("#tag5").focus();$("#sc5").show();
		event.preventDefault();}});
	
	$("#tag5").keydown(function(e){if(e.keyCode == 13){
		$('#tag5').prop('readonly', true);$("#tag6").show(); $("#tag6").focus();$("#sc6").show();
		event.preventDefault();}});
	
	$("#tag6").keydown(function(e){if(e.keyCode == 13){
		$('#tag5').prop('readonly', true);$("#tag7").show(); $("#tag7").focus();$("#sc7").show();
		event.preventDefault();}});
	
	$("#tag7").keydown(function(e){if(e.keyCode == 13){
		$('#tag7').prop('readonly', true);}});
})


var $ipt1 = $('#tag1'),
$clearIpt1 = $('#sc1');
$ipt1.keyup(function(){$("#sc1").toggle(Boolean($(this).val()));});
$clearIpt1.toggle(Boolean($ipt1.val()));
$clearIpt1.click(function(){$("#tag1").val('').focus();$(this).hide();$("#tag1").hide();$('#tag1').prop('readonly',false);});


var $ipt2 = $('#tag2'),
$clearIpt2 = $('#sc2');
$ipt2.keyup(function(){$("#sc2").toggle(Boolean($(this).val()));});
$clearIpt2.toggle(Boolean($ipt2.val()));
$clearIpt2.click(function(){$("#tag2").val('').focus();$(this).hide();$("#tag2").hide();$('#tag2').prop('readonly',false);});

var $ipt3 = $('#tag3'),
$clearIpt3 = $('#sc3');
$ipt3.keyup(function(){$("#sc3").toggle(Boolean($(this).val()));});
$clearIpt3.toggle(Boolean($ipt3.val()));
$clearIpt3.click(function(){$("#tag3").val('').focus();$(this).hide();$("#tag3").hide();$('#tag3').prop('readonly',false);});

var $ipt4 = $('#tag4'),
$clearIpt4 = $('#sc4');
$ipt4.keyup(function(){$("#sc4").toggle(Boolean($(this).val()));});
$clearIpt4.toggle(Boolean($ipt4.val()));
$clearIpt4.click(function(){$("#tag4").val('').focus();$(this).hide();$("#tag4").hide();$('#tag4').prop('readonly',false);});

var $ipt5 = $('#tag5'),
$clearIpt5 = $('#sc5');
$ipt5.keyup(function(){$("#sc5").toggle(Boolean($(this).val()));});
$clearIpt5.toggle(Boolean($ipt5.val()));
$clearIpt5.click(function(){$("#tag5").val('').focus();$(this).hide();$("#tag5").hide();$('#tag5').prop('readonly',false);});

var $ipt6 = $('#tag6'),
$clearIpt6 = $('#sc6');
$ipt2.keyup(function(){$("#sc6").toggle(Boolean($(this).val()));});
$clearIpt6.toggle(Boolean($ipt6.val()));
$clearIpt6.click(function(){$("#tag6").val('').focus();$(this).hide();$("#tag6").hide();$('#tag6').prop('readonly',false);});

var $ipt7 = $('#tag7'),
$clearIpt7 = $('#sc7');
$ipt7.keyup(function(){$("#sc7").toggle(Boolean($(this).val()));});
$clearIpt7.toggle(Boolean($ipt7.val()));
$clearIpt7.click(function(){$("#tag7").val('').focus();$(this).hide();$("#tag7").hide();$('#tag7').prop('readonly',false);});
	
								 
								 
								 



function write() {
	
		
}

$('#writeBt').on('click', function(){
	
	$('.container-contact100').css('display','flex');
	
	//스크롤방지
	$('.container-contact100').on('scroll touchmove mousewheel', function(event) {
		  event.preventDefault();
		  event.stopPropagation();
		  return false;
	});
	//$('body').css('overflow','hidden');
	
	//Check in
	var container = document.getElementById('map');
	var options = {
		center: new kakao.maps.LatLng(33.450701, 126.570667),
		level: 3
	};
	
	var map = new kakao.maps.Map(container, options);

	container.style.width = '300px';
	container.style.height = '240px';

	map.relayout();
});


$('#closeWrite').on('click', function(){
	$('.container-contact100').toggle();
});

$('#checkin').on('click',function(){
	$('#map').fadeToggle();
})



(function ($) {
    "use strict";
    
    
    /*==================================================================
    [ Validate ]*/
    var input = $('.validate-input .input100');

    $('.validate-form').on('submit',function(){
        var check = true;

        for(var i=0; i<input.length; i++) {
            if(validate(input[i]) == false){
                showValidate(input[i]);
                check=false;
            }
        }

        return check;
    });


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