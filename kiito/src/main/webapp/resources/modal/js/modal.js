$(document).ready(function(){
	/*$("#commentSubmit").on('click', function(feed_seq, customer_seq){
		console.log(feed_seq);
		
	})*/
	
	
})


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
			console.log(list);
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


