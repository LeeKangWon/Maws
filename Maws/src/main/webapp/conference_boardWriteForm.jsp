<%@ include file="main_sub2.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></meta>
<title>게시판 등록 폼</title>

<!-- Smart Editor -->
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" charset="utf-8" src="./resources/se2/js/HuskyEZCreator.js"></script>

 

<!-- Smart Editor -->

<script>
    $(function(){
        //전역변수선언
        var editor_object = [];
         
        nhn.husky.EZCreator.createInIFrame({
            oAppRef: editor_object,
            elPlaceHolder: "editor",
            sSkinURI: "./resources/se2/SmartEditor2Skin.html", 
            htParams : {
                // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
                bUseToolbar : true,             
                // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
                bUseVerticalResizer : true,     
                // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
                bUseModeChanger : true, 
            }
        });
         
        //전송버튼 클릭이벤트
        $("#savebutton").click(function(){
            //id가 smarteditor인 textarea에 에디터에서 대입
            editor_object.getById["editor"].exec("UPDATE_CONTENTS_FIELD", []);
             
            // 이부분에 에디터 validation 검증
             
            //폼 submit
            $("#frm").submit();
        });
    });
</script>
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
<script type="text/JavaScript">
	window.onload = function() {
		CKEDITOR.replace('contents');
	}
</script>
<style type="text/css">
* {
	font-size: 9pt;
}

p {
	width: 600px;
	text-align: right;
}

table tbody tr th {
	background-color: gray;
}
</style>
<script type="text/javascript">
	function goUrl(url) {
		location.href = url;
	}
	// 등록 폼 체크
	function boardWriteCheck() {
		var form = document.boardWriteForm;
		if (form.subject.value == '') {
			alert('제목을 입력하세요.');
			form.subject.focus();
			return false;
		}
		if (form.writer.value == '') {
			alert('작성자을 입력하세요');
			form.writer.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<div style="position: absolute; left: 430px; top: 260px;">
		<br>
		<br>
		<br>
		<br>
		<form name="boardWriteForm" action="conference_boardProcess.jsp" method="post"
			onsubmit="return boardWriteCheck();">
			<input type="hidden" name="mode" value="W" />
			<table border="1">
				<colgroup>
					<col width="100" />
					<col width="500" />
				</colgroup>
				<tbody>
					<tr>
						<th align="center">제목</th>
						<td><input type="text" name="subject" size="80"
							maxlength="100" /></td>
					</tr>
					<tr>
						<th align="center">작성자</th>
						<td><input type="text" name="writer" maxlength="20" /></td>
					</tr>
					<tr>
						<td colspan="2"><textarea id="editor" name="contents"
								cols="98" rows="10"></textarea></td>
					</tr>
				</tbody>
			</table>
			<p>
				<input type="button" value="목록" onclick="goUrl('conference_boardList.jsp');" />
				<input type="submit" value="글쓰기" />
			</p>
		</form>
	</div>
</body>
</html>