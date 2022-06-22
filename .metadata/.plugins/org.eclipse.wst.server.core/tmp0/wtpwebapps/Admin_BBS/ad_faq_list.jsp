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
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Insert title here</title>
<style type="text/css">

*{
  box-sizing: border-box; 
}
  
.que:first-child{
    border-top: 1px solid black;
  }
  
.que{
  position: relative;
  padding: 17px 0;
  cursor: pointer;
  font-size: 14px;
  border-bottom: 1px solid #dddddd;
  
}
  
.que::before{
  display: inline-block;
  content: 'Q';
  font-size: 14px;
  color: #006633;
  margin-right: 5px;
}

.que.on>span{
  font-weight: bold;
  color: #006633; 
}
  
.anw {
  display: none;
    overflow: hidden;
  font-size: 14px;
  background-color: #f4f4f2;
  padding: 27px 0;
}
  
.anw::before {
  display: inline-block;
  content: 'A';
  font-size: 14px;
  font-weight: bold;
  color: #666;
  margin-right: 5px;
}
</style>
</head>
<body>

<c:import url="ad_Header.jsp"></c:import>



<div class="container">
	<div class="row">
	<h1>자주 묻는 질문</h1>
		<div id="Accordion_wrap">
		     <div class="que">
		      <span>회원 탈퇴를 하고 싶어요.</span>
		     </div>
		     <div class="anw">
		      <span>주문하신 상품은 결제 완료 후 안내된 배송예정일까지 배송됩니다.<br>
					배송예정일은 판매자 및 배송지에 따라 차이가 있을 수 있습니다.<br>
					또한, 도서산간 지역 배송 혹은 천재지변으로 읺애 배송일정이 변동될 수 있습니다.<br> 
			 </span>
					<button class="btn btn-primary pull-right" value="글쓰기" style="width: 100px; margin-left: 10px; margin-right: 10px">수정하기</button>
					<button class="btn btn-default pull-right" value="글쓰기" style="width: 100px; margin-left: 10px">삭제하기</button>			 
		     </div>
		      <div class="que">
		      <span>회원정보 변경은 어디서 하나요?</span>
		     </div>
		     <div class="anw">
		      <span>This is second answer.</span>
					<button class="btn btn-primary pull-right" value="글쓰기" style="width: 100px; margin-left: 10px; margin-right: 10px">수정하기</button>
					<button class="btn btn-default pull-right" value="글쓰기" style="width: 100px; margin-left: 10px">삭제하기</button>			      
		     </div>
		      <div class="que">
		      <span>상품 변경은 어디서 하나요?</span>
		     </div>
		     <div class="anw">
		      <span>[공지] '비트코인/가상화폐/암호화폐' 거래 금지 안내</span>
					<button class="btn btn-primary pull-right" value="글쓰기" style="width: 100px; margin-left: 10px; margin-right: 10px">수정하기</button>
					<button class="btn btn-default pull-right" value="글쓰기" style="width: 100px; margin-left: 10px">삭제하기</button>			      
		     </div>
		</div>
	</div>	
</div>

<div class="container" style="border: 1px solid gray; margin-top: 10px;">
	<button class="btn btn-primary pull-right" value="글쓰기" style="width: 100px;" onclick="location.href='ad_notice_write.jsp'">글쓰기</button>
	오른쪽에 딱 붙이고 싶은데...
</div>

<script type="text/javascript">
$(".que").click(function() {
	  $(this).next(".anw").stop().slideToggle(300);
	  $(this).toggleClass('on').siblings().removeClass('on');
	  $(this).next(".anw").siblings(".anw").slideUp(300); // 1개씩 펼치기
	});
</script>

</body>
</html>