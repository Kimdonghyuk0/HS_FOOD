<%@page import="board.MemberBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); 
	String msg = (String) request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<link rel="stylesheet" href="css/board.css" type="text/css" media="screen"/>
<script type="text/javascript">
	<% if(msg != null) { %>	
		alert('<%=msg%>');
	<%} %>
</script>
</head>
<body>
	<div align="center">
		<h2>회원탈퇴</h2>
		<hr>
		<p><a href=login.jsp>뒤로가기 </a></p>
		<form name="form1" method="post" action="board_control.jsp">
		<input type="hidden" name="action" value="memberDelete">
			<table border="1">
			<tr>
				<th>아이디</th>
				<td><input type="text" id="m_id" name="m_id" maxlength="15" required></td>
			</tr>
			<tr>
			<th>비밀번호</th>
				<td colspan="2">
					<input type="password" id="m_pw" name="m_pw" maxlength="15" required>
				</td>
			</tr>
			<tr>
			<th>비밀번호 확인</th>
				<td colspan="2">
					<input type="password" id="re_m_pw" name="re_m_pw" maxlength="15" required>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="탈퇴">
					<input type="reset"  value="취소">
				</td>
			</tr>
			</table>
		</form>		
	</div>
</body>
</html>