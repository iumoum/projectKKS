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
			// 한글
			request.setCharacterEncoding("euc-kr");
		
			// 세션 영역에 저장된 정보를 가져옴
			String sessionName = (String) session.getAttribute("sessionName");
			String sessionLevel = (String) session.getAttribute("sessionLevel");
		
			Profile profile = new Profile();
			ProfileDao profileDao = new ProfileDao();
			
			// updateProfileForm.jsp 으로부터 받아온 값을 각각의 변수에 대입
			String userBio = request.getParameter("userBio");
			String userAddress = request.getParameter("userAddress");
			
			// 값 테스트
			System.out.println("userBio updateProfileAction.jsp : " + userBio);
			System.out.println("userAddress updateProfileAction.jsp : " + userAddress);
			
			/* 세션 처리 미완성으로 인한 주석 처리
				// profile DTO에 값 대입
				profile.setUserName(sessionName);
				profile.setUserBio(userBio);
				profile.setUserAddress(userAddress); 
			*/
			
			profile.setUserName("iumium");
			profile.setUserBio(userBio);
			profile.setUserAddress(userAddress); 
			
			// updateProfile 메서드를 호출하여 업데이트 
			profileDao.updateProfile(profile);
			
			// 페이지 이동
			response.sendRedirect(request.getContextPath() + "/updateProfileForm.jsp");
		%>
	</body>
</html>