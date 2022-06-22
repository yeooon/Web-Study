<%@page import="com.test.MemberScoreDTO"%>
<%@page import="com.test.MemberScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%

	// MemberScoreUpdate.jsp
	
	// 이전페이지(MemberScoreUpdateForm.jsp)로부터 데이터(kor,eng,mat + sid) 수신
	
	//한글 전환
	//번호 이름 점수 불러오고
	//dao 객체 생성
	//try catch 데이터 연결
	//dto 객체 생성
	//set 로 새로 데이터 보냄
	//수정 메소드에서 보냄

		request.setCharacterEncoding("UTF-8");
		
		String sid	= request.getParameter("sid");
		String name = request.getParameter("name");
		String kor	= request.getParameter("kor");
		String eng = request.getParameter("eng");
		String mat = request.getParameter("mat");
		
		MemberScoreDAO dao = new MemberScoreDAO();
		
		try
		{
			dao.connection();
			
			MemberScoreDTO dto = new MemberScoreDTO();
			dto.setSid(sid);
			dto.setName(name);
			dto.setKor(Integer.parseInt(kor));
			dto.setEng(Integer.parseInt(eng));
			dto.setMat(Integer.parseInt(mat));
			
			dao.modify(dto);
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
		
		response.sendRedirect("MemberScoreSelect.jsp");

%>
