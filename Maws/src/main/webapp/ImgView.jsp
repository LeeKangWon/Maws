<%@page import="java.net.URLDecoder"%>
<%@page import="com.sun.xml.internal.fastinfoset.Encoder"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="com.company.maws.GalleryVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="main_sub3.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>파일 업로드 예제</title>
</head>
<body>

	<jsp:useBean id="dao" class="com.company.maws.GalleryDAO" />
	<form name="view">
		<%		
		int top = 400;
		int rowcount = 1;
			String saveFloder = "resources/image/";
			ArrayList<GalleryVO> f_list = new ArrayList<GalleryVO>();
			f_list = dao.getFileNamelist(); //dao로 fileNameList 불러오기
			//사용할 객체 초기화

			for (GalleryVO vo : f_list) {
				int left = 340;
				String savePath = saveFloder + vo.getFileName();
				//URLEncoder.encode(savePath, "UTF-8");
				
				if(rowcount % 2 == 0)
					left += 480;
				
				if(rowcount % 3 == 0)
				{
					top += 210;
				}
				
				System.out.println(URLDecoder.decode(savePath, "MS-949").replaceAll(" ", ""));
				
			%>
		<div style="position: absolute; left: <%=left%>px; top: <%=top%>px;">
			<table border="1">
				<td rowspan="3"><img src="<%=URLDecoder.decode(savePath, "UTF-8").replaceAll(" ", "")%>" width="100" height="150">
				
				<tr>
					<td><%=vo.getNum() %></td>
					<td><%=vo.getName() %></td>
				</tr>
				<tr>
					<td><%=savePath%></td>
					<td><%=vo.getTime() %></td>
				</tr>
				<tr>
					<td colspan="3" align="right"><input type="button" value="이미지 등록" onclick="location.href='ImgWriteForm.jsp'">
				</tr>
			</table>
		</div>
		<%
		rowcount++;
		}
			%>
</body>
</html>
