<%@ include file="main_sub2.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	// 사용할 객체 초기화
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	// 파라미터
	String num = request.getParameter("num");
	String pageNum = request.getParameter("pageNum");
	String searchType = request.getParameter("searchType");
	String searchText = request.getParameter("searchText");
	try {
		// 데이터베이스 객체 생성
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/maws", "jspbook", "1234");
		// 조회수 증가 쿼리 실행
		pstmt = conn.prepareStatement("UPDATE notice_board SET hit = hit + 1 WHERE num = ?");
		pstmt.setString(1, num);
		pstmt.executeUpdate();
		// 게시물 상세 조회 쿼리 실행 
		pstmt = conn.prepareStatement(
				"SELECT num, sub, content, writer, reg_date, hit FROM notice_board " + "WHERE num = ?");
		pstmt.setString(1, num);
		rs = pstmt.executeQuery();
		rs.next();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></meta>
<title>게시판 글보기</title>
<link rel="stylesheet" type="text/css"
	href="/resources/ckeditor/contents.css" />
<style type="text/css">
* {
	font-size: 9pt;
}

.btn_align {
	width: 600px;
	text-align: right;
}

table tbody tr th {
	background-color: gray;
}
</style>
<script type="text/javascript">
	function goUrl(url) {
		location.href = url;
	}
	// 삭제 체크
	function deleteCheck(url) {
		if (confirm('정말 삭제하시겠어요?')) {
			location.href = url;
		}
	}
</script>
</head>
<body>
	<div style="position: absolute; left: 430px; top: 260px;">
		<br> <br> <br> <br>
						<table border="1">
							<colgroup>
								<col width="100" />
								<col width="500" />
							</colgroup>
							<tbody>
								<tr>
									<th align="center">제목</th>
									<td><%=rs.getString("sub")%></td>
								</tr>
								<tr>
									<th align="center">작성자/조회수</th>
									<td><%=rs.getString("writer")%> / <%=rs.getInt("hit")%></td>
								</tr>
								<tr>
									<th align="center">등록 일시</th>
									<td><%=rs.getString("reg_date")%></td>
								</tr>
								<tr>
									<td colspan="2"><%=rs.getString("content")%></td>
								</tr>
							</tbody>
						</table>
						<p class="btn_align">
							<input type="button" value="목록"
								onclick="goUrl('notice_boardList.jsp?pageNum=<%=pageNum%>&amp;searchType=<%=searchType%>&amp;searchText=<%=searchText%>');" />
							<input type="button" value="수정"
								onclick="goUrl('notice_boardModifyForm.jsp?num=<%=num%>&amp;pageNum=<%=pageNum%>&amp;searchType=<%=searchType%>&amp;searchText=<%=searchText%>');" />
							<input type="button" value="삭제"
								onclick="deleteCheck('notice_boardProcess.jsp?mode=D&amp;num=<%=num%>&amp;pageNum=<%=pageNum%>&amp;searchType=<%=searchType%>&amp;searchText=<%=searchText%>');" />
						</p>
	</div>
</body>

</html>
<%
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if (rs != null)
			rs.close();
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
	}
%>