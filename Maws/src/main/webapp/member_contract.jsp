<%@ include file="main.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ�� ����</title>

<script type="text/javascript">
	function signup() {
		var form = document.memberContract;

		if (form.name.value == "") {
			alert("�̸��� �Է��ϼ���");
			form.name.select();
			return false;
		}

		else if (form.schoolnum.value == "") {
			alert("�й��� �Է��ϼ���");
			form.schoolnum.select();
			return false;
		}

		else if (form.id.value == "") {
			alert("���̵� �Է��ϼ���");
			form.id.select();
			return false;
		}

		else if (form.password.value == "") {
			alert("��й�ȣ�� �Է��ϼ���");
			form.password.select();
			return false;
		}

		else if (form.address.value == "") {
			alert("�ּҸ� �Է��ϼ���");
			form.address.select();
			return false;
		} 
		
		else if (form.phone.value == "") {
			alert("�ڵ��� ��ȣ�� �Է��ϼ���");
			form.phone.select();
			return false;
		} else {
			alert("���� �Ϸ�");
		}

	}

	function checkPwd() {
		var form = document.memberContract;
		var password = form.password.value;
		var passwordChk = form.passwordChk.value;

		if (password != passwordChk) {
			document.getElementById('passwordChk').style.color = "red";
			document.getElementById('passwordChk').innerHTML = "������ ��ȣ�� �Է��ϼ���.";
			return false;
		} else {
			document.getElementById('passwordChk').style.color = "blue";
			document.getElementById('passwordChk').innerHTML = "��ȣ�� Ȯ�� �Ǿ����ϴ�.";

		}

	}
	
	function idCheck()
	{
		var form = document.memberContract;
		var sid = form.id.value;
		
		if(sid == "")
			alert("�Էµ� ���̵� �����ϴ�.");
		else
			window.open("checkId.jsp?id="+sid,"","width=400 height=150");
	}
	
	function sNCheck()
	{
		var form = document.memberContract;
		var sid = form.schoolnum.value;
		
		if(sid == "")
			alert("�Էµ� �й��� �����ϴ�.");
		else
			window.open("checkSchoolnum.jsp?schoolnum="+sid,"","width=400 height=150");
	}
</script>
</head>
<body>

	<div style="position: absolute; top: 200px; left: 520px;">
		<form name="memberContract" method="post" action="sign_ok.jsp"
			onsubmit="return signup()">
			<table border="1" align="center">
				<tr height="40">
					<td width="100" align="center">��&nbsp;&nbsp;&nbsp;��</td>
					<td width="100"><input type="text" name="name">
				</tr>

				<tr height="40">
					<td width="100" align="center">��&nbsp;&nbsp;&nbsp;��</td>
					<td width="100"><input type="text" name="schoolnum"/>
					<input type="button" value="�ߺ�Ȯ��" onclick="sNCheck()"/>
				</tr>

				<tr height="40">
					<td width="100" align="center">���̵�</td>
					<td width="100">
					<input type="text" name="id" /> 
					<input type="button" value="�ߺ�Ȯ��" onclick="idCheck()"/>
				</tr>

				<tr height="40">
					<td width="100" align="center">��й�ȣ</td>
					<td width="100"><input type="password" name="password">
				</tr>

				<tr height="40">
					<td width="100" align="center">��й�ȣȮ��</td>
					<td width="100"><input type="password" name="passwordChk"
						onkeyup="checkPwd()"> <br>
						<div id="passwordChk">������ ��ȣ�� �Է��ϼ���</div>
				</tr>

				<tr height="40">
					<td width="100" align="center">��&nbsp;&nbsp;&nbsp;��</td>
					<td width="100"><input type="text" size="30" name="address">
				</tr>

				<tr height="40">
					<td width="100" align="center">��&nbsp;&nbsp;&nbsp;��</td>
					<td width="100"><select name="birthY">
							<%
								for (int i = 2016; i >= 1950; i--) {
							%>
							<option value="<%=i%>"><%=i%>
							</option>
							<%
								}
							%>
					</select> ��<select name="birthM">
							<%
								for (int i = 1; i <= 12; i++) {
							%>
							<option value="<%=i%>"><%=i%>
							</option>
							<%
								}
							%>
					</select> ��<select name="birthD">
							<%
								for (int i = 1; i <= 31; i++) {
							%>
							<option value="<%=i%>"><%=i%>
							</option>
							<%
								}
							%>
					</select>��</td>
				</tr>

				<tr height="40">
					<td width="100" align="center">�ڵ�����ȣ</td>
					<td width="100"><input type="text" size="20" name="phone">
				</tr>

				<tr height="40">
					<td colspan="2" align="center"><input type="submit"
						value="ȸ�� ����" name="contract">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="reset"
						value="�ٽ��ۼ�">
				</tr>

			</table>
		</form>
	</div>

</body>
</html>