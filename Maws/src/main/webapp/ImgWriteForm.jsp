<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="main_sub3.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div style="position: absolute; left: 330px; top: 260px;">
	<form name="formUpload" method="post" enctype="multipart/form-data" action="ImgUpload_ok.jsp">
		<input type="file" name="upfile" onkeydown="event.returnValue=false;">
		<textarea name="contents" rows="5" cols="55"></textarea>
		<input type="submit" value="확인"/>
	</form>
	</div>

</body>
</html>