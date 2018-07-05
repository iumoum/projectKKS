<!-- ������ �������� 2018-07-05 ������ -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Update Profile</title>
	</head>
	<body>
		<%
			// �ѱ�
			request.setCharacterEncoding("euc-kr");
		
			// ���� ������ ����� ������ ������
			String sessionName = (String) session.getAttribute("sessionName");
			String sessionLevel = (String) session.getAttribute("sessionLevel");
			
			Profile profile = new Profile();
			ProfileDao profileDao = new ProfileDao();
			
			
			// selectForUpdateProfile �޼��带 ȣ���Ͽ� �ش��ϴ� �������� �����͸� ������
			profile = profileDao.selectProfile(sessionName); 
			
		%>
		<div id="container">
			<div id="nav">
				
			</div>
			<div id="profileUpdateForm">
				<form action="<%= request.getContextPath() %>/updateProfileAction.jsp" method="post">
					<label>
						�ڱ� �Ұ�<br><br>
						<%
							if(profile.getUserBio() == null){
						%>
								<textarea name="userBio" rows="5" cols="30"></textarea>	
						<%
							} else {
						%>
								<textarea name="userBio" rows="5" cols="30"><%= profile.getUserBio() %></textarea>	
						<%		
							}
						%>		
					</label><br><br>
					<label>
						�ּ�<br><br>
						<%
							if(profile.getUserBio() == null){
						%>
								<input type="text" name="userAddress" size="50px">
						<%
							} else {
						%>
								<input type="text" name="userAddress" size="50px" value="<%= profile.getUserAddress() %>">
						<%		
							}
						%>		
							
					</label><br><br>
					<button>������ ������Ʈ</button>
				</form>
			</div>
		</div>
	</body>
</html>