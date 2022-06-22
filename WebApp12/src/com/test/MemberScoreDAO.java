/*=============================
  MemberScoreDAO.java
  - 데이터베이스 액션 처리 전용 클래스
  (TBL_MEMBERSCORE 테이블 전용 DAO) 
===============================*/


package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.util.DBConn;

public class MemberScoreDAO
{
	// 주요 속성 구성
	private Connection conn;
	
	// 데이터베이스 연결 담당 메소드
	public Connection connection() throws ClassNotFoundException, SQLException
	{
		conn = DBConn.getConnection();
		return conn;
	}
	
	// 데이터 입력 담당 메소드(성적 정보 입력)
		public int add(MemberScoreDTO score) throws SQLException
		{
			int result = 0;
			
			// 여기서는 시퀀스넣어주는거 아님!!! ★
			String sql = "INSERT INTO TBL_MEMBERSCORE(SID, KOR, ENG, MAT) VALUES (?, ?, ?, ?)";
			
			PreparedStatement pstmt= conn.prepareStatement(sql);
			
			pstmt.setString(1, score.getSid());
			pstmt.setInt(2, score.getKor());
			pstmt.setInt(3, score.getEng());
			pstmt.setInt(4, score.getMat());
			
			result = pstmt.executeUpdate();
			pstmt.close();
			
			return result;
		}
		
		
		// 성적 리스트 출력 담당 메소드
		public ArrayList<MemberScoreDTO> lists() throws SQLException
		{
			ArrayList<MemberScoreDTO> result = new ArrayList<MemberScoreDTO>();
			
			String sql = "SELECT SID, NAME, KOR, ENG, MAT"
							+ ", (KOR+ENG+MAT) AS TOT"
							+ ", ((KOR+ENG+MAT)/3) AS AVG"
							+ ", RANK() OVER(ORDER BY (KOR+ENG+MAT) DESC) AS RANK"
							+ " FROM VIEW_MEMBERSCORE"
							+ " ORDER BY SID";

			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next())
			{
				MemberScoreDTO score = new MemberScoreDTO();
				
				score.setSid(rs.getString("SID"));
				score.setName(rs.getString("NAME"));
				score.setKor(rs.getInt("KOR"));
				score.setEng(rs.getInt("ENG"));
				score.setMat(rs.getInt("MAT"));
				score.setTot(rs.getInt("TOT"));
				score.setAvg(rs.getInt("AVG"));
				score.setRank(rs.getInt("RANK"));
				
				result.add(score);
			}
			rs.close();
			pstmt.close();
			
			return result;
		}
		
		// 데이터베이스 연결 종료(해제) 담당 메소드
		public void close() throws SQLException
		{
			DBConn.close();
		}
		
		// 흑흑 메소드 추가... 
		// ------------------------------------------------------
		// 번호 검색 담당 메소드
		
		public MemberScoreDTO search(String sid) throws SQLException
		{
			MemberScoreDTO result = new MemberScoreDTO();
			
			String sql = "SELECT SID, NAME, KOR, ENG, MAT FROM VIEW_MEMBERSCORE WHERE SID=?";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sid);
			
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next())
			{
				result.setSid(rs.getString("SID"));
				result.setName(rs.getString("NAME"));
				// 다 불러와야 하나? 왜?
				result.setKor(rs.getInt("KOR"));
				result.setEng(rs.getInt("ENG"));
				result.setMat(rs.getInt("MAT"));
			}
			rs.close();
			pstmt.close();
			
			return result;
		}
		
		
		// 메소드 추가 
		// 성적 데이터 수정 메소드
		public int modify(MemberScoreDTO score) throws SQLException
		{
			int result = 0;
			
			String sql = "UPDATE TBL_MEMBERSCORE"
					+ " SET KOR=?, ENG=?, MAT=?"
					+ " WHERE SID=?";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, score.getKor());
			pstmt.setInt(2, score.getEng());
			pstmt.setInt(3, score.getMat());
			pstmt.setString(4, score.getSid());
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
			return result;
		}
		
		public int remove(String sid) throws SQLException
		{
			int result = 0;
			
			String sql = "DELETE FROM TBL_MEMBERSCORE WHERE SID=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sid);
			
			result = pstmt.executeUpdate();
			pstmt.close();
			
			return result;
		}
		
		
		// 메소드 추가
		// 자식 테이블의 참조 데이터 레코드 수 확인
		public int refCount(String sid) throws SQLException
		{
			int result = 0;
			
			String sql = "SELECT COUNT(*) AS COUNT FROM TBL_MEMBERSCORE WHERE SID=?";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sid);
			
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next())	//if(rs.next())
			{
				result = rs.getInt("COUNT");
			}
			
			rs.close();
			pstmt.close();
			
			return result;
		}
		
		
}