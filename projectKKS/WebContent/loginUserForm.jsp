<!-- 07-05 김정연 -->
<!-- 마지막 수정날짜 07-05 김정연 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>로그인 폼</title>
	</head>
	<body>
		<table border="1">
			
			<form action="<%=request.getContextPath() %>/loginUserAction.jsp" method="post">
				
				<tr>
					<td>이메일 :</td>
					<td><input type="text" name="userEmail"></td>
				</tr>
				<tr>
					<td>비밀번호 :</td>
					<td><input type="password" name="userPw"></td>
				</tr>
				<tr>
					<td><input type="submit" value="확인"></td>
				</tr>
			</form>
		</table>
	</body>
</html>