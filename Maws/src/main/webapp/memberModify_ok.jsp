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
		vo.setId(id);
		dao = MemberDAO.getDAO();
		dao.updateMember(vo);
		 %>

		 <table  style="position: absolute; top: 200px; left: 400px" width="700" cellpadding="5"
		  align="center">
		  <tr>
		   <td height="39" align="center"><font size="6"><b>회원정보가 수정되었습니다.</b></font></td>
		  </tr>
		    <meta http-equiv="Refresh" content="2;url=main.jsp">
		   </td>
		  </tr>
		 </table>
		</body>
		</html>
		</body>
		</html>