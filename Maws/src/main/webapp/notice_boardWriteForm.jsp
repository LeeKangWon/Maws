<%@ include file="main_sub2.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></meta>
<title>게시판 등록 폼</title>
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
<script type="text/JavaScript">
	window.onload = function() {
		CKEDITOR.replace('contents');
	}
</script>
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
</style>
<script type="text/javascript">
	function goUrl(url) {
		location.href = url;
	}
	// 등록 폼 체크
	function boardWriteCheck() {
		var form = document.boardWriteForm;
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
	<div style="position: absolute; left: 430px; top: 260px;">
		<br>
		<br>
		<br>
		<br>
		<form name="boardWriteForm" action="notice_boardProcess.jsp" method="post"
			onsubmit="return boardWriteCheck();">
			<input type="hidden" name="mode" value="W" />
			<table border="1">
				<colgroup>
					<col width="100" />
					<col width="500" />
				</colgroup>
				<tbody>
					<tr>
						<th align="center">제목</th>
						<td><input type="text" name="subject" size="80"
							maxlength="100" /></td>
					</tr>
					<tr>
						<th align="center">작성자</th>
						<td><input type="text" name="writer" maxlength="20" /></td>
					</tr>
					<tr>
						<td colspan="2"><textarea id="contents" name="contents"
								cols="80" rows="10"></textarea></td>
					</tr>
				</tbody>
			</table>
			<p>
				<input type="button" value="목록" onclick="goUrl('notice_boardList.jsp');" />
				<input type="submit" value="글쓰기" />
			</p>
		</form>
	</div>
</body>
</html>