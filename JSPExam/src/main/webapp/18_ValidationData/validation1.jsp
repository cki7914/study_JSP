<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="validation1_process.jsp" method="post" name="loginForm">
		<p>아이디 : <input type="text" name="id" /></p>
		<p>비밀번호 : <input type="password" name="pw" /></p>
		<p><input type="button" value="전송" onclick="checkLogin()" /></p>
	</form>
	
	<script>
		/* function checkForm(){
			alert("아이디 : " + document.loginForm.id.value + "\n" + "비밀번호 : " + document.loginForm.pw.value);
		} */
		
		// 아이디가 입력되었는지 검사하여 입력되지 않았으면 "아이디를 입력해주세요" 출력하고 해당항목에 포커스
		// 아이디는 4~12글자 사이로, 비밀번호는 4글자 이상으로 입력받도록 설정
		function checkLogin(){
			let form = document.loginForm;
			
			if(form.id.value == ""){
				alert("아이디를 입력해주세요");
				form.id.focus();
				return false;
			}
			if(form.pw.value == ""){
				alert("비밀번호를 입력해주세요");
				form.pw.focus();
				return false;
			}
			// focus() : 커서만 가져다 둠
			if(form.id.value.length < 4 || form.id.value.length > 12){
				alert("아이디는 4~12글자 사이로 입력해주세요");
				form.id.focus();
				return false;
			}
			// select() : 작성했던 내용을 선택
			if(form.pw.value.length < 4){
				alert("비밀번호는 4글자 이상 입력해주세요");
				form.pw.select();
				return false;
			}
			
			for(i = 0; i < form.id.value.length; i++){
				let ch = form.id.value.charAt(i);
				
				if((ch < 'a' || ch > 'z') && (ch > 'A' || ch < 'Z') && (ch > '0' || ch < '9')){
					alert("아이디는 영문 소문자만 입력 가능합니다");
					form.id.select();
					return;
				}
			}
			
			form.submit();
		}
	</script>
</body>
</html>