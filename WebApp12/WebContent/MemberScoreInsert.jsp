<%@page import="com.test.MemberScoreDAO"%>
<%@page import="com.test.MemberScoreDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%	
	// 한글 요청하기
	// 이름이랑 전화번호 받아오긴데... 나는 전부 받아오기
	// dao 객체 받아오기
	// try catch 데이터베이스 연결, dto 객체 생성하고, 입력이니까 보낼set 속성 구성
	// dao에 add 메소드 호출
	// 마지막으로 response 응답하기 = sendRedirect → select 페이지로.
	
	// MemberScoreInsert.jsp
	// 이전 페이지(MemberScoreInsertForm.jsp)로부터 데이터(kor, eng, mat + sid) 수신
	
	request.setCharacterEncoding("UTF-8");
	
	String sid = request.getParameter("sid");
	int kor = Integer.parseInt(request.getParameter("kor")); 
	int eng = Integer.parseInt(request.getParameter("eng"));
	int mat = Integer.parseInt(request.getParameter("mat"));
			
	MemberScoreDAO dao = new MemberScoreDAO();
			
	try
	{
		dao.connection();
		
		// 수신된 데이터로 MemberScoreDTO 구성 → add() 메소드의 매개변수
		MemberScoreDTO score = new MemberScoreDTO();
		score.setSid(sid);
		score.setKor(kor);
		score.setEng(eng);
		score.setMat(mat);
		
		// dao 의 add() 메소드 호출 → 데이터 입력(insert 쿼리문 수행)
		dao.add(score);
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
	
	// 새로운 페이지를 요청할 수 있도록 다시 안내
	response.sendRedirect("MemberScoreSelect.jsp");
%>