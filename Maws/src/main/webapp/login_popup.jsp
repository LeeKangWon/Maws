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
			alert("���̵� �Է��ϼ���");
			form.id.select();
			return false;
		}

		else if (form.password.value == "") {
			alert("��й�ȣ�� �Է��ϼ���");
			form.password.select();
			return false;
		}
	}

	
	function idCheck()
	{
		var form = document.loginForm;
		
		
		if(loginForm.id.value == "")
			alert("�Էµ� ���̵� �����ϴ�.");
		else if(loginForm.password.value == "")
			alert("�Էµ� ��й�ȣ�� �����ϴ�.");
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
				<td>���̵�</td>
				<td><input type="text" name="id" title="���̵�" value="���̵�"></td>
			</tr>
			<tr>
				<td>��й�ȣ</td>
				<td><input type="password" name="password" title="��й�ȣ" value="��й�ȣ"></td>
				<td>���̵�����<input type="checkbox"></td>
				<td><input type="submit" value="�α���" onclick="idCheck()"></td>
			</tr>
		</table>
	</form>


</body>
</html>