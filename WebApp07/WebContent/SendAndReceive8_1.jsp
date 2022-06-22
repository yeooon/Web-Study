<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%

	//② 요일 표시

	//① ◀ 할시 오류 뜸
	//③ 다음달이 +1돼서 표기됨 → 날짜 출력에서 < → <=로 바꿈 

	// 만년달력 calendar 사용 ------------------------
	String sYear = request.getParameter("year");
	String sMonth = request.getParameter("month");
	
	//Calendar 객체 생성
	Calendar cal = Calendar.getInstance();
	
	//현재 연, 월, 일 받아오기
	int nowYear = cal.get(Calendar.YEAR);
	int nowMonth = cal.get(Calendar.MONTH)+1;
	int nowDay = cal.get(Calendar.DAY_OF_MONTH);
	
	//최초 페이지 요청 시 확인
	int selectYear = nowYear;
	int selectMonth = nowMonth;
	
	//최초 페이지가 아닐 경우
	if(sYear != null || sMonth != null)
	{
		selectYear = Integer.parseInt(sYear);
		selectMonth = Integer.parseInt(sMonth);
	}
	
	// → selectYear, selectMonth 사용
	
	// 1일의 요일과 그 달의 마지막 날짜를 알아내기
	// 날짜를 1일로 바꾼다.
	// 월은 0부터 시작한다.
	cal.set(selectYear, selectMonth-1, 1);
	
	// 요일 
	int date = cal.get(Calendar.DAY_OF_WEEK);
	
	// 그 달의 마지막 날짜
	int lastday = cal.getActualMaximum(Calendar.DATE);
%>	
	
<%
	//달력그리기------------------------------------------------	
	String calStr = "";
	
	calStr += "<table border = '1'>";
	calStr += "<tr>";
	
	//요일 출력
	String[] yoil = {"일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"};
	for(int i=0; i<yoil.length; i++)
	{
		if(i==0)
			calStr += "<th style='color:red'>"+ yoil[i] +"</th>"; 
		else if(i==6)
			calStr += "<th style='color:blue'>"+ yoil[i] +"</th>"; 
		else	
			calStr += "<th>"+ yoil[i] +"</th>";
	}
	
	//요일 뒤 개행용
	calStr += "</tr>";	
	calStr += "<tr>";
	
	//공백
	for(int i=1; i<date; i++)
		calStr += ("<td></td>");
	
	//1일부터 마지막 날짜까지 출력
	for(int i=1; i<=lastday; i++)
	{
		cal.set(selectYear, selectMonth-1, i);	//month는 0부터 시작
		date = cal.get(Calendar.DAY_OF_WEEK);
		
		if(date==1)	//date는 1부터 시작
			calStr += "<th style='color:red'>"+ i +"</th>"; 
		else if(date==7)
			calStr += "<th style='color:blue'>"+ i +"</th>"; 
		else	
			calStr += "<th>"+ i +"</th>";
		
		//토요일일 경우 개행
		if(date==7)
		{
			calStr += "</tr>";
			
			if(i<=lastday)
				calStr += "<tr>";
		}
	}
		
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive08.jsp</title>
</head>
<body>

<!-- 

	○ 데이터 송수신 실습 08
		- 달력을 출력하는 JSP 페이지를 구성한다.
		- 연도와 월을 입력받아 화면에 출력해주는 형태의 페이지로 구성한다.
		- 단, submit 버튼 없이 이벤트 처리를 한다.
		- 전송한 내용을 수신해서 출력해주는 형태의 단독 페이지로 구성한다.
		
		◀ 2020년 4월 ▶
		
		---------------------------------
		---------------------------------
		---------------------------------
		---------------------------------
		
	   - 『◀』이나 『▶』클릭 시
	   해당 년 월의 달력을 출력해주는 형태의 페이지로 구현한다.
	   
	   - 사용자 최초 요청 주소는 
	   http://localhost:8090/WebApp07/SendAndReceive08.jsp로 한다
	   
	   ○ SendAndReceive08.jsp

-->


<div>
	<h1>데이터 송수신 실습 08</h1>
	<hr>
</div>


<div>
	<!-- 년월 표기 -->	
<%-- 2022년 4월 표기됨 
	<select id="year" name="year" onchange=""><%=selectYear %></select>년
	<select id="month" name="month" onchange=""><%=selectMonth %></select>월
--%>	
	<a href="SendAndReceive08.jsp?year=<%=selectYear %>&month=<%=selectMonth-1 %>" class="btn">◀</a>
	<input type="text" id="year" style="width: 50px;" name="year" value="<%=selectYear %>" readonly="readonly">년
	<input type="text" id="month" style="width: 50px;" name="month" value="<%=selectMonth %>" readonly="readonly">월
	<a href="SendAndReceive08.jsp?year=<%=selectYear %>&month=<%=selectMonth+1 %>" class="btn">▶</a>
</div>


<div>
	<!-- 달력 그리는 부분 -->
	<%=calStr %>
</div>

</body>
</html>