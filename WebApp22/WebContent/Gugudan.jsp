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
<title>Gugudan.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
</head>
<body>

<!-- 원하는 단을 입력받아 구구단을 출력하는 JSP 페이지를 구성한다. 
	단, JSTL Core if 문과 for Each 구문을 활용한다. -->

<div>
	<h1>JSTL 코어(Core)를 활용한 구구단 출력</h1>
</div>

<div>
	<form action="">
		원하는 단 입력 <input type="text" name="dan" class="txt"/><br><br>
		<button type="submit" class="btn">결과 확인</button>
	</form>
</div>

<div>
	<!-- 결과 처리 -->
	<%-- <c:if test="${!empty param.su }"> --%>
<%-- 	
	<c:if test="${!empty param.dan }"> <!-- 만약 null 값이 아닐 때 -->
	<ul>
		<c:forEach var="a" begin="1" end="9" step="1"> <!-- 곱하기 변수 -->
		<li>
			${param.dan} * ${a } = ${param.dan * a }<br>
		</li>
		</c:forEach>
	</ul>
	</c:if>
 --%>
 	<c:if test="${!empty param.dan }"> <!-- 만약 dan이 null 값이 아닐 때 -->
 		<ul>
 			<c:forEach var="a" begin="1" end="9" step="1"> <!-- 곱하기 변수 -->
 			<li>
 				${param.dan } * ${a } = ${param.dan * a }<br>
 			</li>
 			</c:forEach>
 		</ul>
 	</c:if>
</div>

</body>
</html>