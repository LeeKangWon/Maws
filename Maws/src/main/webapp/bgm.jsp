<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<script type="text/javascript">
 
	song = new Array(1);
	song[0] = "resources/music/Love Day.mp3"
	//song[1] = "resources/music/보통연애.mp3"
	
	
	index = Math.floor(Math.random() * song.length);
	
	document.write("<embed name=bgm src=" + song[index] + " autostart=true hidden=true loop=true>");
			



	
	
</script>




</head>
<body>

	<embed src="resources/music/Love Day.mp3" showcontrols="false">
</body>
</html>