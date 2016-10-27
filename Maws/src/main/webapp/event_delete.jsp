<%@ page info="diary calendar" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*,java.io.*,java.net.*,java.util.*" %>

<jsp:useBean id = "dbconn" class="com.company.maws.DBConnect" scope="request" />
<jsp:useBean id = "myutil" class="com.company.maws.MyUtil" scope="request" />  

<%
	request.setCharacterEncoding("UTF-8");
	Connection conn = null;
	Statement stmt = null;
	
	String id = myutil.checkNull2(request.getParameter("id"));
	String query = new String();
	
	try {
		conn = dbconn.getConnection();
		stmt = conn.createStatement();
		
		query = "delete from diary where d_id=" + id;
		stmt.executeUpdate(query);
	} catch(SQLException e){
	} finally {
		dbconn.close();
	}
	
	response.sendRedirect("event_calendar.jsp");
%>