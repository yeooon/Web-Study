<%@page import="com.test.MemberScoreDAO"%>
<%@page import="com.test.MemberDAO"%>
<%@page import="com.test.MemberDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%

	// MemberDelete.jsp 
	
	// 이전 페이지에서 sid 데이터 수신
	// dao 객체 생성
	// 상황에 따라 다른 주소값을 받아야 하기 때문에 strAddr 만들기
	
	// 이전 페이지에서 넘어온 데이터 수신
	String sid = request.getParameter("sid");

	MemberScoreDAO dao = new MemberScoreDAO();

	// 상황에 따라 다른 주소값을 보내야 하기 때문에...
	// sid 값이 계속 달라져서?
			
	String strAddr = "";

	try
	{
		dao.connection();

		dao.remove(sid);
		strAddr = "MemberScoreSelect.jsp";			
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

	response.sendRedirect(strAddr);	//response = 응답
%>