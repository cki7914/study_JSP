<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#chatWindow{
		border: 1px solid black;
		width: 270px;
		height: 310px;
		padding: 5px;
		overflow: scroll;
	}
	#chatMessage{
		width: 235px;
		height: 30px;
	}
	#sendBtn{
		height: 30px;
	}
	#closeBtn{
		margin-bottom: 5px;
	}
	#charId{
		width: 160px;
		height: 25px;
		border: 1px solid #aaa;
		background-color: #eee;
	}
	.myMsg{
		text-align: right;
	}
</style>
</head>
<body>
	<!-- 대화창 UI 정의 -->
	대화명 : <input type="text" id="chatId" value="${ param.chatId }" readonly />
	<button id="closeBtn" onclick="disconnect();">채팅 종료</button>
	
	<div id="chatWindow"></div>
	
	<div>
		<input type="text" id="chatMessage" onKeyup="enterKey();" />
		<button id="sendBtn" onclick="sendMessage();">전송</button>
	</div>
	
	<script>
		// 웹소켓 접속 URL 뒤에 요청명을 덧붙여 웹소켓 객체를 생성
		let webSocket = new WebSocket("<%= application.getInitParameter("CHAT_ADDR") %>/ChatingServer")
		
		let chatWindow, chatMessage, chatId;
		
		window.onload = function(){
			chatWindow = document.getElementById("chatWindow");
			chatMessage = document.getElementById("chatMessage");
			chatId = document.getElementById("chatId").value;
		}
		
		// 메세지 전송
		function sendMessage(){
			// 대화창에 표시
			chatWindow.innerHTML += "<div class='myMsg'>" + chatMessage.value + "</div>";
			// "대화명 > 내용"의 형태로 서버로 전송
			webSocket.send(chatId + " > " + chatMessage.value);
			// 메세지 입력창 내용 지우기
			chatMessage.value="";
			// 대화창 스크롤 위치
			chatWindow.scrollTop = chatWindow.scrollHeight;
		}
		
		// 서버와의 연결 종료
		function disconnect(){
			webSocket.close();
		}
		
		// Enter키 입력
		function enterKey(){
			if(window.event.keyCode == 13){
				sendMessage();
			}
		}
		
		// 웹소켓 서버에 연결됐을 때 실행
		webSocket.onopen = function(event){
			chatWindow.innerHTML += "웹소켓 서버에 연결했습니다<br>";
		}
		
		// 웹소켓 서버가 종료되었을 때 실행
		webSocket.onclose = function(event){
			chatWindow.innerHTML += "웹소켓 서버가 종료되었습니다<br>";
		}
		
		// 에러 발생시
		webSocket.onerror = function(event){
			alert(event.data);
			chatWindow.innerHTML += "채팅 중 에러가 발생하였습니다<br>";
		}
		
		// 메시지를 받았을 때
		webSocket.onmessage = function(event){
			// 대화명과 메세지 분리
			let message = event.data.split(" > ");
			let sender = message[0]; // 보낸 사람
			let content = message[1]; // 메세지 내용
			
			if(content != ""){
				if(content.match("/")){ // 귓속말
					if(content.match("/" + chatId)){
						let temp = content.replace(("/" + chatId), "[귓속말] : ");
						chatWindow.innerHTML += "<div>" + sender + " " + temp + "</div>";
					}
				} else { // 일반 대화
					chatWindow.innerHTML += "<div>" + sender + " > " + content + "</div>";
				}
			}
			chatWindow.scrollTop = chatWindow.scrollHeight;
		}
	</script>
</body>
</html>