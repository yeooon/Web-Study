<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//숫자 데이터 수신
	String garoStr = request.getParameter("su1");
	String seroStr = request.getParameter("su2");
	
	int garo = 0;
	int sero = 0;
	
	// 테이블 안에서 1씩 증가시켜 나갈 변수 선언 및 초기화 
	int n = 0;
	
	try
	{
		garo = Integer.parseInt(garoStr);
		sero = Integer.parseInt(seroStr);
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습05</h1>
	<hr>
	<p>Table.jsp ● → TableOk.jsp ○</p>
</div>

<div>

<!-- 테이블 제작
	<table border="1"> 
	for(int i=0; i < garo; i++)
	{
		<tr>
		for(int j=0; j < sero; j++)
		{
			<td style="width: 40px; text-align: right;"></td>	
		}
		</tr>
	}
	</table>
 -->
 
	<table border="1">
	<% 
	for(int i=0; i < sero; i++)
	{
	%>
		<tr>
		<%
		for(int j=0; j < garo; j++)
		{
			 %>
			<td style="width: 40px; text-align: right;"><%=++n %></td>	
		<%	
		}
		%>
		</tr>
	<%	
	}
	%>
	</table>
</div>


</body>
</html>