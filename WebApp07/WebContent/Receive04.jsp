<%@ page contentType="text/html; charset=UTF-8"%>
<% 

	// 데이터 수신(Send04.html → Receive04.jsp)

	request.setCharacterEncoding("UTF-8");

	String idStr = request.getParameter("id");
	String pwdStr = request.getParameter("pwd");
	String nameStr = request.getParameter("name");
	String telStr = request.getParameter("tel");
	
	String genderStr = request.getParameter("gender");
	String cityStr = request.getParameter("city");
	
	//String usStr = request.getParameter("UserSubject");
	//check~!!!
 	String[] userArr = request.getParameterValues("UserSubject");
 	
 	String subject = "";
 	
 	if(userArr != null)
 	{
 		for(String item : userArr)
 		{
 			subject += "[" + item + "]";
 		}
 	}
	
 	// ※ 추후에는 수신된 데이터를... 쿼리문을 통해 DB 에 입력하는
 	// 처리 과정 등이 포함될 것임을 염두하며 작업을 진행할 수 있도록 하자.


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive04.jsp</title>
</head>
<body>

<div>
	<h1>데이터 송수신 실습</h1>
</div>

<div>
	<h2>가입 승인 내역</h2>
	
	<p>아이디 : <%=idStr %></p>
	<p>패스워드 : <%=pwdStr %></p>
	<p>이름 : <%=nameStr %></p>
	<p>전화번호 : <%=telStr %></p>
	<p>성별 : <%=genderStr %></p>
	<p>지역 : <%=cityStr %></p>
	<p>수강과목 : <%=subject %></p>	
</div>

</body>
</html>