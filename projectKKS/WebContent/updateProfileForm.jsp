<!-- 마지막 수정일자 2018-07-05 김지완 -->
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
			// 한글
			request.setCharacterEncoding("euc-kr");
		
			// 세션 영역에 저장된 정보를 가져옴
			String sessionName = (String) session.getAttribute("sessionName");
			String sessionLevel = (String) session.getAttribute("sessionLevel");
			
			Profile profile = new Profile();
			ProfileDao profileDao = new ProfileDao();
			
			
			// selectForUpdateProfile 메서드를 호출하여 해당하는 프로필의 데이터를 가져옴
			profile = profileDao.selectProfile(sessionName); 
			
		%>
		<div id="container">
			<div id="nav">
				
			</div>
			<div id="profileUpdateForm">
				<form action="<%= request.getContextPath() %>/updateProfileAction.jsp" method="post">
					<label>
						자기 소개<br><br>
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
						주소<br><br>
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
					<button>프로필 업데이트</button>
				</form>
			</div>
		</div>
	</body>
</html>