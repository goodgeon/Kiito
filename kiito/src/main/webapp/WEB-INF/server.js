var app = require('express')();
var http = require('http').Server(app);
var io = require('socket.io')(http);
const fs = require('fs');


app.get('/', function(req, res){
  res.send('<h1>안녕하세요 "/" 경로 입니다.</h1>');
});

io.on('connection', function(socket){
  console.log('한명의 유저가 접속을 했습니다.');
  socket.on('disconnect', function () {
        console.log('한명의 유저가 접속해제를 했습니다.');
  });

  socket.on('send_msg', function (msg) {
        //콘솔로 출력을 한다.
        console.log(msg);
        //다시, 소켓을 통해 이벤트를 전송한다.
        io.emit('send_msg', msg);
  });

  socket.on('saveChat', function(data,chat_seq){
    var jsonData = JSON.parse(data);
    const chat = loadChat(chat_seq);

    console.log(chat);
    if(chat.length === 0){
      fs.writeFileSync('chat'+chat_seq+'.json', '['+JSON.stringify(jsonData)+']');
    }else{
      chat.push({
        chat_seq : chat_seq,
        chat : {
          sender : jsonData.chat.sender,
          receiver : jsonData.chat.receiver,
          text : jsonData.chat.text
        }
      })
      fs.writeFileSync('chat'+chat_seq+'.json', JSON.stringify(chat));
    }

    console.log(chat.length);
    console.log(chat);
  })

  socket.on('getHistory', function(chat_seq){
    const chat = loadChat(chat_seq);
    var chatHistory = chat;
    console.log(chatHistory);
    io.emit('getHistory', chatHistory);
  })

  function loadChat(chat_seq){
    try{
      const dataBuffer =  fs.readFileSync('chat'+chat_seq+'.json');
      const dataJSON = dataBuffer.toString();
      return JSON.parse(dataJSON);
    } catch(e){
      return [];
    }
  }
});


http.listen(82, function(){
  console.log('listening on *:82');
});
