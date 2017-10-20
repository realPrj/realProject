<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공조 || 학습참여</title>
<script>
//form 생성
function createForm(formname,formaction,formmethod){

	var form = document.createElement("form");

	form.name = formname;
	form.action = formaction;
	form.method = formmethod;

	document.body.appendChild(form);

}

// input 생성
function createinput(itype, iname, ivalue){
	var input = document.createElement("input");
	input.type = itype;
	input.name = iname;
	input.value = ivalue;

	document.body.appendChild(input);
}

// 학습방 조회
function inquiry(formname,formaction,formmethod){	
	
	var id = document.getElementsByName("id")[0];

	createForm(formname,formaction,formmethod);
	
	var form = document.getElementsByName(formname)[0];
	
	form.appendChild(id);
	
	form.submit();
	
}

// 학습방 참여
function learningJoin(ivalue){
	
	createinput("hidden", "roomCode", ivalue)
	
	var roomCode = document.getElementsByName("roomCode")[0];

	createForm("learningJoinform","learningJoin","post");
	
	var form = document.getElementsByName(formname)[0];
	
	form.appendChild(roomCode);
	
	form.submit();
	
}

</script>
<body onLoad="${message}">
<table>
<tr>
<td>방이름</td>
<td><input type="text" name="id" value="${id }" placeholder="선생님 아이디를 쓰세요" /></td>
<td><input type="button" value="조회" onClick="inquiry('learningJoinform','learningJoin','post')" /></td>
</tr>
</table>

<div id="content">
${content }
</div>

</body>
</html>