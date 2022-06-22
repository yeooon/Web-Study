<%@page import="com.test.ScoreDTO"%>
<%@page import="com.test.ScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지로부터 데이터 수신
	// 한글 데이터 깨짐 방지
	request.setCharacterEncoding("UTF-8");

	String userName = request.getParameter("UserName");
	String UserKor = request.getParameter("UserKor");
	String UserEng = request.getParameter("UserEng");
	String UserMat = request.getParameter("UserMat");
	
	int kor = Integer.parseInt(UserKor);
	int eng = Integer.parseInt(UserEng);
	int mat = Integer.parseInt(UserMat);

	ScoreDAO dao = null;
	
	try
	{
		dao = new ScoreDAO();
		
		ScoreDTO score = new ScoreDTO();
		score.setName(userName);
		score.setKor(kor);
		score.setEng(eng);
		score.setMat(mat);
		
		dao.add(score);
			
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try{
			dao.close();
		}
		catch(Exception e){
			System.out.println(e.toString());
		}
	}
	
	response.sendRedirect("ScoreList.jsp");

%>