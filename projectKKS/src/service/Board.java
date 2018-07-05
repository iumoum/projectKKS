// ¼­¿¬¹® 2017-07-05
package service;

public class Board {

	private String userName;
	private	String boardTitle;
	private String boardContent;
	private int boardView;
	private int boardStar;
	private String boardOriginal;
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public int getBoardView() {
		return boardView;
	}
	public void setBoardView(int boardView) {
		this.boardView = boardView;
	}
	public int getBoardStar() {
		return boardStar;
	}
	public void setBoardStar(int boardStar) {
		this.boardStar = boardStar;
	}
	public String getBoardOriginal() {
		return boardOriginal;
	}
	public void setBoardOriginal(String boardOriginal) {
		this.boardOriginal = boardOriginal;
	}
	
}
