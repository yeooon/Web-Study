
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

<c:import url="Sidebar.jsp"></c:import>

<div class="container">
	<div class="row">
	<h1>관리자 모드_고객센터</h1> 
		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
			<thead><!-- 제목 -->
				<tr><!-- 1행 -->
					<th style="background-color: #eeeeee; text-align: center;">회원 ID</th>
					<th style="background-color: #eeeeee; text-align: center;">게시물 ID</th>
					<th style="background-color: #eeeeee; text-align: center;">신고자 ID</th>
					<th style="background-color: #eeeeee; text-align: center;">신고내용</th>
					<th style="background-color: #eeeeee; text-align: center;">관리자 조치</th>
					<th style="background-color: #eeeeee; text-align: center;">접수시간</th>
					<th style="background-color: #eeeeee; text-align: center;">처리시간</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>asfdjklaf</td>
					<td><a href="" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">P0310</a></td>
					<td>kim06</td>
					<td>부적절한 내용</td>
					<td>처리</td>
					<td>22:05:27</td>
					<td>22:05:30</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>



<!-- 모달 폼 -->
<div class="modal" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h3 class="modal-title" id="exampleModalLabel"><b>카테고리 추가</b></h3>
      </div>
      <div class="modal-body">
        <form>
          <div class="ms-auto" style="margin-bottom: 10px">
          	<b>신고 세부 내용</b>
            <input type="text" class="form-control" id="recipient-name" readonly="readonly">
            <hr />
          </div>
          <div class="ms-auto" style="margin-bottom: 10px">
          	<b>게시글 링크</b><br>
          	<a href="#">#</a>
          	<hr />
          </div>       
          <div class="ms-auto">
          	<div style="margin-bottom: 10px"><b><span style="color: #0080FF">처리내용</span></b></div>	
          	<textarea name="" id="" cols="30" rows="10" style="width: 550px" placeholder="내용을 입력해주세요" ></textarea>
          </div>             
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        <button type="submit" class="btn btn-primary" onclick="">입력</button>
      </div>
    </div>
  </div>
</div>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>

</body>
</html>