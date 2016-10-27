<%@ include file="main_sub.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>officer_intro</title>

<style type="text/css">
table.basic { 
	width:130%; 
	line-height:21px; 
	border-top: 1px solid #cccccc; 
	border-left: 1px solid #cccccc; 
	border-collapse: collapse;
} 
table.basic th, table.basic td { 
	color:#678197;
	text-align:center;
	border-right: 1px solid #cccccc; 
	border-bottom: 1px solid #cccccc; 
	padding: 3px 0; 
	text-align:center; 
} 
table.basic th { 
	background-color: #eeeeee; 
}
</style>



<script type="text/javascript">
	function handleSelect(elm) {
		window.location = elm.value + ".jsp";
	}
</script>

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

	<div style="position: absolute; left: 400px; top: 260px;">
		<table class="basic" border="1">
			<td rowspan="5"><img
				src="resources\image\officer2016\limsodame.jpg" width="100"
				height="150">
			<tr>
				<td>회장</td>
			</tr>
			<tr>
				<td>이름 : 임소담이</td>
			</tr>
			<tr>
				<td>학번 : 201400000</td>
			</tr>
			<tr>
				<td>전화번호 : 010-0000-0000</td>
			</tr>
		</table>
	</div>

	<div style="position: absolute; left: 850px; top: 260px;">
		<table class="basic" border="1">
			<td rowspan="5"><img
				src="resources\image\officer2016\byeonjihong.jpg" width="100"
				height="150">
			<tr>
				<td>부화장</td>
			</tr>
			<tr>
				<td>이름 : 변지홍</td>
			</tr>
			<tr>
				<td>학번 : 201400000</td>
			</tr>
			<tr>
				<td>전화번호 : 010-0000-0000</td>
			</tr>
		</table>
	</div>


	<div style="position: absolute; left: 400px; top: 470px;">
		<table class="basic" border="1">
			<td rowspan="5"><img
				src="resources\image\officer2016\limsodame.jpg" width="100"
				height="150">
			<tr>
				<td>임원</td>
			</tr>
			<tr>
				<td>이름 : 이지원</td>
			</tr>
			<tr>
				<td>학번 : 201500000</td>
			</tr>
			<tr>
				<td>전화번호 : 010-0000-0000</td>
			</tr>
		</table>
	</div>

	<div style="position: absolute; left: 850px; top: 470px;">
		<table class="basic" border="1">
			<td rowspan="5"><img
				src="resources\image\officer2016\parkjunseo.jpg" width="100"
				height="150">
			<tr>
				<td>임원</td>
			</tr>
			<tr>
				<td>이름 : 박준서</td>
			</tr>
			<tr>
				<td>학번 : 201500000</td>
			</tr>
			<tr>
				<td>전화번호 : 010-0000-0000</td>
			</tr>
		</table>
	</div>

	<div style="position: absolute; left: 400px; top: 680px;">
		<table class="basic" border="1">
			<td rowspan="5"><img
				src="resources\image\officer2016\parkyerim.jpg" width="100"
				height="150">
			<tr>
				<td>임원</td>
			</tr>
			<tr>
				<td>이름 : 박예림</td>
			</tr>
			<tr>
				<td>학번 : 201500000</td>
			</tr>
			<tr>
				<td>전화번호 : 010-0000-0000</td>
			</tr>
		</table>
	</div>

	<div style="position: absolute; left: 850px; top: 680px;">
		<table class="basic" border="1">
			<td rowspan="5"><img
				src="resources\image\officer2016\hanhyeonsu.jpg" width="100"
				height="150">
			<tr>
				<td>임원</td>
			</tr>
			<tr>
				<td>이름 : 한현수</td>
			</tr>
			<tr>
				<td>학번 : 201500000</td>
			</tr>
			<tr>
				<td>전화번호 : 010-0000-0000</td>
			</tr>
		</table>
	</div>


	<div style="position: absolute; left: 400px; top: 890px;">
		<table class="basic" border="1">
			<td rowspan="5"><img
				src="resources\image\officer2016\kimmyounggyu.jpg" width="100"
				height="150">
			<tr>
				<td>임원</td>
			</tr>
			<tr>
				<td>이름 : 김명규</td>
			</tr>
			<tr>
				<td>학번 : 201500000</td>
			</tr>
			<tr>
				<td>전화번호 : 010-0000-0000</td>
			</tr>
		</table>
	</div>

	<div style="position: absolute; left: 850px; top: 890px;">
		<table class="basic" border="1">
			<td rowspan="5"><img
				src="resources\image\officer2016\hwangdahui.jpg" width="100"
				height="150">
			<tr>
				<td>임원</td>
			</tr>
			<tr>
				<td>이름 : 황다희</td>
			</tr>
			<tr>
				<td>학번 : 201500000</td>
			</tr>
			<tr>
				<td>전화번호 : 010-0000-0000</td>
			</tr>
		</table>
	</div>

	<div style="position: absolute; left: 400px; top: 1100px;">
		<table class="basic" border="1">
			<td rowspan="5"><img
				src="resources\image\officer2016\choinakju.jpg" width="100"
				height="150">
			<tr>
				<td>임원</td>
			</tr>
			<tr>
				<td>이름 : 최낙주</td>
			</tr>
			<tr>
				<td>학번 : 201500000</td>
			</tr>
			<tr>
				<td>전화번호 : 010-0000-0000</td>
			</tr>
		</table>
	</div>






</body>
</html>