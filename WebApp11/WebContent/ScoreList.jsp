<%@page import="com.test.ScoreDTO"%>
<%@page import="com.test.ScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	StringBuffer str = new StringBuffer();

	ScoreDAO dao = null;
	
	String scoreCount = "<span id = 'scoreCount'>전체 인원 수 : ";
	
	try
	{
		dao = new ScoreDAO();
		
		scoreCount += dao.count() + "명</span>";
		
		str.append("<table class='table'>");
		str.append("<tr><th>번호</th><th>이름</th><th>국어점수</th><th>영어점수</th><th>수학점수</th><th>총점</th><th>평균</th></tr>");
		
		for(ScoreDTO score : dao.lists())
		{
			str.append("<tr>");
			str.append("<td class='record'>" + score.getSid() + "</td>");
			str.append("<td class='record'>" + score.getName() + "</td>");
			str.append("<td class='record'>" + score.getKor() + "</td>");
			str.append("<td class='record'>" + score.getEng() + "</td>");
			str.append("<td class='record'>" + score.getMat() + "</td>");
			str.append("<td class='record'>" + score.getTot() + "</td>");
			//str.append("<td class='record'>" + score.getAvg() + "</td>");
			str.append("<td class='record'>" + String.format("%.1f", score.getAvg()));
			str.append("</tr>");			
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
	
	/* 이상태로는 이름이랑 점수가 전부 null, 0값이 뜬다 */
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ScoreList</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<style type="text/css">
	.errMsg {color: red; display: none;}	
</style>

<script type="text/javascript">
function formCheck()
{
	//alert("입력 완료~!!");
	
	var uName = document.getElementById("UserName");
	var uKor = document.getElementById("UserKor");
	var uEng = document.getElementById("UserEng");
	var uMat = document.getElementById("UserMat");
	
	var uErr = document.getElementById("nameErr");
	var ukorErr = document.getElementById("korErr");
	var uengErr = document.getElementById("engErr");
	var umatErr = document.getElementById("matErr");
	
	uErr.style.display = "none";
	ukorErr.style.display = "none";
	uengErr.style.display = "none";
	umatErr.style.display = "none";
	
	// 이름 필수 입력 사항
	if (uName.value == "")
	{
		uErr.style.display = "inline";
		uErr.focus();	// focus() 입력상태
		return false;		
	}
	
	if (uKor.value=="" || isNaN(uKor.value) || Number(uKor.value)<0 || Number(uKor.value)>100)
	{
		ukorErr.style.display = "inline";
		ukorErr.focus();
		return false;	
	}
	
	if (uEng.value=="" || isNaN(uEng.value) || Number(uEng.value)<0 || Number(uEng.value)>100)
	{
		uengErr.style.display = "inline";
		uengErr.focus();
		return false;	
	}
	
	if (uMat.value=="" || isNaN(uMat.value) || Number(uMat.value)<0 || Number(uMat.value)>100)
	{
		umatErr.style.display = "inline";
		umatErr.focus();
		return false;	
	}

	return true;
}

</script>

</head>
<body>

<!-- 

호냥냥
	○ WebApp09
	
	   - 여러 명의 이름, 국어점수, 영어점수, 수학점수를 입력받아
	   총점과 평균을 계산하여 출력해줄 수 있는 프로그램을 구현한다.
	   - 리스트 출력 시 번호 오름차순 정렬하여 출력할 수 있도록 한다.
	   - 데이터베이스 연동하여 처리한다.
	   (TBL_SCORE, SCORESEQ 활용)
	   - 즉, 성적 처리 프로그램을 데이터베이스 연동하여
	   JSP로 구성할 수 있도록 한다.
	   
	   데이터베이스 연결 및 데이터 처리
	   ------------------------------------------------------------
	   성적 처리
	   
	   이름(*)	[ textbox ] → 이름 입력 확인
	   국어점수	[ textbox ] → 0 ~ 100 사이의 정수가 확인되었는지 확인
	   영어점수	[ textbox ] → 0 ~ 100 사이의 정수가 확인되었는지 확인
	   수학점수	[ textbox ] → 0 ~ 100 사이의 정수가 확인되었는지 확인
	   
	   < 성적 추가 >		→  button
	   
	   번호 	이름	국어점수 영어점수 수학점수     총점     평균 
	   1	  이시우	   90       80       70        240       80.0
	   2	  이윤태	   80       70       60        210       70.0
	   3	  홍은혜	   70       60       50        180       60.0

	○ WebApp09_scott.sql → 완료
	   ScoreList.jsp
	   ScoreInsert.jsp
	   com.util.DBConn.java → 완료
-->

<div>
	<h1>데이터베이스 연결 및 데이터 처리</h1>
	<hr>
</div>

<div>
	<form action="ScoreInsert.jsp" method="post" onsubmit="return formCheck();">
		<table class="table">
			<tr>
				<th>이름(*)</th>
				<td>
				<input type="text" class="txt" id="UserName" name="UserName"/>
				<span class="errMsg" id="nameErr">이름 입력 확인</span>
				</td>
			</tr>
			<tr>
				<th>국어점수</th>
				<td>
				<input type="text" class="txt" id="UserKor" name="UserKor"/>
				<span class="errMsg" id="korErr">0 ~ 100 사이의 정수가 확인되었는지 확인</span>				
				</td>
			</tr>
			<tr>
				<th>영어점수</th>
				<td>
				<input type="text" class="txt" id="UserEng" name="UserEng"/>
				<span class="errMsg" id="engErr">0 ~ 100 사이의 정수가 확인되었는지 확인</span>				
				</td>
			</tr>
			<tr>
				<th>수학점수</th>
				<td>
				<input type="text" class="txt" id="UserMat" name="UserMat"/>
				<span class="errMsg" id="matErr">0 ~ 100 사이의 정수가 확인되었는지 확인</span>				
				</td>
			</tr>
			<tr>
				<td>
				<button type="submit" id="btnAdd" class="btn">성적 추가</button>
				</td>
			</tr>						
		</table>
	</form>
</div>

<%=scoreCount %>
<%=str.toString() %>

</body>
</html>












