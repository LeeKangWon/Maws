<%@ include file="main.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jQuery UI Menu - Categories</title>
<style type="text/css">
#cssmenu, #cssmenu ul, #cssmenu ul li, #cssmenu ul li a {
	margin: 0;
	padding: 0;
	border: 0;
	list-style: none;
	line-height: 1;
	display: block;
	position: relative;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

#cssmenu {
	width: 180px;
	z-index: 10;
}

#cssmenu ul {
	border: 1px solid #cccccc;
	border-radius: 5px;
	background: #ffffff;
	background: -moz-linear-gradient(bottom, #f0f0f0, #ffffff);
	background: -webkit-linear-gradient(bottom, #f0f0f0, #ffffff);
	background: -o-linear-gradient(bottom, #f0f0f0, #ffffff);
	background: -ms-linear-gradient(bottom, #f0f0f0, #ffffff);
	background: linear-gradient(to top, #f0f0f0, #ffffff);
}

#cssmenu ul li {
	display: block;
	border-bottom: 1px solid #cccccc;
}

#cssmenu ul li.active {
	border-bottom: 0;
}

#cssmenu ul li:last-child {
	border-bottom: 0;
}

#cssmenu ul li a {
	display: block;
	padding: 14px 12px;
	font-family: Helvetica, Arial, sans-serif;
	font-size: 16px;
	font-weight: bold;
	text-decoration: none;
	color: #444444;
}

#cssmenu ul li.active {
	left: -8px;
	width: 194px;
	padding: 2px;
	background: #fbc779;
	background: -moz-linear-gradient(bottom, #fabb5b, #fcd397);
	background: -webkit-linear-gradient(bottom, #fabb5b, #fcd397);
	background: -o-linear-gradient(bottom, #fabb5b, #fcd397);
	background: -ms-linear-gradient(bottom, #fabb5b, #fcd397);
	background: linear-gradient(to top, #fabb5b, #fcd397);
	box-shadow: 0 1px 1px rgba(0, 0, 0, 0.25);
}

#cssmenu ul li.active>a {
	padding: 12px 12px 12px 16px;
	border-left: 1px dashed #fde6c3;
	border-top: 1px dashed #fde6c3;
	border-bottom: 1px dashed #fde6c3;
	color: #ffffff;
	text-shadow: 0 1px 1px #f89e16;
}

#cssmenu ul li.active:after {
	position: absolute;
	right: -16px;
	top: 7px;
	width: 31.52691193px;
	height: 31.52691193px;
	background: #fbc779;
	background: -moz-linear-gradient(-45deg, #fabb5b, #fcd397);
	background: -webkit-linear-gradient(-45deg, #fabb5b, #fcd397);
	background: -o-linear-gradient(-45deg, #fabb5b, #fcd397);
	background: -ms-linear-gradient(-45deg, #fabb5b, #fcd397);
	background: linear-gradient(-45deg, #fabb5b, #fcd397);
	-webkit-transform: rotate(45deg);
	-moz-transform: rotate(45deg);
	-ms-transform: rotate(45deg);
	-o-transform: rotate(45deg);
	transform: rotate(45deg);
	content: "";
}

#cssmenu ul li.active:before {
	position: absolute;
	right: -12px;
	top: 9px;
	z-index: 10;
	width: 28.52691193px;
	height: 28.52691193px;
	border-right: 1px dashed #fffbf5;
	border-top: 1px dashed #fffbf5;
	-webkit-transform: rotate(45deg);
	-moz-transform: rotate(45deg);
	-ms-transform: rotate(45deg);
	-o-transform: rotate(45deg);
	transform: rotate(45deg);
	content: "";
}

#cssmenu ul li.active a:after {
	position: absolute;
	bottom: -7px;
	left: -11px;
	z-index: -1;
	width: 0;
	height: 0;
	border-top: 4px solid transparent;
	border-bottom: 4px solid transparent;
	border-left: 8px solid transparent;
	border-right: 8px solid #f8a425;
	content: "";
}
</style>
</head>
<body>

	<div id="cssmenu" style="position:absolute; left:50px; top:300px;">
		<ul>
			<li class="active"><a href="#">Maws</a></li>
			<li><a href="#">등업신청</a></li>
			<li><a href="member_intro.jsp">회원정보</a></li>
			<li><a href="ImgView.jsp">갤러리</a></li>
			<li><a href="#">자유게시판</a></li>
		</ul>
	</div>


</body>
</html>