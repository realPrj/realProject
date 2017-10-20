<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공조 || 학생 메인</title>
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

function eventClick(formname,formaction,formmethod){	

	createForm(formname,formaction,formmethod);
	
	var form = document.getElementsByName(formname)[0];
	
	form.submit();
	
}
</script>
<body onLoad="${message}">
<h1>공조</h1>
<table>
	<tr>
		<td><input type="button" value="로그아웃" onClick="eventClick('logoutform','logout','post')"  /></td>
	</tr>
	<tr>
		<td><input type="button" value="나의정보" onClick=""  /></td>
	</tr>
	<tr>
		<td><input type="button" value="출결" onClick=""  /></td>
	</tr>
</table>
<div>
	<div>학습 참여<br/><input type="button" value="+" onClick="eventClick('learningjoinform','learningJoinPage','post')" /></div>
	<div>개설한 과목<br/>${content }</div>
</div>
</body>
</html>