function checki() {
	

}	
function tagg() {location.href = 'customer/agree';}	

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