<%@page import="board.MemberBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	Date date = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	String today = sdf.format(date);
	
	MemberBean member=new MemberBean();
	String m_name=member.getUserName((String)session.getAttribute("s_id"));
	
%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="css/board.css" type="text/css" media="screen"/>
<head>
<meta charset="UTF-8">
<title>board_form</title>
</head>
<body>
<div align="center">
	<h2>게시판 : 글 작성 화면 </h2>
	<hr>
	<form action="board_control.jsp" method="post">
	
		<input type="hidden" name="action" value="insertBoard">
		<input type="hidden" name="board_id" value="${s_id}">
		<table style="width: 80%; max-width: 600px;">
			<tr>
				<th style="width: 15%;">제목</th>
				<td style="width: 35%;"><input type="text" name="board_title" maxlength="50"></td>
			</tr>

			<tr>
			 <th>작성자</th>
			 <td colspan="3"><input type="text" name="board_name" value="<%=m_name%>" readonly maxlength="15"></td>
			</tr>
			
			<tr>
			 <th>작성일</th>
			 <td colspan="3"><input type="text" name="board_date" value="<%=today%>" readonly></td>
			</tr>

			<tr>
			 <th>내용</th>
			 <td colspan="3"><textarea name="board_content" cols="50" rows="16"></textarea></td>
			</tr>
			
		</table>
		<div style="width: 80%; max-width:600px; margin-top: 20px; display: flex; justify-content: flex-end;">
			<button style="margin: 5px; border: 0px;" type="submit">완료</button>
			<button style="margin: 5px; border: 0px;" type="button" onclick="location.href='board_control.jsp?action=list'">목록</button>
		</div>
	
	</form>
</div>
</body>
</html>