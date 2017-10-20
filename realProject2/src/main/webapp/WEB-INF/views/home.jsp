<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>공조 || Home</title>
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

// 신분선택
function identity(ivalue){
	
	createinput("hidden", "identity", ivalue);
	
	var identity = document.getElementsByName("identity")[0];
	
	createForm("IdentificationCheckform","IdentificationCheck","post");
	

	var form = document.getElementsByName("IdentificationCheckform")[0];
	form.appendChild(identity);
	
	form.submit();
	
}

</script>
<body onLoad="${message}">


<h1>공조 하ㅇㄹㅇdfdsdfsdㄹㄴ하하호허ㅗ호</h1>

<input type="button" value="선생님" onClick="identity('1')" />
<input type="button" value="학생" onClick="identity('2')" />
</body>
</html>