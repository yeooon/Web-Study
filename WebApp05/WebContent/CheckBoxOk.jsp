<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립트 릿 영역

	//한글 깨짐 방지 처리
	request.setCharacterEncoding("UTF-8");

	// 이름 데이터 수신
	String nameStr = request.getParameter("name");
	
	// 메모 데이터 수신 check~!!
	String memoStr = request.getParameter("memo");
	memoStr = memoStr.replaceAll("\n", "<br>");
	//-- JDK 1.5 이후부터 『replaceAll()』메소드 사용 가능
	// 『replaceAll()』을 통해 처리한 결과를 다시 memo 변수에 대입
	// "안녕하세요\n반갑습니다.\n홍길동입니다." → "안녕하세요<br>반갑습니다.<br>홍길동입니다."
	
	String[] loveArr = request.getParameterValues("checkGroup");
	
	// ※ 같은 name 속성의 값을 가진 데이터 여러개를 받는 경우
	// (즉, 다중 데이터로 수신하는 경우)
	// 이를 배열로 처리해야 한다. → 『getParameterValues()』
	
	
	
	// name, memo 특이사항 없음
	
	//※ 배열 데이터를 수신하여 처리할 경우...
	//	 수신된 데이터가 전혀 없는 경우는
	// 	 배열의 값 자체가 null 이 되어버리기 때문에
	//	 null 에 대한 확인(검사) 과정이 필요하다.
	
	String love = "";
	
	if(loveArr!=null)
	{
		for(String item : loveArr)
			love += "[" + item + "]";
	}

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CheckBoxOk.jsp</title>
</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습04</h1>
	<hr>
	<p>CheckBox.jsp ● → CheckBoxOk.jsp ○</p>
</div>

<div>
	<h2>수신 데이터 확인</h2>
	
	<h3>이름 : <%=nameStr %></h3>
	
	<h3>메모<br><br><%=memoStr %></h3>
	<!-- 	<p>나는<br>오타없이<br>점점 타이핑이 빨라지고 있다.</p> -->
	
	<h3>이상형 : <%=love %></h3>
</div>

</body>
</html>