/*=======================
	ServletSample.java
========================*/

package com.test.ajax;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test04 extends HttpServlet
{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}
	
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// 서블릿 관련 코딩
		
		// 한글 깨짐 방지처리
		request.setCharacterEncoding("UTF-8");
		
		// 동 이름 넘어온 데이터 수신
		String addr = request.getParameter("addr");
		
		//System.out.println(addr);
		
		// ※ 여기서도 앞에서와 마찬가지로 우편번호 데이터베이스 있다고 가정하고...
		// 대신 직접 자료구조(ArrayList) 구성
		ArrayList<ZipCodeDTO> lists = new ArrayList<ZipCodeDTO>();
		
		if (addr.indexOf("서교") > -1)
		{
			lists.add(new ZipCodeDTO("04047", "서울특별시 마포구 독막로3길 6 (합정동)"));
			lists.add(new ZipCodeDTO("04046", "서울특별시 마포구 독막로3길 7 (합정동)"));
			lists.add(new ZipCodeDTO("04047", "서울특별시 마포구 독막로3길 8 (합정동)"));
			lists.add(new ZipCodeDTO("04044", "서울특별시 마포구 독막로3길 13 (서교동)"));
			lists.add(new ZipCodeDTO("04044", "서울특별시 마포구 독막로3길 17 (서교동, 용성빌딩)"));
			lists.add(new ZipCodeDTO("04047", "서울특별시 마포구 독막로3길 18 (서교동)"));
			lists.add(new ZipCodeDTO("04047", "서울특별시 마포구 독막로3길 20 (서교동)"));
			lists.add(new ZipCodeDTO("04044", "서울특별시 마포구 독막로3길 21 (서교동)"));
			lists.add(new ZipCodeDTO("04044", "서울특별시 마포구 독막로3길 21-3 (서교동)"));
			lists.add(new ZipCodeDTO("04044", "서울특별시 마포구 독막로3길 21-4 (서교동)"));
		}
		else if (addr.indexOf("역삼") > -1)
		{
			lists.add(new ZipCodeDTO("06232", "서울특별시 강남구 강남대로 지하 396 (역삼동, 강남역)"));
			lists.add(new ZipCodeDTO("06253", "서울특별시 강남구 강남대로 298 (역삼동, 푸르덴셜타워)"));
			lists.add(new ZipCodeDTO("06253", "서울특별시 강남구 강남대로 298 (역삼동, 푸른덴셜)"));
			lists.add(new ZipCodeDTO("06253", "서울특별시 강남구 강남대로 302 (역삼동, 동희빌딩)"));
			lists.add(new ZipCodeDTO("06253", "서울특별시 강남구 강남대로 302-2 (역삼동)"));
			lists.add(new ZipCodeDTO("06253", "서울특별시 강남구 강남대로 308 (역삼동, 랜드마크타워)"));
			lists.add(new ZipCodeDTO("06253", "서울특별시 강남구 강남대로 308 (역삼동, 이노션)"));
			lists.add(new ZipCodeDTO("06253", "서울특별시 강남구 강남대로 310 (역삼동, 유니온센터오피스텔)"));
			lists.add(new ZipCodeDTO("06253", "서울특별시 강남구 강남대로 314 (역삼동, 서우빌딩)"));
			lists.add(new ZipCodeDTO("06253", "서울특별시 강남구 강남대로 318 (역삼동, TOWER837)"));
		}
		
		request.setAttribute("lists", lists);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("Test04Ok.jsp");
		dispatcher.forward(request, response);
	}
}






















