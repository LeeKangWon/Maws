<%@page import="java.util.Enumeration"%>
<%@page import="java.io.File"%>
<%@page import="java.io.IOException"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String encType="UTF-8"; //인코딩 타입
		int sizeLimit = 1*1024*1024; //1메가
		String fullPath = "";
		String fileNameTest="";
		String saveFolder="/Image";
		String savePath1="D:\\MawsPage\\Maws\\src\\main\\webapp\\resources\\image"; //웹 어플리케이션의 절대 경로가 저장될 객체
		// 사용할 객체 초기화
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		// 파라미터
		System.out.println(session.getAttribute("id"));
		
		try{
			MultipartRequest multi = new MultipartRequest(request, savePath1, sizeLimit, encType, new DefaultFileRenamePolicy());
			Enumeration<?> files = multi.getFileNames();
			String file2 = (String)files.nextElement();
			fileNameTest = multi.getFilesystemName(file2);
			String originalFileName = multi.getOriginalFileName("upfile");
			String fileName = multi.getFilesystemName("upfile");
			
			String id = (String)session.getAttribute("id");

			
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/maws", "jspbook", "1234");

			// 실행
			String sql = "INSERT INTO gallery (m_name, filename) VALUES(?,?)";
			/*
			 * INSERT INTO 테이블명 VALUES(컬럼1 넣고자하는 데이터, 컬럼2 넣고자하는 데이터 ...) 컬럼을
			 * 선택하여 값을 넣을수도 있다. 선택적으로 넣기 위해서는 INSERT 테이블명 VALUES 넣고자하는 데이터
			 */
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, fileName);
			ps.executeUpdate();

			
			
			if(fileName==null) {
	%>
	<h2>파일이 업로드 되지 않았습니다.</h2><br>
	<a href = "javascript:history.back()">다시 업로드 하기</a>
	<%
			}
			else {
				File file1 = multi.getFile("upfile");
				String contents = multi.getParameter("contents");
				fullPath = savePath1 + "/" + fileNameTest;
	%>
	<h2>파일 업로드가 정상적으로 완료되었습니다!</h2>
	저장된 파일 이름 : <%=fileName %><br>
	변경되기 이전의 파일 이름 : <%=originalFileName %><br>
	설명 : <%=contents%><br>
	사이즈 : <%=file1.length()%>Byte<br>
	ContentType : <%=multi.getContentType("upfile")%><br>
	<br>
	<img src="<%=fullPath %>" width="512" height="384">
	<%
			}
		}catch(IOException e){
			out.print("<h2>IOException이 발생했습니다.</h2><br><pre>" + e.getMessage() + "</pre>");
			e.printStackTrace();
		}
			
		finally {
			if (rs != null)
				rs.close();
			if (ps != null)
				ps.close();
			if (con != null)
				con.close();
		}
	%>

</body>
</html>