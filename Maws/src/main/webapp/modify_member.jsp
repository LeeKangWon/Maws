<%@page import="com.company.maws.MemberDAO"%>
<%@page import="com.company.maws.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@ include file="main.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 가입</title>

<script type="text/javascript">
	function signup() {
		var form = document.memberContract;

		if (form.name.value == "") {
			alert("이름을 입력하세요");
			form.name.select();
			return false;
		}

		else if (form.schoolnum.value == "") {
			alert("학번을 입력하세요");
			form.schoolnum.select();
			return false;
		}

		else if (form.id.value == "") {
			alert("아이디를 입력하세요");
			form.id.select();
			return false;
		}

		else if (form.password.value == "") {
			alert("비밀번호를 입력하세요");
			form.password.select();
			return false;
		}

		else if (form.address.value == "") {
			alert("주소를 입력하세요");
			form.address.select();
			return false;
		} 
		
		else if (form.phone.value == "") {
			alert("핸드폰 번호를 입력하세요");
			form.phone.select();
			return false;
		} else {
			alert("정보 수정 완료");
		}

	}

	
	function idCheck()
	{
		var form = document.memberContract;
		var sid = form.id.value;
		
		if(sid == "")
			alert("입력된 아이디가 없습니다.");
		else
			window.open("checkId.jsp?id="+sid,"","width=400 height=150");
	}
	
	function sNCheck()
	{
		var form = document.memberContract;
		var sid = form.schoolnum.value;
		
		if(sid == "")
			alert("입력된 학번이 없습니다.");
		else
			window.open("checkSchoolnum.jsp?schoolnum="+sid,"","width=400 height=150");
	}
</script>
</head>
<body>

	
	<%
		
		String id = (String)session.getAttribute("id");
		MemberDAO dao = MemberDAO.getDAO();
		MemberVO vo = dao.getMember(id);
		
		try {
			

	%>
	<div style="position: absolute; top: 200px; left: 520px;">
		<form name="memberContract" method="post" action="modify_ok.jsp"
			onsubmit="return signup()">
			<table border="1" align="center">
				<tr height="40">
					<td width="100" align="center">이&nbsp;&nbsp;&nbsp;름</td>
					<td width="100"><input type="text" name="name" value = "<%=vo.getName()%>">
				</tr>

				<tr height="40">
					<td width="100" align="center">학&nbsp;&nbsp;&nbsp;번</td>
					<td width="100"><input type="text" name="schoolnum" value="<%=vo.getSchoolnum()%>"/>
				</tr>

				<tr height="40">
					<td width="100" align="center">아이디</td>
					<td width="100">
					<%=vo.getId()%>
				</tr>

				<tr height="40">
					<td width="100" align="center">비밀번호재입력</td>
					<td width="100"><input type="password" name="password">
				</tr>

				<tr height="40">
					<td width="100" align="center">주&nbsp;&nbsp;&nbsp;소</td>
					<td width="100"><input type="text" size="30" name="address"  value="<%=vo.getAddress()%>">
				</tr>

				<tr height="40">
					<td width="100" align="center">생&nbsp;&nbsp;&nbsp;일</td>
					<td width="100"><select name="birthY">
							<%
								for (int i = 2016; i >= 1950; i--) {
							%>
							<option value="<%=i%>"><%=i%>
							</option>
							<%
								}
							%>
					</select> 년<select name="birthM">
							<%
								for (int i = 1; i <= 12; i++) {
							%>
							<option value="<%=i%>"><%=i%>
							</option>
							<%
								}
							%>
					</select> 월<select name="birthD">
							<%
								for (int i = 1; i <= 31; i++) {
							%>
							<option value="<%=i%>"><%=i%>
							</option>
							<%
								}
							%>
					</select>일</td>
				</tr>

				<tr height="40">
					<td width="100" align="center">핸드폰번호</td>
					<td width="100"><input type="text" size="20" name="phone" value="<%=vo.getPhone()%>">
				</tr>

				<tr height="40">
					<td colspan="2" align="center"><input type="submit"
						value="저장" name="contract">
				</tr>

			</table>
		</form>
	</div>
	
	<%
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>

</body>
</html>