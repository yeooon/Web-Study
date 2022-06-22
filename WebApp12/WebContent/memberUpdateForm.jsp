<%@page import="com.test.MemberDTO"%>
<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// sid 수신
	// 수신한 sid 를 가지고 회원 데이터 조회
	// 조회해서 얻어낸 데이터를 폼에 구성
	// 이전 페이지로부터 데이터 요청(request)
	
	// sid 수신
	// 번호랑 이름은 그대로 불러오고
	// kor, eng, mat는 아무거나 들어갈 수 있음
	// 이것들을 조회하기 위해 dao 인스턴스 생성
	// try catch 데이터베이스 연결, dto 객체 생성, 요소들 불러오기
	
	String sid = request.getParameter("sid");

	// name 과 tel엔 아무거나 들어갈 수 있음.
	String name = "";
	String tel = "";
	
	// name을 조회하기 위해 dao 인스턴스 생성
	MemberDAO dao = new MemberDAO();
	
	try
	{
		// 데이터베이스 연결
		dao.connection();
		
		MemberDTO member = dao.searchMember(sid);
		name = member.getName();
		tel = member.getTel();
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
<title>MemberUpdateFrom.jsp</title>
<link rel="stylesheet" type="text/css" href="css/MemeberScore.css">

<script type="text/javascript">

function memberSubmit()
{
	// 확인
	alert("입력완료~^-^");
	
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
	<h1>회원<span style="color: red;"> 수정 </span> 페이지 </h1>
</div>

<div>
	<a href="MemberSelect.jsp"><button type="button">회원 명단 관리</button></a>
</div>
<br>

<div>
	<!-- 회원 데이터 수정 폼 구성 -->
	<form action="MemberUpdate.jsp?sid=<%=sid %>" method="post" id="memberForm">
	<table class="table">
		<tr>
			<th>이름</th>
			<td>
				<input type="text" id="uName" name="uName" value="<%=name%>"/>
			</td>
			<td>
				<span class="errMsg" id="nameMsg">이름을 입력해야 합니다.</span>
			</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td>
				<input type="text" id="uTel" name="uTel" value="<%=tel%>"/>
			</td>
			<td>
			</td>
		</tr>
	</table>
	<%-- <input type="hidden" name="sid" value="<%=sid%>"> --%> <!-- 숨겨놓는 요소-->
	<br />
		  <!-- 이부분들이 작동을 안함... 함수는 되는데 어째서? 확인해야함 -->
		  <!-- 위에 style.display 를 tyle.display 로 오타내서. -->
	<a href="javascript:memberSubmit()"><button type="button">수정하기</button> </a>
	<a href="javascript:memberReset()"><button type="button">취소하기</button> </a>
	<a href="javascript:memberSelect.jsp()"><button type="button">목록으로</button> </a>
	
	</form>
</div>

</body>
</html>