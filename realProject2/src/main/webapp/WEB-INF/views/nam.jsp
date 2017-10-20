<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	var gogo1 = null;
	var gogo2 = null;
	var count = 0;
	var allmoney = 0;
	var money = 0;
	var div = null;
	var amountnumber = 0;
	
	$(document).ready(function() {
		$(".add").click(function() {
			
			if(count != 0){
				
			gogo1 = document.getElementsByName("Commodityprice"+(count-1))[0].value;
			gogo2 = document.getElementsByName("amount"+(count-1))[0].value;
			money = gogo1 * gogo2
			$(".totalprice"+(count-1)).attr("value", money);
			allmoney = parseInt(allmoney)+parseInt(money);
			amountnumber = parseInt(amountnumber)+parseInt(gogo2);
			
			}
			
			div = $("<div class='good'>");
			$("body").append(div);

			var textbox = $("<input />");
			textbox.attr("type", "text");
			textbox.attr("class", "textbox");
			textbox.attr("placeholder", "상품명");
			div.append(textbox);

			var textbox1 = $("<input />");
			textbox1.attr("type", "text");
			textbox1.attr("class", "Commodityprice"+count);
			textbox1.attr("name", "Commodityprice"+count);
			textbox1.attr("value", "");
			textbox1.attr("placeholder", "상품 가격");
			div.append(textbox1);

			var textbox2 = $("<input />");
			textbox2.attr("type", "text");
			textbox2.attr("class", "amount"+count);
			textbox2.attr("name", "amount"+count);
			textbox2.attr("value", "");
			textbox2.attr("placeholder", "상품 수량");
			div.append(textbox2);

			var textbox3 = $("<input />");
			textbox3.attr("type", "text");
			textbox3.attr("placeholder", "구매가격");
			textbox3.attr("name", "totalprice"+count);
			textbox3.attr("class", "totalprice"+count);
			div.append(textbox3);
			
			count = count+1;

		});

		$(".remove").click(function() {
			$("div:last-Child").remove();
			count = count - 1;
		});
		
		$(".price").click(function() {
			
			$(".good:last-Child").remove();
			
			
			var divv = $("<div class='goods'>");
			$("body").append(divv);
			
			var textbox5 = $("<input />");
			textbox5.attr("type", "text");
			textbox5.attr("value", amountnumber);
			divv.append(textbox5);
			
			var textbox4 = $("<input />");
			textbox4.attr("type", "text");
			textbox4.attr("value", allmoney);
			divv.append(textbox4);
			
		});

	});
</script>

<style>
.add {
	background-color: #00D8FF;
}

.remove {
	background-color: #1DDB16;
}

input {
	background-color: #DAD9FF;
	text-align: right;
	margin-left: 10px;
}

input:first-Child {
	text-align: left;
	color: brown;
}

div {
	border: 2px solid;
	width: 900px;
}
</style>
</head>
<body>
	<BUTTON class="add" onClick="add()">상품 추가</BUTTON>
	<BUTTON class="remove" onClick="remove()">상품 삭제</BUTTON>
	<BUTTON class="price" onClick="price()">입력완료</BUTTON>

</body>
</html>