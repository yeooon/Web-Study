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
<title>MemberInsertForm.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
</head>
<body>

<div>
	<h2>JSTL 코어(Core)를 활용한 회원 정보 입력</h2>
	<hr />
</div>

<div>
	<form action="MemberInsert.jsp">
	
		<!-- (이름, 전화번호, 주소) * 5명 분 -->
		<!-- → submit 액션 처리 -->
		<table class="table">
			<tr>
				<th>이름</th>
				<td>
					<!-- 				
					<input type="text" name="name1" id="name1" />
					<input type="text" name="name2" id="name2" />	
					<input type="text" name="name3" id="name3" />	
					<input type="text" name="name4" id="name4" />	
					<input type="text" name="name5" id="name5" />	
					 -->
					<c:forEach var="a" begin="1" end="5" step="1">
						이름${a}<input type="text" name="name${a }" id="name${a }" />	
					</c:forEach>
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
					<c:forEach var="a" begin="1" end="5" step="1">
						전화번호${a}<input type="text" name="tel${a }" id="tel${a }" />
					</c:forEach>				
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
					<c:forEach var="a" begin="1" end="5" step="1">
						주소${a}<input type="text" name="adress${a }" id="adress${a }"/>
					</c:forEach>					
				</td>
			</tr>
			
			<button type="submit" class="btn">결 과 확 인</button>
			
		</table>
	</form>
</div>

</body>
</html>