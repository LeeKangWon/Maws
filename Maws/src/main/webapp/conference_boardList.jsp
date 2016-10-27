<%@ include file="main_sub2.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	// 사용할 객체 초기화
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int pageNumTemp = 1;
	int listCount = 10;
	int pagePerBlock = 10;
	String whereSQL = "";
	// 파라미터
	String pageNum = request.getParameter("pageNum");
	String searchType = request.getParameter("searchType");
	String searchText = request.getParameter("searchText");
	// 파라미터 초기화
	if (searchText == null) {
		searchType = "";
		searchText = "";
	}
	if (pageNum != null) {
		pageNumTemp = Integer.parseInt(pageNum);
	}
	// 한글파라미터 처리
	String searchTextUTF8 = new String(searchText.getBytes("ISO-8859-1"), "UTF-8");
	// 데이터베이스 커넥션 및 질의문 실행
	// 검색어 쿼리문 생성
	if (!"".equals(searchText)) {
		if ("ALL".equals(searchType)) {
			whereSQL = " WHERE sub LIKE CONCAT('%',?,'%') OR writer LIKE CONCAT('%',?,'%') OR content LIKE CONCAT('%',?,'%') ";
		} else if ("SUBJECT".equals(searchType)) {
			whereSQL = " WHERE sub LIKE CONCAT('%',?,'%') ";
		} else if ("WRITER".equals(searchType)) {
			whereSQL = " WHERE writer LIKE CONCAT('%',?,'%') ";
		} else if ("CONTENTS".equals(searchType)) {
			whereSQL = " WHERE content LIKE CONCAT('%',?,'%') ";
		}
	}
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/maws", "jspbook", "1234");
		// 게시물의 총 수를 얻는 쿼리 실행
		pstmt = conn.prepareStatement("SELECT COUNT(NUM) AS TOTAL FROM conference_board" + whereSQL);
		if (!"".equals(whereSQL)) {
			if ("ALL".equals(searchType)) {
				pstmt.setString(1, searchTextUTF8);
				pstmt.setString(2, searchTextUTF8);
				pstmt.setString(3, searchTextUTF8);
			} else {
				pstmt.setString(1, searchTextUTF8);
			}
		}
		rs = pstmt.executeQuery();
		rs.next();
		int totalCount = rs.getInt("TOTAL");
		// 게시물 목록을 얻는 쿼리 실행
		pstmt = conn.prepareStatement("SELECT num, sub, writer, reg_date, hit FROM conference_board "
				+ whereSQL + " ORDER BY num DESC LIMIT ?, ?");
		if (!"".equals(whereSQL)) {
			// 전체검색일시
			if ("ALL".equals(searchType)) {
				pstmt.setString(1, searchTextUTF8);
				pstmt.setString(2, searchTextUTF8);
				pstmt.setString(3, searchTextUTF8);
				pstmt.setInt(4, listCount * (pageNumTemp - 1));
				pstmt.setInt(5, listCount);
			} else {
				pstmt.setString(1, searchTextUTF8);
				pstmt.setInt(2, listCount * (pageNumTemp - 1));
				pstmt.setInt(3, listCount);
			}
		} else {
			pstmt.setInt(1, listCount * (pageNumTemp - 1));
			pstmt.setInt(2, listCount);
		}
		rs = pstmt.executeQuery();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></meta>
<title>게시판 목록</title>
<style type="text/css">


p {
	width: 600px;
	text-align: right;
}

table thead tr th {
	background-color: gray;
}

tr.menu {
	width: "5"; height : "30";
	background-image: url('resources/image/BBS/table_mid.gif');
	background-repeat: repeat-x;
	text-align: center;
	height: "30";
}
</style>
<script type="text/javascript">
	function goUrl(url) {
		location.href = url;
	}
	// 검색 폼 체크
	function searchCheck() {
		var form = document.searchForm;
		if (form.searchText.value == '') {
			alert('검색어를 입력하세요.');
			form.searchText.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<div style="position: absolute; left: 430px; top: 260px;">
		<table width="100%" cellpadding="0" cellspacing="0" border="0">
			<tr height="5">
				<td width="5"></td>
			</tr>
			<tr class="menu">
				<td width="5"><img src="resources/image/BBS/table_left.gif"
					width="5" height="30" /></td>
				<td width="73">번호</td>
				<td width="379">제목</td>
				<td width="73">작성자</td>
				<td width="164">작성일</td>
				<td width="58">조회수</td>
				<td width="7"><img src="resources/image/BBS/table_right.gif"
					width="5" height="30" /></td>
			</tr>




			<%
					if (totalCount == 0) {
				%>
			<tr>
				<td align="center" colspan="5">등록된 게시물이 없습니다.</td>
			</tr>

			<tr height="1" bgcolor="#D2D2D2">
				<td colspan="6"></td>
			</tr>
			<tr height="1" bgcolor="#82B5DF">
				<td colspan="6" width="752"></td>
			</tr>
			<%
					} else {
							int i = 0;
							while (rs.next()) {
								i++;
				%>
			<tr>
			<td></td>
				<td align="center"><%=totalCount - i + 1 - (pageNumTemp - 1) * listCount%></td>
				
				<td><a href="conference_boardView.jsp?num=<%=rs.getInt("num")%>&amp;pageNum=<%=pageNumTemp%>&amp;searchType=<%=searchType%>&amp;searchText=<%=searchText%>"><%=rs.getString("sub")%></a></td>
				<td align="center"><%=rs.getString("writer")%></td>
				<td align="center"><%=rs.getString("reg_date").substring(0, 10)%></td>
				<td align="center"><%=rs.getInt("hit")%></td>
			</tr>
			<%
					}
						}
				%>
			</tbody>
			<tfoot>
				<tr>
					<td align="center" colspan="5">
						<%
							// 페이지 네비게이터
								if (totalCount > 0) {
									int totalNumOfPage = (totalCount % listCount == 0) ? totalCount / listCount
											: totalCount / listCount + 1;

									int totalNumOfBlock = (totalNumOfPage % pagePerBlock == 0) ? totalNumOfPage / pagePerBlock
											: totalNumOfPage / pagePerBlock + 1;

									int currentBlock = (pageNumTemp % pagePerBlock == 0) ? pageNumTemp / pagePerBlock
											: pageNumTemp / pagePerBlock + 1;

									int startPage = (currentBlock - 1) * pagePerBlock + 1;
									int endPage = startPage + pagePerBlock - 1;

									if (endPage > totalNumOfPage)
										endPage = totalNumOfPage;
									boolean isNext = false;
									boolean isPrev = false;
									if (currentBlock < totalNumOfBlock)
										isNext = true;
									if (currentBlock > 1)
										isPrev = true;
									if (totalNumOfBlock == 1) {
										isNext = false;
										isPrev = false;
									}
									StringBuffer sb = new StringBuffer();
									if (pageNumTemp > 1) {
										sb.append("<a href=\"").append("conference_boardList.jsp?pageNum=1&amp;searchType=" + searchType
												+ "&amp;searchText=" + searchText);
										sb.append("\" title=\"<<\"><<</a>&nbsp;");
									}
									if (isPrev) {
										int goPrevPage = startPage - pagePerBlock;
										sb.append("&nbsp;&nbsp;<a href=\"").append("conference_boardList.jsp?pageNum=" + goPrevPage
												+ "&amp;searchType=" + searchType + "&amp;searchText=" + searchText);
										sb.append("\" title=\"<\"><</a>");
									} else {

									}
									for (int i = startPage; i <= endPage; i++) {
										if (i == pageNumTemp) {
											sb.append("<a href=\"#\"><strong>").append(i).append("</strong></a>&nbsp;&nbsp;");
										} else {
											sb.append("<a href=\"").append("conference_boardList.jsp?pageNum=" + i + "&amp;searchType="
													+ searchType + "&amp;searchText=" + searchText);
											sb.append("\" title=\"" + i + "\">").append(i).append("</a>&nbsp;&nbsp;");
										}
									}
									if (isNext) {
										int goNextPage = startPage + pagePerBlock;

										sb.append("<a href=\"").append("conference_boardList.jsp?pageNum=" + goNextPage + "&amp;searchType="
												+ searchType + "&amp;searchText=" + searchText);
										sb.append("\" title=\">\">></a>");
									} else {

									}
									if (totalNumOfPage > pageNumTemp) {
										sb.append("&nbsp;&nbsp;<a href=\"").append("conference_boardList.jsp?pageNum=" + totalNumOfPage
												+ "&amp;searchType=" + searchType + "&amp;searchText=" + searchText);
										sb.append("\" title=\">>\">>></a>");
									}
									out.print(sb.toString());
								}
						%>
					</td>
				</tr>
			</tfoot>
		</table>
		<p>
			<input align="right" type="button" value="목록" onclick="goUrl('conference_boardList.jsp');" />
			<input align="right" type="button" value="글쓰기"
				onclick="goUrl('conference_boardWriteForm.jsp');" />
		</p>
		<form name="searchForm" action="conference_boardList.jsp" method="get"
			onsubmit="return searchCheck();">
			<p>
				<select name="searchType">
					<option value="ALL" selected="selected">전체검색</option>
					<option value="SUBJECT"
						<%if ("SUBJECT".equals(searchType))
					out.print("selected=\"selected\"");%>>제목</option>
					<option value="WRITER"
						<%if ("WRITER".equals(searchType))
					out.print("selected=\"selected\"");%>>작성자</option>
					<option value="CONTENTS"
						<%if ("CONTENTS".equals(searchType))
					out.print("selected=\"selected\"");%>>내용</option>
				</select> <input type="text" name="searchText" value="<%=searchTextUTF8%>" />
				<input type="submit" value="검색" />
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
