<!-- 07-05 김정연 회원가입 폼.-->
<!-- 마지막 수정날짜 07-05 김정연 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>회원가입 창</title>
	</head>
	<body>
		<form action="<%=request.getContextPath() %>/insertUserAction.jsp" method="post">
			<table border="1">
				<tr>
					<td>이메일 : <input type="text" name="email"></td>
				</tr>
				<tr>
					<td>닉네임 : <input type="text" name="name"></td>
				</tr>
				<tr>	
					<td>비밀번호 : <input type="text" name="pw"></td>
				</tr>
				<tr>
					<td><input type="submit" value="확인"></td>
				</tr>
			</table>
		</form>
	</body>
</html>