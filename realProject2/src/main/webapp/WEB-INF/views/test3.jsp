<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jQuery Traversing</title>
<style>
.ancestors * {
   display: block;
   border: 2px solid lightgray;
   color: lightgray;
   padding: 5px;
   margin: 15px;
}

.descendants * {
   display: block;
   border: 2px solid gray;
   color: gray;
   padding: 5px;
   margin: 15px;
}
</style>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js">
</script>
<script>
   $(document).ready(function(){
      /* Ancestors */
      /* $("#an") */
      /* Ancestors */
      $(".sp").parents().css({"color": "green", "border": "2px solid green"});
      /* $(".sp").parents("ul").css({"color": "blue", "border": "2px solid blue"}); */
       /* $(".sp").parentsUntil("div").css({"color": "red", "border": "2px solid red"}); */
       
       
     /*   / Descendants / */
/* $("#de").children().css({"color": "orange", "border": "2px solid orange"});  */
/*  $("#de").children("p.first").css({"color": "red", "border": "2px solid red"}); */ 
 /* $("#de").find("span").css({"color": "blue", "border": "2px solid blue"});  */
 /* $("#de").find("").css({"color": "red", "border": "2px solid red"}); * */
   });
   
   
</script>
</head>
<body>
   <div id="comment">
      <span>jQuery Traversing</span>
   </div>

   <!-- Ancestors : Great-Grandparent -->
   <div id="an" style="width: 500px;">
      <!-- Ancestors :  Grandparent -->
      <ul>
         <!-- Ancestors :  Direct Parent -->
         <li><span class="sp">span</span></li>
      </ul>
   </div>
   <!-- Descendants : Current element -->
   <div id="de" class="descendants" style="width: 500px;">
      <!-- Descendants : Child -->
      <p class="first">
         <!-- Descendants : Grandchild -->
         <span>Grandchild</span>
      </p>
      <!-- Descendants : Child -->
      <p class="second">
         <!-- Descendants : Grandchild -->
         <span>Grandchild</span>
      </p>
   </div>
   
   
   
   <h1>Welcome to ICIA Education Center</h1>

	<p>제4차 산업혁명 선도인력 양성 사업</p>

	<div style="border: 1px solid black;">
		<p>북두칠성</p>
		<p class="member">신태휘 외 6명</p>
	</div>
	<br/>

	<div style="border: 1px solid black;">
		<p>공조</p>
		<p class="member">남영환 외 4명</p>
	</div>
	<br/>

	<div style="border: 1px solid black;">
		<p>헬로월드</p>
		<p class="member">이경한 외 3명</p>
	</div>
	<br/>
	
	<div style="border: 1px solid black;">
		<p>강조</p>
		<p class="member">이노훈 외 4명</p>
	</div>
   
   
</body>
</html>