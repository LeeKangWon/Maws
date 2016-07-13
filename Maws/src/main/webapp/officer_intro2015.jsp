<%@ include file="main_sub.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>officer_intro</title>

<script type="text/javascript">
	function handleSelect(elm) {
		window.location = elm.value + ".jsp";
	}
</script>

</head>
<body>

	<div style="position: absolute; left: 430px; top: 220px;">
		<select name="select"
			onchange="javascript:handleSelect(this);">
			<option value="">===년도 선택===</option>
			<option value="officer_intro2016">2016년 임원</option>
			<option value="officer_intro2015">2015년 임원</option>
		</select>
	</div>

	<div style="position: absolute; left: 430px; top: 260px;">
		회장
		<table border="1">
			<td rowspan="4"><img
				src="resources\image\officer2015\leekangwon.jpg" width="100"
				height="150">
			<tr>
				<td>이름 : 이강원</td>
				<td>학번 : 201101690</td>
			</tr>
			<tr>
				<td>나이 : 25</td>
				<td>전화번호 : 010-4658-9446</td>
			</tr>
			<td colspan="2">이메일 : wangchozza1@naver.com</td>
		</table>
	</div>

	<div style="position: absolute; left: 910px; top: 260px;">
		부회장
		<table border="1">
			<td rowspan="4"><img
				src="resources\image\officer2015\hwangsuji.jpg" width="100"
				height="150">
			<tr>
				<td>이름 : 황수지</td>
				<td>학번 : ?</td>
			</tr>
			<tr>
				<td>나이 : ?</td>
				<td>전화번호 : ?</td>
			</tr>
			<td colspan="2">이메일 : ?</td>
		</table>
	</div>


	<div style="position: absolute; left: 430px; top: 470px;">
		임원
		<table border="1">
			<td rowspan="4"><img
				src="resources\image\officer2015\limsodame.jpg" width="100"
				height="150">
			<tr>
				<td>이름 : 임소담이</td>
				<td>학번 : ?</td>
			</tr>
			<tr>
				<td>나이 : ?</td>
				<td>전화번호 : ?</td>
			</tr>
			<td colspan="2">이메일 : ?</td>
		</table>
	</div>

	<div style="position: absolute; left: 910px; top: 470px;">
		임원
		<table border="1">
			<td rowspan="4"><img
				src="resources\image\officer2015\byeonjihong.jpg" width="100"
				height="150">
			<tr>
				<td>이름 : 변지홍</td>
				<td>학번 : ?</td>
			</tr>
			<tr>
				<td>나이 : ?</td>
				<td>전화번호 : ?</td>
			</tr>
			<td colspan="2">이메일 : ?</td>
		</table>
	</div>

	<div style="position: absolute; left: 430px; top: 680px;">
		임원
		<table border="1">
			<td rowspan="4"><img
				src="resources\image\officer2015\kimsoungmin.jpg" width="100"
				height="150">
			<tr>
				<td>이름 : 김성민</td>
				<td>학번 : ?</td>
			</tr>
			<tr>
				<td>나이 : ?</td>
				<td>전화번호 : ?</td>
			</tr>
			<td colspan="2">이메일 : ?</td>
		</table>
	</div>

	<div style="position: absolute; left: 910px; top: 680px;">
		임원
		<table border="1">
			<td rowspan="4"><img
				src="resources\image\officer2015\chadongin.png" width="100"
				height="150">
			<tr>
				<td>이름 : 차동인</td>
				<td>학번 : ?</td>
			</tr>
			<tr>
				<td>나이 : ?</td>
				<td>전화번호 : ?</td>
			</tr>
			<td colspan="2">이메일 : ?</td>
		</table>
	</div>


	<div style="position: absolute; left: 430px; top: 890px;">
		임원
		<table border="1">
			<td rowspan="4"><img
				src="resources\image\officer2015\parkminyoung.png" width="100"
				height="150">
			<tr>
				<td>이름 : 차동인</td>
				<td>학번 : ?</td>
			</tr>
			<tr>
				<td>나이 : ?</td>
				<td>전화번호 : ?</td>
			</tr>
			<td colspan="2">이메일 : ?</td>
		</table>
	</div>






</body>
</html>