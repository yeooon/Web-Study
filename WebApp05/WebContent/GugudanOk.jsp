<%@ page contentType="text/html; charset=UTF-8"%>\
<% 
// 스크립트 릿 영역

	String str = request.getParameter("dan");

	// 변수 선언과 초기화는 무조건 위에서 해줘야 하나봐...
	// int n = Integer.parseInt(str) 하면 밑에서 오류남.
	int n = 0;
	
	try
	{
		n = Integer.parseInt(str);
	
	}
	catch(Exception e)
	{
		// 예외 발생 시...
		// 클라이언트의 브라우저 화면서 출력되지 않고...
		// 서버의 콘솔 창에 오류 메세지가 나오도록 구성된다.
		System.out.println(e.toString());
		
		// 예외 발생 시...
		// 해당 내용을 서버 log 기록으로 남기는 처리...
		getServletContext().log("오류 : " + e.toString());
	}

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gugudan.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습02</h1>
	<hr>
	<p>Gugudan.jsp ● → Gugudan.jsp ○</p>
</div>

<div>
	<!-- html 주석문 -->
	<!-- 구구단 곱셈 식 -->
	<%-- <% %> 랑 <%= %> 쓰는 거 어렵다 헷갈린다.--%>
	<%-- jsp 주석문 --%>
	
	<%
		for(int i=1; i<=9;i++)
		{
	%>
			<%=n%> * <%=i %> = <%=(n*i) %><br>
	<%			
		}
	%>
</div>

</body>
</html>