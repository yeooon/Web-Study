<!-- http://bootstrapk.com/components/ 
여기서 아이콘을 따오든지 이미지를 따오든지 하기
-->

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
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<title>ad_main.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
<style type="text/css">

.social-box .box {
    background: #f2f2f2;
    border-radius: 10px; 
    cursor: pointer;
    margin: 20px 0;
    padding: 40px 10px;
    transition: all 0.5s ease-out;
}

.social-box .box:hover {
   box-shadow: 0 0 6px #4183D7;
}

.social-box .box-text {
	border: 1px;
    font-size: 15px;
    line-height: 30px;
    margin: 20px 0;
}

.social-box .box-btn a {
    color: #4183D7;
    font-size: 16px;
    text-decoration: none;
}

.social-box .fa {
    color: #4183D7;
}
</style>
</head>
<body>

<c:import url="ad_Header.jsp"></c:import>

<div class="social-box">
    <div class="container">
     	<div class="row">
     	<h1 style="color: #0080FF;">Main</h1>
		    <div class="col-lg-6 col-xs-12 text-center">
				<div class="box">
                    <i class="fa fa-behance fa-3x" aria-hidden="true"></i>
					<div class="box-title">
						<h3>회원관리</h3>
					</div>
				 </div>
			</div>	 
			
			 <div class="col-lg-6 col-xs-12  text-center">
				<div class="box">
				    <i class="fa fa-twitter fa-3x" aria-hidden="true"></i>
					<div class="box-title">
						<h3>카테고리 관리</h3>
					</div>
				 </div>
			</div>	 
			
			<div class="col-lg-6 col-xs-12 text-center">
				<div class="box">
                    <i class="fa fa-pinterest-p fa-3x" aria-hidden="true"></i>
					<div class="box-title">
						<h3>거래 관리</h3>
					</div>
				 </div>
			</div>	 
			
			<div class="col-lg-6 col-xs-12 text-center">
				<div class="box">
				    <i class="fa fa-google-plus fa-3x" aria-hidden="true"></i>
					<div class="box-title">
						<h3>고객 센터</h3>
					</div>
				 </div>
			</div>	 
			
		</div>		
    </div>
</div>



<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>


</body>
</html>