<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
$(function(){
	
	for(var i=1; i<6; i++){
	$(".tab td:nth-child("+i+")").on({
		mouseenter: function(){
			$(this).css("background-color","#FFE400");
			$(this).css("font-weight","bold");
		},
		mouseleave: function(){
			$(this).css("background-color","#FFFFFF");
			$(this).css("font-weight","normal");
		},
		click: function(){
			$(this).css("background-color","#FF0000");
		}
	});
	
	};
	
	for(var i=2; i<7; i++){
		$(".tab2 tr:nth-child("+i+")").on({
			mouseenter: function(){
				$(this).css("background-color","#FFE400");
				$(this).css("font-weight","bold");
			},
			mouseleave: function(){
				$(this).css("background-color","#FFFFFF");
				$(this).css("font-weight","normal");
			},
			click: function(){
				$(this).css("background-color","#FF0000");
			}
		});
		
		};
	
	
		$("[id *= board]").hide();
		$("[id = board3]").show();
		$("[id = board33]").show();
		
			
	$(".tab td:nth-child(1)").click(function(){
		$("[id *= board]").hide();
		$("[id = board1]").show();
		$("[id = board11]").show();
	});
	
	$(".tab td:nth-child(2)").click(function(){
		$("[id *= board]").hide();
		$("[id = board2]").show();
		$("[id = board22]").show();
	});
	
	$(".tab td:nth-child(3)").click(function(){
		$("[id *= board]").hide();
		$("[id = board3]").show();
		$("[id = board33]").show();
	});
	
	$(".tab td:nth-child(4)").click(function(){
		$("[id *= board]").hide();
		$("[id = board4]").show();
		$("[id = board44]").show();
	});
	
	$(".tab td:nth-child(5)").click(function(){
		$("[id *= board]").hide();
		$("[id = board5]").show();
		$("[id = board55]").show();
	});

});
</script>
<body>

<!-- Practice : jQuery Selector & Action
		1. 첫 페이지 로딩 시 [역사자료]만 화면 출력
		2. 로딩 후 다섯 개의 제목을 클릭할 경우 해당 자료 영역만 화면에 출력
		3. 제목은 마우스 오버 시 색상 변화 주기(마우스리브시 원상 복구)
		*** td:nth-child(순번) 참조
		4. 특정 분야의 모든 테이블은 게시글을 구분할 수 있는 css지정
		5. 특정 분야의 모든 테이블의 특정 게시글에 마우스오버되었을 경우 
		   글씨를 두껍게 처리 마우스리브시 원상복구
	-->

	<div>
		<table class="tab">
			<tr>
				<td>여행</td><td>공학</td><td>역사</td><td>생활</td><td>쇼핑</td>
			</tr>
		</table>
	</div>
	
	<div id="board11"><h1>여행 자료</h1></div>	
	<div id="board2"><h1>공학 자료</h1></div>
	<div id="board3"><h1>역사 자료</h1></div>
	<div id="board4"><h1>생활 자료</h1></div>
	<div id="board5"><h1>쇼핑 자료</h1></div>
	
	<div id="board1">
		<table class="tab2">
			<tr>
				<th colspan="5">여행자료</th>
			</tr>
			<tr>
				<td>1</td>
				<td>프랑스 여행기</td>
				<td>hoonzzang</td>
				<td>2017-09-09</td>
				<td>5</td>
			</tr>
			<tr>
				<td>2</td>
				<td>영국 여행기</td>
				<td>hoonzzang</td>
				<td>2017-09-10</td>
				<td>50</td>
			</tr>
			<tr>
				<td>3</td>
				<td>독일 여행기</td>
				<td>hoonzzang</td>
				<td>2017-09-11</td>
				<td>100</td>
			</tr>
			<tr>
				<td>4</td>
				<td>이탈리아 여행기</td>
				<td>hoonzzang</td>
				<td>2017-09-12</td>
				<td>15</td>
			</tr>
			<tr>
				<td>5</td>
				<td>스페인 여행기</td>
				<td>hoonzzang</td>
				<td>2017-09-20</td>
				<td>55</td>
			</tr>
		</table>
	</div>
	
	<div id="board22">
		<table class="tab2">
			<tr>
				<th colspan="5">공학자료</th>
			</tr>
			<tr>
				<td>1</td>
				<td>프랑스 공학</td>
				<td>hoonzzang</td>
				<td>2017-09-09</td>
				<td>5</td>
			</tr>
			<tr>
				<td>2</td>
				<td>영국 공학</td>
				<td>hoonzzang</td>
				<td>2017-09-10</td>
				<td>50</td>
			</tr>
			<tr>
				<td>3</td>
				<td>독일 공학</td>
				<td>hoonzzang</td>
				<td>2017-09-11</td>
				<td>100</td>
			</tr>
			<tr>
				<td>4</td>
				<td>이탈리아 공학</td>
				<td>hoonzzang</td>
				<td>2017-09-12</td>
				<td>15</td>
			</tr>
			<tr>
				<td>5</td>
				<td>스페인 공학</td>
				<td>hoonzzang</td>
				<td>2017-09-20</td>
				<td>55</td>
			</tr>
		</table>
	</div>
	
	<div id="board33">
		<table class="tab2">
			<tr>
				<th colspan="5">역사자료</th>
			</tr>
			<tr>
				<td>1</td>
				<td>프랑스 역사</td>
				<td>hoonzzang</td>
				<td>2017-09-09</td>
				<td>5</td>
			</tr>
			<tr>
				<td>2</td>
				<td>영국 역사</td>
				<td>hoonzzang</td>
				<td>2017-09-10</td>
				<td>50</td>
			</tr>
			<tr>
				<td>3</td>
				<td>독일 역사</td>
				<td>hoonzzang</td>
				<td>2017-09-11</td>
				<td>100</td>
			</tr>
			<tr>
				<td>4</td>
				<td>이탈리아 역사</td>
				<td>hoonzzang</td>
				<td>2017-09-12</td>
				<td>15</td>
			</tr>
			<tr>
				<td>5</td>
				<td>스페인 역사</td>
				<td>hoonzzang</td>
				<td>2017-09-20</td>
				<td>55</td>
			</tr>
		</table>
	</div>
	
	
	<div id="board44">
		<table class="tab2">
			<tr>
				<th colspan="5">생활자료</th>
			</tr>
			<tr>
				<td>1</td>
				<td>프랑스 생활</td>
				<td>hoonzzang</td>
				<td>2017-09-09</td>
				<td>5</td>
			</tr>
			<tr>
				<td>2</td>
				<td>영국 생활</td>
				<td>hoonzzang</td>
				<td>2017-09-10</td>
				<td>50</td>
			</tr>
			<tr>
				<td>3</td>
				<td>독일 생활</td>
				<td>hoonzzang</td>
				<td>2017-09-11</td>
				<td>100</td>
			</tr>
			<tr>
				<td>4</td>
				<td>이탈리아 생활</td>
				<td>hoonzzang</td>
				<td>2017-09-12</td>
				<td>15</td>
			</tr>
			<tr>
				<td>5</td>
				<td>스페인 생활</td>
				<td>hoonzzang</td>
				<td>2017-09-20</td>
				<td>55</td>
			</tr>
		</table>
	</div>
	
		<div id="board55">
		<table class="tab2">
			<tr>
				<th colspan="5">쇼핑자료</th>
			</tr>
			<tr>
				<td>1</td>
				<td>프랑스 쇼핑</td>
				<td>hoonzzang</td>
				<td>2017-09-09</td>
				<td>5</td>
			</tr>
			<tr>
				<td>2</td>
				<td>영국 쇼핑</td>
				<td>hoonzzang</td>
				<td>2017-09-10</td>
				<td>50</td>
			</tr>
			<tr>
				<td>3</td>
				<td>독일 쇼핑</td>
				<td>hoonzzang</td>
				<td>2017-09-11</td>
				<td>100</td>
			</tr>
			<tr>
				<td>4</td>
				<td>이탈리아 쇼핑</td>
				<td>hoonzzang</td>
				<td>2017-09-12</td>
				<td>15</td>
			</tr>
			<tr>
				<td>5</td>
				<td>스페인 쇼핑</td>
				<td>hoonzzang</td>
				<td>2017-09-20</td>
				<td>55</td>
			</tr>
		</table>
	</div>


</body>
</html>