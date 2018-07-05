<!-- ¼­¿¬¹® 2017-07-05 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("euc-kr");
	String userName = request.getParameter("userName");
	String boardTitle = request.getParameter("boardTitle");
	String boardContent = request.getParameter("boardContent");
	String boardOriginal = request.getParameter("boardOriginal");
	
	Board board = new Board();
	board.setUserName(userName);
	board.setBoardTitle(boardTitle);
	board.setBoardContent(boardContent);
	board.setBoardOriginal(boardOriginal);
	
	BoardDao boardDao = new BoardDao();
	boardDao.insertBoard(board);
%>