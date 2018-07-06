<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>ȸ�� ����</title>
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
	
		<h1><%=sessionName %>���� ȸ������</h1>
		<table border="1" style="border-collapse: collapse">
			<form action="<%=request.getContextPath() %>/updateUserAction.jsp" method="post">
				<tr>
					<td>�г��� :</td>
					<td><input id="readonly" type="text" value="<%=userName%>" readonly></td>
				</tr>
				<tr>
					<td>�̸��� :</td>
					<td><input id="readonly" type="text" value="<%=userEmail%>" readonly></td>
				</tr>
				<tr>
					<td>��й�ȣ :</td>
					<td><input type="text" name="reUserPw" value="<%=userPw%>"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="����">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<h3><a href="deleteUser.jsp">���� ����</a></h3>
					</td>
				</tr>
			</form>
		</table>
	</body>
</html>