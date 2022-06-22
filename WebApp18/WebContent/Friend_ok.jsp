<%@ page contentType="text/html; charset=UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="ob" class="com.test.FriendDTO"></jsp:useBean>
<jsp:setProperty property="*" name="ob"/>

<!-- 다중 선택으로 넘어온 이상형 값을 출력하기 위한 처리 -->

<%

	String str = "";
	if(ob.getIdelType() != null)
	{
		for(String temp : ob.getIdelType())
			str += temp + " ";
	}

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Friend_ok.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>


이름 : <%=ob.getName() %><br>
나이 : <%=ob.getAge() %><br>
성별 : <%=ob.getGender() %><br>
이상형 : <%=str %><br>

</body>
</html>