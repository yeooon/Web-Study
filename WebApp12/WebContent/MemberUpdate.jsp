<%@page import="com.test.MemberDTO"%>
<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%

	//MemberUpdate.jsp
	
	//한글 전환
	//번호 이름 점수 불러오고
	//dao 객체 생성
	//try catch 데이터 연결
	//dto 객체 생성
	//set 로 새로 데이터 보냄
	//수정 메소드에서 보냄
	
	request.setCharacterEncoding("UTF-8");

	String sid = request.getParameter("sid");
	String name = request.getParameter("uName");
	String tel = request.getParameter("uTel");
	
	MemberDAO dao = new MemberDAO();
	
	try
	{
		dao.connection();
		
		MemberDTO member = new MemberDTO();
		member.setSid(sid);
		member.setName(name);
		member.setTel(tel);
		
		dao.modify(member);
		
		// 이후 반환 결과에 따라 분기 처리 가능~
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
	
	// 클라이언트에 MemberSelect.jsp 페이지를 다시 요청할 수 있도록 안내~!!
	response.sendRedirect("MemberSelect.jsp");

%>
