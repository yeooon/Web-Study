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
<title>bbs.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
</head>
<body>
<div class="container">
	<div class="row">
	<h1>일반 회원 리스트</h1> <!-- 왜 서체가? 배민서체지? 커스텀 css해놔서 그럼 -->
		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
			<thead><!-- 제목 -->
				<tr><!-- 1행 -->
					<th style="background-color: #eeeeee; text-align: center;">E-mail</th>
					<th style="background-color: #eeeeee; text-align: center;">이름</th>
					<th style="background-color: #eeeeee; text-align: center;">닉네임</th>
					<th style="background-color: #eeeeee; text-align: center;">전화</th>
					<th style="background-color: #eeeeee; text-align: center;">레벨</th>
					<th style="background-color: #eeeeee; text-align: center;">가입일</th>
					<th style="background-color: #eeeeee; text-align: center;">상태</th>
					<th style="background-color: #eeeeee; text-align: center;">누적 차단 횟수</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>yjooo0816@gmail.com</td>
					<td>이연주</td>
					<td>이연주</td>
					<td>010-1111-1111</td>
					<td>1LV</td>
					<td>2022.05.05</td>
					<td>
					<div class="btn-group">
					  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
					    카테고리 <span class="caret"></span>
					  </button>
					  <ul class="dropdown-menu" role="menu">
					    <li><a href="#">정상</a></li>
					    <li><a href="#">차단</a></li>
					  </ul>					
					</div>
					</td>
					<td>1회</td>
				</tr>
			</tbody>
		</table>

		<div class="btn-group">
		  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
		    카테고리 <span class="caret"></span>
		  </button>
		  <ul class="dropdown-menu" role="menu">
		    <li><a href="#">1</a></li>
		    <li><a href="#">2</a></li>
		    <li><a href="#">3</a></li>
		    <li><a href="#">4</a></li>
		  </ul>	  
		</div>
		<div class="form-group">
		   <input type="text" class="form-control" placeholder="검색어를 입력하세요">
		   <button type="submit" class="btn btn-default">검색</button>
		</div>	





	</div>
</div>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>

</body>
</html>