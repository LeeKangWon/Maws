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
	<!-- chrome에서 select가 작동을 안한다 물어볼것 -->
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
				src="resources\image\officer2016\limsodame.jpg" width="100"
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

	<div style="position: absolute; left: 910px; top: 260px;">
		부회장
		<table border="1">
			<td rowspan="4"><img
				src="resources\image\officer2016\byeonjihong.jpg" width="100"
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


	<div style="position: absolute; left: 430px; top: 470px;">
		임원
		<table border="1">
			<td rowspan="4"><img
				src="resources\image\officer2016\limsodame.jpg" width="100"
				height="150">
			<tr>
				<td>이름 : 이지원</td>
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
				src="resources\image\officer2016\parkjunseo.jpg" width="100"
				height="150">
			<tr>
				<td>이름 : 박준서</td>
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
				src="resources\image\officer2016\parkyerim.jpg" width="100"
				height="150">
			<tr>
				<td>이름 : 박예림</td>
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
				src="resources\image\officer2016\hanhyeonsu.jpg" width="100"
				height="150">
			<tr>
				<td>이름 : 한현수</td>
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
				src="resources\image\officer2016\kimmyounggyu.jpg" width="100"
				height="150">
			<tr>
				<td>이름 : 김명규</td>
				<td>학번 : ?</td>
			</tr>
			<tr>
				<td>나이 : ?</td>
				<td>전화번호 : ?</td>
			</tr>
			<td colspan="2">이메일 : ?</td>
		</table>
	</div>

	<div style="position: absolute; left: 910px; top: 890px;">
		임원
		<table border="1">
			<td rowspan="4"><img
				src="resources\image\officer2016\hwangdahui.jpg" width="100"
				height="150">
			<tr>
				<td>이름 : 황다희</td>
				<td>학번 : ?</td>
			</tr>
			<tr>
				<td>나이 : ?</td>
				<td>전화번호 : ?</td>
			</tr>
			<td colspan="2">이메일 : ?</td>
		</table>
	</div>

	<div style="position: absolute; left: 430px; top: 1100px;">
		임원
		<table border="1">
			<td rowspan="4"><img
				src="resources\image\officer2016\choinakju.jpg" width="100"
				height="150">
			<tr>
				<td>이름 : 최낙주</td>
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