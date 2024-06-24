<%@page import="board.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="board" scope="request" class="board.Board"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<link rel="stylesheet" href="css/board.css" type="text/css" media="screen"/>
</head>
<body>
<div align="center">
	<h2>게시판 : 수정 화면 </h2>
	<hr>
	<c:set var="board" value="${board}"/>
	
	<form action="board_control.jsp" method="post">
	<input type="hidden" name="action" value="updateProc">
	<input type="hidden" name="board_id" value="${board.board_id}">
		<table style="width: 80%; max-width: 600px;">
			<tr>
				<th style="width: 15%;">제목</th>
				<td style="width: 35%;"><input type="text" name="board_title" maxlength="50" value="${board.board_title}"></td>
				<th style="width: 15%;">번호</th>
				<td style="width: 35%;"><input type="text" name="board_num" readonly="readonly" value="${board.board_num}"></td>
			</tr>

			<tr>
			 <th>작성자</th>
			 <td colspan="3"><input type="text" name="board_name" maxlength="15" readonly="readonly" value="${board.board_name}"></td>
			</tr>
			
			<tr>
			 <th>작성일</th>
			 <td colspan="3"><input type="text" name="board_date" readonly="readonly" value="${board.board_date}"></td>
			</tr>

			<tr>
			 <th>내용</th>
			 <td colspan="3"><input type="text" name="board_content" maxlength="200" value="${board.board_content}"></td>
			</tr>
			
		</table>
		<div style="width: 80%; max-width:600px; margin-top: 20px; display: flex; justify-content: flex-end;">
			<button style="margin: 5px;" type="submit">수정하기</button>
			<button style="margin: 5px;" type="button" onclick="location.href='board_control.jsp?action=list'">목록</button>
		</div>
	
	</form>
</div>
</body>
</html>