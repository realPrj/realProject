<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공조 || 로그인</title>
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

// 로그인
function login(){	
	
	var id = document.getElementsByName("id")[0];
	var pwd = document.getElementsByName("pwd")[0];
	var identity = document.getElementsByName("identity")[0];
	
	createForm("loginform","login","post");
	
	var form = document.getElementsByName("loginform")[0];
	
	form.appendChild(id);
	form.appendChild(pwd);
	form.appendChild(identity);
	
	form.submit();
	
}

function eventClick(formname,formaction,formmethod){	

	var identity = document.getElementsByName("identity")[0];
	
	createForm(formname,formaction,formmethod);
	
	var form = document.getElementsByName(formname)[0];
	
	form.appendChild(identity);
	
	form.submit();
	
}

</script>
<body onLoad="${message}">
<h1>공조</h1>
<table>
<tr>
<td>아이디</td>
<td><input type="text" name="id" value="${id }" placeholder="아이디" /></td>
</tr>
<tr>
<td>비밀번호</td>
<td><input type="text" name="pwd" placeholder="비밀번호" /></td>
</tr>
<tr>
<td><input type="button" value="아이디 찾기" onClick="eventClick('idFindPageform','idFindPage','post')" /></td>
</tr>
<tr>
<td><input type="button" value="회원가입" onClick="eventClick('joinPageform','joinPage','post')" /></td>
</tr>
<tr>
<td><input type="button" value="로그인" onClick="login()" /></td>
</tr>
</table>
<input type="hidden" name="identity" value="${identity }" />
</body>
</html>