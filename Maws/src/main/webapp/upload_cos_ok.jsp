<%@page import="java.io.File"%>
<%@page import="java.io.IOException"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String encType="UTF-8"; //인코딩 타입
		int sizeLimit = 1*1024*1024; //1메가
		
		String saveFolder="/Image";
		String savePath1="D:/사진"; //웹 어플리케이션의 절대 경로가 저장될 객체
		//ServletContext context = getServletContext();
		//savePath1 = context.getRealPath(saveFolder);
		
		String savePath2 = application.getRealPath("/Image");
		String savePath3 = request.getRealPath("/Image");
		
		try{
			MultipartRequest multi = new MultipartRequest(request, savePath1, sizeLimit, encType, new DefaultFileRenamePolicy());
			String originalFileName = multi.getOriginalFileName("upfile");
			String fileName = multi.getFilesystemName("upfile");
			
			if(fileName==null) {
	%>
	<h2>파일이 업로드 되지 않았습니다.</h2><br>
	<a href = "javascript:history.back()">다시 업로드 하기</a>
	<%
			}
			else {
				File file1 = multi.getFile("upfile");
				String contents = multi.getParameter("contents");
	%>
	<h2>파일 업로드가 정상적으로 완료되었습니다!</h2>
	저장된 파일 이름 : <%=fileName %><br>
	변경되기 이전의 파일 이름 : <%=originalFileName %><br>
	설명 : <%=contents%><br>
	사이즈 : <%=file1.length()%>Byte<br>
	ContentType : <%=multi.getContentType("upfile")%><br>
	<%
			}
		}catch(IOException e){
			out.print("<h2>IOException이 발생했습니다.</h2><br><pre>" + e.getMessage() + "</pre>");
		}
	%>

</body>
</html>