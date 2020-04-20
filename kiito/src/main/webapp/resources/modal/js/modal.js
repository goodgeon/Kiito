$(document).ready(function(){
	/*$("#commentSubmit").on('click', function(feed_seq, customer_seq){
		console.log(feed_seq);
		
	})*/
	
	
})
function showInputNumber(feed_seq){
	$("#smsInput"+feed_seq).toggle();
}

function sendSms(feed_seq){
	var phoneNumber = $("#smsPhoneNumber"+feed_seq).val();
	var checkin = $("#modalCheckin"+feed_seq).html();
	var congestion = $("#modalCongestion"+feed_seq).html();
	var contents = $("#modalContents"+feed_seq).html();
	
	console.log(phoneNumber);
	console.log(checkin);
	console.log(congestion);
	console.log(contents);

	$.ajax({
		type : "POST",
		url : "feed/sendSms",
		data : {
			phoneNumber : phoneNumber,
			checkin : checkin,
			congestion : congestion,
			contents : contents
		},
		success : function(){
			alert("문자전송번호 : " + phoneNumber);
		}
	})
}


function submitComment(feed_seq, customer_seq){
		var text = $("#inputComment"+feed_seq).val();
		console.log(text);
		$.ajax({
			type : "POST",
			url : "comment/insertComment",
			data : {
				feed_seq : feed_seq,
				customer_seq : customer_seq,
				text : text
			},
			success : function(){
				$("#inputComment"+feed_seq).val('');
				getCommentList(feed_seq);
			}
		})
}

function getCommentList(feed_seq){
	var commentList = [];
	$.ajax({
		type : "GET",
		url : "comment/getCommentList",
		data : {
			feed_seq : feed_seq
		},
		success : function(list){
			var html = '';
			
			$.each(list, function(key,item){
				html += '<li>';
				html += '<div class = "comment-img">';
				html += '<img src = "'+item.customer.profileImg + '" class = "img-responsive img-circle" alt="Image"/>';
				html += '</div>';
				html += '<div class = "comment-text">';
				html += '<strong><a href="">' + item.customer.nick + '</a></strong>';
				html += '<p>' + item.text + '</p> <span class="date sub-text">' + item.inputdate + '</span>';
				html += '</div></li>';
			})
			
			$("#commentListUl"+feed_seq).html(html);
			$("#commentsCount"+feed_seq).html(list.length);
			$("#modalCommentsCount"+feed_seq).html(list.length);
		}
	})
}


