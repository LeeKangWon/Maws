<%@page import="com.company.maws.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
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

	<jsp:useBean id="vo" class="com.company.maws.MemberVO"/>
	<jsp:setProperty property="*" name="vo" />
	<jsp:useBean id="dao" class="com.company.maws.MemberDAO"/>


	<%
		String id = (String)session.getAttribute("id");
		String password = (String)request.getParameter("password");
		vo.setId(id);
		vo.setPassword(password);
		dao = MemberDAO.getDAO();
		dao.deleteMember(id, password);
		session.invalidate();
		 %>

		 <table  style="position: absolute; top: 200px; left: 450px" width="700" cellpadding="5"
		  align="center">
		  <tr>
		   <td height="39" align="center"><font size="6"><b>회원탈퇴 되었습니다.</b></font></td>
		  </tr>
		  
		  <tr>
		   <td align="center">
		     5초후에 메인으로 이동합니다.
		    <meta http-equiv="Refresh" content="5;url=main.jsp">
		   </td>
		  </tr>
		 </table>
		</body>
		</html>
		</body>
		</html>