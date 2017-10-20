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
/*
jQeury Syntax
--------------------
 $(selector).action();	객체를 호출 -> 
 -------------------
 $(document).ready(function(){});	onLoad와 같음
 $(function(){});	가장 기본적인 기본 명령어이기 때문에 onLoad형식으로 시작한다.(document).ready 생략된거

 selector
 1. Tag Selector   : $("tag")
 2. Id Selector   : $("#id")
 3. Class Selector   : $(".class")
 4. Attribute Selector   : $("[attribute]") --> [node-name 연산자 value]
    4-0. [name]
    4-1. [name = value]	 예)) [name = test3]
       지정한 노드의 값 중에서 value와 값이 같은 노드
    4-2. [name *= value]
       지정한 노드의 값 중에서 value값을 포함하고 있는 노드
    4-3. [name $= value]
       지정한 노드의 값 중에서 value값으로 끝나는 노드
    4-4. [name != value]
       지정한 노드의 값 중에서 value와 값이 같지 않은 노드
    4-5. [name ^= value]
       지정한 노드의 값 중에서 value값으로 시작하는 노드
    4-6. [name = value] [name2 = value]
       다중 속성을 활용한 선택자
       
       
   	인접 Selector
	$("input[name='user']")
	$("p.intro")
	$("p:first")
	$("ul li:first")
	$("ul li:first-child")
	$(":button")
	$("tr:even")
	$("tr:odd")
 
 */

 // jQeury 시작
$(function(){
$("button").click(function(){
		$("h1").hide();
		$(".test1").hide();
		$("#test2").hide();
	});
	
	$("[name = 'test4']").click(function(){
		$("h1").show();
		$(".test1").show();
		$("#test2").show();
	});
	

	$("[id = 대단원]").hide();
	$("[id = 문제]").hide();

	

	
$("[id = 과목]").click(function(){
	$("[id = 대단원]").show();

	
	$("[id = 대단원]").click(function(){
		
		$("[id = 문제]").show();
	});
	

});

$("input[type='button']").click(function(){
	$("h2").toggle(1000);
	$(".business").toggle(2000);
	$("#contents").toggle(3000);
	$("input[name='user']").toggle(4000);
	$("this").toggle(5000);
});


$("p").on({
	mouseenter: function(){
		$(this).css("background-color","lightgray");
	},
	mouseleave: function(){
		$(this).css("background-color","lightblue");
	},
	click: function(){
		$(this).css("background-color","yellow");
	}
});

$("input.fadeTo[value='FADE-OUT']").click(function() {
    $("h2").fadeTo(3000, 0.3);
 });

 $("input.fadeTo[value='FADE-IN']").click(function() {
    $("h2").fadeTo(3000, 1);

 });
 
 $("#title").click(function() {
    $("#board1").slideToggle("slow");
 });

	
});
    // hide는 숨겨줌

</script>

<!-- jQuery Animate() 
	$(selector).animate({params}, speed, callback);
	params : properties 
-->
 
<script> 
// append 뒤에다 추가 prepend 앞에다 추가

$(document).ready(function(){
    $("button").click(function(){
    	$("#animate1").text("ICIA Education Center");
        /* $("#animate1").animate({left: '250px'});  */
        /* $("#animate1").animate({
        		top: '250px',
        		opacity: '0.5',
            	height: '200px',
            	width: '200px'
        	}); */
    	/* $("#animate1").animate({
    		left: '250px',
    		opacity: '0.5',
        	height: '+=50px',
        	width: '+=50px'
    	}); */
    	/* var div = $("#animate1");
        div.animate({height: '250px', opacity: '0.4'}, "slow");
        div.animate({width: '250px', opacity: '0.8'}, "slow");
        div.animate({height: '150px', opacity: '0.4'}, "slow");
        div.animate({width: '150px', opacity: '0.8'}, "slow"); */
    	var div = $("#animate1");  
        div.animate({top: '200px',height:'250px', width:'250px'}, "slow");
        div.animate({fontSize: '30px'}, "slow");
    });
});
</script>

<style>
	#animate1	{background:#98bf21; color:#FFFFFF;
					  height:150px; width:150px;
					  margin:auto; text-align:center; line-height:150px;
					  position:absolute;}
</style>




<style>
#board1 {
    padding: 5px;
    text-align: center;
    background-color: #e5eecc;
    border: solid 1px #c3c3c3;
}

#borad1 {
    padding: 50px;
    display: none;
}
</style>

</head>
<body>

    <!-- jQuery Event 
	Mouse Events
		click, dblclick, mouseenter, mouseleave, hover(mouseenter처리, mouseleave처리)
	Keyboard Events
		keypress
		keydown
		keyup
	Form Events
	 	submit
	 	change
	 	focus
	 	blur
	Document/Window Events
		load
		resize
		scroll
		unload
	
	** on(이벤트, 처리함수) Method
	해당 이벤트에서 처리할 함수 지정
	** on({이벤트: 처리함수}, ..., {이벤트: 처리함수}) Method
	개체에 여러개의 이벤트 핸들러 연결
-->

<button>Animation using jQuery</button>
	<div id="animate1"></div>



	<p>이게 바로 오오오오</p>

	<h1>하하하</h1>
	<h2>히히</h2>
	<div class="test1">test1</div>
	<div id="test2">test2</div>
	<div class="business">test3</div>
	<div id="contents">test4</div>
	<input type="text" name="user" value="멋지다" />
	<input type="button" value="시작" />

	<table id="과목">
		<tr>
			<td><input type="button" value="수학" /></td>
		</tr>
	</table>

	<table id="대단원">
		<tr>
			<td><input type="button" value="집합" /></td>
		</tr>
		<tr>
			<td><input type="button" value="분수" /></td>
		</tr>
	</table>


	<table id="문제">
		<tr>
			<td><input type="button" value="1" /></td>
		</tr>
		<tr>
			<td><input type="button" value="2" /></td>
		</tr>
	</table>


	<button name="test3">접어두기</button>
	<button name="test4">펼치기</button>

</body>
</html>