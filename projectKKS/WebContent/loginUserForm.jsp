<!-- 07-05 ������ -->
<!-- ������ ������¥ 07-05 ������ -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>�α��� ��</title>
	</head>
	<body>
		<table border="1">
			
			<form action="<%=request.getContextPath() %>/loginUserAction.jsp" method="post">
				
				<tr>
					<td>�̸��� :</td>
					<td><input type="text" name="userEmail"></td>
				</tr>
				<tr>
					<td>��й�ȣ :</td>
					<td><input type="password" name="userPw"></td>
				</tr>
				<tr>
					<td><input type="submit" value="Ȯ��"></td>
				</tr>
			</form>
		</table>
	</body>
</html>