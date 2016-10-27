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

	<div style="position: absolute; left: 400px; top: 260px;">
		<table class="basic" border="1">
			<td rowspan="5"><img
				src="resources\image\officer2015\leekangwon.jpg" width="100"
				height="150">
			<tr>
				<td>회장</td>
			</tr>
			<tr>
				<td>이름 : 이강원</td>
			</tr>
			<tr>
				<td>학번 : 201101690</td>
			</tr>
			<tr>
				<td>전화번호 : 010-4658-9446</td>
			</tr>
		</table>
	</div>

	<div style="position: absolute; left: 850px; top: 260px;">
		<table class="basic" border="1">
			<td rowspan="5"><img
				src="resources\image\officer2015\hwangsuji.jpg" width="100"
				height="150">
			<tr>
				<td>부회장</td>
			</tr>
			<tr>
				<td>이름 : 황수지</td>
			</tr>
			<tr>
				<td>학번 : 201300000</td>
			</tr>
			<tr>
				<td>전화번호 : 010-0000-0000</td>
			</tr>
		</table>
	</div>


	<div style="position: absolute; left: 400px; top: 470px;">
		<table class="basic" border="1">
			<td rowspan="5"><img
				src="resources\image\officer2015\limsodame.jpg" width="100"
				height="150">
			<tr>
				<td>임원</td>
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

	<div style="position: absolute; left: 850px; top: 470px;">
		<table class="basic" border="1">
			<td rowspan="5"><img
				src="resources\image\officer2015\byeonjihong.jpg" width="100"
				height="150">
			<tr>
				<td>임원</td>
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

	<div style="position: absolute; left: 400px; top: 680px;">
		<table class="basic" border="1">
			<td rowspan="5"><img
				src="resources\image\officer2015\kimsoungmin.jpg" width="100"
				height="150">
			<tr>
				<td>임원</td>
			</tr>
			<tr>
				<td>이름 : 김성민</td>
			</tr>
			<tr>
				<td>학번 : 201400000</td>
			</tr>
			<tr>
				<td>전화번호 : 010-0000-0000</td>
			</tr>
		</table>
	</div>

	<div style="position: absolute; left: 850px; top: 680px;">
		<table class="basic" border="1">
			<td rowspan="5"><img
				src="resources\image\officer2015\chadongin.png" width="100"
				height="150">
			<tr>
				<td>임원</td>
			</tr>
			<tr>
				<td>이름 : 차동인</td>
			</tr>
			<tr>
				<td>학번 : 201400000</td>
			</tr>
			<tr>
				<td>전화번호 : 010-0000-0000</td>
			</tr>
		</table>
	</div>


	<div style="position: absolute; left: 400px; top: 890px;">
		<table class="basic" border="1">
			<td rowspan="5"><img
				src="resources\image\officer2015\parkminyoung.png" width="100"
				height="150">
			<tr>
				<td>임원</td>
			</tr>
			<tr>
				<td>이름 : 박민영</td>
			</tr>
			<tr>
				<td>학번 : 201400000</td>
			</tr>
			<tr>
				<td>전화번호 : 010-0000-0000</td>
			</tr>
		</table>
	</div>


</body>
</html>