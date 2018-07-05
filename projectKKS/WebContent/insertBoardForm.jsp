<!-- 서연문 2017-07-05 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Insert title here</title>
	</head>
	<body>
		<%
			/* session.getAttribute("sessionName");
			session.getAttribute("sessionLevel"); */
		%>
		<form action="<%= request.getContextPath() %>/insertBoardAction.jsp" method="post">
			<table border="1">
				<tr>
					<td>글쓴이 : <input type="text" name="userName" value="id001" readonly></td>
				</tr>
				<tr>	
					<td>자작곡 제목 : <input type="text" name="boardTitle"></td>
				</tr>
				<tr>	
					<td>자작곡 설명 : <input type="text" name="boardContent"></td>
				</tr>
				<tr>	
					<td>자작곡 업로드 : <input type="file" name="boardOriginal"></td>
				</tr>
			</table>
			<input type="submit" value="등록">
		</form>
	</body>
</html>