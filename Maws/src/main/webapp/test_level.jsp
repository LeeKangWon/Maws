<%@ include file="main_sub2.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">

</script>
</head>
<body>
	<jsp:useBean id="dao" class="com.company.maws.MemberDAO" />
	<jsp:useBean id="vo" class="com.company.maws.MemberVO" />

	<%
	
		if(session.getAttribute("id") == null)
		{
			out.println("<script>alert('로그인 해 주십시오');</script>");
		}
		else
		{
			// 사용할 객체 초기화
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			// 파라미터
			
			String id = (String)session.getAttribute("id");
			try {
				// 데이터베이스 객체 생성
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/maws", "jspbook", "1234");
				pstmt = conn.prepareStatement("select m_level from member " + "where m_id = ?");
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				if(rs.next())
				{
					System.out.println("레벨 확인=>" + rs.getInt("m_level"));
				}
				pstmt = conn.prepareStatement("select e_year, e_month, e_day, title, content from cal");
				
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			
		}
	%>

	<table>
		<tr>
			<td>&nbsp;</td>
			<td align="center">제목</td>
			<td><input name="title" size="50" maxlength="100"></td>
			<td>&nbsp;</td>
		</tr>
		<tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
		<tr>
			<td>&nbsp;</td>
			<td align="center">이름</td>
			<td><input name="name" size="50" maxlength="50"></td>
			<td>&nbsp;</td>
		</tr>
		<tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
		<tr>
			<td>&nbsp;</td>
			<td align="center">비밀번호</td>
			<td><input name="password" size="50" maxlength="50"></td>
			<td>&nbsp;</td>
		</tr>
		<tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
		<tr>
			<td>&nbsp;</td>
			<td align="center">내용</td>
			<td><textarea name="memo" cols="50" rows="13"></textarea></td>
			<td>&nbsp;</td>
		</tr>
		<tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
		<tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
		<tr align="center">
			<td>&nbsp;</td>
			<td colspan="2"><input type=button value="등록">
			<input type=button value="취소">
			<td>&nbsp;</td>
		</tr>
			</td>
		</tr>
</table>
	

</body>
</html>