<%@ page info="diary calendar" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.io.*,java.net.*,java.util.*" %>

<jsp:useBean id = "myutil" class="com.company.maws.MyUtil" scope="request" />  

<%
	request.setCharacterEncoding("UTF-8");
	String mode = myutil.checkNull(request.getParameter("mode"));
	String id = myutil.checkNull2(request.getParameter("id"));
	String year = myutil.checkNull(request.getParameter("year"));
	String month = myutil.checkNull(request.getParameter("month"));
	String day = myutil.checkNull(request.getParameter("day"));
	String subject = myutil.toKorean(request.getParameter("subject"));
	String contents = myutil.toKorean(request.getParameter("contents"));
%>

<html>
<head>
<title>chek</title>


<%
	//모드가 새글일경우
	if (mode.equals("insert")) {
		if( request.getParameter("log_id").equals("123") && request.getParameter("passwd").equals("123") ){
%>
			<script>	
				window.alert( "로그인 되었습니다.")
				location.replace("event_write.jsp?mode=&year=<%= year%>&month=<%= month %>&day=<%= day %>")
			</script>
<%
		} else {
%>
			<script>
				window.alert( "ID 나 Password를 다시 확인해주십시오.")
				location.replace("event_view.jsp?mode=insert&year=<%= year %>&month=<%= month %>&day=<%= day %>")
			</script>
<%
		}
	}
%>

<%
	//모드가 수정일경우
	if (mode.equals("modify")) {
		if( request.getParameter("log_id").equals("123") && request.getParameter("passwd").equals("123") ){
%>
			<script>	
				window.alert( "로그인 되었습니다.")
				location.replace("event_write.jsp?mode=modify&id=<%= id %>")
			</script>
<%
		} else {
%>
			<script>
				window.alert( "ID 나 Password를 다시 확인해주십시오.")
				location.replace("event_view.jsp?mode=view&id=<%= id%>")
			</script>
<%
		}
	}
%>

<%
	//모드가 삭제일경우
	if (mode.equals("delete")) {
		if( request.getParameter("log_id").equals("123") && request.getParameter("passwd").equals("123") ){
%>
			<script>	
				window.alert( "관리자 권한으로 삭제 되었습니다.")
				location.replace("event_delete.jsp?id=<%= id %>")
			</script>
<%
		} else {
%>
			<script>
				window.alert( "ID 나 Password를 다시 확인해주십시오.")
				location.replace("event_view.jsp?mode=view&id=<%= id%>")
			</script>
<%
		}
	}
%>
	
</head>
<body>
</body>
</html>