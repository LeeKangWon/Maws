<%@page import="com.company.maws.MemberVO"%>
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
</head>
<body>

	<jsp:useBean id="dao" class="com.company.maws.MemberDAO" />


	<%
		ArrayList<MemberVO> list = dao.getMemberIntrolist();
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
			if(schoolNum[0].substring(1, 5).equals("2014"))
			{
				if(rowcount % 2 == 0)
					left += 480;
				
				if(rowcount % 3 == 0)
				{
					top += 210;
				}
				
			
	%>
	
	<div style="position: absolute; left: <%=left%>px; top: <%=top%>px;">
		<table border="1">
			<td rowspan="3"><img src="" width="100" height="150">
			<tr>
				<td><%=vo.getName() %></td>
				<td><%=vo.getSchoolnum() %></td>
			</tr>
			<tr>
				<td><%=vo.getBirth() %></td>
				<td><%=vo.getPhone() %></td>
			</tr>
			<tr>
				<td colspan="3" align="right"><input type="button" value="수정">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
					type="button" value="삭제"></td>
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