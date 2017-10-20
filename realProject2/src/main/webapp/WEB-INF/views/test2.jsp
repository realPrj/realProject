<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jQuery Test</title>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
   /*  jQeury Syntax
    --------------------------
    $(selector).action(); 
    --------------------------
    $(document).ready(function(){});
    $(function(){});
   
    selector
    1. Tag Selector         : $("tag")
    2. Id Selector         : $("#id")
    3. Class Selector      : $(".class")
    4. Attribute Selector   : $("[attribute]")  --> [node-name 연산자 value]
    4-0. [name]
    **4-1. [name = value] 
    지정한 노드의 값 중에서 value와 값이 같은 노드
    4-2. [name *= value]   [name *= b]
    지정한 노드의 값 중에서 value값을 포함하고 있는 노드
    4-3. [name $= value]
    지정한 노드의 값 중에서 value값으로 끝나는 노드
    4-4. [name != value]
    지정한 노드의 값 중에서 value와 값이 같지 않은 노드
    4-5. [name ^= value]
    지정한 노드의 값 중에서 value값으로 시작하는 노드
    **4-6. [name = value][name2 = value]
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

   /* $(function(){
    alert("Jquery Load Success");
    }); */

   /* onLoad EventHandler */
   $(document).ready(function() {
      $("button").click(function() {
         $("h2").hide(1000);
         $(".business").hide(2000);
         $("#contents").hide(3000);
         $("[name='user']").hide(4000);
         $(this).hide(5000);
      });
      $("input.toggle").click(function() {
         $("h2").toggle(1000);
         $(".business").toggle(2000);
         $("#contents").toggle(3000);
         $("input[name='user']").toggle(4000);
         $(this).toggle(5000);
      });

      $("p").on({
         mouseenter : function() {
            $(this).css("background-color", "lightgray");
         },
         mouseleave : function() {
            $(this).css("background-color", "lightblue");
         },
         click : function() {
            $(this).css("background-color", "yellow");
         }
      });

      $("input.fade").click(function() {
         $("h2").fadeToggle();
         $(".business").fadeToggle(5000);
         $("#contents").fadeToggle("slow");
         $("input[name='user']").fadeToggle("fast");
         $(this).fadeToggle(10000, popup());
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

    function popup() {
         alert("외부 함수 호출");
      }
</script>
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
   <!-- Selector : Tag Element -->
   <h2>ICIA 교육원</h2>

   <p class="business">제4차 산업혁명 선도인력 양성 사업</p>

   <div id="contents">IoT 센서 데이터를 활용한 수치 정보 시각화 과정</div>
   <input type="text" name="user" placeholder="유저명" />
   <br />
   <button>개체 숨기기</button>
   <input type="button" class="toggle" value="개체 Hide/Show" />
   <input type="button" class="fade" value="FADE-TOGGLE" />
   <input type="button" class="fadeTo" value="FADE-OUT" />
   <input type="button" class="fadeTo" value="FADE-IN" />
   <hr />

   <!-- Practice : jQuery Selector & Action
      1. 첫 페이지 로딩 시 [역사자료]만 화면 출력
      2. 로딩 후 다섯 개의 제목을 클릭할 경우 해당 자료 영역만 화면에 출력
      3. 메뉴는 마우스 오버 시 색상 변화 주기(마우스리브시 원상 복구)
      *** td:nth-child(순번) 참조
      4. 특정 분야의 모든 테이블은 게시글을 구분할 수 있는 css지정
      5. 특정 분야의 모든 테이블의 특정 게시글에 마우스오버되었을 경우 
         글씨를 두껍게 처리 마우스리브시 원상복구
   -->
   <div id="title">
      <table class="tab">
         <tr>
            <td>여행</td>
            <td>공학</td>
            <td>역사</td>
            <td>생활</td>
            <td>쇼핑</td>
         </tr>
      </table>
   </div>
   <div id="board1">
      <table>
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
   <!-- <div id="board2"><h1>공학 자료</h1></div>
   <div id="board3"><h1>역사 자료</h1></div>
   <div id="board4"><h1>생활 자료</h1></div>
   <div id="board5"><h1>쇼핑 자료</h1></div> -->
</body>
</html>

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