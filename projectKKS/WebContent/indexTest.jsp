<!-- 07-05 김정연 인덱스 테스트 페이지 -->
<!-- 마지막 수정날짜 07-05 김정연 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
	<%
		String sessionName = (String)session.getAttribute("sessionName");
		String sessionLevel = (String)session.getAttribute("sessionLevel");
		System.out.println(sessionName);
		
		if(sessionName==null){%>
			<h3><a href="<%=request.getContextPath() %>/insertUSerForm.jsp">회원가입</a></h3>
			<h3><a href="<%=request.getContextPath() %>/loginUserForm.jsp">로그인</a></h3>
<%		}else{%>
			<h3><a href="<%=request.getContextPath() %>/logoutUser.jsp">로그아웃</a></h3>
			<h3><a href="<%=request.getContextPath() %>/insertUserForm.jsp">회원가입</a></h3>
			<h3><a href="<%=request.getContextPath() %>/updateUserForm.jsp">회원정보 수정</a></h3>
			<h3><a href="<%=request.getContextPath() %>/deleteUser.jsp">회원정보 삭제</a></h3>
<%		}
%>
		
	</body>
</html>