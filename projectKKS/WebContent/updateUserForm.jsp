<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>회원 수정</title>
		<style>
			#readonly{
				font-weight : 900;
				color : #FF0000;
			}
		</style>
	</head>
	<body>
	<%
		String sessionName = (String)session.getAttribute("sessionName");
		
		User user = null;
		UserDao userDao = new UserDao();
		
		user = userDao.updateUserValue(sessionName);
		
		String userName = user.getUserName();
		String userEmail = user.getUserEmail();
		String userPw = user.getUserPw();
	%>
	
		<h1><%=sessionName %>님의 회원수정</h1>
		<table border="1" style="border-collapse: collapse">
			<form action="<%=request.getContextPath() %>/updateUserAction.jsp" method="post">
				<tr>
					<td>닉네임 :</td>
					<td><input id="readonly" type="text" value="<%=userName%>" readonly></td>
				</tr>
				<tr>
					<td>이메일 :</td>
					<td><input id="readonly" type="text" value="<%=userEmail%>" readonly></td>
				</tr>
				<tr>
					<td>비밀번호 :</td>
					<td><input type="text" name="reUserPw" value="<%=userPw%>"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="수정">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<h3><a href="deleteUser.jsp">계정 삭제</a></h3>
					</td>
				</tr>
			</form>
		</table>
	</body>
</html>