package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.util.DBConn;

public class ScoreDAO
{
	// 주요 속성 구성
	private Connection dbConn;
	
	// 데이터베이스 연결 = 생성자 형태로 정의
	public ScoreDAO() throws ClassNotFoundException, SQLException
	{
		dbConn = DBConn.getConnection();
	}
	
	// 데이터 입력 메소드 정의
	public int add(ScoreDTO dto) throws SQLException
	{
		int result = 0;
		String sql = "INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT)"
				+ " VALUES(SCORESEQ.NEXTVAL, ?, ?, ?, ?)";
		
		PreparedStatement pstmt = dbConn.prepareStatement(sql);
		
		pstmt.setString(1, dto.getName());
		pstmt.setInt(2, dto.getKor());
		pstmt.setInt(3, dto.getEng());
		pstmt.setInt(4, dto.getMat());
		
		result = pstmt.executeUpdate();
		pstmt.close();
		
		return result;
	}
	
	// 리스트 출력 메소드 정의 
	// ArrayList<MemberDTO> 객체 → 쿼리문 → 액션 개체 → 쿼리문 연동 객체(ResultSet) 
	// → 반복문 set → 객체들 닫기
	public ArrayList<ScoreDTO> lists() throws SQLException
	{
		ArrayList<ScoreDTO> result = new ArrayList<ScoreDTO>();
		
		String sql = "SELECT SID, NAME, KOR, ENG, MAT"
				+ ",(KOR+ENG+MAT) AS TOT"
				+ ",(KOR+ENG+MAT)/3 AS AVG"
				+ " FROM TBL_SCORE ORDER BY SID";
		
		PreparedStatement pstmt = dbConn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next())
		{
			ScoreDTO dto = new ScoreDTO();
			
			// 여기가 문제였소
			dto.setSid(rs.getString("SID"));
			dto.setName(rs.getString("NAME"));
			dto.setKor(rs.getInt("KOR"));
			dto.setEng(rs.getInt("ENG"));
			dto.setMat(rs.getInt("MAT"));
			dto.setTot(rs.getInt("TOT"));
			dto.setAvg(rs.getDouble("AVG"));
			
			/* --> 이렇게 되면... 이름이랑 값에 전부 null값이 떠요
			dto.setSid(dto.getSid("SID"));
			dto.setName(dto.getName(""));
			dto.setKor(dto.getKor());
			dto.setEng(dto.getEng());
			dto.setMat(dto.getMat());
			dto.setTot(dto.getTot());
			dto.setAvg(dto.getAvg());
			*/
			
			result.add(dto);
		}
		rs.close();
		pstmt.close();
		
		return result;
					
	}
	
	
	// 인원 수 확인 메소드 정의
	public int count() throws SQLException
	{
		int result = 0;
		
		String sql = "SELECT COUNT(*) AS COUNT FROM TBL_SCORE";
		
		PreparedStatement pstmt = dbConn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next())
		{
			result = rs.getInt("COUNT");
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	// 종료 메소드 정의 
	
	public void close() throws SQLException
	{
		DBConn.close();
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
