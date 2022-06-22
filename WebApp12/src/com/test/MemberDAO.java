/*====================================
   MemberDAO.java
   - 데이터베이스 액션 처리 전용 클래스
   (TBL_MEMBER 테이블 전용 DAO)
=====================================*/

package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.util.DBConn;

public class MemberDAO
{
	private Connection conn;
	
	// 데이터베이스 연결 담당 메소드 
	public Connection connection() throws ClassNotFoundException, SQLException
	{
		conn = DBConn.getConnection();
		return conn;
	}
	
	// 데이터 입력 담당 메소드
	public int add(MemberDTO dto) throws SQLException
	{
		int result = 0;
		String sql = "INSERT INTO TBL_MEMBER(SID, NAME, TEL)"
				+ " VALUES(MEMBERSEQ.NEXTVAL, ?, ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dto.getName());
		pstmt.setString(2, dto.getTel());
		
		result = pstmt.executeUpdate();
		
		return result;
	}
	
	// 전체 회원 리스트 출력 담당 메소드 → 조건이 없으므로, 매개변수가 없다.
	public ArrayList<MemberDTO> lists() throws SQLException
	{
		// 리스트 출력 메소드 정의 
		// ArrayList<MemberDTO> 객체 → 쿼리문 → 액션 개체 → 쿼리문 연동 객체(ResultSet) 
		// → 반복문 set → 객체들 닫기
		ArrayList<MemberDTO> result = new ArrayList<MemberDTO>();
		String sql = "SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY SID";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next())
		{
			//객체 만들기
			MemberDTO member = new MemberDTO();
			member.setSid(rs.getString("SID"));
			member.setName(rs.getString("NAME"));
			member.setTel(rs.getString("TEL"));
			
			result.add(member);
		}
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	// 전체 인원 수 확인 담당 메소드 → 조건이 없으므로, 매개변수가 없다.
	public int count() throws SQLException
	{
		int result = 0;
		String sql = "SELECT COUNT(*) AS COUNT FROM TBL_MEMBER";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();	//executeQuery는 ResultSet을 반환
		while (rs.next()) //→ if 도 가능
		{
			result = rs.getInt("COUNT");
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
	
	
	//---------------------------------------------------------------
	// 메소드 추가
	// 번호 검색 담당 메소드(번호를 통해 회원 데이터 조회)
	// 회원 검색 담당 메소드
	// -- 현재... 번호(sid)는 TBL_MEMBER 테이블에서 식별자의 역할을 수행하고 있으며
	// 번호를 통한 검색 결과는 한 명의 회원일 수 밖에 없기 때문에 
	// 반환 자료형은 MemberDTO 형태로 구성한다.
	// ★ int → MemberDTO
	public MemberDTO searchMember(String sid) throws SQLException
	{
		MemberDTO result = new MemberDTO();
		
		String sql = "SELECT SID, NAME, TEL FROM TBL_MEMBER WHERE SID=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, sid);	//★
		ResultSet rs = pstmt.executeQuery();
		
		// 검색을 하려면...
		//★
		while (rs.next())
		{
			result.setSid(rs.getString("SID"));
			result.setName(rs.getString("NAME"));
			result.setTel(rs.getString("TEL"));
			
			// 검색이지 입력이 아니기 때문에 add 필요 없음
		}
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	// 메소드 추가
	// 회원 데이터 수정 담당 메소드
	public int modify(MemberDTO member) throws SQLException // 적용된 행의 건수 반환... 미치겠네... exqute
	{
		String sql = "UPDATE TBL_MEMBER SET NAME=?, TEL=? WHERE SID=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		// 여기 순서를 다르게 해서 오류가 났던 거였다...
		// sid, name, tel 순서였음. 
		pstmt.setString(1, member.getName());
		pstmt.setString(2, member.getTel());
		pstmt.setString(3, member.getSid());
		
		int result = pstmt.executeUpdate();
		pstmt.close();
		
		return result;
		
		//rs 는 executeQuery랑만 쓰인다.
		
	}
	
	// 회원 데이터 삭제 담당 메소드
	public int remove(String sid) throws SQLException
	{
		//딜리트 쿼리문은 excuteUpdate
		int result = 0;
		String sql = "DELETE FROM TBL_MEMBER WHERE SID=?";
		
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
