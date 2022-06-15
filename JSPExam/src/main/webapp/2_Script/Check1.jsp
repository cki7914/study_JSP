<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 선언부이기 때문에 메서드 선언 가능 -->
<%! /* 선언부이기 때문에 메서드 선언 가능 */
	public int add(int num1, int num2) {
		return num1 + num2;	
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 
		스크립틀릿 - 자바코드 작성
		스크립틀릿은 _jspService라는 메서드 안에 선언되는 영역이므로
		스크립틀릿 내에선 메서드를 선언하여 사용할 수 없음
	 -->
	 
	<%
		int result = add(10, 20);
	%>
	
	add 결과 1 : <%= result %> <br>	   <!-- 표현식으로 작성 - 변수를 출력하도록 표현식 사용 -->
	add 결과 2 : <%= add(30, 40) %>	   <!-- 표현식 - 메서드를 직접 호출하는 표현시 사용 -->
	
	<!-- 
		선언부	: 멤버변수나 메서드를 선언할 때 사용하는 영역
				  _JSPSERVICE 메서드의 바깥에 생성됨
				  선언부에서 생성한 변수는 '전역변수'(여기저기 다 사용가능)로 사용
	
		스크립틀릿	: 선언부에서 선언한 메서드를 호출하거나 자바코드를 작성하는 영역
				  _JSPSERVICE 메서드 내부에 생성됨
				  스크립틀릿 안에 메서드 생성이 불가능 (메서드 안에 또 다른 메서드를 생성할 수 없기 때문)
				  스크립틀릿 안에서 생성한 변수는 지역변수 (해당 메서드안에서만 사용가능)로 사용
				   
	   표현식		: 변수의 값을 출력하고자 할 때 사용
	   		   	  표현식 구문 전체가 서블릿에서 out.print의 값으로 들어가므로
	   		   	  세미콜론을 사용하면 안됨. (표현식을 사용할 땐 ; (세미콜론)을 사용하지 않는다.)
	 -->
	
</body>
</html>