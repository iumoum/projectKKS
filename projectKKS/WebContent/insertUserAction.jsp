<!-- 07-05 ������ ȸ������ ó�� -->
<!-- ������ ������¥ 07-05 ������ -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
	<%
		request.setCharacterEncoding("euc-kr");
		User user = new User();
		//dto Ŭ������ User ��ü ����.
		
		user.setUserEmail(request.getParameter("email"));
		user.setUserName(request.getParameter("name"));
		user.setUserPw(request.getParameter("pw"));
		//request�� �Ѱܹ��� ������ user dto�� ����.
		
		System.out.println(user.getUserEmail()+"<=�̸���");
		System.out.println(user.getUserName()+"<=�̸�(�г���)");
		System.out.println(user.getUserPw()+"<=��й�ȣ");
		//Ȯ��.
		String userName = user.getUserName();
		//profile_tb ���̺� userName���� �־���� �ϱ� ������, �̸� ȣ���� ������ ���� �� dto�� ��� userName���� �����Ѵ�.
		
		UserDao userDao = new UserDao();
		//user_tb ���̺� insert ó�������� ����ִ� UserDaoŬ������ ��ü ����.
		
		userDao.insertUser(user);
		// UserDao Ŭ������ �ּҰ��� �Ҵ���� ��ü. userDao�� �̿��� insertUser ȣ��(dto�� ������ ������ ȣ���Ѵ�).
		
		ProfileDao profileDao = new ProfileDao();
		//profile_tb ���̺� �ܷ�Ű�� ������ userName���� insert ó�������� ����ִ� ProfileDaoŬ������ ��ü����. 
		
		profileDao.insertProfile(userName);
		//profileDao ��ü�� �̿��� insertProfile �޼ҵ� ȣ��(dto�� ����ִ� userName���� ���� ������ String ������ userName�� ȣ���Ѵ�).
	%>
	</body>
</html>