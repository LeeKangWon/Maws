<%@ include file="main.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 가입</title>

<style type="text/css">
 #formcon {width:630px;margin:0 auto}
 #formcon h3{padding:0 0 10px 0;font-size:15px;font-weight:bold}
 #formcon p{padding:0 0 20px 0}
 fieldset{border:none}
 legend,caption{font-size:0;width:0;height:0}
 #formcon table{width:100%;border-top:2px solid #009999;
 border-bottom:2px solid #009999;border-spacing:0}
 #formcon td{border-bottom:1px solid #333;padding:10px 0 10px 10px}
 #formcon th{border-bottom:1px solid #333;padding:10px 0 10px 10px;background:#d7f0ef;text-align:left}
 #formcon input{border:1px solid #a6d5dd;color:#0000ff;padding:1px}
 #formcon .input_btn{text-align:center}
 #formcon .input_btn input{border:0;vertical-align:middle;margin-top:5px}
 #formcon img{vertical-align:middle;margin-top:-3px}
</style>


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
		}
		
		else if (form.upfile.value == "") {
			alert("사진을 등록하세요")
			form.upfile.select();
			return false;
		}
		
		else {
			alert("가입 완료");
		}

	}

	function checkPwd() {
		var form = document.memberContract;
		var password = form.password.value;
		var passwordChk = form.passwordChk.value;

		if (password != passwordChk) {
			document.getElementById('passwordChk').style.color = "red";
			document.getElementById('passwordChk').innerHTML = "동일한 암호를 입력하세요.";
			return false;
		} else {
			document.getElementById('passwordChk').style.color = "blue";
			document.getElementById('passwordChk').innerHTML = "암호가 확인 되었습니다.";

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


	<div id="formcon" style="position: absolute; top: 200px; left: 400px;">
		<form name="memberContract" method="post" action="sign_ok.jsp" enctype="multipart/form-data" 
			onsubmit="return signup()">
			<table border="1" align="center">
				<tr height="40">
					<th width="100" align="center">이&nbsp;&nbsp;&nbsp;름</th>
					<td width="100"><input type="text" name="name">
				</tr>

				<tr height="40">
					<th width="100" align="center">학&nbsp;&nbsp;&nbsp;번</th>
					<td width="100"><input type="text" name="schoolnum"/>
					<input type="button" value="중복확인" onclick="sNCheck()"/>
				</tr>

				<tr height="40">
					<th width="100" align="center">아이디</th>
					<td width="100">
					<input type="text" name="id" /> 
					<input type="button" value="중복확인" onclick="idCheck()"/>
				</tr>

				<tr height="40">
					<th width="100" align="center">비밀번호</th>
					<td width="100"><input type="password" name="password">
				</tr>

				<tr height="40">
					<th width="100" align="center">비밀번호확인</th>
					<td width="100"><input type="password" name="passwordChk"
						onkeyup="checkPwd()"> <br>
						<div id="passwordChk">동일한 암호를 입력하세요</div>
				</tr>

				<tr height="40">
					<th width="100" align="center">주&nbsp;&nbsp;&nbsp;소</th>
					<td width="100"><input type="text" size="30" name="address">
				</tr>

				<tr height="40">
					<th width="100" align="center">생&nbsp;&nbsp;&nbsp;일</th>
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
					<th width="100" align="center">핸드폰번호</th>
					<td width="100"><input type="text" size="20" name="phone">(-를 빼고 입력하시오)
				</tr>
				
				<tr height="40">
					<th width="100" align="center">사진등록</th>
					<td width="100"><input type="file" name="filename" onkeydown="event.returnValue=false;"></td>
				</tr>

				<tr height="40">
					<td colspan="2" align="center"><input type="submit"
						value="회원 가입" name="contract">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="reset"
						value="다시작성">
				</tr>

			</table>
		</form>
	</div>

</body>
</html>