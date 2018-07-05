<!-- 07-05 김정연 로그인 처리 -->
<!-- 마지막 수정 날짜 07-05 -->
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
		
		//form에서 넘겨받은 값들을 String 타입의 변수로 대입.
		String userEmail = request.getParameter("userEmail");
		String userPw = request.getParameter("userPw");
		
		//user dto 객체 생성
		User user = new User();
		
		//dao객체 생성.
		UserDao userDao = new UserDao();
		
		//로그인 체크라는 변수를 만들어서 checkUserEmailPw에서 리턴된 login_ckeck의 변수를 대입한다.
		String loginCheck = userDao.checkUserEmailPw(userEmail, userPw);
		System.out.println(loginCheck);
		
		//이런 loginCheck에 들어있는 String 형식의 텍스트가 로그인 성공일시 sessionUser메서드 호출과 동시에 세션생성.
		if(loginCheck.equals("로그인 성공")){
			userDao.sessionUser(userEmail, user);
			session.setAttribute("sessionName", user.getUserName());
			session.setAttribute("sessionLevel", user.getUserLevel());
			
			//끝마치면 인덱스테스트로 이동.
		 	response.sendRedirect(request.getContextPath()+"/indexTest.jsp");
		 	
		//만약 이게 비밀번호를 잘못 입력하였습니다ㅡ라면 콘솔창에 비밀번호 틀림 출력.
		}else if(loginCheck.equals("비밀번호를 잘못 입력하였습니다")){
			System.out.println("비밀번호 틀림");
			
			//끝마치면 인덱스테스트로 이동.
			response.sendRedirect(request.getContextPath()+"/indexTest.jsp");
			
		//만약 저게 아니면 이메일이 틀림 콘솔창에 출력.	
		}else{
			System.out.println("이메일이 틀림");
			
			//끝마치면 인덱스테스트로 이동.
			response.sendRedirect(request.getContextPath()+"/indexTest.jsp");
		}
	%>
	</body>
</html>