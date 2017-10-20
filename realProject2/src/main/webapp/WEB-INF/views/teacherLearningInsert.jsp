<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공조 || 학습개설</title>
</head>
<script>
//form 생성
function createForm(formname,formaction,formmethod){

	var form = document.createElement("form");

	form.name = formname;
	form.action = formaction;
	form.method = formmethod;

	document.body.appendChild(form);

}

// 방 개설
function open(formname,formaction,formmethod){	
	
	var roomName = document.getElementsByName("roomName")[0];
	var roomIntroduction = document.getElementsByName("roomIntroduction")[0];

	createForm(formname,formaction,formmethod);
	
	var form = document.getElementsByName(formname)[0];
	
	form.appendChild(roomName);
	form.appendChild(roomIntroduction);
	
	form.submit();
	
}

</script>
<body>
<table>
<tr><td>방이름</td><td><input type="text" name="roomName" placeholder="학습방 이름" /></td></tr>
<tr><td>방소개</td><td><input type="text" name="roomIntroduction" placeholder="학습방 소개" /></td></tr>
<tr><td><input type="button" value="개설하기" onClick="open('learningOpenform','learningOpen','post')" /></td></tr>
</table>
</body>
</html>