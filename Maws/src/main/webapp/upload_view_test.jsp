<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="java.util.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>파일 업로드 예제</title>
</head>
<body>

	<jsp:useBean id="dao" class="com.company.maws.GalleryDAO" />
	<form name="view">
		<%
			ArrayList<String> f_list = new ArrayList<String>();
			//사용할 객체 초기화
			String fileName;
			Connection con = null;
			PreparedStatement ps = null;
			ResultSet rs = null;
			con = null;
			ps = null;
			rs = null;
			String query = "Select filename from gallery";
			try {
				Class.forName("com.mysql.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/maws", "jspbook", "1234");
				ps = con.prepareStatement(query);
				rs = ps.executeQuery();

				if (rs.next()) {

					for(String str : f_list)
					{
						
						System.out.println(rs.getString("filename"));
					// 기존 사용자가 존재
					//for(String fileName : f_list)
						//System.out.println(fileName);
					}
				} 
				rs.close();
				ps.close();
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		%>

		<form action="upload_cos_ok.jsp" enctype="multipart/form-data"
			method="post">

			이미지 올리기 : <input type="text" name="imgName" size="5"> <input
				type="file" name="uploadImg" value="파일찾기"><Br> <input
				type="submit" value="올리기">
		</form>



		<br> <br> <br>

		<form name="fileForm" action="upload_cos_ok.jsp"
			enctype="multipart/form-data" method="post">
			작성자: <input type="text" name="user"><br> 제 목: <input
				type="text" name="title"><br> <input type="file"
				name="uploadFile"><br> <input type="submit"
				value="파일올리기"><br>
		</form>
</body>
</html>
