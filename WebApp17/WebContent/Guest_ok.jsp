<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="ob" class="com.test.GuestDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="ob"/>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Guest_ok.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<!-- 작성해서 넘긴 내용 확인 -->
<!-- 이름, 제목, 내용 -->
<div>
	<h2>작성된 내용 확인</h2>
	<%=ob.getUserName() %><br>
	<%=ob.getSubject() %><br>
	<%=ob.getContent().replaceAll("\n", "<br>") %><br>
</div>

</body>
</html>