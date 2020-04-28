<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
  <head>

	    <!-- ==============================================
		Title and Meta Tags
		=============================================== -->
		<meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">  
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>KIITO - 君がいるところ</title>
		<meta name="description" content="" />
        <meta name="keywords" content="" />
        <meta property="og:title" content="" />
        <meta property="og:url" content="" />
        <meta property="og:description" content="" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
		
		<!-- ==============================================
		Favicons
		=============================================== --> 
		<link rel="icon" href="../resources/assets/img/logo.jpg">
		<link rel="apple-touch-icon" href="../resources/img/favicons/apple-touch-icon.png">
		<link rel="apple-touch-icon" sizes="72x72" href="../resources/img/favicons/apple-touch-icon-72x72.png">
		<link rel="apple-touch-icon" sizes="114x114" href="../resources/img/favicons/apple-touch-icon-114x114.png">
		
	    <!-- ==============================================
		CSS
		=============================================== -->
             <link type="text/css" href="../resources/assets/css/demos/photo.css" rel="stylesheet" />
       	<link rel="stylesheet" href="../resources/writef/css/main.css">
       	<link rel="stylesheet" type="text/css" href="../resources/writef/css/kakaomap.css">
       	<link href="https://fonts.googleapis.com/css?family=Sawarabi+Mincho" rel="stylesheet">
				
		<!-- ==============================================
		Feauture Detection
		=============================================== -->
		<script src="../resources/assets/js/modernizr-custom.js"></script>

	
		
		<!-- socket.io -->
        <script src="http://localhost:82/socket.io/socket.io.js"></script>
        <script>
        	var customer_seq = ${sessionScope.customer.customer_seq};
        	var dbChatList;
        	var receiver;
        	
        	function getChatList(){
        		var chatList=[];
        		
        		
        		chatList = test(chatList);
        		return chatList;
            }


            
            $(document).ready(function(){
            	var socket = io("http://localhost:82");
                var chatList = [];
            	var dbChatList = [];
            	
                
                $.get({
					url : "getChatList",
					data : {
						customer_seq : customer_seq
					},
					success : function(result){
	                    dbChatList = result;

	                },
	                async : false
                });
                
                chatList = getChatList();
                setChatList(chatList);
                
                

                $("#msg").on('keydown',function(key){
                    
                	text = $("#msg").val();    
                    var msg = {
						sender : customer_seq,
						text : text,
						receiver : receiver
                    };
                    var flag = true;
                    
                    if(key.keyCode == 13){
                        for(var i = 0; i<dbChatList.length; i++){
							if(dbChatList[i].customer1_seq == msg.receiver || dbChatList[i].customer2_seq == msg.receiver){
								flag = false;
							}
                        }

                        if(flag){
                            //새로운 채팅 생성
                        	/* $.post("insertChat", {customer1_seq : msg.sender, customer2_seq : msg.receiver}).done(function(){
								console.log("insert chat");
								getChatList();
							}); */
							/* $.post({
								url : "insertChat",
								data : {
									customer1_seq : msg.sender, 
									customer2_seq : msg.receiver
								},
								success : function(){
									console.log("insert chat");
									getChatList();
								},
								async : false
							}) */
							
                        };
                        
                    	//소켓에 send_msg라는 이벤트로 input에 #msg의 벨류를 담고 보내준다.
                        socket.emit("send_msg", msg);
                       	//#msg에 벨류값을 비워준다.
                       	$("#msg").val("");
                       	$(".conversation-container").scrollTop($(document).height());
                    }
                    
                });

                socket.on('send_msg', function(msg) {
                	var dbChatList = [];
                    
                    $.get({
    					url : "getChatList",
    					data : {
    						customer_seq : customer_seq
    					},
    					success : function(result){
    	                    dbChatList = result;

    	                },
    	                async : false
                    });
                    
                	var receiver;
    				$.get({
    					url : "getCustomer",
    					data : {
    						customer_seq : msg.receiver
    					},
    					success : function(data){
    						receiver = data;
    					},
    					async : false
    				});

    				var sender;
    				$.get({
    					url : "getCustomer",
    					data : {
    						customer_seq : msg.sender
    					},
    					success : function(data){
    						sender = data;
    					},
    					async : false
    				});
                    if(typeof msg.receiver == "undefined"){
                        alert("대화상대를 선택하세요");
                        return false;
                    }
                	if(msg.sender == customer_seq){
                    	/* var obj = {
            					sender :  customer_seq,
            					text : msg.text
                        }; */
                        var chat_seq;

                        for(var i = 0; i < dbChatList.length; i++){
							if((dbChatList[i].customer1_seq == msg.sender && dbChatList[i].customer2_seq == msg.receiver) || (dbChatList[i].customer1_seq == msg.receiver && dbChatList[i].customer2_seq == msg.sender)){
								chat_seq = dbChatList[i].chat_seq;
								break;
							}
                        }
                        console.log(chat_seq);

                        //const json = '{"result":true, "count":42}';
                        //const obj = JSON.parse(json);
                        const obj = '{"chat_seq" : '+chat_seq+', "chat" : {"sender" : '+msg.sender+',"receiver" : '+msg.receiver+',"text" : "'+msg.text+'"}}';
                        /* $.getJSON("../resources/chatLog/chatLog"+chat_seq+".json", function(data){
                        	data.push(JSON.parse(obj)); 
                        	console.log(data);
                        	$.each(data, function(I, item){
                        		console.log(item.chat_seq);
                        		console.log(item.chat.sender);
                        		console.log(item.chat.text);
                        	}); 
                        	
                        });*/
                        socket.emit("saveChat", obj, chat_seq);
                         
                        //var chatLog = JSON.parse(obj);
                        //console.log(chatLog);
                       
                        //console.log(obj);
	                    var str = '';
	                    str += '<div class="convo-area">';
	                    str += '<div class="convo-message">';
	                    str += '<p>';
	                    str += msg.text;
	                    str += '</p></div></div>';
	                    str += '<div class="convo-img">';
	                    if(sender.profileImg.substring(0,4) == 'http'){
	                    	str += '<img src="'+sender.profileImg+'" alt="" class="img-responsive img-circle" style = "width : 50px; height : 50px;"></div>';
			            }else{
			            	str += '<img src="<c:url value = "/img/'+sender.profileImg+'"/>" alt="" class="img-responsive img-circle" style = "width : 50px; height : 50px;"></div>';	
					    }
	                    //str += '<img src="'+sender.profileImg+'" alt="" class="img-responsive img-circle" style = "width : 50px; height : 50px;"></div>';
                    
    	                //div 태그를 만들어 텍스트를 msg로 지정을 한뒤 #chat_box에 추가를 시켜준다.
	                    $('<div class = "convo-box pull-right"></div>').html(str).appendTo(".conversation-container");
	                    $(".conversation-container").scrollTop($(document).height());
	                    $("#latest"+msg.receiver).html(msg.text);
                	}else if(msg.receiver == customer_seq){
                    	var flag = true;
                    	console.log(chatList);

                    	for(var i = 0; i<chatList.length; i++){
                        	
                        	//팔로우 안돼있는사람한테 온 채팅
							if(msg.sender == chatList[i].customer1_seq || msg.sender == chatList[i].customer2_seq){
								flag = false;
								console.log("채팅방있음");
							}

						};
						
						//팔로우 안돼잇으면
                    	if(flag){
                        	console.log("씨발");
                    		$.get("getCustomer", {customer_seq : msg.sender}).done(function(customer){
                    			var str = '';
            					str += '<li id = "customer-list'+customer.customer_seq+'" class="active" onclick = "sendTo('+customer.customer_seq+')">';
            					str += '<div class="user-message-details">';
            					str += '<div class="user-message-img">';
            					if(customer.profileImg.substring(0,4) == 'http'){
            						str += '<img src="'+customer.profileImg+'" class="img-responsive img-circle" alt="">';
                    			}else{
                    				str += '<img src="<c:url value = "/img/'+customer.profileImg+'"/>" class="img-responsive img-circle" alt="">';
                            	}
            					str += '<span class="user-online"></span></div>';
            					str += '<div class="user-message-info">';
            					str += '<h4>'+customer.name+'</h4>';
            					str += '<p id = "latest'+customer.customer_seq+'">'+msg.text+'</p>';
            					str += '<span class="time-posted">1:55 PM</span></div>';
            					str += '<span class="message-notification">1</span>';
            					str += '</div></li>';
            					
            					$("#chat-list").append(str);
            					chatList.push({
                					chat_seq : -1,
                					customer1_seq : msg.sender,
                					custoemr2_seq : msg.receiver
                				})
							})
							flag = false;
                       	} 
						
                		
						var str = '';
						str += '<div class="convo-area convo-left">';
						str += '<div class="convo-message">';
						str += '<p>';
						str += msg.text;
						str += '</p></div></div>';
						str += '<div class="convo-img">';
						if(sender.profileImg.substring(0,4) == 'http'){
							str += '<img src= "'+sender.profileImg+'" alt="" class="img-responsive img-circle" style = "width : 50px; height : 50px;"></div>';
						}else{
							str += '<img src="<c:url value = "/img/'+sender.profileImg+'"/>" alt="" class="img-responsive img-circle" style = "width : 50px; height : 50px;"></div>';
						}
						
						$('<div class = "convo-box convo-left"></div>').html(str).appendTo(".conversation-container");
						$(".conversation-container").scrollTop($(document).height());
						$("#latest"+msg.sender).html(msg.text);
                    }
                });

            });

			function test(chatList){
                
                $.get({
					url : "getChatList",
					data : {
						customer_seq : customer_seq
					},
					success : function(result){
	                    dbChatList = result;
	                    //array copy
	                    chatList = JSON.parse(JSON.stringify(dbChatList));
	                    var followingList;

	                    getFollowingList(chatList,dbChatList);
	                },
	                async : false
                });
                return chatList;
            }

            function getFollowingList(chatList, dbChatList){
                $.get({
					url : 'getFollowingList',
					success : function(list){
	                    followingList = list;
	                    //console.log(followingList);
	                    

	                    for(var i = 0; i<followingList.length; i++){
	                    	var chat = {
	                                chat_seq : -1,
	                                customer1_seq : customer_seq,
	                                customer2_seq : followingList[i]
	                        }
	                        
	                    	var flag = false;
	                        for(var j = 0; j<dbChatList.length; j++){
	                            //flag = false;
	                            //중복검사
								if((dbChatList[j].customer1_seq == chat.customer1_seq && dbChatList[j].customer2_seq == chat.customer2_seq) || (dbChatList[j].customer1_seq == chat.customer2_seq && dbChatList[j].customer2_seq == chat.customer1_seq)){
									console.log("중복");
									flag = true;	
								} 
	                        }
	                        
	                        if(!flag){
								chatList.push(chat);
							} 
	                    }
	                },
	                async : false
                })
            }


            function sendTo(num){
            	var socket = io("http://localhost:82");
            	var customer_seq = "${sessionScope.customer.customer_seq}";
            	var chat_seq;

                $.get({
					url : "getChat_seq",
					data : {
						customer1_seq : customer_seq, 
						customer2_seq : num
					},
					success : function(data){
						chat_seq = data;
					},
					async : false
                });

                if(chat_seq == ""){
					console.log("undefined");
					$.post({
						url : "insertChat",
						data : {
							customer1_seq : customer_seq, 
							customer2_seq : num
						},
						success : function(){
							console.log("insert chat");
							getChatList();
						},
						async : false
					});
					$.get({
						url : "getChat_seq",
						data : {
							customer1_seq : customer_seq, 
							customer2_seq : num
						},
						success : function(data){
							chat_seq = data;
						},
						async : false
	                });
	                console.log(chat_seq);
                }
                console.log(chat_seq);
            	socket.emit("getHistory", chat_seq);
            	
            	socket.on('getHistory', function(data){
                	$(".conversation-container").html('');
                	$.each(data,function(index, item){
						if(item.chat.sender == customer_seq){
							var str = '';
		                    str += '<div class="convo-area">';
		                    str += '<div class="convo-message">';
		                    str += '<p>';
		                    str += item.chat.text;
		                    str += '</p></div></div>';
		                    str += '<div class="convo-img">';
		                    if(customer1.profileImg.substring(0,4) == 'http'){
		                    	str += '<img src="'+customer1.profileImg+'" alt="" class="img-responsive img-circle" style = "width : 50px; height : 50px;" ></div>';
			                }else{
			                	str += '<img src="<c:url value = "/img/'+customer1.profileImg+'"/>" alt="" class="img-responsive img-circle" style = "width : 50px; height : 50px;" ></div>';
				            }
		                    
	                    
	    	                //div 태그를 만들어 텍스트를 msg로 지정을 한뒤 #chat_box에 추가를 시켜준다.
		                    $('<div class = "convo-box pull-right"></div>').html(str).appendTo(".conversation-container");
		                    $(".conversation-container").scrollTop($(document).height());
						}else{
							var str = '';
							str += '<div class="convo-area convo-left">';
							str += '<div class="convo-message">';
							str += '<p>';
							str += item.chat.text;
							str += '</p></div></div>';
							str += '<div class="convo-img">';
							if(customer.profileImg.substring(0,4) == 'http'){
		                    	str += '<img src="'+customer.profileImg+'" alt="" class="img-responsive img-circle" style = "width : 50px; height : 50px;" ></div>';
			                }else{
			                	str += '<img src="<c:url value = "/img/'+customer.profileImg+'"/>" alt="" class="img-responsive img-circle" style = "width : 50px; height : 50px;" ></div>';
				            }
							$('<div class = "convo-box convo-left"></div>').html(str).appendTo(".conversation-container");
							$(".conversation-container").scrollTop($(document).height());
						}
                    })
                })
            	
				receiver = num;

				var customer;
				$.get({
					url : "getCustomer",
					data : {
						customer_seq : num
					},
					success : function(data){
						customer = data;
					},
					async : false
				});

				var customer1;
				$.get({
					url : "getCustomer",
					data : {
						customer_seq : customer_seq
					},
					success : function(data){
						customer1 = data;
					},
					async : false
				});

				$("#chatRoomCustomerProfileImg").attr("src",'<c:url value = "/img/'+customer.profileImg+'"/>');

				

				if(customer.profileImg.substring(0,4) == 'http'){
					$("#chatRoomCustomerProfileImg").attr("src",customer.profileImg);
				}else{
					$("#chatRoomCustomerProfileImg").attr("src",'<c:url value = "/img/'+customer.profileImg+'"/>');
				}
			



				
				$("#chatRoomCustomerName").html(customer.name);
				$("#chatroomonline").html("ONLINE");
				$(".conversation-container").html('');
				//@todo : 대화내용불러오기
				
			};

            function setChatList(chatList){
            	var socket = io("http://localhost:82");
            	var str = '';
            	var seqList = [];
            	var customer_seq = "${sessionScope.customer.customer_seq}";
            	
            	for(var i = 0; i<chatList.length; i++){
					if(chatList[i].customer1_seq == customer_seq){
						seqList[i] = chatList[i].customer2_seq;
					}else if(chatList[i].customer2_seq == customer_seq){
						seqList[i] = chatList[i].customer1_seq;
					}
                }
                
                
                
            	$.each(seqList, function(index,item){
                	var customer;

                	$.get("getFollowingCustomer",{customer_seq : item}).done(function(data){
						console.log(data);
						customer = data;
						value = '/img/${i.savedFilename}'
						str = '';
						str += '<li id = "customer-list'+customer.customer_seq+'" class="active" onclick = "sendTo('+customer.customer_seq+')">';
						str += '<div class="user-message-details">';
						str += '<div class="user-message-img">';
						if(customer.profileImg.substring(0,4) == 'http'){
							str += '<img src="'+customer.profileImg+'" class="img-responsive img-circle" alt="" style = "width : 40px; height : 40px;">';
						}else{
							str += '<img src="<c:url value = "/img/'+customer.profileImg+'"/>" class="img-responsive img-circle" alt="" style = "width : 40px; height : 40px;">';
						}
						str += '<span class="user-online"></span></div>';
						str += '<div class="user-message-info">';
						str += '<h4>'+customer.name+'</h4>';
						str += '<p id = "latest'+customer.customer_seq+'"></p>';
						str += '<span class="time-posted"></span></div>';
						str += '<span class="message-notification">1</span>';
						str += '</div></li>';
						
						$("#chat-list").append(str);
						
						$.each(chatList, function(index,item){
		                	socket.emit('getHistory',item.chat_seq);
		                	socket.on('getHistory',function(data){
		                    	var text = data[data.length-1].chat.text;
		                    	var num;
		                    	if(data[data.length-1].chat.sender == customer_seq){
									num = data[data.length-1].chat.receiver;
		                        }else{
									num = data[data.length-1].chat.sender;
		                        }
		                    	$("#latest"+num).html(text);
		                    })
		                })
                    });
				}) 
            }
        </script>
		
  </head>

<body>

     <!-- ==============================================
     Navigation Section
     =============================================== -->  
     <header class="tr-header">
      <nav class="navbar navbar-default">
       <div class="container-fluid">
	    <div class="navbar-header">
		 <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse">
		  <span class="sr-only">Toggle navigation</span>
		  <span class="icon-bar"></span>
		  <span class="icon-bar"></span>
		  <span class="icon-bar"></span>
		 </button>
		 <a class="navbar-brand" href="index.html"><i class="fab fa-instagram"></i> KIITO</a>
		</div><!-- /.navbar-header -->
		<div class="navbar-left">
		 <div class="collapse navbar-collapse" id="navbar-collapse">
		  <ul class="nav navbar-nav">
		  </ul>
		 </div>
		</div><!-- /.navbar-left -->
		<div class="navbar-right">                          
		 <ul class="nav navbar-nav">
		   <li>
		   <div class="search-dashboard">
               <form>
                    <input placeholder="Search here" type="text">
                    <button type="submit"><i class="fa fa-search"></i></button>
               </form>
          </div>							
		   </li>

		   <li class="dropdown notification-list">
		    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
			 <i class="fa fa-bell noti-icon"></i>
			 <span class="badge badge-danger badge-pill noti-icon-badge">4</span>
			</a>
			<div class="dropdown-menu dropdown-menu-right dropdown-lg">
             
			 <div class="dropdown-item noti-title">
			  <h6 class="m-0">
			   <span class="pull-right">
			    <a href="" class="text-dark"><small>Clear All</small></a> 
			   </span>Notification
			  </h6>
			 </div>

			 <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 416.983px;">
			  <div class="slimscroll" style="max-height: 230px; overflow: hidden; width: auto; height: 416.983px;">
			   <div id="Slim">
			    <a href="javascript:void(0);" class="dropdown-item notify-item">
				 <div class="notify-icon bg-success"><i class="fa fa-comment"></i></div>
				 <p class="notify-details">Caleb Flakelar commented on Admin<small class="text-muted">1 min ago</small></p>
				</a><!--/ dropdown-item-->
				<a href="javascript:void(0);" class="dropdown-item notify-item">
				 <div class="notify-icon bg-success"><i class="fa fa-user-plus"></i></div>
				 <p class="notify-details">Grace Flake followed you.<small class="text-muted">5 hours ago</small></p>
				</a><!--/ dropdown-item-->
				<a href="javascript:void(0);" class="dropdown-item notify-item">
				 <div class="notify-icon bg-success"><i class="fa fa-heart"></i></div>
				 <p class="notify-details">Carlos Crouch liked your photo.<small class="text-muted">3 days ago</small></p>
				</a><!--/ dropdown-item-->
				<a href="javascript:void(0);" class="dropdown-item notify-item">
				 <div class="notify-icon bg-success"><i class="fa fa-comment"></i></div>
				 <p class="notify-details">Caleb Flakelar commented on Admin<small class="text-muted">4 days ago</small></p>
				</a><!--/ dropdown-item-->
				<a href="javascript:void(0);" class="dropdown-item notify-item">
				 <div class="notify-icon bg-success"><i class="fa fa-user-plus"></i></div>
				 <p class="notify-details">Maureen Hilda followed you.<small class="text-muted">7 days ago</small></p>
				</a><!--/ dropdown-item-->
				<a href="javascript:void(0);" class="dropdown-item notify-item">
				 <div class="notify-icon bg-success"><i class="fa fa-heart"></i></div>
				 <p class="notify-details">Carlos Crouch liked your photo.<small class="text-muted">13 days ago</small></p>
				</a><!--/ dropdown-item-->
			   </div><!--/ .Slim-->
			   <div class="slimScrollBar" style="background: rgb(158, 165, 171) none repeat scroll 0% 0%; width: 8px; position: absolute; top: 0px; opacity: 0.4; display: block; border-radius: 7px; z-index: 99; right: 1px;"></div>
			   <div class="slimScrollRail" style="width: 8px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51) none repeat scroll 0% 0%; opacity: 0.2; z-index: 90; right: 1px;"></div>
			  </div><!--/ .slimscroll-->
			 </div><!--/ .slimScrollDiv-->
			 <a href="photo_notifications.html" class="dropdown-item text-center notify-all">
			  View all <i class="fa fa-arrow-right"></i>
			 </a><!-- All-->
            </div><!--/ dropdown-menu-->
		   </li>

		   <li class="dropdown notification-list">
			<a class="nav-link dropdown-toggle arrow-none waves-effect" data-toggle="dropdown" href="/kiito/customer/chat" role="button" aria-haspopup="false" aria-expanded="false">
			 <i class="fa fa-envelope noti-icon"></i>
			 <span class="badge badge-success badge-pill noti-icon-badge">6</span>
			</a>
			<div class="dropdown-menu dropdown-menu-right dropdown-lg dropdown-new">
             <div class="dropdown-item noti-title">
			  <h6 class="m-0">
			   <span class="float-right">
			    <a href="" class="text-dark"><small>Clear All</small></a> 
			   </span>Chat
			  </h6>
			 </div>

			 <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 416.983px;">
			  <div class="slimscroll" style="max-height: 230px; overflow: hidden; width: auto; height: 416.983px;">
			   <div id="Slim2">
				<a href="javascript:void(0);" class="dropdown-item notify-item nav-user">
				 <div class="notify-icon"><img src="../resources/assets/img/users/1.jpg" class="img-responsive img-circle" alt=""> </div>
				 <p class="notify-details">Cristina Pride</p>
				 <p class="text-muted font-13 mb-0 user-msg">Hi, How are you? What about our next meeting</p>
				</a><!--/ dropdown-item-->
				<a href="javascript:void(0);" class="dropdown-item notify-item nav-user">
				 <div class="notify-icon"><img src="../resources/assets/img/users/2.jpg" class="img-responsive img-circle" alt=""> </div>
				 <p class="notify-details">Sam Garret</p>
				 <p class="text-muted font-13 mb-0 user-msg">Yeah everything is fine</p>
				</a><!--/ dropdown-item-->
				<a href="javascript:void(0);" class="dropdown-item notify-item nav-user">
				 <div class="notify-icon"><img src="../resources/assets/img/users/3.jpg" class="img-responsive img-circle" alt=""> </div>
				 <p class="notify-details">Karen Robinson</p>
				 <p class="text-muted font-13 mb-0 user-msg">Wow that's great</p>
				</a><!--/ dropdown-item-->
				<a href="javascript:void(0);" class="dropdown-item notify-item nav-user">
				 <div class="notify-icon"><img src="../resources/assets/img/users/4.jpg" class="img-responsive img-circle" alt=""> </div>
				 <p class="notify-details">Sherry Marshall</p>
				 <p class="text-muted font-13 mb-0 user-msg">Hi, How are you? What about our next meeting</p>
				</a><!--/ dropdown-item-->
				<a href="javascript:void(0);" class="dropdown-item notify-item nav-user">
				 <div class="notify-icon"><img src="../resources/assets/img/users/5.jpg" class="img-responsive img-circle" alt=""> </div>
				 <p class="notify-details">Shawn Millard</p>
				 <p class="text-muted font-13 mb-0 user-msg">Yeah everything is fine</p>
				</a><!--/ dropdown-item-->
			   </div><!--/ .Slim-->
			   <div class="slimScrollBar" style="background: rgb(158, 165, 171) none repeat scroll 0% 0%; width: 8px; position: absolute; top: 0px; opacity: 0.4; display: block; border-radius: 7px; z-index: 99; right: 1px;"></div>
			   <div class="slimScrollRail" style="width: 8px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51) none repeat scroll 0% 0%; opacity: 0.2; z-index: 90; right: 1px;"></div>
			  </div><!--/ slimscroll-->
			 </div> <!--/ slimScrollDiv-->
			 <a href="photo_chat.html" class="dropdown-item text-center notify-all">
			  View all <i class="fa fa-arrow-right"></i>
			 </a>
            </div><!--/ dropdown-menu-->
		   </li>
		  
		 <li class="dropdown mega-avatar">
		  <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
		   <span class="avatar w-32">
		   	<c:if test="${sessionScope.customer.profileImg == null }">
				<img src="../resources/login/images/profileImg_null2.png" class="img-resonsive img-circle" width="25" height="25" alt="..."/>
			</c:if>
			<c:if test="${sessionScope.customer.profileImg.substring(0,4) == 'http' }">
				<img src="<c:url value = '${sessionScope.customer.profileImg }'/>" class="img-resonsive img-circle" width="25" height="25" alt="..."/>
			</c:if>
			<c:if test="${sessionScope.customer.profileImg.substring(0,4) != 'http' }">
				<img src="<c:url value = '/img/${sessionScope.customer.profileImg }'/>" class="img-resonsive img-circle" width="25" height="25" alt="..."/>
			</c:if>
		   </span>
		   <!-- hidden-xs hides the username on small devices so only the image appears. -->
		   <span class="hidden-xs">
			${sessionScope.customer.nick }
		   </span>
		  </a>
		  <div class="dropdown-menu w dropdown-menu-scale pull-right">
<!-- 		   <a class="dropdown-item" href="#"><span>New Story</span></a> 
		   <a class="dropdown-item" href="#"><span>Become a Member</span></a>  -->
		   <div class="dropdown-divider"></div>
		   <a class="dropdown-item" href="profile?profileImg=${sessionScope.customer.profileImg }"><span>Profile</span></a> 
		   <a class="dropdown-item" href="#editp" data-toggle="modal" rel="modal:open"><span>Settings</span></a> 
<!-- 		   <a class="dropdown-item" href="#">Need help?</a>  -->
		   <div class="dropdown-divider"></div>
		   <a class="dropdown-item" href="logout">Sign out</a>
		  </div>
		 </li><!-- /navbar-item -->	
		 
		 </ul><!-- /.sign-in -->   
		</div><!-- /.nav-right -->
       </div><!-- /.container -->
      </nav><!-- /.navbar -->
     </header><!-- Page Header -->  
  
	 <!-- ==============================================
	 Navbar Second Section
	 =============================================== -->
	<section class="nav-sec">
	  <div class="d-flex justify-content-between">
	   <div class="p-2 nav-icon-lg dark-black">
	   <a class="nav-icon" href="/kiito/home"><em class="fa fa-home"></em>
		<span>Home</span>
	   </a>
	   </div>
	   <div class="p-2 nav-icon-lg clean-black">
	   <a class="nav-icon" href="/kiito/feed/explore"><em class="fa fa-crosshairs"></em>
		<span>Explore</span>
	   </a>
	   </div>
	   <div class="p-2 nav-icon-lg dark-black">
	 <a class="nav-icon" onclick = "writeBt()" style="cursor:pointer"><em class="fab fa-instagram"  ></em>
		<span>Upload</span>
	   </a>
	   </div>
	 <!--   <div class="p-2 nav-icon-lg clean-black">
	   <a class="nav-icon" href="photo_stories.html"><em class="fa fa-align-left"></em>
		<span>Stories</span>
	   </a>
	   </div> -->
	   <div class="p-2 nav-icon-lg mint-green">
	   <a class="nav-icon" href="profile?profileImg=${sessionScope.customer.profileImg }"><em class="fa fa-user"></em>
		<span>Profile</span>
	   </a>
	   </div>
	  </div>
	</section>	
  
	 <!-- ==============================================
	 Modal Section
	 =============================================== -->
     <section class="chat">
	  <div class="container">
	   <div class="row">
	   
        <div class="messages-box">
		 <div class="row">
		  <div class="col-lg-4 col-md-12 no-pdd">
		   <div class="messages-container">
		   
			<div class="message-header">
			 <div class="message-title">
			  <h4>Messages</h4>
			 </div><!--/ message-title-->
             <div class="search-area">  
              <div class="input-field">
               <input placeholder="Search" type="text">
               <i class="fa fa-search"></i>
              </div>
             </div><!--/ search-area-->			 
			</div><!--/ message-header-->
								
			<div class="messages-list">
			  <ul id = "chat-list">
			 
										
			  </ul>
			</div><!--/ messages-list -->
			
		   </div><!--/ messages-container-->
		  </div><!--/ col-lg-4 -->
		  
		  <div class="col-lg-8 col-md-12 pd-right-none pd-left-none">
		   <div class="conversation-box">
		   
			<div class="conversation-header">
			 <div class="user-message-details">
			  <div class="user-message-img">
			   <img id = "chatRoomCustomerProfileImg" src="" class="img-responsive img-circle" alt="" style = "width : 40px; height : 40px;">
			  </div>
			  <div class="user-message-info">
			   <h4 id = "chatRoomCustomerName"></h4>
			   <p id = "chatRoomOnline"></p>
			  </div><!--/ user-message-info -->
			 </div><!--/ user-message-details -->
			 <a href="#" title=""><i class="fa fa-ellipsis-v"></i></a>
			</div><!--/ conversation-header -->
			
			<div class="conversation-container">

			 
									
			</div><!--/ conversation-container -->
            <div class="type_messages">  
             <div class="input-field">
              <!-- <textarea id="msg" placeholder="Type something &amp; press enter"></textarea> -->
              <input id = "msg" type = "text" placeholder="Type something &amp; press enter"> 
			  <ul class="imoji">
			   <li><a href="#"><i class="fa fa-smile"></i></a></li>
			   <li><a href="#"><i class="fa fa-image"></i></a></li>
			   <li><a href="#"><i class="fa fa-paperclip"></i></a></li>
			  </ul><!--/ imoji -->
             </div><!--/ input-field -->
            </div><!--/ type_messages -->
								
           </div><!--main-conversation-box end-->
		  </div><!--/ col-lg-8 -->
		  
		 </div><!--/ row -->
		</div><!--/ messages-box -->	   
	  
      </div><!--/ row -->
      </div><!--/ container -->
     </section><!--/ chat -->	 
	   
     <!-- ==============================================
	 Scripts
	 =============================================== -->
	<script src="../resources/assets/js/jquery.min.js"></script>
	<script src="../resources/assets/js/bootstrap.min.js"></script>
	<script src="../resources/assets/js/base.js"></script>
	<script src="../resources/assets/plugins/slimscroll/jquery.slimscroll.js"></script>
	<script>
	$('#Slim,#Slim2').slimScroll({
	        height:"auto",
			position: 'right',
			railVisible: true,
			alwaysVisible: true,
			size:"8px",
		});		
	</script>
	
	<!-- write form -->
      <div class="container-contact100">
      <div class="wrap-contact100">
         <form class="contact100-form validate-form" id = "writeForm" action = "/kiito/feed/insertFeed" method = "POST" enctype="multipart/form-data" >
         <input type = "hidden" name = "customer_seq" value = "${sessionScope.customer.customer_seq }" id="cs">
            <span class="contact100-form-title">私がいるところ</span>
            <div class="wrap-input100 validate-input" data-validate = "이거 왜뜨지 씨발">
               <input class="input100" type="text" id="checkin" placeholder = "Please enter a search term">
               
               <input class = "input100" id = "checkinBt" type = "button" value = "search">
               <!-- 같은 이름 ㄴㄴ -->
               <span class="focus-input100"></span>
            </div>
            <input type = "text" id = "dataSelected" name = "checkin" style = "display : none;">
            
            <div class="map_wrap">
                <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
            
                <div id="menu_wrap" class="bg_white">
                    <hr>
                    <ul id="placesList"></ul>
                    <div id="pagination"></div>
                </div>
            </div>
            <div class = "wrap-input100">
               <input type = "radio" name = "congestion" value = "3" checked = "checked" style = "margin-left : 20px;">congestion
               <input type = "radio" name = "congestion" value = "2">smoothness
               <input type = "radio" name = "congestion" value = "1">dullness
            </div>
                  
            <div class="wrap-input100 validate-input" data-validate = "Please enter your message">
               <textarea id = "contents" class="input100" name="contents" placeholder="Your Message" style = "resize : none"></textarea>
               <span class="focus-input100"></span>
            </div>
            
            <div data-validate = "이거 왜뜨지 씨발">

               <input type = "file" id = "input_imgs" name = "imagefile"  multiple accept="image/gif, image/jpeg, image/png" style="display:none" />
               <input type='text' name='imagefile2' id='imagefile2' style="display:none;"> 
            <img src='../resources/images/picture.png' border='0' onclick='document.all.imagefile.click(); document.all.imagefile2.value=document.all.imagefile.value'> 
            <input type = "file" id = "input_video" name = "videofile" multiple accept="video/*" style="display:none" />
               <input type='text' name='videofile2' id='videofile2' style="display:none;"> 
            <img src='../resources/images/video.png' border='0' onclick='document.all.videofile.click(); document.all.videofile2.value=document.all.videofile.value'> 

            
            
               <!-- <input class="input100" multiple = "multiple" type="file" name="upload" id="file" value="파일선택" size="30">
               <span class="focus-input100"></span> -->
            </div>
            <div>
               <div class = "imgs_wrap" style = "margin-bottom : 10px;">
               
               </div>
            </div>
            
            
            <div class="wrap-input100 validate-input" data-validate = "이거 왜뜨지 씨발">
            <br>
                  <input type="text" id="tag" class="input100" placeholder="tag" />
               <span class="focus-input100"></span>
            </div>
   

            
         <ul id="tag-list">
              </ul>


         <input type="hidden" value="" name="arr" id="rdTag" />
         
      

            <div class="container-contact100-form-btn">
               <button type = "button" id = "submitFeed"class="contact100-form-btn">
                  <span>
                     <i class="fa fa-paper-plane-o m-r-6" aria-hidden="true"></i>
                     submit
                  </span>
               </button>
               　　
               <button type = "button" id = "closeWrite"class="contact100-form-btn">
                  <span>
                     <i class="fa fa-paper-plane-o m-r-6" aria-hidden="true"></i>
                     close
                  </span>
               </button>
            </div>
         </form>
      </div>
   </div>
   
         <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cab38e188d1015fa32fe5df13ab040fa&libraries=services,clusterer,drawing"></script>
      <script src = "../resources/writef/js/kakaomap.js"></script>
      
      <script src="../resources/writef/js/main.js"></script>
      
      <!--    개인정보수정 -->
    <div id="editp" class="modal">
   <form id="editForm" style="text-align: -webkit-center;">
   <span style="font-size: 70px; font-family: fantasy; font-style: italic; color: antiquewhite;">Info.</span><br>
   <div style="background-color: #daf6ffa6; width: 400px; min-height: 45vh; border-radius: 30px;">
   <section class="content bgcolor-1" style="border-radius: 30px;">
   <img style = "border:1px solid #642EFE; width : 150px; height : 150px;" src="../img/${sessionScope.customer.profileImg }" class="img-responsive img-circle" id="base">
   <a>${sessionScope.customer.nick }</a><br>

         <span class="input input--haruki">
               <input class="input__field input__field--haruki" type="text"  id="nick" />
               <label class="input__label input__label--haruki" for="input-1">
                  <span class="input__label-content input__label-content--haruki">NickName</span>
               </label>
            </span>
            <button id="bt3" value="수정" ><img src="../resources/images/check.png"></button>
            
                     <span class="input input--haruki">
               <input type="password" class="input__field input__field--haruki"  id="password" />
               <label class="input__label input__label--haruki" for="input-1">
                  <span class="input__label-content input__label-content--haruki">password</span>
               </label>
            </span>
            
                     <span class="input input--haruki">
               <input type="password" class="input__field input__field--haruki"  id="password1"/>
               <label class="input__label input__label--haruki" for="input-1">
                  <span class="input__label-content input__label-content--haruki" id="password1">password check</span>
               </label>
            </span>
            <button id="bt7" value="탈퇴" >delete<img src="../resources/images/check.png"></button>
            <br>
               　　<div class="modal-meta-top">
               <button type = "button" id = "closeWrite" data-dismiss="modal" class="contact100-form-btn">
                  <span>
                     <i class="fa fa-paper-plane-o m-r-6" aria-hidden="true"></i>
                     close
                  </span>
               </button>
               </div>
      </section>
      </div>
</form>
</div>
      

  </body>
</html>
