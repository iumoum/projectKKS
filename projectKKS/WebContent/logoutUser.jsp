<!-- 07-05 김정연 로그아웃 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
	<%
		//연결끊기
		session.invalidate();
	
		//이어서, 인덱스로 이동. 그럼 로그아웃이 되어잉ㅆ다.
		response.sendRedirect(request.getContextPath()+"/indexTest.jsp");
	%>
	</body>
</html>