<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공조 || 아이디 찾기</title>
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

// 아이디 찾기
function idfind(){	
	
	var email = document.getElementsByName("email")[0];
	var identity = document.getElementsByName("identity")[0];
	
	createForm("idFindform","idFind","post");
	
	var form = document.getElementsByName("idFindform")[0];
	
	form.appendChild(email);
	form.appendChild(identity);
	
	form.submit();
	
}

</script>
<body>
<h1>공조</h1>
<input type="hidden" name="identity" value="${identity }" />
<table>
	<tr>
		<td>이메일</td>
		<td><input type="text" name="email" placeholder="예)****@naver.com" /></td>
	</tr>
	<tr>
		<td><input type="button" value="아이디 찾기" onClick="idfind()" /></td>
	</tr>
</table>
</body>
</html>