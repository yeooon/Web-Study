<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%

	//- 반응을 안하고, 첫째줄 이후로는 달력이 안그려짐
	//-- 셀렉트를 바꾸면 에러가 뜸
	
	
	//④ 자기 자신 페이지로부터 데이터 수신
	String sYear = request.getParameter("year");
	String sMonth = request.getParameter("month");
	
	//① Calender 객체 생성
	//java.util.Calendar cal = java.util.Calendar.getInstance();
	Calendar cal = Calendar.getInstance();
	
	//② 현재 연, 월, 일 받아오기
	int nowYear = cal.get(Calendar.YEAR);			//-- 2022
	int nowMonth = cal.get(Calendar.MONTH)+1;		//-- 4
	int nowDay = cal.get(Calendar.DAY_OF_MONTH);	//-- 13
	
	//③ 표시할 달력의 년, 월 구성 → 페이지 최초 요청을 감안한 코드(딱 열었을 때 보이는 거)
	int selectYear = nowYear;
	int selectMonth = nowMonth;
	

	//⑤ 페이지가 최초 요청이 아닐 시 받아온 값 넣어주기
	//→ Line 10 ~ 11 을 통해 수신한 데이터로 표시할 달력의 년, 월 구성
	if(sYear != null || sMonth != null)
	{
		selectYear = Integer.parseInt(sYear);
		selectMonth = Integer.parseInt(sMonth);
	}

	// 테스트
	//out.print("<h1>selectYear : " + selectYear + "</h>");
	//out.print("<h1>selectMonth : " + selectMonth + "</h>");
	/*
		<option value="2012">2012</option>
 		<option value="2013">2013</option>
						:
 		<option value="2022">2022</option>
	*/

	//⑥-1 확인한 날짜로 year <select> option 구성------------------
	String yOptions = "";
	
	//			~ 부터 시작해서 		~까지 할거다
	for(int year=(selectYear-10); year<=(selectYear+10); year++)
	{
		// 관찰 1.
		//yOptions += "<option value='" + year + "'>" + year + "</option>";
		
		// 관찰 2.
		//if(year==nowYear)
		//	yOptions += "<option value='" + year + "' selected='selected'>" + year + "</option>";
		//else
		//	yOptions += "<option value='" + year + "'>" + year + "</option>";
				
		// 상황1. 페이지 최초 요청 → sYear 는 null / 현재 년도와 옵션이 같을 때 → selected(○)
		// 상황2. 페이지 최초 요청이 아닐 때 → sYear 는 null 아님 / 선택된 년도와 옵션이 같을 때 → selected(○) 
		// 상황3. 나머지 → selected(X)
			
		if(sYear==null && year==nowYear)
			yOptions += "<option value='" + year + "' selected='selected'>" + year + "</option>";
			//<option value='year' selected='selected'></option>
		else if(sYear!=null && Integer.parseInt(sYear)==year) 
			yOptions += "<option value='" + year + "' selected='selected'>" + year + "</option>";
		else
			yOptions += "<option value='" + year + "'>" + year + "</option>";
	}	
	// ------------------확인한 날짜로 month <select> option 구성

	//⑥-2 확인한 날짜로 year <select> option 구성-------------------
		// 상황1. 페이지 최초 요청 → sMonth 는 null / 현재 년도와 옵션이 같을 때 → selected(○)
		// 상황2. 페이지 최초 요청이 아닐 때 → sMonth 는 null 아님 / 선택된 년도와 옵션이 같을 때 → selected(○) 
		// 상황3. 나머지 → selected(X)	
		String mOptions = "";
		for(int month=1; month<=12; month++)
		{
			if(sMonth==null && month==nowMonth)
				mOptions += "<option value='" + month + "' selected='selected'>" + month + "</option>";
				//<option value='year' selected='selected'></option>
			else if(sMonth!=null && Integer.parseInt(sMonth)==month) 
				mOptions += "<option value='" + month + "' selected='selected'>" + month + "</option>";
			else
				mOptions += "<option value='" + month + "'>" + month + "</option>";	
	}	
	// -------------------확인한 날짜로 year <select> option 구성
	
	
	//만년 달력 연산 ----------------------------------------------------
	int[] months = {31,28,31,30,31,30,31,31,30,31,30,31};
	
	// 2월 윤년인 날 정해주기
	if(selectYear%4 == 0 && selectYear%100 != 0 || selectYear%400 == 0)
	{
		months[1] = 29;
	}	
	
	// 총 날 누적 년수
	int nalsu;
	
	// 요일 항목 배열 구성
	String[] yoil = {"일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"};
	
	// 입력받은 년도 이전 년도까지 날 수 연산
	
	nalsu = (selectYear-1)*365 + (selectYear-1)/4 - (selectYear-1)/100 + (selectYear-1)/400;
	
	// 입력받은 월의 이전 월 까지 날 수 추가
	for(int i=0; i<selectMonth-1; i++)
		nalsu += months[i];

	//각 달 1일 연산
	nalsu++;

	// 요일 계산
	int week = nalsu%7;
	
	// 마지막 날 계산
	int lastday = months[selectMonth-1];
	
	

	// 달력 그리기 --------------------------------------------------------------
	// calStr 이 달력이 될 것이다. → 여기다 값을 누적해나감
	String calStr = "";
	
	//<table border=1>누적
	calStr += "<table border=1>";
	
	//<tr>누적	
	calStr += "<tr>";	
	
	// 요일 이름 발생
	for(int i=0; i<yoil.length; i++)
	{
		if(i==0)												   //-- 일요일
			calStr += "<th style='color:red'>"+ yoil[i] +"</th>";  
		else if(i==6)											   //-- 토요일은 파란색
			calStr += "<th style='color:blue'>"+ yoil[i] +"</th>"; 
		else													   //-- 나머지는 까만색
			calStr += "<th>"+ yoil[i] +"</th>"; 				   
	}
	
	calStr += "</tr>";	
	
	
	// 빈 칸 공백 td 발생
	calStr += "<tr>";
	
	for(int i=1; i<=week; i++)
		calStr += "<td></td>";	
	
	// 날짜 td 발생
	for(int i=1; i<=lastday; i++)
	{
		week++;		//-- 날짜가 하루씩 찍힐 때 마다(구성이 이루어질 때 마다) 요일도 함께 1씩 증가~!!!
		
		//calStr += "<td>" + i + "</td>";
		//만약 현재 년도와 지금년도가 같고, 현재월과 지금월이 같고, i가 오늘이고 요일이 일요일이라면
		if(selectYear==nowYear && selectMonth==nowMonth && i==nowDay && week%7==0)
			calStr += "<td class='nowSat'>" + i + "</td>"; // 오늘은 토요일
			
		//만약 현재 년도와 지금년도가 같고, 현재월과 지금월이 같고, i가 오늘이고 요일이 월요일이라면
		else if(selectYear==nowYear && selectMonth==nowMonth && i==nowDay && week%7==1)
			calStr += "<td class='nowSun'>" + i + "</td>"; // 오늘은 토요일		

		//만약 현재 년도와 지금년도가 같고, 현재월과 지금월이 같고, i가 오늘이고 요일이 월요일이라면
		else if(selectYear==nowYear && selectMonth==nowMonth && i==nowDay)
			calStr += "<td class='now'>" + i + "</td>"; // 오늘은 평일
		
		else if(week%7==0)
			calStr += "<td class='Sat'>" + i + "</td>"; // 오늘이 아닌 토요일
			
		else if(week%7==1)
			calStr += "<td class='Sun'>" + i + "</td>"; // 오늘이 아닌 일요일
			
		else
			calStr += "<td>" + i + "</td>"; // 오늘이 아님
			
		// 일요일일 때마다 개행
		if(week%7==0)
			calStr += "</tr><tr>";
	}
	
	// 날짜 td 발생
		if(week%7!=0)
			calStr += "</tr>";	

		calStr += "</table>";		
	
	// ---------------------------------------------------------------달력 그리기
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive07.jsp</title>

<script type="text/javascript">
	function formCalendar(obj)
	{
		// 유효성 검사가 필요할 경우 삽입할 수 있는 영역~!!!
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
 <!-- form 의 action 속성 값 생략 → 요청 페이지 / 데이터의 수신처는 자기 자신 -->
 	<form action="" method="post">
 	<select id="year" name="year" onchange="formCalendar(this.form)">
 		<!-- <option value="9999">9999</option>
  		<option value="9998">9998</option>	 -->	
  		<%=yOptions %>
 	</select>년
 	<select id="month" name="month" onchange="formCalendar(this.form)">
 	 	<!-- <option value="99">99</option>
 	 	<option value="98">98</option> -->
 	 	<%=mOptions %>
 	</select>월
 	</form>
 </div>
 <br>
 
 <div>
 	<!-- 달력 그릴거임 -->
 	<%=calStr %> 
 </div>
 
 
</body>
</html>