//마지막 수정날짜 07-05 김정연
package service;

public class User {
	private String userEmail;
	private String userPw;
	private String userName;
	private String userLevel;
	private String userSignUpDate;
	
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		System.out.println(userEmail);
		this.userEmail = userEmail;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		System.out.println(userPw);
		this.userPw = userPw;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		System.out.println(userName);
		this.userName = userName;
	}
	public String getUserLevel() {
		return userLevel;
	}
	public void setUserLevel(String userLevel) {
		this.userLevel = userLevel;
	}
	public String getUserSignUpDate() {
		return userSignUpDate;
	}
	public void setUserSignUpDate(String userSignUpDate) {
		this.userSignUpDate = userSignUpDate;
	}
	
}
