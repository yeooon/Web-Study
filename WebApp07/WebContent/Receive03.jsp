<%@ page contentType="text/html; charset=UTF-8"%>
<%

	String num1Str = request.getParameter("num1");
	String num2Str = request.getParameter("num2");
	String gihoStr = request.getParameter("giho");
	
	int num1=0;
	int num2=0;
	String result = "";

	try
	{
		num1 = Integer.parseInt(num1Str);
		num2 = Integer.parseInt(num2Str);	

		// valueOf = 정수타입으로 변환하는 메소드 = Integer 객체로 만들어서 반환함
		if(gihoStr.equals("+"))
			result = String.valueOf(num1+num2);
		else if(gihoStr.equals("-"))
			result = String.valueOf(num1-num2);
		else if(gihoStr.equals("*"))
			result = String.valueOf(num1*num2);
		else if(gihoStr.equals("/"))
		{
			//result = String.valueOf(num1/num2);
			//result = String.valueOf(num1/(double)num2);
			result = String.format("%.1f",(num1/(double)num2));
		}
		
		//String.format = 문자열의 형식을 설정하는 메소드. ↑ 위에서 사용한 건 실수형
		
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
<title>Receive03.jsp</title>
</head>
<body>

<div>
	<h1>데이터 송수신 실습</h1>
</div>

<div>

『입력하신 <%=num1 %>와(과) <%=num2 %>의 연산 결과는 <%=result %>입니다.』

</div>

</body>
</html>