<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>

<body>

	<jsp:useBean id="vo" class="com.company.maws.MemberVO" />
	<jsp:setProperty property="*" name="vo" />
	<jsp:useBean id="dao" class="com.company.maws.MemberDAO" />
	
	<%
		String id = request.getParameter("id");
		int check = dao.idConfirm(id);

		if (check == 1) {
			out.print("<script>");
			out.print("alert('아이디 사용 가능');");
			out.print("window.close();");
			out.print("</script>");
		}
		else {
			out.print("<script>");
			out.print("alert('아이디 중복입니다');");
			out.print("window.close();");
			out.print("</script>");
		}
	%>



</body>
</html>
