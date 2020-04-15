

///////////////////////////////////////////////////////////////////////사진업로드
var sel_files = [];
//var filesArrTemp = [];

$(document).ready(function(){
	$("#input_imgs").on("change", handleImgsFilesSelect);
});

function handleImgsFilesSelect(e){
	
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	/*for(var i=0; i<filesArr.length; i++){
		filesArrTemp.push(filesArr[i]);
	}*/
	
	
	filesArr.forEach(function(f) {
		if(!f.type.match("image.*")){
			alert("확장자는 이미지 확장자만 가능합니다");
			//filesArrTemp.pop(f);
			//e.target.files = null;
			//$("#input_imgs").val('');
			return false;
		}
		
		sel_files.push(f);
		console.log(sel_files);
		
		var reader = new FileReader();
		reader.onload = function(e){
			var img_html = "<img src = \"" + e.target.result + "\" style = 'width : 240px; height : 240px;' />";
			$(".imgs_wrap").append(img_html);
		}
		reader.readAsDataURL(f);
	})
}
////////////////////////////////////////////////////////////



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
    
    var checkin = $("#checkin").val();
    var contents = $("#contents").val();
    
    
    if(checkin == null || checkin == ""){
    	alert("장소를 입력해주세요");
    	$("#checkin").focus();
    	return;
    }
    
    if(contents == null || contents == ""){
    	alert("내용을 입력해주세요");
    	$("#contents").focus();
    	return;
    }
    
	$('#writeForm').submit();
	
	/*var formData = new FormData();
	 
	// 파일 데이터
	for(var i=0; i<filesArrTemp.length; i++) {
	   formData.append("files", filesArrTemp[i]);
	}
	
	
	

	$.ajax({
	    type : "POST",
	    url : "feed/uploadImgFile",
	    data : formData,
	    enctype: 'multipart/form-data',
	    processData: false,
	    contentType: false,
	    success : function(data) {
	        if(data.result){
	            //alert("Success");
	        }else{
	            //alert(data.result);
	        }
	        
	    },
	    err : function(err) {
	        alert(err.status);
	    }
	});*/

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