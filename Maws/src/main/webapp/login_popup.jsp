<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login_popup</title>

<script type="text/javascript">
	function signup() {
		var form = document.loginForm;

		if (form.id.value == "") {
			alert("아이디를 입력하세요");
			form.id.select();
			return false;
		}

		else if (form.password.value == "") {
			alert("비밀번호를 입력하세요");
			form.password.select();
			return false;
		}
	}

	
	function idCheck()
	{
		var form = document.loginForm;
		
		
		if(loginForm.id.value == "")
			alert("입력된 아이디가 없습니다.");
		else if(loginForm.password.value == "")
			alert("입력된 비밀번호가 없습니다.");
		else
			form.submit();
	}
	
</script>
</head>
<body>
	<br>
	<br>

	<form name="loginForm" method="post" action="login_request.jsp">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" title="아이디" value="아이디"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="password" title="비밀번호" value="비밀번호"></td>
				<td>아이디저장<input type="checkbox"></td>
				<td><input type="submit" value="로그인" onclick="idCheck()"></td>
			</tr>
		</table>
	</form>


</body>
</html>