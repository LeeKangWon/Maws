<%@ include file="main_sub2.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>conference_BBS_list</title>
<style type="text/css">
tr.menu {
	width: "5";
	height: "30";
	background-image: url('resources/image/BBS/table_mid.gif');
	background-repeat: repeat-x;
	text-align: center;
}
</style>
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
			<tr height="25" align="center">
			</tr>
			<tr height="1" bgcolor="#D2D2D2">
				<td colspan="6"></td>
			</tr>

			<tr height="1" bgcolor="#82B5DF">
				<td colspan="6" width="752"></td>
			</tr>
		</table>

		<table width="100%" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td colspan="4" height="5"></td>
			</tr>
			<tr align="center">
				<td><input type=button value="글쓰기"></td>
			</tr>
		</table>
	</div>
</body>

</html>