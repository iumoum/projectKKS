<!-- 07-05 ������ ȸ������ ��.-->
<!-- ������ ������¥ 07-05 ������ -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>ȸ������ â</title>
	</head>
	<body>
		<form action="<%=request.getContextPath() %>/insertUserAction.jsp" method="post">
			<table border="1">
				<tr>
					<td>�̸��� : <input type="text" name="email"></td>
				</tr>
				<tr>
					<td>�г��� : <input type="text" name="name"></td>
				</tr>
				<tr>	
					<td>��й�ȣ : <input type="text" name="pw"></td>
				</tr>
				<tr>
					<td><input type="submit" value="Ȯ��"></td>
				</tr>
			</table>
		</form>
	</body>
</html>