<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="board.Board" %>
<%@ page import="board.BoardBean" %>
<%@ page import="java.net.URLEncoder" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시판 목록</title>
    <link rel="stylesheet" href="css/board.css" type="text/css">
</head>
<body>
<div align="center">
    <h2>게시판 : 목록 화면</h2>
    <hr>
    <div>
        <u><a href="board_control.jsp?action=logOut">로그아웃</a></u>
    </div>

    <!-- 검색 폼 추가 -->
    <form method="get" action="board_list.jsp">
        <input type="text" name="searchKeyword" placeholder="검색어를 입력하세요" value="<%= request.getParameter("searchKeyword") != null ? request.getParameter("searchKeyword") : "" %>">
        <button type="submit">검색</button>
        	<button  type="button" onclick="location.href='board_control.jsp?action=list'">목록</button>
    </form>
    
    <h2>게시판</h2>
    <table style="width: 80%;">
        <tr bgcolor="yellow">
            <th style="width: 10%;">번호</th>
            <th style="width: 40%; min-width: 300px;">제목</th>
            <th style="width: 20%;">작성자</th>
            <th style="width: 30%;">작성일</th>
        </tr>
        <!-- 게시글 목록 출력 부분 -->
        <% 
        int currentPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
        String searchKeyword = request.getParameter("searchKeyword") != null ? request.getParameter("searchKeyword") : "";
        BoardBean boardBean = new BoardBean();
        ArrayList<Board> boards;
        int totalPosts;
        if (searchKeyword.isEmpty()) {
            boards = boardBean.getBoardList(currentPage);
            totalPosts = boardBean.getTotalPosts();
        } else {
            boards = boardBean.searchBoardList(searchKeyword, currentPage);
            totalPosts = boardBean.getSearchTotalPosts(searchKeyword);
        }
        int totalPages = (int) Math.ceil((double) totalPosts / 10);
        request.setAttribute("boards", boards);
        request.setAttribute("totalPages", totalPages);
        %>
        <c:forEach items="${boards}" var="board">
            <tr>
                <td><a href="board_control.jsp?action=detail&board_num=${board.board_num}">${board.board_num}</a></td>
                <td><a href="board_control.jsp?action=detail&board_num=${board.board_num}">${board.board_title}</a></td>
                <td>${board.board_name}</td>
                <td>${board.board_date}</td>
            </tr>
        </c:forEach>
    </table>
    <div style="width: 80%;">
        <div style="text-align: right; margin-top: 20px;">
            <button style="border: 0px; background: #fff" type="button" onclick="location.href='board_form.jsp'"><u> 글쓰기 </u></button>
        </div>
    </div>
    <nav style="text-align: center; background-color: #f8f9fa; padding: 10px 0;">
        <c:forEach begin="1" end="${totalPages}" var="i">
            <a href="board_list.jsp?page=${i}&searchKeyword=<%= URLEncoder.encode(searchKeyword, "UTF-8") %>">${i}</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </c:forEach>
    </nav>
</div>
</body>
</html>
