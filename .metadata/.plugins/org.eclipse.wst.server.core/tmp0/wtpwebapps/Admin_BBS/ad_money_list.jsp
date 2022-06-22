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
<title>ad_money_list.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
</head>
<body>

<c:import url="ad_Header.jsp"></c:import>

<div class="container">
	<div class="row">
	<h1>관리자모드_입출금관리</h1> 
		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
			<thead><!-- 제목 -->
				<tr><!-- 1행 -->
					<th style="background-color: #eeeeee; text-align: center;">회원ID</th>
					<th style="background-color: #eeeeee; text-align: center;">이름</th>
					<th style="background-color: #eeeeee; text-align: center;">입,출금</th>
					<th style="background-color: #eeeeee; text-align: center;">입출금 시간</th>
					<th style="background-color: #eeeeee; text-align: center;">입출금 은행</th>
					<th style="background-color: #eeeeee; text-align: center;">계좌</th>
					<th style="background-color: #eeeeee; text-align: center;">금액</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>afdj12</td>
					<td>김민성</td>
					<td>출금</td>
					<td>22.05.23  23:01:44	</td>
					<td>국민</td>
					<td>656502-750000</td>
					<td>70,000</td>
				</tr>
			</tbody>
		</table>

		오른쪽 정렬 어케함... margin 줬는데 이거 아닌것같음
		<div class="btn-group" style="display: flex; width: 30%; margin-left: 820px">
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