<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
	<%
		String sessionName = (String)session.getAttribute("sessionName");
		String reUserPw = request.getParameter("reUserPw");
		
		UserDao userDao = new UserDao();
		
		String text = userDao.updateUser(reUserPw, sessionName);
		
		System.out.println(text);
		
		response.sendRedirect(request.getContextPath()+"/indexTest.jsp");
	%>
	</body>
</html>