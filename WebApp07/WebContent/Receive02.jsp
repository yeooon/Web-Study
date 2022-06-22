<%@ page contentType="text/html; charset=UTF-8"%>
<% 

	//이름, 국어, 영어, 수학
	request.setCharacterEncoding("UTF-8");
	
	String nameStr = request.getParameter("userName");
	String KorStr = request.getParameter("Kor");
	String engStr = request.getParameter("Eng");
	String matStr = request.getParameter("Mat");
	
/* 	int kor = Integer.parseInt(KorStr);
	int eng = Integer.parseInt(engStr);
	int mat = Integer.parseInt(matStr); */
	
	int kor, eng, mat;
	kor=eng=mat=0;
	int tot=0;
	double avg=0;
	
	// 변수 선언은 try ~ catch 구문 밖에서 진행.
	try
	{
		kor = Integer.parseInt(KorStr);
		eng = Integer.parseInt(engStr);
		mat = Integer.parseInt(matStr);
		
		tot = kor + eng + mat;
		avg = tot/3.0;
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive02.jsp</title>

<style type="text/css">
<span {color: blue; font-weight: bold; font-size: 15pt;}
</style>

</head>
<body>

<div>
	<h1>데이터 송수신 실습</h1>
</div>

<div>

『<span style="color: pink"><%=nameStr %></span> 님, 성적 처리가 완료되었습니다.<br>
회원님의 점수는 국어 : <%=kor %>점, 영어 <%=eng %>점, 수학 <%=mat %>점 입니다.<br>
총점은 <%=tot %>점, 평균은 <span><%=String.format("%.1f", avg) %></span>입니다.』<br>

</div>

</body>
</html>