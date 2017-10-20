<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공조 || 선생님 학습방 메인</title>
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

//input 생성
function createinput(itype, iname, ivalue){
	var input = document.createElement("input");
	input.type = itype;
	input.name = iname;
	input.value = ivalue;

	document.body.appendChild(input);
}

//메뉴선택
function menu(ivalue){
	
	createinput("hidden", "cacode", ivalue);
	
	var cacode = document.getElementsByName("cacode")[0];
	
	createForm("menuform","tcmenu","post");
	

	var form = document.getElementsByName("menuform")[0];
	form.appendChild(cacode);
	
	form.submit();
	
}
</script>
<body>
<div id="menu">
<table>
	<tr><td><input type="button" value="" onClick="menu('1')" /></td></tr>
	<tr><td><input type="button" value="" onClick="menu('2')" /></td></tr>
	<tr><td><input type="button" value="" onClick="menu('3')" /></td></tr>
	<tr><td><input type="button" value="" onClick="menu('4')" /></td></tr>
	<tr><td><input type="button" value="" onClick="menu('5')" /></td></tr>
	<tr><td><input type="button" value="" onClick="menu('6')" /></td></tr>
	<tr><td><input type="button" value="" onClick="menu('7')" /></td></tr>
	<tr><td><input type="button" value="" onClick="menu('8')" /></td></tr>
	<tr><td><input type="button" value="" onClick="menu('9')" /></td></tr>
	<tr><td><input type="button" value="" onClick="menu('10')" /></td></tr>
	<tr><td><input type="button" value="" onClick="menu('11')" /></td></tr>
	<tr><td><input type="button" value="" onClick="menu('12')" /></td></tr>
	<tr><td><input type="button" value="" onClick="menu('13')" /></td></tr>
</table>
</div>

<div id="content">

</div>

</body>
</html>