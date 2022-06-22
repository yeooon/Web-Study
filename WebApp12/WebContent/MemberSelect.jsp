<%@page import="com.test.MemberDTO"%>
<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스트링 버퍼 객체 생성
	// DAO 객체 생성
	// 테이블 만들기 시작해야겠죠?
	// try catch --> 데이터베이스 연결 --> 테이블 생성 str.append

	StringBuffer str = new StringBuffer();
	//참고(추가한 부분) ↓	
	MemberDAO dao = new MemberDAO();
	
	String MemberCount = "<span id='memberCount'>전체 인원 수 : ";
	
	try
	{	
		// 참고
		dao.connection();
		/*dao = new MemberDAO(); */
		/*MemberCount += dao.count(); */
		
		str.append("<table class='table'>");
		str.append("<tr><th style='width: 50px;'>번호</th>");
		str.append("<th style='width: 100px;'>이름</th>");
		str.append("<th style='width: 150px;'>전화번호</th>");
		str.append("<th style='width: 200px;'>회원관리</th></tr>");
		
		
		// member에 dao.list 범위를 넣겠다.
		for (MemberDTO member: dao.lists())
		{
			str.append("<tr><td>"+ member.getSid()+"</td>");
			str.append("<td>"+ member.getName()+"</td>");
			str.append("<td>" + member.getTel() + "</td>");
			str.append("<td><a href = 'memberUpdateForm.jsp?sid="+ member.getSid() +"'>");
			str.append("<button type='button' class='btn01'>수정</button></a>");
			
			// memberDelete(1, '고길동')
			// ※ 자바스크립트에서 사용할 수 있는
			// 따옴표의 종류 : ①"" ②'' ③\"\"
			// 일반적으로 따옴표가 두 번 중첩되어 사용하게 되면
			// ①과 ②를 사용하면 된다.
			// 하지만, 따옴표가 세 번 중첩되어 사용될 경우 
			// ③ escape 를 사용해야 한다.
			
			str.append("<a href='javascript:memberDelete(" + member.getSid() + ", \"" + member.getName() + "\")'>");
			str.append("<button type='button' class='btn01'>삭제</button>");
			str.append("</a></td><tr>");
		}
		str.append("</table>");
		//javascript:memberDelete(,\\)
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
<title>MemberSelect.jsp</title>
<link rel="stylesheet" type="text/css" href="css/MemberScore.css">
<style type="text/css">
	a {text-decoration: none;}
</style>

<script type="text/javascript">
	
	function memberDelete(sid, name)
	{
		// 확인
		alert("지울거에유~");
		
		// 확인
		//alert("번호 : " + sid + ", 이름 : " + name)
		var res = confirm("번호 : " + sid + ", 이름 : " + name + "\n이 회원의 정보를 정말 삭제하시겠습니까?");
		
		// 확인
		// alert(res);
		// confirm() 함수를 통해 호출되는 창은
		// 확인 -> true / 취소 -> false 를 반환하게 된다.
		
		if (res)
		{
			window.location.href="MemberDelete.jsp?sid=" +sid;
		}
	}
</script>

</head>
<body>

<div>
	<h1>회원<span style="color: pink">명단</span>관리 및 출력 페이지</h1>
	<hr />
</div>

<div>
	<a href="MemberScoreSelect.jsp"><button type="button" onsubmit="return formCheck()">회원 성적 관리</button></a>
	<a href="MemberInsertForm.jsp"><button type="button">신규 회원 등록</button></a>
</div>


<div>
	<!-- 리스트 출력 -->
	<!-- DB에서 받아낸 내용으로 틀을 잡아봐라... -->
	
	<!-- <table class="table">
		<tr>
			<th style="width: 50px;">번호</th>
			<th style="width: 100px;">이름</th>
			<th style="width: 150px;">전화번호</th>
			<th style="width: 200px;">회원관리</th>
		</tr>
		<tr>
			<td>1</td>
			<td>희동이</td>
			<td>010-1111-1111</td>
			<td>
				<a><button type="button" class="btn01">수정</button></a>
				<a><button type="button" class="btn01">삭제</button></a>
			</td>
		</tr>
		<tr>
			<td>2</td>
			<td>도우너</td>
			<td>010-2222-2222</td>
			<td>
				<a><button type="button" class="btn01">수정</button></a>
				<a><button type="button" class="btn01">삭제</button></a>
			</td>
		</tr>
		<tr>
			<td>3</td>
			<td>마이클</td>
			<td>010-3333-3333</td>
			<td>
				<a><button type="button" class="btn01">수정</button></a>
				<a><button type="button" class="btn01">삭제</button></a>
			</td>
		</tr>
	</table> -->
</div>

<div>
 <%-- <%=MemberCount %> --%>
 <%=str.toString() %>
</div>

</body>
</html>