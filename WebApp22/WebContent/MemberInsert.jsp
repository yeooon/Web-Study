<%@page import="com.test.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<% 
	// MemberInsert.jsp
	
	// 5명분 데이터 수신 → 객체 구성 → 자료구조 구성 → setAttribute()
	//						MemberDTO
	
	// 자료구조 구성 --> 리스트(자료구조) List(자료구조) ArrayList(배열리스트)
	List<MemberDTO> lists = new ArrayList<MemberDTO>();
	
	// 데이터를 어떻게 수신함? for문으로 set에 집어넣나?	
	for(int i=1; i<6; i++)
	{
		// set으로 집어넣을 dto 객체 생성
		MemberDTO dto = new MemberDTO();
		
		// 이전 페이지에서 자료 불러오기
		String name = request.getParameter("name"+i);
		String tel = request.getParameter("tel"+i);
		String adress = request.getParameter("adress"+i);
		
		dto.setName(name);
		dto.setTel(tel);
		dto.setAdress(adress);
		
		// dto에 이미 set했기 때문에 dto를 통째로 매개변수로 넘겨줘도 괜찮은 건가?
		lists.add(dto);
		
	}	
	
	// setAttribute() → "lists" 값에 lists를 넣어준다.
	request.setAttribute("lists", lists); 
	
	
	// MemberList.jsp 를 요청할 수 있도록 안내
	// RequestDispatcher 는 현재 request에 담긴 정보를 저장하고 있다가
	// 그 다음 페이지, 그 다음 페이지에도 해당 정보를 볼 수 있게 저장하는 기능
	// A.jsp에 담겨있는 pram을 B.jsp에서도, C.jsp에서도 계속 받아볼 수 있다.
	// → RequestDispatcher rd = request.getRequestDispatcher("포워드할 jsp");
	// → 결국 MemberList.jsp로 보낸다는 뜻 아닌지?
	RequestDispatcher rd = request.getRequestDispatcher("MemberList.jsp");
	
	rd.forward(request, response);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberInsert.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
</head>
<body>
</body>
</html>