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
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
</head>
<body>

<c:import url="ad_Header.jsp"></c:import>


<div class="container">
	<div class="row">
	<form action="">
		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd; width: 1100px;">
			<thead><!-- 제목 -->
				<tr><!-- 1행 -->
					<th colspan="3" style="background-color: #eeeeee; text-align: center;">김민성 님의 문의 내역</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td style="width: 20%;">글 제목</td>
					<td colspan="2">안녕하세요...</td>
				</tr>
				<tr>
					<td style="width: 20%;">작성일자</td>
					<td colspan="2">2022-06-05</td>
				</tr>
				<tr>
					<td style="width: 20%;">처리 상황</td>
					<td colspan="2">처리 진행 중</td>
				</tr>		
				<tr>
					<td style="width: 20%;">카테고리</td>
					<td colspan="2">상품문의</td>
				</tr>											
				<tr>
					<td>내용</td>
					<td colspan="2" style="min-height:200px; text-align: left;">
					안녕하세요 제가 얼마전에 물건을 샀는데 하자가 있었습니다.
					</td>
				</tr>				
			</tbody>			
		</table>
		
		</form>
		
		<div>
			<h2>답변하기</h2>
				<div>	
					<textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style="height: 300px; width: 1100px;"></textarea></div>
				</div>
				<div style="margin-top: 20px; width: 1100px;">
					<button class="btn btn-primary pull-right" value="글쓰기" style="width: 150px">글쓰기</button>
					<button class="btn pull-right" value="돌아가기" style="width: 150px" onclick="location.href='ad_ask_list.jsp'">돌아가기</button>				
				</div>
		</div>
		
	</div>
</div>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>


</body>
</html>