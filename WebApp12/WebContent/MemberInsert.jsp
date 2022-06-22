<%@page import="com.test.MemberDTO"%>
<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//MemberInsert
	//-- 데이터베이스의 테이블(TBL_MEMBER)에
	// 회원 데이터 추가 액션 처리 수행
	// ... 이후, 다시 리스트 페이지(MemberSelect.jsp)를 요청할 수 있도록 안내
	
	// 한글 요청하기
	// 이름이랑 전화번호 받아오긴데... 나는 전부 받아오기
	// dao 객체 받아오기
	// try catch 데이터베이스 연결, dto 객체 생성하고, 입력이니까 보낼set 속성 구성
	// dao에 add 메소드 호출
	// 마지막으로 response 응답하기 = sendRedirect → select 페이지로.
	
	request.setCharacterEncoding("UTF-8");

	String uName = request.getParameter("uName");
	String uTel = request.getParameter("uTel");
	
	MemberDAO dao = new MemberDAO();
	
	try
	{
		// 데이터베이스 연결
		dao.connection();
		
		// MemberDTO 객체 생성 및 속성 구성(→ add() 메소드 호출 위해 필요)
		MemberDTO member = new MemberDTO();
		member.setName(uName);
		member.setTel(uTel);
		
		// insert 쿼리문을 수행하는 dao 의 add() 메소드 호출
		dao.add(member);
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

	response.sendRedirect("MemberSelect.jsp");
%>
