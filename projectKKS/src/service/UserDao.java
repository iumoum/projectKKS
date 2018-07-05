package service;
import java.sql.*;
import service.User;

public class UserDao {
	
	public void insertUser(User user) {
	//void 리턴 타입으로 지정하고 User 클래스타입인 매개변수 user를 선언한다.
		Connection insertUserConn = null;
		PreparedStatement insertUserPstmt = null;
		//객체들의 초기값 지정.
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			//드라이버 로딩.
		
			String jdbcDriver = "jdbc:mysql://localhost:3306/kks?useUnicode=true&characterEncoding=euckr";
			String dbUser = "kks";
			String dbPass = "kks123";
			
			insertUserConn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			//insertUserConn 객체에 db연결에 필요한 데이터들을 대입한다.
			insertUserPstmt = insertUserConn.prepareStatement("INSERT INTO user_tb(user_email, user_pw, user_name, user_sign_up_date) VALUES(?, ?, ?, now())");
			
			insertUserPstmt.setString(1, user.getUserEmail());
			insertUserPstmt.setString(2, user.getUserPw());
			insertUserPstmt.setString(3, user.getUserName());
			//insertUserPstmt 객체에 저장된 쿼리문들의 입력값에 차례대로 user dto에 셋팅된 값들을 가져와 대입한다.
			insertUserPstmt.executeUpdate();
			//쿼리 실행
			System.out.println(insertUserPstmt + "<=쿼리문 db 연결 성공");
			//실행되면 콘솔창에 쿼리문과 입력한 텍스트 출력.
		} catch (ClassNotFoundException e) {
			System.out.println("클래스를 찾을수 없다. 드라이버 파일을 찾아봐라");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("sql 쿼리문을 다시한번 살펴봐라. 관련해서 오류남.");
			e.printStackTrace();
		}finally {
			try {
				insertUserPstmt.close();
				insertUserConn.close();
				//객체 종료.
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
	}
}
