



<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" pageEncoding="EUC-KR"
	contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<html>

<head>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<title>Home</title>

<script src = "http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src = "http://malsup.github.com/jquery.cycle2.js"></script>

<script type="text/javascript">
	function loginPop() {
		window
				.open(
						"login_popup.jsp",
						"",
						"width = 450, height = 150, status = 1, location = no, title = no, toolbar = no");
	}
	
	function logoutPop()  {
		window
		.open(
				"logout_popup.jsp",
				"",
				"width = 450, height = 150, status = 1, location = no, title = no, toolbar = no").close();
		
	}
</script>

<style type="text/css">
a{color:#333;text-decoration:none}
body{font-size:12px; font-family: "돋움"; color:#333}
/* The CSS Code for the menu starts here */
#menu {
	font-family: Arial, sans-serif;
	font-weight: bold;
	text-transform: uppercase;
	margin: 0px 0;
	padding: 0 0 0 10px;
	list-style-type: none;
	font-size: 16px;
	background: #eee;
	height: 40px;
	-moz-border-radius: 10px;
	-webkit-border-radius: 10px;
	border-top: 2px solid #eee;
	border-left: 2px solid #eee;
	border-bottom: 2px solid #ccc;
	border-right: 2px solid #ccc;
}

#menu li {
	float: left;
	margin: 0;
}

#menu li a {
	text-decoration: none;
	display: block;
	padding: 0 98px;
	line-height: 40px;
	color: #666;
}

#menu li a:hover, #menu li.active a {
	background-color: #f5f5f5;
	border-bottom: 2px solid #DDD;
	color: #999;
}

/* Orange Menu */
#menu.orange {
	border-top: 2px solid #d15600;
	border-left: 2px solid #d15600;
	border-bottom: 2px solid #B44500;
	border-right: 2px solid #B44500;
	background: #d15600;
}

#menu.orange a {
	color: #fff;
}

#menu.orange li a:hover, #menu.orange li.active a {
	color: #FA9B5B;
	background: #B44500;
	border-bottom: 2px solid #d15600;
}
</style>

</head>

<body>
	


	<table width="200" height="70" bgcolor="#FFFF5A">
	</table>	

	<div style="position: absolute; left: 50px; top: 10px;">
		<a href="home.jsp"><img src="resources\image\Maws_logo.png"
			width="170" height="60"></a>
	</div>
	
	<%
		if(session.getAttribute("id") == null)
		{
	%>
		<div style="position: absolute; left: 1000px; top: 50px;">
		<table cellspacing="0">
			<td><a href="login_popup.jsp"><img
					src="resources\image\login_img.png" width="50" height="30">login</a>
			</td>
			<td><a href="member_contract.jsp"><img
					src="resources\image\create_account.png" width="30" height="30">Creat
					Account</a></td>
		</table>
	</div>
	<%
		}
	
		else
		{
			// 사용할 객체 초기화
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			// 파라미터
			String query = "select m_level from member where m_id =?";
			
			int level = 0;
			
			String slevel = "";
			try {
				// 데이터베이스 객체 생성
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/maws", "jspbook", "1234");
				// 조회수 증가 쿼리 실행
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, (String)session.getAttribute("id"));
				// 게시물 상세 조회 쿼리 실행 
				rs = pstmt.executeQuery();
				if(rs.next())
				{
					level = rs.getInt("m_level");
					
				}
				
				if(level == 0)
				{
					slevel = "비회원";
				}
				else if(level == 1)
				{
					slevel = "회원";
				}
				else if(level == 2)
				{
					slevel = "임원";
				}
				else if(level == 3)
				{
					slevel = "관리자";
				}
				
				
				%>
				<div style="position: absolute; left: 850px; top: 60px;">
				<%
				out.print(session.getAttribute("id") + slevel + "님 환영합니다.");
				%>
				</div>
				<%
			
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			}
			
			%>
			<div style="position: absolute; left: 1100px; top: 50px;">
				<table cellspacing="0">
			<td><a href="logout_popup.jsp"><img
					src="resources\image\logout_img.png" width="30" height="30">logout</a>
			</td>
			<td><a href="modify_member.jsp" value="개인정보 변경"><img
					src="resources\image\modify_user.png" width="30" height="30">내정보</td>
				</table>
			</div>
			<%
		}
	%>



	<div style="position: absolute; left: 45px; top: 120px;">
		<ul id="menu" class="orange" >
			<li><a href="maws_intro.jsp">동아리 소개</a></li>
			<li><a href="main_sub2.jsp">공지사항</a></li>
			<li><a href="main_sub3.jsp">Maws</a></li>
			<li><a href="main_sub4.jsp">C-edu</a></li>
			<li><a href="main_sub5.jsp">Q&A</a></li>
		</ul>
	</div>

	
	
	<div
		style="position: absolute; border-top: 1px solid; top: 180px; width: 1350px;">

	</div>


</body>
</html>
