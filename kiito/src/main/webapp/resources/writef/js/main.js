function checki() {}	

$(document).ready(function() {	
	

/* // 서버에 넘기기
    $("#writeForm").on("submit", function (e) {
        var value = marginTag(); // return array
        $("#rdTag").val(value); 

        $(this).submit();
    });*/

    $("#tag").on("keypress", function (e) {
        var self = $(this);

        // input 에 focus 되있을 때 엔터 및 스페이스바 입력시 구동
        if (e.key === "Enter" || e.keyCode == 32) {

            var tagValue = self.val(); // 값 가져오기

            // 값이 없으면 동작 ㄴㄴ
            if (tagValue !== "") {

                // 같은 태그가 있는지 검사한다. 있다면 해당값이 array 로 return 된다.
                var result = Object.values(tag).filter(function (word) {
                    return word === tagValue;
                })
            
                // 태그 중복 검사
                if (result.length == 0) { 
                    $("#tag-list").append("<li class='tag-item'>"+tagValue+"<span class='del-btn' idx='"+counter+"'>x</span></li>");
                    addTag(tagValue);
                    self.val("");
                } else {
                    alert("태그값이 중복됩니다.");
                }
            }
            e.preventDefault(); // SpaceBar 시 빈공간이 생기지 않도록 방지
        }
    });

    // 삭제 버튼 
    // 삭제 버튼은 비동기적 생성이므로 document 최초 생성시가 아닌 검색을 통해 이벤트를 구현시킨다.
    $(document).on("click", ".del-btn", function (e) {
        var index = $(this).attr("idx");
        tag[index] = "";
        $(this).parent().remove();
    });

})




$('#closeWrite').on('click', function(){
	$('#checkin').val('');
	$('#contents').val('');
	$("#file").val('');
	$('#placesList').html('');
	$('#pagination').html('');
	$('.container-contact100').toggle();
	$('body').css('overflow','scroll');
});

var tag = {};
var counter = 0;

// 태그를 추가한다.
function addTag (value) {
    tag[counter] = value; // 태그를 Object 안에 추가
    counter++; // counter 증가 삭제를 위한 del-btn 의 고유 id 가 된다.
}

// 최종적으로 서버에 넘길때 tag 안에 있는 값을 array type 으로 만들어서 넘긴다.
function marginTag () {
    return Object.values(tag).filter(function (word) {
        return word !== "";
    });
}

$('#submitFeed').on('click', function(){
	
	var value = marginTag(); // return array 태그 넘기기
    $("#rdTag").val(value); 
    var arr = $("#rdTag").val();
    console.log(typeof(arr));
    
	$('#writeForm').submit();
	
	
	
	
   // alert(arr);
    
    
    /*$.ajax({
    	url : "feed/hashtag",
    	type : "POST",
    	data : {
    		arr : arr
    	},
    	success : function(result){
    		if(result=="aa")
			alert("등록되었습니다.");
		}
    })*/
    
    /*$.post("feed/hashtag",function(arr){
    	console.log(arr);
    })*/
    
    
    //$("#rdTag").submit();
	
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