<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Update Profile Action</title>
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
			
			// updateProfileForm.jsp ���κ��� �޾ƿ� ���� ������ ������ ����
			String userBio = request.getParameter("userBio");
			String userAddress = request.getParameter("userAddress");
			
			// �� �׽�Ʈ
			System.out.println("userBio updateProfileAction.jsp : " + userBio);
			System.out.println("userAddress updateProfileAction.jsp : " + userAddress);
			
			/* ���� ó�� �̿ϼ����� ���� �ּ� ó��
				// profile DTO�� �� ����
				profile.setUserName(sessionName);
				profile.setUserBio(userBio);
				profile.setUserAddress(userAddress); 
			*/
			
			profile.setUserName("iumium");
			profile.setUserBio(userBio);
			profile.setUserAddress(userAddress); 
			
			// updateProfile �޼��带 ȣ���Ͽ� ������Ʈ 
			profileDao.updateProfile(profile);
			
			// ������ �̵�
			response.sendRedirect(request.getContextPath() + "/updateProfileForm.jsp");
		%>
	</body>
</html>