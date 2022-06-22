<%@ page contentType="text/html; charset=UTF-8"%>
<% 

	// 이전 페이지로(Send05.html)부터 넘어온 데이터 수신 → dan
	String danStr = request.getParameter("DAN");
	
	int dan = 0;
	String result = "";
	
	try
	{
		dan = Integer.parseInt(danStr);
		
		for(int i=1; i<=9; i++)
		{
			result += String.format("%d * %d = %d<br>", dan, i, (dan*i));
		}	
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
<title>Receive05.jsp</title>
</head>
<body>

<div>
	<%=result %>

</div>

</body>
</html>