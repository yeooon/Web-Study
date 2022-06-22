<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSession01.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<script type="text/javascript">

	function sendIt()
	{
		
		//alert("테스트");
		
		var f = document.myForm;
		
		if (!f.userName.value)
		{
			alert("이름을 입력해야 합니다~!!!");
			f.userName.focus();
			return;
		}
		
		if (!f.userTel.value)
		{
			alert("전화번호를 입력해야 합니다~!!!");
			f.userTel.focus();
			return;
		}
		
		f.submit();
	}

	</script>

</head>
<body>

<!-- 
	○ TestSession01.jsp 에서 TestSession02.jsp 로
	이름과 전화번호를 입력받아 전송
	
	TestSession02.jsp 에서 TestSession03.jsp 로 
	아이디와 패스워드를 입력받고 
	앞에서 전달받은 이름과 전화번호를 함께 전송
	
	TestSession03.jsp 에서 전달받은 이름, 전화번호, 아이디, 패스워드 출력
	
	01 →→→→→→→→→ 02 →→→→→→→→→→ 03
	이름, 전화				 아이디, 패스워드	    이름, 전화, 아이디, 패스워드
	입력					 입력					출력

				- getParameter				- getAttribute 
				
	※ 즉, 01 에서 02 로 넘겨받을 땐 getParameter
	   02 에서 03으로 넘겨받을 땐 getParameter 와 getAttribute 로 세션 활용
	   01 에서 03으로 넘겨줄 수 없기 때문에 세션(session)에 저장
	   
	※ session 외에 input 태그 hidden 속성을 이용한 정보 전달 가능 			
 -->

	<div>
		<h1>이름과 전화번호(TestSession01.jsp)</h1>
	</div>
				
	<div>
		<form action="TestSession02.jsp" method="post" name="myForm">
		<table>
			<tr>
				<th>이름</th>
				<td>
					<input type="text" id="userName" name="userName" class="txt"/>
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
					<input type="text" id="userTel" name="userTel" class="txt"/>
				</td>
			</tr>
			<tr>
				<td>
					<button type="button" id="btn" class="btn" onclick="sendIt()">입력</button>
				</td>
			</tr>	
			</form>						
		</table>
	</div>

</body>
</html>