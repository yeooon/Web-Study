<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberList.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
</head>
<body>

<div>
	<h1>JSTL 코어(Core) 문제 해결</h1>
	<h2>회원 명단 출력</h2>
	<hr />
</div>

<div>
	<!-- 5명의 이름, 전화번호, 주소 출력 -->
	<!-- MemberInsert에서 받은 lists 값을 dto에 집어넣는다. -->
	<c:forEach var="dto" items="${lists }">
		${dto.name }<br>
		${dto.tel }<br>
		${dto.adress }<br>
	
	</c:forEach>
</div>

</body>
</html>