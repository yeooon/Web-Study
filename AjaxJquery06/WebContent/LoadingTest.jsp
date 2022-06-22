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
<title>Insert title here</title>
<link rel="stylesheet"  type="text/css" href="<%=cp %>/css/main.css">
</head>
<body>

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
$(function()
		{
			$("#sendBtn").click(function()
			{
				//alert("확인");
				
				var params = "name=" + $.trim($("#name").val())
					+ "&content=" + $.trim($("#content").val());
				
				$.ajax(
				{
					type : "POST"
					, url : "LoadingTest_ok.jsp"
					, data : params
					, success : function(args)
					{
						$("#result").html(args);
						
						$("#name").val("");
						$("#content").val("");
						$("#name").focus();
						
					}
					, beforeSend : showRequest
					, error : function(e)
					{
						alert(e.responseText);
					}
				});
				
			});
			
			// check~!!!
			//$(document).ajaxStart(기능,동작,행위).ajaxComplete(기능,동작,행위);
			$(document).ajaxStart(function()
			{
				// AJAX 시작 시...
				$("#loading").show();
				$("#result").hide();
				
			}).ajaxComplete(function()
			{
				// Ajax 종료 시...
				$("#loading").hide();
				$("#result").show();			
				
			});
		});
		
		function showRequest()
		{
			var flag = true;
			
			if(!$("#name").val())
			{
				alert("이름을 입력해야 합니다.");
				$("#name").focus();
				flag = false;
			}
			
			if(!$("#content").val())
			{
				alert("내용을 입력해야 합니다.");
				$("#content").focus();
				flag = false;
			}
			
			return flag;
		}
</script>

<div>jQeurt의 ajax() 활용 실습
<p>로딩 이미지 적용</p>
</div>

<div>
	이름 <input type="text" id="name" class="txt"/><br><br>
	내용 <input type="text" id="content" class="txt"/><br><br>
	<input type="button" value="등록하기" id="sendBtn" class="txt"/>
</div>
<br><br>

<div id="loading" style="text-align: center; display: none;">
	<img src="images/loading_01.gif" alt="loading" />
</div>

<div id="result">
</div>

</body>
</html>