<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send10.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습10</h1>
	<hr>
</div>

<!-- Send10.jsp → Send10_re.jsp → Receive10.jsp -->
<!-- Send10.jsp → Send10_for.jsp → Receive10.jsp -->

<!-- 사용자 최초 요청 페이지 -->
<!-- http://localhost:8090/WebAoo07/Send10.jsp -->

<div>
	<h2>포워딩 및 리다이렉트</h2>
</div>


<div>
	<!-- action 처리에 대한 분기~!!! -->
	<form action="" method="post" id="testForm">
		이름<input type="text" name="UserName" class="txt">
		<br><br>
		
		<!-- check -->
		<button type="submit" class="btn" style="width: 150px"
		onclick="this.form.action='Send10_re.jsp'">리다이렉트</button>
			<!-- 버튼 객체.버튼 객체가 몸담고 있는 form 객체 -->
		<button type="submit" class="btn" style="width: 150px"
		onclick="this.form.action='Send10_for.jsp'">포워드</button>
	</form>
</div>

</body>
</html>