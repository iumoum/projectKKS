<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Someone's Page</title>
	</head>
	<body>
		<%
			// ���� ���� �޾ƿ�
			String sessionName = (String)session.getAttribute("sessionName");
			String sessionLevel = (String)session.getAttribute("sessionLevel");
			
			ProfileDao profileDao = new ProfileDao();
			Profile profile = profileDao.selectProfile(sessionName);
		%>
		<table border="1">
			<tr>
				<!-- �̸� -->
				<td><%= profile.getUserName() %></td>
			</tr>
			<tr>
				<!-- �̸��� -->
				<td><%= profile.getUserAddress() %></td>
			</tr>
			<tr>
				<!-- �ڱ�Ұ� -->
				<td><%= profile.getUserBio() %></td>
			</tr>
		</table>
		
		<div id = "followButton">
			<a href="#">+ Follow</a>
			<a href="#">- UnFollow</a>
		</div>
	</body>
</html>