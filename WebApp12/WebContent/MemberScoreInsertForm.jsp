<%@page import="com.test.MemberScoreDTO"%>
<%@page import="com.test.MemberScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%	
	request.setCharacterEncoding("UTF-8");

	// sid 수신
	// 수신한 sid 를 가지고 회원 데이터 조회
	// 조회해서 얻어낸 데이터를 폼에 구성
	// 이전 페이지(MemberScoreSelect.jsp)로부터 데이터 요청(request)

	String sid = request.getParameter("sid");
	String name = "";
	
	// name을 조회하기 위한 dao 인스턴스 생성
	MemberScoreDAO dao = new MemberScoreDAO();
	
	try
	{
		// 데이터베이스 연결
		dao.connection();
		
		// 수신한 sid를 활용하여 name 얻어내기
		MemberScoreDTO member = dao.search(sid);
		name = member.getName();
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			dao.close();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberScoreInsertForm.jsp</title>
<link rel="stylesheet" type="text/css" href="css/MemeberScore.css">

<script type="text/javascript">


	function memberScoreSubmit()
	{
		alert("입력완료~^-^");
		
		// 입력한 정보 다 불러오기, 폼, 이름, 메세지, 점수들 등
		// 아무것도 안 쓸 때는 없다고 표기하기
		// 만약 내용이 없으면 inline 해주기 
		// form 을 직접 지정하여 submit 액션 수행
		
		var memberScoreform = document.getElementById("memberScoreForm");
		
		var kor = document.getElementById("kor");
		var eng = document.getElementById("eng");
		var mat = document.getElementById("mat");
		
		var korMsg = document.getElementById("korMsg");
		var engMsg = document.getElementById("engMsg");
		var matMsg = document.getElementById("matMsg");
		
		korMsg.style.display = "none";
		engMsg.style.display = "none";
		matMsg.style.display = "none";

		
		if (kor.value == "" || Number(kor.value)>100 || Number(kor.value)<0 || isNaN(kor.value))
		{
			korMsg.style.display = "inline";
			kor.focus();
			return;
		}
		
		if (eng.value == "" || Number(eng.value)>100 || Number(eng.value)<0 || isNaN(eng.value))
		{
			engMsg.style.display = "inline";
			eng.focus();
			return;
		}
		
		if (mat.value == "" || Number(mat.value)>100 || Number(mat.value)<0 || isNaN(mat.value))
		{
			matMsg.style.display = "inline";
			mat.focus();
			return;
		}
		
		memberScoreform.submit();
		//alert("입력완료?"); → 여기까지 안옴
	}//end memberScoreSubmit();
	
	function memberScoreReset()
	{
		//확인
		alert("취소했슈~");
		//아무것도 써지지 않은 상태로 돌아가야하는데...
		var memberScoreform = document.getElementById("memberScoreForm");
		
		var kor = document.getElementById("kor");
		var eng = document.getElementById("eng");
		var mat = document.getElementById("mat");
		
		var korMsg = document.getElementById("korMsg");
		var engMsg = document.getElementById("engMsg");
		var matMsg = document.getElementById("matMsg");
		
		korMsg.style.display = "none";
		engMsg.style.display = "none";
		matMsg.style.display = "none";
		
		// form을 직접 지정하여 rest 액션 수행
		memberScoreForm.reset();
		kor.focus();	// 이름으로 돌아가용
	}

</script>

</head>
<body>

<div>
	<h1>회원<span style="color: pink;">성적</span> 관리
		  및<span style="color: pink;">입력</span> 페이지</h1>
</div>

<div>
	<a href="MemberScoreSelect.jsp"><button type="button">회원 성적 관리</button></a>
</div>

<div>
	<!-- 회원 성적 데이터 입력 폼 -->
	<form action="MemberScoreInsert.jsp?sid=<%=sid %>" method="post" id="memberScoreForm">
		<table class="table">
		<tr>
			<th>번호</th>
			<td>
				<%=sid %>
			</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>
				<%=name%>
			</td>
			<td>
			</td>
		</tr>
		<tr>
			<th>국어점수</th>
			<td>
				<input type="text" id="kor" name="kor" class="txtScore"/>
			</td>
			<td>
				<span class="errMsg" id="korMsg">0 ~ 100 사이의 국어점수를 입력해야 합니다.</span>
			</td>
		</tr>
		<tr>
			<th>영어점수</th>
			<td>
				<input type="text" id="eng" name="eng" class="txtScore"/>
			</td>
			<td>
				<span class="errMsg" id="engMsg">0 ~ 100 사이의 영어점수를 입력해야 합니다.</span>
			</td>
		</tr>
		<tr>
			<th>수학점수</th>
			<td>
				<input type="text" id="mat" name="mat" class="txtScore"/>
			</td>
			<td>
				<span class="errMsg" id="matMsg">0 ~ 100 사이의 수학점수를 입력해야 합니다.</span>
			</td>
		</tr>						
	</table>
	<br>


	<a href="javascript:memberScoreSubmit()"><button type="button">입력하기</button> </a>
	<!-- ↓ 이 친구 새로고침처럼 작동되고 있음 -->
	<!-- <a href=""><button type="button">취소하기</button> </a> -->
	<a href="javascript:memberScoreReset()"><button type="button">취소하기</button> </a>
	<a href="MemberScoreSelect.jsp"><button type="button">목록으로</button> </a>

	</form>
</div>
</body>
</html>