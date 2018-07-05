// 마지막 수정 날짜 2018-07-05 김정연
package service;

import service.*;
import java.sql.*;

public class UserDao {

		
	public User sessionUser(String userEmail, User user) {
	//리턴 타입은 유져로 지정하고 스트링과 유저 데이터 타입인 매개변수 두개를 선언한다.
		Connection connsessionUser = null;
		PreparedStatement pstmtsessionUser = null;
		ResultSet rssessionUser = null;
		//초기값 지정.
		try {
			Class.forName("com.mysql.jdbc.Driver");
			//드라이버 로딩
			String dbUrl = "jdbc:mysql://localhost:3306/kks?useUnicode=true&characterEncoding=euckr";
			String dbUser = "KKS";
			String dbPw = "KKS123";
			
			connsessionUser = DriverManager.getConnection(dbUrl, dbUser, dbPw);
			//db연결을 위한 데이터들을 connsessionUser 객체에 대입
			pstmtsessionUser = connsessionUser.prepareStatement("SELECT * FROM user_tb where user_email = ?");
			pstmtsessionUser.setString(1, userEmail);
			//pstmtsessionUser내부에 저장된 쿼리문의 입력값에 호출받은 userEmail값을 넣는다.
			rssessionUser = pstmtsessionUser.executeQuery();
			//쿼리 실행.
			System.out.println(pstmtsessionUser);
			if(rssessionUser.next()) {
				user.setUserName(rssessionUser.getString("user_name"));
				user.setUserLevel(rssessionUser.getString("user_level"));
				//쿼리의 조건대로 뽑아온 레코드들 중에서 user_name과 user_level을 user DTO에 셋팅.
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(pstmtsessionUser != null) {
				try {
					pstmtsessionUser.close();
				} catch (SQLException sqlException) {
					System.out.println("DB와 관련된 예외가 발생하였습니다!");
					sqlException.printStackTrace();
				}
			}
			if(connsessionUser != null) {
				try {
					connsessionUser.close();
				} catch (SQLException sqlException) {
					System.out.println("DB와 관련된 예외가 발생하였습니다!");
					sqlException.printStackTrace();
				}
			}
			if(rssessionUser != null) {
				try {
					rssessionUser.close();
				} catch (SQLException sqlException) {
					System.out.println("DB와 관련된 예외가 발생하였습니다!");
					sqlException.printStackTrace();
				}
			}
			//객체 종료.
		}
		return user;
		//리턴 유져 객체.
	}
	
	public String checkUserEmailPw(String userEmail, String userPw) {
	//String을 리턴타입으로 지정뒤, String 데이터 타입으로 매개변수 두개를 선언.
		Connection conncheckUserEmailPw = null;
		PreparedStatement pstmtcheckUserEmailPw = null;
		ResultSet rscheckUserEmailPw = null;
		String loginCheck = null;
		//객체, 변수들에 초기값 지정.
		
		
		try {
			
			//드라이버 로딩.
			Class.forName("com.mysql.jdbc.Driver");
			
			//db연결을 위한 데이터들을 conncheckUserEmailPw객체에 대입
			String dbUrl = "jdbc:mysql://localhost:3306/kks?useUnicode=true&characterEncoding=euckr";
			String dbUser = "KKS";
			String dbPw = "KKS123";
			
			conncheckUserEmailPw = DriverManager.getConnection(dbUrl, dbUser, dbPw);
			
			//pstmtcheckUserEmailPw에 입력된 쿼리문의 입력값에 호출받은 userEmail을 넣는다.
			pstmtcheckUserEmailPw = conncheckUserEmailPw.prepareStatement("SELECT user_pw FROM user_tb where user_email = ?");
			pstmtcheckUserEmailPw.setString(1, userEmail);
			
			//쿼리 실행.
			rscheckUserEmailPw = pstmtcheckUserEmailPw.executeQuery();
			
			//쿼리의 조건대로 끄집어낸 레코들에서 user_pw를 꺼내 비밀번호를 비교할 변수 pw_check를 대입한다
			if(rscheckUserEmailPw.next()) {
				String pw_check = rscheckUserEmailPw.getString("user_pw");
				
				//만약 입력, 호출받은 비밀번호가 위, pw_check와 같다면 로그인 성공을 변수에 대입.
				if(userPw.equals(pw_check)) {
					loginCheck = "로그인 성공";
					
				//아니면 아래 텍스트를 대입.
				}else {
					loginCheck = "비밀번호를 잘못 입력하였습니다";
				}
				
			//쿼리 실행 자체가 안될시 아래 텍스트 대입......
			}else {
				loginCheck = "이메일을 잘못 입력하였습니다";
			}
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				rscheckUserEmailPw.close();
				pstmtcheckUserEmailPw.close();
				conncheckUserEmailPw.close();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		//..후 호출.
		return loginCheck;
		
	}
	public void insertUser(User user) {
	//void 리턴 타입으로 지정하고 User 클래스타입인 매개변수 user를 선언한다.
		
		Connection conn = null;
		PreparedStatement pstmtInsertUser = null;
		//객체들의 초기값 지정.
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			//드라이버 로딩.
		
			String dburl = "jdbc:mysql://localhost:3306/kks?useUnicode=true&characterEncoding=euckr";
			String dbUser = "KKS";
			String dbPw = "KKS123";
			
			conn = DriverManager.getConnection(dburl, dbUser, dbPw);
			//Conn 객체에 db연결에 필요한 데이터들을 대입한다.
			
			pstmtInsertUser = conn.prepareStatement("INSERT INTO user_tb(user_email, user_pw, user_name, user_sign_up_date) VALUES(?, ?, ?, now())");
			
			pstmtInsertUser.setString(1, user.getUserEmail());
			pstmtInsertUser.setString(2, user.getUserPw());
			pstmtInsertUser.setString(3, user.getUserName());
			//insertUserPstmt 객체에 저장된 쿼리문들의 입력값에 차례대로 user dto에 셋팅된 값들을 가져와 대입한다.
			
			pstmtInsertUser.executeUpdate();
			//쿼리 실행
			
			System.out.println(pstmtInsertUser + "<=쿼리문 db 연결 성공");
			//실행되면 콘솔창에 쿼리문과 입력한 텍스트 출력.
			
		} catch (ClassNotFoundException e) {
			System.out.println("클래스를 찾을수 없다. 드라이버 파일을 찾아봐라");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("sql 쿼리문을 다시한번 살펴봐라. 관련해서 오류남.");
			e.printStackTrace();
		} finally {
			if(pstmtInsertUser != null) {
				try {
					pstmtInsertUser.close();
				} catch (SQLException sqlException) {
					System.out.println("DB와 관련된 예외가 발생하였습니다!");
					sqlException.printStackTrace();
				}
			}
			if(conn != null) {
				try {
					conn.close();
				} catch (SQLException sqlException) {
					System.out.println("DB와 관련된 예외가 발생하였습니다!");
					sqlException.printStackTrace();
				}
			}
			//객체 종료.
		}
	}
}
