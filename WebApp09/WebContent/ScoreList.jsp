<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 결과값 변수 
	String str = "";

	// 데이터베이스 연결
	Connection conn = DBConn.getConnection();
	
	// 쿼리문 준비 (select)
	String sql = "SELECT SID, NAME, KOR, ENG, MAT,(KOR+ENG+MAT) AS TOT,(KOR+ENG+MAT)/3 AS AVG FROM TBL_SCORE ORDER BY SID";
	
	// 작업 객체 생성 및 준비된 쿼리문 수행
	Statement stmt = conn.createStatement();
	
	ResultSet rs = stmt.executeQuery(sql);
	
	// 결과 ResultSet 에 대한 처리 → 반복문 처리
	str += "<table class='table'>";
	str += "<tr>";
	str += "<th id='numTitle'>번호</th>";
	str += "<th id='nameTitle'>이름</th>";
	str += "<th id='korTitle'>국어점수</th>";
	str += "<th id='engTitle'>영어점수</th>";
	str += "<th id='matTitle'>수학점수</th>";
	str += "<th id='totTitle'>총점</th>";
	str += "<th id='avgTitle'>평균</th>";
	str += "</tr>";
	
	// 밑에 결과를 넣어줘요
	while(rs.next())
	{
		str += "<tr>";
		str += "<td class='list'>" + rs.getString("SID") + "</td>";
		str += "<td class='list'>" + rs.getString("NAME") + "</td>";
		str += "<td class='list'>" + rs.getString("KOR") + "</td>";
		str += "<td class='list'>" + rs.getString("ENG") + "</td>";
		str += "<td class='list'>" + rs.getString("MAT") + "</td>";
		str += "<td class='list'>" + rs.getString("TOT") + "</td>";
		str += "<td class='list'>" + String.format("%.1f", rs.getDouble("AVG")) + "</td>";
		str += "</tr>";
	}
	
	str += "</table>";
	
	rs.close();
	stmt.close();
	DBConn.close();
	

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

	<%=str %>

</body>
</html>












