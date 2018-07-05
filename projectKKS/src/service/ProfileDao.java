//마지막 수정날짜 07-05 김정연
package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ProfileDao {
	
	public void insertProfile(String userName) {
	//void 리턴타입으로 지정, String 데이터 타입으로 매개변수 userName 선언.
		Connection insertProfileConn = null;
		PreparedStatement insertProfilePstmt = null;
		//객체들의 초기값 지정.
		try {
			Class.forName("com.mysql.jdbc.Driver");
			//드라이버 로딩.
		
			String jdbcDriver = "jdbc:mysql://localhost:3306/kks?useUnicode=true&characterEncoding=euckr";
			String dbUser = "kks";
			String dbPass = "kks123";
			insertProfileConn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			//insertProfileConn에 db연결에 필요한 데이터들을 대입.
			insertProfilePstmt = insertProfileConn.prepareStatement("INSERT INTO profile_tb(user_name) VALUES(?)");
			insertProfilePstmt.setString(1, userName);
			//insertProfilePstmt에 저장된 쿼리문의 입력값에 호출받은 String 변수인 userName을 대입한다.
			insertProfilePstmt.executeUpdate();
			//쿼리 실행.
			System.out.println(insertProfilePstmt + "<=쿼리문. 실행성공.");
			//쿼리가 정상적으로 실행이 되면 콘솔창에 insertProfilePstmt 출려과 입력한 텍스트 출력.
		} catch (ClassNotFoundException e) {
			System.out.println("클래스 찾을수 없음. 드라이버를 살펴보아라.");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("쿼리문을살펴보세요.");
			e.printStackTrace();
		}finally {
			try {
				insertProfilePstmt.close();
				insertProfileConn.close();
				//객체 종료.
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
	}
}