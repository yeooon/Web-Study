<%@page import="java.sql.Statement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지로부터 데이터 수신
	// 한글 데이터 깨짐 방지
	
	request.setCharacterEncoding("UTF-8");

	String uName = request.getParameter("UserName");
	String uKor = request.getParameter("UserKor");	// 형변환
	String uEng = request.getParameter("UserEng");
	String uMat = request.getParameter("UserMat");
	
	int kor = Integer.parseInt(uKor);
	int eng = Integer.parseInt(uEng);
	int mat  = Integer.parseInt(uMat);
	
	try
	{
		//데이터베이스 연결
		Connection conn = DBConn.getConnection();
		
		// 쿼리문 준비 
		String sql = String.format("INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT) VALUES(SCORESEQ.NEXTVAL, '%s', %d, %d, %d)", uName, kor, eng, mat);
		
		//db 액션 처리
		Statement stmt = conn.createStatement();
		int result = 0;
		result = stmt.executeUpdate(sql);
		
		stmt.close();
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		DBConn.close();
	}
	
	response.sendRedirect("ScoreList.jsp");

%>