// 서연문 2017-07-05
package service;
import service.*;
import java.sql.*;

public class BoardDao {
	
	public void insertBoard(Board board) {
		Connection conn = null;
		PreparedStatement prepardInsertBoard = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			String dbUrl = "jdbc:mysql://localhost:3306/kks?useUnicod=true&characterEncoding=euckr";
			String dbUser = "kks";
			String dbPw = "kks123";
			
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPw);
			
			prepardInsertBoard = conn.prepareStatement("INSERT INTO board_tb(user_name, board_title, board_content, board_original, board_date)VALUES (?,?,?,?,now())");
			prepardInsertBoard.setString(1, board.getUserName());
			prepardInsertBoard.setString(2, board.getBoardTitle());
			prepardInsertBoard.setString(3, board.getBoardContent());
			prepardInsertBoard.setString(4, board.getBoardOriginal());
			prepardInsertBoard.executeUpdate();
			
		} catch(ClassNotFoundException e) {
			System.out.println("DB연결 클래스를 찾을 수 없습니다");			
		} catch(SQLException ex) {
			System.out.println(ex.getMessage());
			ex.printStackTrace();
		} finally {
			if (prepardInsertBoard != null) try { prepardInsertBoard.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
	}
}
