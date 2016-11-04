<%@ include file="main_sub2.jsp"%>
<%@ page info="diary calendar" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*,java.io.*,java.net.*,java.util.*" %>

<jsp:useBean id = "dbconn" class="com.company.maws.DBConnect" scope="request" />
<jsp:useBean id = "myutil" class="com.company.maws.MyUtil" scope="request" />  



<%
	request.setCharacterEncoding("UTF-8");
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	String mode = myutil.checkNull(request.getParameter("mode"));
	String id = myutil.checkNull2(request.getParameter("id"));
	String member_id = myutil.checkNull((String)session.getAttribute("member_id"));
	String member_name = URLDecoder.decode(myutil.checkNull((String)session.getAttribute("member_name")));
	String member_email = myutil.checkNull((String)session.getAttribute("member_email"));	
	String year = new String();
	String month = new String();
	String day = new String();
	String subject = new String();
	String contents = new String();
	String created = new String();
	String userid = new String();
	String query = new String();	
	
	if (mode.equals("view")) {// start if
	

	
	//회원 인증 체크	
	//if (member_id.equals("") || member_name.equals("") || member_email.equals("")) {
	//	response.sendRedirect("login.jsp?ret_url=calendar.jsp");
	//}
	
	try {
		conn = dbconn.getConnection();
		stmt = conn.createStatement();
	} catch (SQLException e) {
	}
	
	try {
		query = "select * from diary where d_id = "+id;
		rs = stmt.executeQuery(query);
		
		if(rs.next()) {
			year = myutil.checkNull(rs.getString("d_year"));
			month = myutil.checkNull(rs.getString("d_month"));
			day = myutil.checkNull(rs.getString("d_day"));
			subject = myutil.checkNull(rs.getString("d_subject"));
			contents = myutil.checkNull(rs.getString("d_contents"));
			created = myutil.checkNull(rs.getString("d_created"));
			userid = myutil.checkNull(rs.getString("d_userid"));
		}
		rs.close();
		
		contents = myutil.n12br(contents);
	} catch(SQLException e) {
	} finally {
		dbconn.close();
	}
	
	} //end if
	
	if (mode.equals("insert")){
	
	year    = myutil.checkNull(request.getParameter("year"));
	month = myutil.checkNull(request.getParameter("month"));
	day    = myutil.checkNull(request.getParameter("day"));
	
	}
%>

<html>
<head>
<title>다이어리</title>




</head>
<body LEFTMARGIN="0" TOPMARGIN="0" MARGINWIDTH="0" MARGINHEIGHT="0">
<table width="700" height="180" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
		<td align="center" valign="top">
<!-- 모드가 insert일때 시작-->
<%
	if (mode.equals("insert")){
%>
	<div style="position: absolute; left: 450px; top: 260px;">
	<table width="500" height="145" border="0" cellspacing="0" cellpadding="0" align="center">
	
	
	<tr>
		<td width="500" height="5"></td>
	</tr>
	<tr>
		<td width="500" height="3" bgcolor="#44A5E9"></td>
	</tr>
	<tr>
		<td width="500" height="2" bgcolor="#D2FCFC"></td>
	</tr>
	<tr>		
		<td width="500" height="50" align="left" class="title"><img src = "resources/jsp_img/point.gif" border="0" align="absmiddle">&nbsp;<%= year %>년 <%= month %>월 <%= day %>일 <br>&nbsp;&nbsp;스캐줄은 없습니다.</td>
	</tr>
	<tr>
		<td width="500" height="200"></td>
	</tr>
	<tr>
		<td width="500" height="1" bgcolor="#A6E6E6"></td>
	</tr>
	</table>
	
	
	<table width="500"  height="25" border="0" cellspacing="0" cellpadding="0" align="center">
	
	
	<tr>
		<td width="500" height="20" align="center">		
			<a href="event_calendar.jsp"><img src="resources/jsp_img/list.gif" border="0" alt="diary_list.gif" align="absmiddle"></a>
			<a href="event_diary_login.jsp?mode=<%= mode %>&year=<%= year %>&month=<%= month %>&day=<%= day %>"><img src = "resources/jsp_img/write.gif" border="0" alt="new_write.gif" align="absmiddle"></a>			
		</td>
	</tr>
	<tr>
		<td width="500" height="1" bgcolor="#D2FCFC"></td>
	</tr>
	<tr>
		<td wdith="500" height="2" bgcolor="#44A5E9"></td>
	</tr>
	
	</table>
	</div>
	
<%
	}
%>
<%
	if (mode.equals("view")){
%>
	<div style="position: absolute; left: 450px; top: 260px;">
	<table width="500" height="145" border="0" cellspacing="0" cellpadding="0" align="center">
	
	
	<tr>
		<td width="500" height="5"></td>
	</tr>
	<tr>
		<td width="500" height="3" bgcolor="#44A5E9"></td>
	</tr>
	<tr>
		<td width="500" height="2" bgcolor="#D2FCFC"></td>
	</tr>
	<tr>		
		<td width="500" height="20" align="left" class="title">&nbsp;<%= year %>년 <%= month %>월 <%= day %>일</td>
	</tr>
	<tr>
		<td width="500" height="20" align="left" class="title">&nbsp;제목&nbsp;:&nbsp;<%= subject %></td>
	</tr>
	<tr>
		<td width="500" height="80" align="left">
			<table width="500" height="200" border="0" cellspacing="0" cellpadding="0" align="left" valign="top">
				<tr>
					<td width="5"></td>
					<td width="500" height="200" valign="top" align="left" class="title"><%= contents %></td>
				</tr>
				<tr>
					<td colspan="2" width="200"></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td width="500"></td>
	</tr>
	<tr>
		<td width="500" height="1" bgcolor="#A6E6E6"></td>
	</tr>
	
	
	</table>
	<table width="500"  height="25" border="0" cellspacing="0" cellpadding="0" align="center">
	
	
	<tr>
		<td width="500" height="20" align="center">
			<a href="event_calendar.jsp"><img src="resources/jsp_img/list.gif" border="0" alt="diary_list.gif" align="absmiddle"></a>
			<a href="event_diary_login.jsp?mode=modify&id=<%= id %>"><img src = "resources/jsp_img/modify.gif" border="0" alt="modify.gif" align="absmiddle"></a>
			<a href="event_diary_login.jsp?mode=delete&id=<%= id %>"><img src = "resources/jsp_img/delete.gif" border="0" alt="delete.gif" align="absmiddle"></a>			
		</td>
	</tr>
	<tr>
		<td width="500" height="1" bgcolor="#D2FCFC"></td>
	</tr>
	<tr>
		<td wdith="500" height="2" bgcolor="#44A5E9"></td>
	</tr>
	
	</table>
	</div>
	
<%
	}
%>
			
		</td>
	</tr>
</table>
</body>
</html>