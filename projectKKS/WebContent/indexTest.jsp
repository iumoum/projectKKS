<!-- 07-05 ������ �ε��� �׽�Ʈ ������ -->
<!-- ������ ������¥ 07-05 ������ -->
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
			<h3><a href="<%=request.getContextPath() %>/insertUSerForm.jsp">ȸ������</a></h3>
			<h3><a href="<%=request.getContextPath() %>/loginUserForm.jsp">�α���</a></h3>
<%		}else{%>
			<h3><a href="<%=request.getContextPath() %>/logoutUser.jsp">�α׾ƿ�</a></h3>
			<h3><a href="<%=request.getContextPath() %>/insertUserForm.jsp">ȸ������</a></h3>
			<h3><a href="<%=request.getContextPath() %>/updateUserForm.jsp">ȸ������ ����</a></h3>
			<h3><a href="<%=request.getContextPath() %>/deleteUser.jsp">ȸ������ ����</a></h3>
<%		}
%>
		
	</body>
</html>