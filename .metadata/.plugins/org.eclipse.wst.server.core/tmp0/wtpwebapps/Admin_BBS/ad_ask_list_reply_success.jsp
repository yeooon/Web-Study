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
		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
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
		
		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
			<h2>답변하기</h2>
			<thead><!-- 제목 -->
				<tr><!-- 1행 -->
					<th colspan="3" style="background-color: #eeeeee;">
					[운영자] 안녕하세요 김민성 님
					</th>
				</tr>
			</thead>			
			<tbody>
				<tr>
					<td colspan="2" style="min-height:200px; text-align: left;">
					문의사항에 대한 답변을 드립니다
					<br />
					<br />
					<br />
					<br />
					<br />
					<button class="btn btn-primary pull-right" value="글쓰기" style="width: 150px; margin-left: 10px">수정하기</button>
					<button class="btn btn-default pull-right" value="글쓰기" style="width: 150px; margin-left: 10px">삭제하기</button>
					<button class="btn btn-default pull-right" value="돌아가기" style="width: 150px" onclick="location.href='ad_ask_list.jsp'">돌아가기</button>						
					</td>
				</tr>
			</tbody>
		</table>		
	</div>
</div>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>


</body>
</html>