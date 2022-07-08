<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="" name="frm">
		<p>나이 : <input type="text" name="age" onkeypress="checkNum();" /></p>
		<input type="submit" value="전송" />
	</form>
	
	<script>
		// 이름은 숫자로 시작할 수 없음
		// isNaN() : 숫자 여부를 확인하는 함수
		// isNaN() 함수의 인수값이 숫자이면 false, 숫자가 아니면 true
		function checkNum(){
			/* if(!isNaN(document.frm.name.value.substr(0, 1))){
				alert("이름은 숫자로 시작할 수 없습니다");
				document.frm.name.select();
				return false;
			} */
			
			// event.returnValue = 입력받은 키 값의 반환 여부를 설정
			if(!(event.keyCode >= 48 && event.keyCode <= 57)){
				alert("숫자만 입력 가능합니다");
				event.returnValue = false;
			}
		}
	</script>
</body>
</html>