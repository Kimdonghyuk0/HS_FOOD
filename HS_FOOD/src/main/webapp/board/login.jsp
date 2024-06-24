<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/board.css" type="text/css" media="screen"/>
<meta charset="UTF-8">
<title>로그인 페이지(전부 완성)</title>
</head>
<body bgcolor="#FFFFFF">
<div style="text-align:center;">
	<h2>로그인(전부 완성)</h2>
	<hr>
	<form method="post" action="board_control.jsp" name="form1">
		<input type="hidden" name="action" value="loginProc">
		<table width="250px" border="1" align="center" cellspacing="0" cellpadding="5">
			<tr>
			<td colspan="2" align="center">로그인</td>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="m_id" size="10"></td>
			</tr>
			<tr>
				<td>패스워드</td>
				<td><input type="password" name="m_pw" size="10"></td>
			</tr>
			<tr>
				<td align ="center" colspan="2">
					<div style="display: flex; justify-content:space-between;">
						<button type="submit" style="width:80px;">로그인</button>
						<button type="button" style="width:80px;" onclick="location.href='member_join.jsp'">회원가입</button>
						<button type="button" style="width:80px;" onclick="location.href='member_delete.jsp'">회원탈퇴</button>
					</div>
				</td>
			</tr>
		
		</table>
	</form>
</div>
</body>
</html>