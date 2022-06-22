<%@ page contentType="text/html; charset=UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");

	// 이전페이지에서 이름과 전화번호를 넘겨받은 상황
	String userName = request.getParameter("userName");
	String userTel = request.getParameter("userTel");
	
	// 다음페이지로 전달해주기 위해...
	session.setAttribute("userName", userName);
	session.setAttribute("userTel", userTel);


%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSession02.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<script type="text/javascript">

	function test()
	{
		
		//alert("테스트");
		
		var f = document.myForm;
		
		if (!f.userId.value)
		{
			alert("이름을 입력해야 합니다~!!!");
			f.userId.focus();
			return;
		}
		
		if (!f.userPwd.value)
		{
			alert("전화번호를 입력해야 합니다~!!!");
			f.userPwd.focus();
			return;
		}

		f.submit();
	}

	</script>

</head>
<body>
	
	<div>
		<h1>아이디와 패스워드(TestSession02.jsp)</h1>
	</div>


	<div>
		<form action="TestSession03.jsp" method="post" name="myForm">
		<table>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" id="userId" name="userId" class="txt"/>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="text" id="userPwd" name="userPwd" class="txt"/>
				</td>
			</tr>
			<tr>
				<td>
					<button type="button" id="btn" class="btn" onclick="test()">입력</button>
				</td>
			</tr>	
			</form>						
		</table>
	</div>

</body>
</html>