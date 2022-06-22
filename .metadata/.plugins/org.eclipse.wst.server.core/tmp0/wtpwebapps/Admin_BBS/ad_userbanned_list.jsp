<%@page import="bbs.Bbs"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bbs.bbsDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 기기별 크기 담당 -->
<meta name="viewport" content="width=device-width", initial-scale="1">
<!-- 디자인 담당 -->
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>ad_userbanned_list.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
</head>
<body>

<c:import url="ad_Header.jsp"></c:import>

<div class="container">
	<div class="row">
	<h1>차단 회원 관리</h1> 
		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
			<thead><!-- 제목 -->
				<tr><!-- 1행 -->
					<th style="background-color: #eeeeee; text-align: center;">E-mail</th>
					<th style="background-color: #eeeeee; text-align: center;">닉네임</th>
					<th style="background-color: #eeeeee; text-align: center;">차단기간</th>
					<th style="background-color: #eeeeee; text-align: center;">차단일시</th>
					<th style="background-color: #eeeeee; text-align: center;">차단내용</th>
					<th style="background-color: #eeeeee; text-align: center;">차단상세</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>yjooo0816@gmail.com</td>
					<td>이연주</td>
					<td>3일</td>
					<td>2022.05.05</td>
					<td>부적절한 게시물</td>
					<td>-</td>
				</tr>
			</tbody>
		</table>


		오른쪽 정렬 어케함... 
		<div class="btn-group" style="display: flex; width: 30%; align-content: right;">
			<select name="job">
			    <option value="">카테고리</option>
			    <option value="">1</option>
			    <option value="">2</option>
			</select> 
		   <input type="text" class="form-control" placeholder="검색어를 입력하세요">
		   <button type="submit" class="btn btn-default" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">검색</button>
		</div>	
	</div>
</div>


<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>

</body>
</html>