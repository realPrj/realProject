<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공조 || 선생님 회원가입</title>
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

//회원가입
function join(){	
	
	var id = document.getElementsByName("id")[0];
	var pwd = document.getElementsByName("pwd")[0];
	var name = document.getElementsByName("name")[0];
	var email = document.getElementsByName("email")[0];
	var phone = document.getElementsByName("phone")[0];
	var identity = document.getElementsByName("identity")[0];
	
	createForm("joinform","join","post");
	
	var form = document.getElementsByName("joinform")[0];
	
	form.appendChild(id);
	form.appendChild(pwd);
	form.appendChild(name);
	form.appendChild(email);
	form.appendChild(phone);
	form.appendChild(identity);
	
	form.submit();
	
}

// 아이디 중복 확인
function idRedundancyCheck(){
	
	var id = document.getElementsByName("id")[0];
	var identity = document.getElementsByName("identity")[0];
	
	createForm("idRedundancyCheckform","idRedundancyCheck","post");
	
	var form = document.getElementsByName("idRedundancyCheckform")[0];
	
	form.appendChild(id);
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
<td><input type="button" value="아이디 중복 체크" onClick="idRedundancyCheck()" /></td>
</tr>
<tr>
<td>비밀번호</td>
<td><input type="text" name="pwd" placeholder="비밀번호" /></td>
</tr>
<tr>
<td>비밀번호 재입력</td>
<td><input type="text" name="pwd" placeholder="비밀번호 재입력"  /></td>
</tr>
<tr>
<td>이름</td>
<td><input type="text" name="name" value="${name }" placeholder="이름"  /></td>
</tr>
<tr>
<td>E-mail</td>
<td><input type="text" name="email" value="${email }" placeholder="예)*****@naver.com"  /></td>
</tr>
<tr>
<td>전화번호</td>
<td><input type="text" name="phone" value="${phone }" placeholder="예)010-0000-0000"  /></td>
</tr>
<tr>
	<td><input type="button" value="회원가입" onClick="join()" /></td>
</tr>
</table>
<input type="hidden" name="identity" value="${identity }" />
</body>
</html>