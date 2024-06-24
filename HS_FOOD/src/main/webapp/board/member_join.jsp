<%@page import="board.MemberBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="css/board.css" type="text/css" media="screen"/>
</head>
<body>
	<div align="center">
		<h2>회원가입</h2>
		<hr>
		<p><a href=login.jsp>로그인 </a></p>
		<form name="form1" method="post" action="board_control.jsp">
		<input type="hidden" name="action" value="join">
			<table border="1">
			<tr>
				<th>아이디</th>
				<td><input type="text" id="m_id" name="m_id" maxlength="15" required></td>
				<td><button type="button" onclick="checkId();">중복확인</button></td>
			</tr>
			
			<tr>
				<th>이름</th>
				<td colspan="3" style="text-align: left;"><input type="text" name="m_name" maxlength="15" required></td>
				
			</tr>
			<tr>
			<th>비밀번호</th>
				<td colspan="3" style="text-align: left;">
					<input type="password" name="m_pw" maxlength="15" required>
				</td>
			</tr>
			<tr>
				<td colspan="3" align="center">
					<input type="submit" value="저장">
					<input type="reset" value="취소">
				</td>
			</tr>
			</table>
		</form>		
	</div>
</body>


<script>

<%
	ArrayList<String> idList = null;
	MemberBean mb = new MemberBean();
	idList = mb.getIdList();
	
	StringBuffer values = new StringBuffer();
	
	if(idList != null) {
		for(int i=0; i<idList.size();i++){
			if(values.length() >0){
				values.append(",");
			}
			values.append('"').append(idList.get(i)).append('"');
		}		
	}
%>

	function checkId(){
		var inputId = document.getElementById('m_id').value;
		var list = [<%= values.toString()%>];
		console.log(list);
		if(inputId==""){
			alert("아이디를 입력해주세요");
			return;
		}
		
		var flag = true;
		for (var i=0; i<list.length;i++){
			if(inputId==list[i]){
				flag = false;
				break;
			}
		}
		
		if(flag) {
			alert("사용가능한 아이디입니다.");
			return;
		}else{
			alert("사용 불가능한 아이디입니다.");
			document.getElementById('m_id').value = "";
			return;
		}
		
	}		
		
		
</script>
</html>