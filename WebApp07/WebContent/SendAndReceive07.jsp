<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%

	//① 반응을 안하고, 첫째줄 이후로는 달력이 안그려짐
	//② 셀렉트를 바꾸면 에러가 뜸
	
	String sYear = request.getParameter("year");
	String sMonth = request.getParameter("month");
	
	// Calender 객체 생성
	Calendar cal = Calendar.getInstance();
	
	// 현재 연, 월, 일 받아오기
	int NowYear = cal.get(Calendar.YEAR);
	int NowMonth = cal.get(Calendar.MONTH)+1;
	int NowDay = cal.get(Calendar.DAY_OF_MONTH);
	
	//받을 걸 최초 페이지 요청시 표시
	int selectYear = NowYear;
	int selectMonth = NowMonth;
	

	//페이지가 최초 요청이 아닐 시 받아온 값 넣어주기
	//여기가 문제가 아니다
	if(sYear != null || sMonth != null)
	{
		selectYear = Integer.parseInt(sYear);
		selectMonth = Integer.parseInt(sMonth);
	}

	
	// 확인한 날짜로 year <select> option 구성 → ok
	
	String yOptions = "";
	
	for(int year=(selectYear-10); year<=(selectYear+10);year++)
	{
		if(sYear==null && year==NowYear)
			yOptions += "<option value='" + year + "' selected='selected'>" + year + "</option>";
			//<option value='year' selected='selected'></option>
		else if(sYear!=null && Integer.parseInt(sYear)==year) 
			yOptions += "<option value='" + year + "' selected='selected'>" + year + "</option>";
		else
			yOptions += "<option value='" + year + "'>" + year + "</option>";
	
	}
	
	// 확인한 날짜로 month <select> option 구성 → ok
	String mOptions = "";
	for(int month=1; month<=12; month++)
	{
		if(sMonth==null && month==NowMonth)
			mOptions += "<option value='" + month + "' selected='selected'>" + month + "</option>";
			//<option value='year' selected='selected'></option>
		else if(sMonth!=null && Integer.parseInt(sMonth)==month) 
			mOptions += "<option value='" + month + "' selected='selected'>" + month + "</option>";
		else
			mOptions += "<option value='" + month + "'>" + month + "</option>";
	
	}	
	
	//만년 달력 그리기
	int[] months = {31,28,31,30,31,30,31,31,30,31,30,31};
	
	// 2월 윤년인 날 정해주기
	if(selectYear%4 == 0 && selectYear%100 != 0 || selectYear%400 == 0)
	{
		months[1] = 29;
	}	
	
	// 총 날 누적 년수
	int nalsu;
	
	// 요일 항목 구성
	String[] yoil = {"일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"};
	
	// 입력받은 년도 이전 년도까지 날 수 연산
	
	nalsu = (selectYear-1)*365 + (selectYear-1)/4 - (selectYear-1)/100 + (selectYear-1)/400;
	
	// 입력받은 월의 이전 월 까지 날 수 추가 연산
	for(int i=0; i<selectMonth-1; i++)
		nalsu += months[i];

	//각 달 1일 연산
	nalsu++;

	// 요일 계산
	int week = nalsu%7;
	
	// 마지막 날 계산
	int lastday = months[selectMonth-1];
	
	
	
	// 달력 그리기
	// calStr 이 달력이 될 것이다. → 여기다 값을 누적해나감
	String calStr = "";
	
	//<table border=1>누적
	calStr += "<table border=1>";
	
	//<tr>누적	
	calStr += "<tr>";	
	
	for(int i=0; i<yoil.length; i++)
	{
		if(i==0)		// 일요일은 빨간색
			calStr += "<th style='color:red'>"+ yoil[i] +"</th>"; // 요일 출력
		else if(i==6)	// 토요일은 파란색
			calStr += "<th style='color:blue'>"+ yoil[i] +"</th>"; // 요일 출력
		else			// 나머지는 까만색
			calStr += "<th>"+ yoil[i] +"</th>"; // 요일 출력
	}
	
	calStr += "</tr>";	
	
	calStr += "<tr>";
	
	// 빈 칸에 공백 td 발생
	for(int i=1; i<=week; i++)
		calStr += "<td></td>";
		
	// 날짜 td 발생
	for(int i=1; i<=lastday; i++)
	{
		week++;
		
		//calStr += "<td>" + i + "</td>";
		//만약 현재 년도와 지금년도가 같고, 현재월과 지금월이 같고, i가 오늘이고 요일이 일요일이라면
		if(selectYear==NowYear && selectMonth==NowMonth && i==NowDay && week%7==0)
			calStr += "<td class='nowSat'>" + i + "</td>"; // 오늘은 토요일
			
		//만약 현재 년도와 지금년도가 같고, 현재월과 지금월이 같고, i가 오늘이고 요일이 월요일이라면
		else if(selectYear==NowYear && selectMonth==NowMonth && i==NowDay && week%7==1)
			calStr += "<td class='nowSun'>" + i + "</td>"; // 오늘은 토요일		

		//만약 현재 년도와 지금년도가 같고, 현재월과 지금월이 같고, i가 오늘이고 요일이 월요일이라면
		else if(selectYear==NowYear && selectMonth==NowMonth && i==NowDay)
			calStr += "<td class='now'>" + i + "</td>"; // 오늘
		
		else if(week%7==0)
			calStr += "<td class='Sat'>" + i + "</td>"; // 오늘은 토요일
			
		else if(week%7==1)
			calStr += "<td class='Sun'>" + i + "</td>"; // 오늘은 토요일
			
		else
			calStr += "<td>" + i + "</td>"; // 오늘		
			
		// 일요일일 때마다 개행
		if(week%7==0)
			calStr += "</tr><tr>";
	}
	
		if(week%7!=0)
			calStr += "</tr>";	
		
		calStr += "</table>";	
			
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive07.jsp</title>

<script type="text/javascript">
	function formCalendar(obj)
	{
		// receive 페이지로 이동
		obj.submit();
	}
</script>

</head>
<body>
<!-- 
	○ 데이터 송수신 실습 07
	- 달력을 출력하는 JSP 페이지를 구성한다.
	- 연도와 월을 입력받아 화면에 출력해주는 형태의 페이지로 구성한다.
	- 단, submit 버튼 없이 이벤트 처리를 할 수 있도록 한다.
	- 전송한 내용을 수신해서 출력해주는 형태의 페이지로 구성한다.
	- 연도 구성은 현재의 연도를 기준으로 이전 10년, 이후 10년으로 구성한다.
	  (기본적으로 만년달력을 구성하는데 현재의 연, 월은 달력 객체로부터 확인할 수 있도록 한다.)
	- 월 구성은 1월 부터 12월 까지로 구성한다.
	
	[2022▼]년 [4▼]월
	---------------------------------
	---------------------------------
	---------------------------------
	---------------------------------
	
	- 연도 select 나 월 select 의 내용이 변화되면
	해당 연 월의 달력을 출력해주는 형태의 페이지로 구성한다.
	
	- 사용자 최초 요청 주소는 
	http://localhost:8090/WebApp07/SendAndReceive07.jsp 로 한다.
	
	○ SendAndReceive07.jsp
 -->
 <div>
 	<h1>데이터 송수신 실습</h1>
 	<hr>
 </div>
 
 
 <div>
 	<form method="post">
 	<select id="year" name="year" onchange="formCalendar(this.form)">
 	<%=yOptions %>
 	</select>년
 	<select id="month" name="month" onchange="formCalendar(this.form)">
 	<%=mOptions %>
 	</select>월
 	</form>
<!--  	<select>
 		<option value="2012">2012</option>
 		<option value="2013">2013</option>
 		<option value="2014">2014</option>
 		<option value="2015">2015</option>
 		<option value="2016">2016</option>
 		<option value="2017">2017</option>
 		<option value="2018">2018</option>
 		<option value="2019">2019</option>
 		<option value="2020">2020</option>
 		<option value="2021">2021</option>
 		<option value="2022">2022</option>
 	</select>년
 	<select>
 		<option value="1">1</option>
 		<option value="2">2</option>
 		<option value="3">3</option>
 		<option value="4">4</option>
 		<option value="5">5</option>
 		<option value="6">6</option>
 		<option value="7">7</option>
 		<option value="8">8</option>
 		<option value="9">9</option>
 		<option value="10">10</option>
 		<option value="11">11</option>
  		<option value="12">12</option>		
 	</select>월 -->
 </div>
 <br>
 
 <div>
 <!-- 달력 그릴거임 -->
	<%=calStr %>
 
 </div>
 
 
</body>
</html>