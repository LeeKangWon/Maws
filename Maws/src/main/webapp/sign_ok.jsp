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
		if (dao.memberInsert(vo) > 0) {
			out.print("<script>");
			out.print("location.href='main.jsp';");
			out.print("</script>");
		}

		else {
			out.print("<script>");
			out.print("alert('회원 가입이 정상적으로 완료되지 않았습니다.');");
			out.print("history.back();");
			out.print("</script>");
		}
	%>
</body>
</html>