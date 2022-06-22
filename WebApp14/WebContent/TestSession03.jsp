<%@ page contentType="text/html; charset=UTF-8"%>
<% 

		request.setCharacterEncoding("UTF-8");

		// 이이전페이지 → 이전페이지에서 이름과 전화번호를 넘겨받은 상황
		//String name = request.getParameter("userName");
		//String tel = request.getParameter("userTel");
		
		String userName = (String)session.getAttribute("userName");
		String userTel = (String)session.getAttribute("userTel");
		
		// 이전 페이지에서 아이디랑 비밀번호를 넘겨받은 상황
		String id = request.getParameter("userId");
		String pwd = request.getParameter("userPwd");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSession03.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>이름, 전화번호, 아이디, 패스워드 출력</h1>
	<h2>(TestSession03.jsp)</h2>
</div>

<h4>아이디 : <%=id %><br>
<h4>비밀번호 : <%=pwd %><br>
<h4>이름 : <%=userName %><br>
<h4>전화번호 : <%=userTel %><br>

<h1>성공~</h1>

<a href="TestSession01.jsp">처음 페이지로 돌아가기</a>

</body>
</html>