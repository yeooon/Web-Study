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
<title>ad_notice_write.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
</head>
<body>


<div class="container">
	<div class="row">
	<form action="writeAction.jsp" method="post">
		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
			<thead><!-- 제목 -->
				<tr><!-- 1행 -->
					<th colspan="2" style="background-color: #eeeeee; text-align: left;">공지 등록</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
					<div class="" style="display: flex; width: 100%; align-content: right;">
						<select name="job" style="margin-right: 20px">
						    <option value="">카테고리</option>
						    <option value="">1</option>
						    <option value="">2</option>
						</select> 
			   			<input type="text" class="form-control" placeholder="제목을 입력하세요">
		   			</div>
					</td>	
				</tr>
				<tr>	
					<td><textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style="height: 350px;"></textarea></td>
				</tr>
			</tbody>
		</table>
					<button class="btn btn-primary pull-right" value="글쓰기" style="width: 100px; margin-left: 10px; margin-right: 10px">등록</button>
					<button class="btn btn-default pull-right" value="글쓰기" style="width: 100px; margin-left: 10px" onclick="location.href='ad_ask_list.jsp'">취소</button>	
	</form>
	</div>
</div>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>

</body>
</html>