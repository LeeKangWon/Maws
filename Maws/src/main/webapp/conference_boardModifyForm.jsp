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
		conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/maws", "jspbook", "1234");
		// 게시물 상세 조회 쿼리 실행 
		pstmt = conn.prepareStatement(
				"SELECT num, sub, content, writer, hit, reg_date FROM conference_board " + "WHERE NUM = ?");
		pstmt.setString(1, num);
		rs = pstmt.executeQuery();
		rs.next();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></meta>
<title>게시판 수정 폼</title>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/ckeditor/ckeditor.js"></script>
<style type="text/css">
* {
	font-size: 9pt;
}

p {
	width: 600px;
	text-align: right;
}

table tbody tr th {
	background-color: gray;
}
법
</style>
<script type="text/javascript">
	function goUrl(url) {
		location.href = url;
	}
	// 수정 폼 체크
	function boardModifyCheck() {
		var form = document.boardModifyForm;
		if (form.subject.value == '') {
			alert('제목을 입력하세요.');
			form.subject.focus();
			return false;
		}
		if (form.writer.value == '') {
			alert('작성자을 입력하세요');
			form.writer.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<div align="center">
		<br>
		<br>
		<br>
		<br>
		<form name="boardModifyForm" action="conference_boardProcess.jsp" method="post"
			onsubmit="return boardModifyCheck();">
			<input type="hidden" name="mode" value="M" /> <input type="hidden"
				name="num" value="<%=num%>" /> <input type="hidden" name="pageNum"
				value="<%=pageNum%>" /> <input type="hidden" name="searchType"
				value="<%=searchType%>" /> <input type="hidden" name="searchText"
				value="<%=searchText%>" />
			<table border="1" summary="게시판 수정 폼">
				<caption>게시판 수정 폼</caption>
				<colgroup>
					<col width="100" />
					<col width="500" />
				</colgroup>
				<tbody>
					<tr>
						<th align="center">제목</th>
						<td><input type="text" name="subject" size="80"
							maxlength="100" value="<%=rs.getString("subject")%>" /></td>
					</tr>
					<tr>
						<th align="center">작성자</th>
						<td><input type="text" name="writer" maxlength="20"
							value="<%=rs.getString("writer")%>" /></td>
					</tr>
					<tr>
						<td colspan="2"><textarea name="contents" cols="80" rows="10"><%=rs.getString("contents")%></textarea>
							<script>
								CKEDITOR.replace('contents');
							</script></td>
					</tr>
				</tbody>
			</table>
			<p>
				<input type="button" value="목록"
					onclick="goUrl('conference_boardList.jsp?pageNum=<%=pageNum%>&amp;searchType=<%=searchType%>&amp;searchText=<%=searchText%>');" />
				<input type="submit" value="글수정" />
			</p>
		</form>
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
