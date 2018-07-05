//마지막 수정날짜  07-05 김지완
package service;

import java.sql.*;

public class ProfileDao {
	
	public void insertProfile(String userName) {
	//void 리턴타입으로 지정, String 데이터 타입으로 매개변수 userName 선언.
		Connection conn = null;
		PreparedStatement pstmtInsertProfile = null;
		//객체들의 초기값 지정.
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			//드라이버 로딩.
		
			String dbUrl = "jdbc:mysql://localhost:3306/kks?useUnicode=true&characterEncoding=euckr";
			String dbUser = "KKS";
			String dbPw = "KKS123";
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPw);
			
			//insertProfileConn에 db연결에 필요한 데이터들을 대입.
			pstmtInsertProfile = conn.prepareStatement("INSERT INTO profile_tb(user_name) VALUES(?)");
			pstmtInsertProfile.setString(1, userName);
			
			//insertProfilePstmt에 저장된 쿼리문의 입력값에 호출받은 String 변수인 userName을 대입한다.
			pstmtInsertProfile.executeUpdate();
			
			//쿼리 실행.
			System.out.println(pstmtInsertProfile + "<=쿼리문. 실행성공.");
			
			//쿼리가 정상적으로 실행이 되면 콘솔창에 insertProfilePstmt 출려과 입력한 텍스트 출력.
		} catch (ClassNotFoundException e) {
			System.out.println("클래스 찾을수 없음. 드라이버를 살펴보아라.");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("쿼리문을살펴보세요.");
			e.printStackTrace();
		}finally {
			try {
				pstmtInsertProfile.close();
				conn.close();
				//객체 종료.
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	// profile_tb 테이블의 특정 레코드를 수정하는 메서드
	// 매개변수로 ProfileKJW 객체 참조 값 입력받음. 수정 폼에 입력된 값들을 담은 객체임
	// 리턴 데이터 타입은 void.
	public void updateProfile(Profile profile) {
		Connection conn = null;
		PreparedStatement pstmtupdateProfile = null;
		
		// profile_tb 테이블에서 특정 레코드를 업데이트 하는 쿼리
		String sqlupdateProfile = "UPDATE profile_tb SET user_bio = ?, user_address = ? WHERE user_name = ?";
		
		try {
			// mysql 드라이버 로딩
			Class.forName("com.mysql.jdbc.Driver");
			
			// DB 연결
			String dbUrl = "jdbc:mysql://localhost:3306/KKS?useUnicode=true&characterEncoding=euckr";
			String dbUser = "KKS";
			String dbPw = "KKS123";
			conn = DriverManager.getConnection(dbUrl,dbUser,dbPw);
			
			// 위의 쿼리 준비
			pstmtupdateProfile = conn.prepareStatement(sqlupdateProfile);
			
			// ?에 값 대입
			pstmtupdateProfile.setString(1, profile.getUserBio());
			pstmtupdateProfile.setString(2, profile.getUserAddress());
			pstmtupdateProfile.setString(3, profile.getUserName());
			
			// 쿼리 실행 및 수정된 레코드 수 출력
			System.out.println("수정된 profile_tb 레코드 수 : " + pstmtupdateProfile.executeUpdate());
			
		} catch(ClassNotFoundException classException) {
			System.out.println("DB DRIVER 클래스를 찾지 못하였습니다. 커넥터가 존재하는지 확인해주세요!");
		} catch(SQLException sqlException) {
			System.out.println("DB와 관련된 예외가 발생하였습니다!");
			sqlException.printStackTrace();
		} finally {
			if(pstmtupdateProfile != null) {
				try {
					pstmtupdateProfile.close();
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
		}
	}
	
	// profile 테이블의 특정 레코드를 조회하는 쿼리 
	// 매개변수는 사용자 이름. 특정 레코드를 조회하기 위함
	// 리턴 데이터 타입은 ProfileKJW 클래스 데이터 타입입니다. 조회된 결과를 DTO를 통해 전달 하기 위함입니다.
	public Profile selectProfile(String userName) {
		Connection conn = null;
		PreparedStatement pstmtSelectProfile = null;
		ResultSet rsSelectProfile = null;
		Profile profile = null;
		
		// userName 변수 체크
		System.out.println("userName from updateProfileAction.jsp : " + userName);
		
		// profile_tb 테이블에서 특정 레코드를 조회하는 쿼리
		String sqlSelectForUpdateProfile = "SELECT user_name,user_bio,user_address FROM profile_tb WHERE user_name = ?";
		
		try {
			// mysql 드라이버 로딩
			Class.forName("com.mysql.jdbc.Driver");
			
			// DB 연결
			String dbUrl = "jdbc:mysql://localhost:3306/KKS?useUnicode=true&characterEncoding=euckr";
			String dbUser = "KKS";
			String dbPw = "KKS123";
			conn = DriverManager.getConnection(dbUrl,dbUser,dbPw);
			
			// 위의 쿼리 준비
			pstmtSelectProfile = conn.prepareStatement(sqlSelectForUpdateProfile);
			
			// ?에 값 대입
			pstmtSelectProfile.setString(1, userName);
			
			// 쿼리 실행
			rsSelectProfile = pstmtSelectProfile.executeQuery();
			
			// 조회된 결과가 있다면
			if(rsSelectProfile.next()) {
				profile = new Profile();
				
				// Profile DTO에 조회된 데이터들을 대입
				profile.setUserName(rsSelectProfile.getString("user_name"));
				profile.setUserBio(rsSelectProfile.getString("user_bio"));
				profile.setUserAddress(rsSelectProfile.getString("user_address"));
				
				// 대입된 값 체크
				System.out.println("DTO check userName on selectForUpdateProfile : " + profile.getUserName());
				System.out.println("DTO check userBio on selectForUpdateProfile : " + profile.getUserBio());
				System.out.println("DTO check userAddress on selectForUpdateProfile : " + profile.getUserAddress());
			}
		} catch(ClassNotFoundException classException) {
			System.out.println("DB DRIVER 클래스를 찾지 못하였습니다. 커넥터가 존재하는지 확인해주세요!");
		} catch(SQLException sqlException) {
			System.out.println("DB와 관련된 예외가 발생하였습니다!");
			sqlException.printStackTrace();
		} finally {
			if(rsSelectProfile != null) {
				try {
					rsSelectProfile.close();
				} catch (SQLException sqlException) {
					System.out.println("DB와 관련된 예외가 발생하였습니다!");
					sqlException.printStackTrace();
				}
			}
			if(pstmtSelectProfile != null) {
				try {
					pstmtSelectProfile.close();
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
		}
		return profile;
	}
}