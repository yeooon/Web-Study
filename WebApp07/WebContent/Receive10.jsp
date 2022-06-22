<%@ page contentType="text/html; charset=UTF-8"%>
<% 
	// 이전 페이지로(Send10_re.jsp 또는 Send10_for.jsp)부터 데이터(UserName, message) 수신
	request.setCharacterEncoding("UTF-8");

	String userName = request.getParameter("UserName");
	
	String message = (String)request.getAttribute("message");	// 다운캐스팅 오브젝트 → 스트링
	
	
	
	
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive10.jsp</title>
</head>
<body>

<div>
	<h1>데이터 송수신 실습 10</h1>
	<hr>
</div>

<div>
	<h2>최종 수신 페이지(Receive10.jsp)</h2>
</div>

<div>
	<p>이름 : <%=userName %></p>
	<p>내용 : <%=message %></p>
</div>

</body>
</html>