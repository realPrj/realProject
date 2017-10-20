<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공조 || 학생 회원가입</title>
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

// 회원가입
function join(){	
	
	var id = document.getElementsByName("id")[0];
	var pwd = document.getElementsByName("pwd")[0];
	var name = document.getElementsByName("name")[0];
	var email = document.getElementsByName("email")[0];
	var phone = document.getElementsByName("phone")[0];
	var stGrade = document.getElementsByName("stGrade")[0];
	var stclass = document.getElementsByName("stclass")[0];
	var stNumber = document.getElementsByName("stNumber")[0];
	var identity = document.getElementsByName("identity")[0];

	createForm("joinform","join","post");
	
	var form = document.getElementsByName("joinform")[0];
	
	form.appendChild(id);
	form.appendChild(pwd);
	form.appendChild(name);
	form.appendChild(email);
	form.appendChild(phone);
	form.appendChild(stGrade);
	form.appendChild(stclass);
	form.appendChild(stNumber);
	form.appendChild(identity);
	
	form.submit();
	
}

//아이디 중복 확인
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
	<td>학년/반/번호</td>
	<td>학년</td>
	<td><select name="stGrade" >
	<option value="1">1</option>
	<option value="2">2</option>
	<option value="3">3</option>
	<option value="4">4</option>
	<option value="5">5</option>
	<option value="6">6</option>
	</select></td>
		<td>반</td>
	<td><select name="stclass">
	<option value="1">1</option>
	<option value="2">2</option>
	<option value="3">3</option>
	<option value="4">4</option>
	<option value="5">5</option>
	<option value="6">6</option>
	<option value="7">7</option>
	<option value="8">8</option>
	<option value="9">9</option>
	<option value="10">10</option>
	</select></td>
		<td>번호</td>
	<td><select name="stNumber">
	<option value="1">1</option>
	<option value="2">2</option>
	<option value="3">3</option>
	<option value="4">4</option>
	<option value="5">5</option>
	<option value="6">6</option>
	<option value="7">7</option>
	<option value="8">8</option>
	<option value="9">9</option>
	<option value="10">10</option>
	<option value="11">11</option>
	<option value="12">12</option>
	<option value="13">13</option>
	<option value="14">14</option>
	<option value="15">15</option>
	<option value="16">16</option>
	<option value="17">17</option>
	<option value="18">18</option>
	<option value="19">19</option>
	<option value="20">20</option>
	</select></td>
</tr>
<tr>
	<td><input type="button" value="회원가입" onClick="join()" /></td>
</tr>
</table>
<input type="hidden" name="identity" value="${identity }" />
</body>
</html>