<%@page import="java.util.Enumeration"%>
<%@page import="java.io.File"%>
<%@page import="java.io.IOException"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="java.sql.*"%>
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
		request.setCharacterEncoding("UTF-8");
	
		String encType="UTF-8"; //인코딩 타입
		int sizeLimit = 1*1024*1024; //1메가
		String fullPath = "";
		String fileNameTest="";
		String saveFolder="/Image";
		String savePath1="D:\\MawsPage\\Maws\\src\\main\\webapp\\resources\\image\\member_image"; //웹 어플리케이션의 절대 경로가 저장될 객체
		
		MultipartRequest multi = new MultipartRequest(request, savePath1, sizeLimit, encType, new DefaultFileRenamePolicy());
		Enumeration<?> files = multi.getFileNames();
		String file2 = (String)files.nextElement();
		fileNameTest = multi.getFilesystemName(file2);
		String originalFileName = multi.getOriginalFileName("filename");
		String fileName = multi.getFilesystemName("filename");
		
		
		
	%>

	<jsp:useBean id="vo" class="com.company.maws.MemberVO"/>
	<jsp:setProperty property="*" name="vo"/>
	<jsp:useBean id="dao" class="com.company.maws.MemberDAO"/>


	<%
		String name = multi.getParameter("name");
		int schoolnum = Integer.parseInt(multi.getParameter("schoolnum"));
		String id = multi.getParameter("id");
		String password = multi.getParameter("password");
		String address = multi.getParameter("address");
		String birthY = multi.getParameter("birthY");
		String birthM = multi.getParameter("birthM");
		String birthD = multi.getParameter("birthD");
		int birth = Integer.parseInt(birthY + birthM + birthD);
		String phone = multi.getParameter("phone");
		
		vo.setName(name);
		vo.setSchoolnum(schoolnum);
		vo.setId(id);
		vo.setPassword(password);
		vo.setAddress(address);
		vo.setBirth(birth);
		vo.setPhone(phone);
		vo.setFilename(fileName);
		
		
		if (dao.memberInsert(vo) <= 0) {
			
			out.print("<script>");
			out.print("alert('회원 가입이 정상적으로 완료되지 않았습니다.');");
			out.print("history.back();");
			out.print("</script>");
			
		}

		else {

			out.print("<script>");
			out.print("location.href='main.jsp';");
			out.print("</script>");
		}
	%>
</body>
</html>