<%@page import="com.test.MemberScoreDTO"%>
<%@page import="com.test.MemberDTO"%>
<%@page import="com.test.MemberScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%

// 스트링 버퍼 객체 생성
// DAO 객체 생성
// 테이블 만들기 시작해야겠죠?
// try catch --> 데이터베이스 연결 --> 테이블 생성 str.append

	StringBuffer str = new StringBuffer();
	MemberScoreDAO dao = new MemberScoreDAO();
	
	String memberCount = "<spand id='memberCount'>전체 인원 수 : ";
		
	try
	{
		dao.connection();
		str.append("<table class='table'>");
		str.append("<tr>");
		str.append("<th class='numTh' style='width: 50px;'>번호</th>");
		str.append("<th class='nameTh' style='width: 100px;'>이름</th>");
		str.append("<th style='width: 150px;'>국어점수</th>");
		str.append("<th style='width: 200px;'>영어점수</th>");
		str.append("<th style='width: 200px;'>수학점수</th>");
		str.append("<th style='width: 200px;'>총점</th>");
		str.append("<th style='width: 200px;'>평균</th>");
		str.append("<th style='width: 200px;'>석차</th>");
		str.append("<th style='width: 200px;'>성적 처리</th>");
		str.append("</tr>");
		
		for(MemberScoreDTO score : dao.lists())
		{
			str.append("<tr>");
			str.append("<th>"+ score.getSid() +"</th>");
			str.append("<td>"+ score.getName() +"</td>");
			str.append("<td class='txtScore'>"+ score.getKor() +"</td>");
			str.append("<td class='txtScore'>"+ score.getEng() +"</td>");
			str.append("<td class='txtScore'>"+ score.getMat() +"</td>");
			str.append("<td class='txtScore'>"+ score.getTot() +"</td>");
			str.append("<td class='txtScore'>"+ String.format("%.2f", score.getAvg()) +"</td>");
			str.append("<td class='txtScore'>"+ score.getRank() +"</td>");
			
			// 성적 처리 항목(입력, 수정, 삭제)
			/*
			str.append("<td>");
			str.append("<a href = 'MemberScoreInsertForm.jsp?sid='"+score.getSid()+"'>");
			str.append("<button type='button' class='btn01'>입력</button></a>");
			str.append("<a href = 'MemberScoreUpdateForm.jsp?sid='"+score.getSid()+"'>");
			str.append("<button type='button' class='btn01'>수정</button></a>");
			str.append("<a href='javascript:memberScoreDelete(" + score.getSid() + ", \"" + score.getName() + "\")'>");
			str.append("<button type='button' class='btn01'>삭제</button></a>");
			str.append("</td>");
			str.append("</tr>");
			*/
			
			// 성적이 입력되어있지 않은 경우 : 입력버튼만 활성화 해 놓기
			if(score.getKor()==-1 && score.getEng()==-1 && score.getMat()==-1)
			{
				str.append("<td>");
				
				// ★★★계속 null 값 뜨던 이유 → 이 친구를 연결 안 해줬기 때문에...★★★
				str.append("<a href='MemberScoreInsertForm.jsp?sid="+ score.getSid() +"'>");
				str.append("<button type='button' class='btn01'>");
				str.append("입력");
				str.append("</button>");
				str.append("</a>");
				
				str.append("<button type='button' class='btn02' disabled='disabled'>");
				str.append("수정");
				str.append("</button>");
				str.append("<button type='button' class='btn02' disabled='disabled'>");
				str.append("삭제");
				str.append("</button>");
				
				str.append("</td>");

			}
			else // 성적이 입력 된 경우 : 수정, 삭제 버튼 활성화 해 놓기
			{
				str.append("<td>");
				str.append("<button type='button' class='btn02' disabled='disabled'>");
				str.append("입력");
				str.append("</button>");

				str.append("<a href='MemberScoreUpdateForm.jsp?sid="+ score.getSid() +"'>");				
				str.append("<button type='button' class='btn01'>");
				str.append("수정");
				str.append("</button>");
				str.append("</a>");
				str.append("<a href='javascript:memberScoreDelete(" + score.getSid() + ", \"" + score.getName() + "\")'>");
				str.append("<button type='button' class='btn01'>");
				str.append("삭제");
				str.append("</button>");
				str.append("</a>");
				
				str.append("</td>");
			}
			
			
		}
		str.append("</table>");
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

<script type="text/javascript">

	function memberScoreDelete(sid, name)
	{
		alert("지울거에유~");
		
		// ※ name 문자열 넘기는 과정에서 따옴표 구성에 주의할 것~!!!
		var res = confirm("정말로 " + name + "의 성적 데이터를 모두 지우시겠습니까?");
		
		if (res)
		{
			window.location.href="MemberScoreDelete.jsp?sid=" + sid;
		}
	}

</script>

</head>
<body>

<div>
	<h1>회원 <span style="color: blue">성적</span> 관리 및 출력 페이지</h1>
	<hr />
</div>

<div>
	<a href="MemberSelect.jsp"><button type="button">회원 명단 관리</button></a>
</div>

<!-- 번호 이름 국어점수 영어점수 수학점수 총점 평균 석차 	성적 처리-->
<!--  				...										입력 수정 삭제 -->

<div>
<!-- 
	<form action="">
		<table class="table">
			<tr>
			<th style="width: 50px;">번호</th>
			<th style="width: 100px;">이름</th>
			<th style="width: 150px;">국어점수</th>
			<th style="width: 200px;">영어점수</th>
			<th style="width: 200px;">수학점수</th>
			<th style="width: 200px;">총점</th>
			<th style="width: 200px;">평균</th>
			<th style="width: 200px;">석차</th>
			<th style="width: 200px;">성적 처리</th>
			</tr>
			<tr>
				<th>1</th>
				<td>이브이</td>
				<td>80</td>
				<td>80</td>
				<td>80</td>
				<td>240</td>
				<td>80</td>
				<td>1</td>
				<td>
					<a><button type="button" class="btn01">입력</button></a>
					<a><button type="button" class="btn01">수정</button></a>
					<a><button type="button" class="btn01">삭제</button></a>
				</td>
			</tr>
		</table>
	</form>
 -->
</div>

<div>
	<%=str.toString() %>
</div>

</body>
</html>