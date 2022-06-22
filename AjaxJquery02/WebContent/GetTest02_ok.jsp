<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	String nickName = request.getParameter("nickName");

	String resultDiv = "";
	
	resultDiv = String.format("%s님 안녕하세요", nickName);

%>
<h3>첫번째 방법</h3> <br>
<%=resultDiv %> <br>


<h3>두번째 방법</h3> <br>
${param.nickName }님 안녕하세요.