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
			// 세션 정보 받아옴
			String sessionName = (String)session.getAttribute("sessionName");
			String sessionLevel = (String)session.getAttribute("sessionLevel");
			
			ProfileDao profileDao = new ProfileDao();
			Profile profile = profileDao.selectProfile(sessionName);
		%>
		<table border="1">
			<tr>
				<!-- 이름 -->
				<td><%= profile.getUserName() %></td>
			</tr>
			<tr>
				<!-- 이메일 -->
				<td><%= profile.getUserAddress() %></td>
			</tr>
			<tr>
				<!-- 자기소개 -->
				<td><%= profile.getUserBio() %></td>
			</tr>
		</table>
		
		<div id = "followButton">
			<a href="#">+ Follow</a>
			<a href="#">- UnFollow</a>
		</div>
	</body>
</html>