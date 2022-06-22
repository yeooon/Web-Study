<%@page import="com.test.MemberDTO"%>
<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberInsertForm.jsp</title>
<link rel="stylesheet" type="text/css" href="css/MemeberScore.css">

<script type="text/javascript">

	function memberSubmit()
	{
		// 확인
		alert("입력완료~^-^");
		
		// 입력한 정보 다 불러오기, 폼, 이름, 메세지, 점수들 등
		// 아무것도 안 쓸 때는 없다고 표기하기
		// 만약 내용이 없으면 inline 해주기 
		// form 을 직접 지정하여 submit 액션 수행
		
		var memberForm = document.getElementById("memberForm");
		var uName = document.getElementById("uName");
		var nameMsg = document.getElementById("nameMsg");
		
		nameMsg.style.display = "none";
		
		if (uName.value == "")
		{
			nameMsg.style.display = "inline";
			uName.focus();
			return;
		}
		
		// form 을 직접 지정하여 submit 액션 수행
		memberForm.submit();
	}
	
	function memberReset()
	{
		//확인
		alert("취소했슈~");
		//아무것도 써지지 않은 상태로 돌아가야하는데...
		var memberForm = document.getElementById("memberForm");
		var uName = document.getElementById("uName");
		var nameMsg = document.getElementById("nameMsg");
		
		nameMsg.style.display = "none";
		
		// form을 직접 지정하여 rest 액션 수행
		memberForm.reset();	// 전부 지우고
		uName.focus();	// 이름으로 돌아가용
	}

</script>

</head>
<body>

<div>
	<h1>회원<span style="color: pink;">명단</span> 관리
		  및<span style="color: pink;">입력</span> 페이지</h1>
</div>

<div>
	<a href="MemberSelect.jsp"><button type="button">회원 명단 관리</button></a>
</div>
<br>

<div>
	<!-- 회원 데이터 입력 폼 구성 -->
	<form action="MemberInsert.jsp" method="post" id="memberForm">
	<table class="table">
		<tr>
			<th>이름</th>
			<td>
				<input type="text" id="uName" name="uName"/>
			</td>
			<td>
				<span class="errMsg" id="nameMsg">이름을 입력해야 합니다.</span>
			</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td>
				<input type="text" id="uTel" name="uTel"/>
			</td>
			<td>
			</td>
		</tr>
	</table>
	<br />
		  <!-- 이부분들이 작동을 안함... 함수는 되는데 어째서? 확인해야함 -->
		  <!-- 위에 style.display 를 tyle.display 로 오타내서. -->
	<a href="javascript:memberSubmit()"><button type="button">입력하기</button> </a>
	<a href="javascript:memberReset()"><button type="button">취소하기</button> </a>
	<a href="javascript:memberSelect.jsp()"><button type="button">목록으로</button> </a>
	
	</form>
</div>

</body>
</html>