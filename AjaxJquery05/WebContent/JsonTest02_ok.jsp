<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String name = request.getParameter("name");
	String content = request.getParameter("content");
	
	// 반환해 줄 쿼리 스트링
	String result = "";
			
	// JSON 데이터(배열)
	// [{"이름1":"값1","이름2:":"값2","이름3":"값3"}, {"이름1":"값1", "이름2:":"값2"}]

	//
			
	// [{"num":"1","name:":"임소민1","content":"안녕하세요1"},
	// [{"num":"1","name:":"임소민2","content":"안녕하세요2"},
	// [{"num":"1","name:":"임소민3","content":"안녕하세요3"},
	// [{"num":"1","name:":"임소민4","content":"안녕하세요4"},
	// [{"num":"1","name:":"임소민5","content":"안녕하세요5"},
	
	// [{"num":"1","name:":"임소민1","content":"안녕하세요1"},
	// {"num":"1","name:":"임소민2","content":"안녕하세요2"},
	// {"num":"1","name:":"임소민3","content":"안녕하세요3"},
	// {"num":"1","name:":"임소민4","content":"안녕하세요4"},
	// {"num":"1","name:":"임소민5","content":"안녕하세요5"}, ← 마지막 컴마 제거
	
	// [{"num":"1","name:":"임소민1","content":"안녕하세요1"},
	// {"num":"1","name:":"임소민2","content":"안녕하세요2"},
	// {"num":"1","name:":"임소민3","content":"안녕하세요3"},
	// {"num":"1","name:":"임소민4","content":"안녕하세요4"},
	// {"num":"1","name:":"임소민5","content":"안녕하세요5"},] ← 마지막 컴마 제거
		    
	    
	for(int n=1; n<=5; n++)			
	{
		StringBuffer sb = new StringBuffer();
		
		//JsonTest01_ok.jsp 의 내용 복사&붙여넣기
		sb.append("{\"num\":\"" + n + "\"");			
		sb.append(",\"name\":\"" + name + n + "\"");
		sb.append(",\"content\":\"" + content + n + "\"},");		// check~!! 『,』
		
		result += sb.toString();
		
	}
	
	// 마지막 『,』 탈락
	result = result.substring(0, result.length()-1);		// 마지막에 붙은 , 빼야하니까!!
	
	// json 배열 객체 구성
	result = "[" + result + "]";
	
	out.println(result);
	
%>
