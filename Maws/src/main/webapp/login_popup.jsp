<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login_popup</title>

<style type="text/css">
<!--
A:link {
	font-family: "굴림";
	text-decoration: none;
	color: #3E3E3E
}

A:visited {
	font-family: "굴림";
	text-decoration: none;
	color: #3E3E3E
}

A:hover {
	font-family: "굴림";
	text-decoration: underline;
	color: #F29708;
}

.title {
	font-family: "굴림";
	color: #504F4F
}
-->
</style>

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

	<body LEFTMARGIN="0" TOPMARGIN="0" MARGINWIDTH="0" MARGINHEIGHT="0">
	<div id="cssmenu" style="position: absolute; left: 600px; top: 250px;">
		<table width="235" height="180" border="0" cellspacing="0"
			cellpadding="0" align="center">
			<tr>
				<td align="center" valign="top">

					<form name="loginform" method=post action="login_request.jsp">
						<table border="0" cellspacing="0" cellpadding="0" align="center"
							width="210" height="133">
							<tr>
								<td width="210" height="5"></td>
							</tr>
							<tr>
								<td width="210" height="3" bgcolor="#44A5E9"></td>
							</tr>
							<tr>
								<td width="210" height="2" bgcolor="#D2FCFC"></td>
							</tr>
							<tr>
								<td height="20" aling="center" valing="middle" class="title">로그인
								</td>
							</tr>
							<tr>
								<td height="90">

									<div align="center">
										<table border="0" cellspacing="0" cellpadding="0"
											align="center" width="200">
											<tr>
												<td width="200" class="title" align="center">
													아이디&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;<input type="text"
													name="id" size="15" class="title">
												</td>
											</tr>
											<tr>
												<td width="200" class="title" align="center">패스워드 :</font>&nbsp;<input
													type="password" name="password" size="15" class="title">
												</td>
											</tr>
										</table>
									</div>


								</td>
							</tr>
							<tr>
								<td width="210"></td>
							</tr>
							<tr>
								<td width="210" height="1" bgcolor="#A6E6E6"></td>
							</tr>
						</table>
						<table border="0" cellspacing="0" cellpadding="0" align="center"
							width="210" height="25">
							<tr>
								<td height="25" align="center"><input type="submit"
									value="확인" class="title" onclick="idCheck()"> <input type="button"
									value="취소" class="title" onClick="history.back()"></td>
							</tr>
							<tr>
								<td width="210" height="1" bgcolor="#D2FCFC"></td>
							</tr>
							<tr>
								<td wdith="210" height="2" bgcolor="#44A5E9"></td>
							</tr>
						</table>
					</form>

				</td>
			</tr>
		</table>
	</div>


</body>
</html>