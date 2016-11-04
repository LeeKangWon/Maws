<%@page import="com.company.maws.MemberVO"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Arrays"%>
<%@ include file="member_intro.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
table.basic { 
	width:130%; 
	line-height:21px; 
	border-top: 1px solid #cccccc; 
	border-left: 1px solid #cccccc; 
	border-collapse: collapse;
} 
table.basic th, table.basic td { 
	color:#678197;
	text-align:center;
	border-right: 1px solid #cccccc; 
	border-bottom: 1px solid #cccccc; 
	padding: 3px 0; 
	text-align:center; 
} 
table.basic th { 
	background-color: #eeeeee; 
}
</style>
</head>
<body>

	<jsp:useBean id="dao" class="com.company.maws.MemberDAO" />


	<%
		ArrayList<MemberVO> list = dao.getMemberIntrolist();
		String saveFloder = "resources/image/member_image/";
	%>

	<%
		int top = 400;
		int rowcount = 1;
		for(MemberVO vo : list)
		{
			
			int left = 340;
			int[] intSchoolNum = new int[1];
			intSchoolNum[0] = vo.getSchoolnum();
			String[] schoolNum = new String[1];
			schoolNum[0] = Arrays.toString(intSchoolNum);
			System.out.println(schoolNum[0].substring(1, 5));
			String savePath = saveFloder + vo.getFilename();
			if(schoolNum[0].substring(1, 5).equals("2013"))
			{
				if(rowcount % 2 == 0)
					left += 480;
				
				if(rowcount % 3 == 0)
				{
					top += 210;
				}
				
			
	%>
	
	<div style="position: absolute; left: <%=left%>px; top: <%=top%>px;">
		<table border="1" class="basic">
			<td rowspan="5"><img src="<%=URLDecoder.decode(savePath, "UTF-8").replaceAll(" ", "")%>" width="100" height="150">
			<tr>
				<td>이름: <%=vo.getName() %></td>
			</tr>
			<tr>
				<td>학번: <%=vo.getSchoolnum() %></td>
			</tr>
			<tr>
				<td>생일: <%=Integer.toString(vo.getBirth()).substring(5, 7) + "월 " + Integer.toString(vo.getBirth()).substring(7, 8) + "일" %></td>
			</tr>
			<tr>
				<td>핸드폰: <%=vo.getPhone() %></td>
			</tr>
		</table>
	</div>

	
	<%
		
		System.out.println(rowcount);
		System.out.println(left+","+top);
		rowcount++;
			}
		}
	%>


	<div style="position: absolute; left: 1150px; top: <%=top%>px;">
		<input type="button" value="등록">
	</div>



</body>
</html>