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

<c:import url="ad_Header.jsp"></c:import>

<div class="container">
	<div class="row">
	<h1>관리자모드_상품관리</h1> <!-- 왜 서체가? 배민서체지? 커스텀 css해놔서 그럼 -->
		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
			<thead><!-- 제목 -->
				<tr><!-- 1행 -->
					<th style="background-color: #eeeeee; text-align: center;">상품ID</th>
					<th style="background-color: #eeeeee; text-align: center;">카테고리</th>
					<th style="background-color: #eeeeee; text-align: center;">등록일자</th>
					<th style="background-color: #eeeeee; text-align: center;">판매자ID</th>
					<th style="background-color: #eeeeee; text-align: center;">제목</th>
					<th style="background-color: #eeeeee; text-align: center;">거래방식</th>
					<th style="background-color: #eeeeee; text-align: center;">상태</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>PO32</td>
					<td>CPU</td>
					<td>2022.05.23</td>
					<td>asdf123</td>
					<td><a href="ad_product_list_direct.jsp">CPU 싼가격에 팝니다</a></td>
					<td>직거래</td>
					<td>거래중</td>
				</tr>
			</tbody>
		</table>



		오른쪽 정렬 어케함... 
		<div>
			<input type="checkbox" name="xxx" value="yyy" checked>블라인드 처리된 게시글만 보기
		</div>
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