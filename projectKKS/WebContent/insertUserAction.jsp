<!-- 07-05 김정연 회원가입 처리 -->
<!-- 마지막 수정날짜 07-05 김정연 -->
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
		//dto 클래스인 User 객체 생성.
		
		user.setUserEmail(request.getParameter("email"));
		user.setUserName(request.getParameter("name"));
		user.setUserPw(request.getParameter("pw"));
		//request로 넘겨받은 값들을 user dto에 셋팅.
		
		System.out.println(user.getUserEmail()+"<=이메일");
		System.out.println(user.getUserName()+"<=이름(닉네임)");
		System.out.println(user.getUserPw()+"<=비밀번호");
		//확인.
		String userName = user.getUserName();
		//profile_tb 테이블에 userName값을 넣어줘야 하기 때문에, 미리 호출할 변수를 선언 및 dto에 담긴 userName값을 대입한다.
		
		UserDao userDao = new UserDao();
		//user_tb 테이블에 insert 처리과정이 담겨있는 UserDao클래스의 객체 생성.
		
		userDao.insertUser(user);
		// UserDao 클래스의 주소값을 할당받은 객체. userDao를 이용해 insertUser 호출(dto에 셋팅한 값들을 호출한다).
		
		ProfileDao profileDao = new ProfileDao();
		//profile_tb 테이블에 외래키로 설정한 userName값을 insert 처리과정이 담겨있는 ProfileDao클래스의 객체생성. 
		
		profileDao.insertProfile(userName);
		//profileDao 객체를 이용해 insertProfile 메소드 호출(dto에 담겨있는 userName값을 빼네 대입한 String 변수인 userName을 호출한다).
	%>
	</body>
</html>