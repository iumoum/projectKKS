<!-- 07-05 ������ �α׾ƿ� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
	<%
		//�������
		session.invalidate();
	
		//�̾, �ε����� �̵�. �׷� �α׾ƿ��� �Ǿ��פ���.
		response.sendRedirect(request.getContextPath()+"/indexTest.jsp");
	%>
	</body>
</html>