<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<script type="text/javascript">
	function sendIt()
	{
		var f = document.myForm;
		
		//alert("확인");
		
		f.submit();
	}

</script>

</head>
<body>

<div>
	<h1>데이터 입력</h1>
	<hr />
</div>
			<!-- 
			com.test.FriendDTO.java
			Friend_ok.jsp
			 -->
<div>
	<form action="Friend_ok.jsp" method="post" name="myForm">
		<table class="table">
			<tr>
				<th>이름(*)</th>
				<td>
					<input type="text" class="txt" name="name"/>
				</td>
			</tr>
			<tr>
				<th>나이</th>
				<td>
					<input type="text" class="txt" name="age"/>
				</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<label>
						<input type="radio" name="gender" id="male" value="남자" />남자
					</label>
					<label>
						<input type="radio" name="gender" id="female" value="여자" />여자
					</label>					
				</td>
			</tr>
			<tr>
				<th>이상형</th>
				<td>
					<label>
						<input type="checkbox" name="idelType" id="t1" value="카리나" />카리나
					</label>	
					<label>
						<input type="checkbox" name="idelType" id="t2" value="수지" />수지
					</label>
					<label>
						<input type="checkbox" name="idelType" id="t3" value="카리나" />김지수
					</label>
					<label>
						<input type="checkbox" name="idelType" id="t4" value="유재석" />유재석
					</label>
					<label>
						<input type="checkbox" name="idelType" id="t5" value="남주혁" />남주혁
					</label>
					<label>
						<input type="checkbox" name="idelType" id="t6" value="박보검" />박보검
					</label>																												
				</td>
			</tr>	
				<td colspan="2">
					<button type="button" onclick="sendIt()" class="btn">
					등록</button>
				</td>
				
		</table>
	</form>
</div>

</body>
</html>