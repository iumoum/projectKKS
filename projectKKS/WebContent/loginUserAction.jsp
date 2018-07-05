<!-- 07-05 ������ �α��� ó�� -->
<!-- ������ ���� ��¥ 07-05 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
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
		
		//form���� �Ѱܹ��� ������ String Ÿ���� ������ ����.
		String userEmail = request.getParameter("userEmail");
		String userPw = request.getParameter("userPw");
		
		//user dto ��ü ����
		User user = new User();
		
		//dao��ü ����.
		UserDao userDao = new UserDao();
		
		//�α��� üũ��� ������ ���� checkUserEmailPw���� ���ϵ� login_ckeck�� ������ �����Ѵ�.
		String loginCheck = userDao.checkUserEmailPw(userEmail, userPw);
		System.out.println(loginCheck);
		
		//�̷� loginCheck�� ����ִ� String ������ �ؽ�Ʈ�� �α��� �����Ͻ� sessionUser�޼��� ȣ��� ���ÿ� ���ǻ���.
		if(loginCheck.equals("�α��� ����")){
			userDao.sessionUser(userEmail, user);
			session.setAttribute("sessionName", user.getUserName());
			session.setAttribute("sessionLevel", user.getUserLevel());
			
			//����ġ�� �ε����׽�Ʈ�� �̵�.
		 	response.sendRedirect(request.getContextPath()+"/indexTest.jsp");
		 	
		//���� �̰� ��й�ȣ�� �߸� �Է��Ͽ����ϴ٤Ѷ�� �ܼ�â�� ��й�ȣ Ʋ�� ���.
		}else if(loginCheck.equals("��й�ȣ�� �߸� �Է��Ͽ����ϴ�")){
			System.out.println("��й�ȣ Ʋ��");
			
			//����ġ�� �ε����׽�Ʈ�� �̵�.
			response.sendRedirect(request.getContextPath()+"/indexTest.jsp");
			
		//���� ���� �ƴϸ� �̸����� Ʋ�� �ܼ�â�� ���.	
		}else{
			System.out.println("�̸����� Ʋ��");
			
			//����ġ�� �ε����׽�Ʈ�� �̵�.
			response.sendRedirect(request.getContextPath()+"/indexTest.jsp");
		}
	%>
	</body>
</html>