<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "com.company.maws.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


</head>
<body>

	<%
		request.setCharacterEncoding("UTF-8");
	%>


	<%
		
		System.out.println(request.getParameter("id"));
		System.out.println(request.getParameter("password"));
		
	
		
		String v_id = request.getParameter("id");
		
		int flag = MemberDAO.getDAO().userCheck(request.getParameter("id"), request.getParameter("password"));
		
		System.out.println(flag);
		
		if(flag==1)
		{
			session.setAttribute("id", request.getParameter("id"));
			System.out.println("로그인 성공");
			out.print("<script>");
			out.print("alert('로그인이 정상적으로 처리 되었습니다.');");
			out.print("location.href='home.jsp'");
			out.print("</script>");
		}
		else if(flag==0)
		{

			System.out.println("로그인 실패 => 패스워드 불일치");
			out.print("<script>");
			out.print("alert('패스워드가 일치하지 않습니다.');");
			out.print("location.href='home.jsp';");
			out.print("</script>");
		}
		else
		{
			System.out.println("로그인 실패=> 아이디없거나 불일치");
			out.print("<script>");
			out.print("alert('아이디를 확인해 주세요.');");
			out.print("location.href='home.jsp';");
			out.print("</script>");
		}
	%>

</body>
</html>