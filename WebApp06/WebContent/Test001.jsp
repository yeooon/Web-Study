<%@ page contentType="text/html; charset=UTF-8"%>
<%-- <%@ page buffer="8kb" autoFlush="true"%> --%>
<%-- <%@ page buffer="1kb" autoFlush="false" %> --%>
<%-- <%@ page buffer="10kb" autoFlush="false"%> --%>
<%@ page buffer="1kb" autoFlush="true"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test001</title>
</head>
<body>

<div>
	<h1>page 디렉티브 buffer 속성 및 autoFlush 실습</h1>
	<hr>
</div>

<div>
	<h2>반복문 구성</h2>
</div>

	<% 
	for(int i=1; i<=1000; i++)
	{
	%>1234<%
	}
	%>

</body>
</html>