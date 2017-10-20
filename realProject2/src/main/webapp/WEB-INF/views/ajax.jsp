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
   function start() {
      $.ajax({
         type : "GET",
         url : "ajaxTest",
         date : {
            id : "icia",
            pw : "1111"
         },// 요청값
         dataType : "html", //json.xml,testmjsnop
         success : function(data) {
            alert(data);
            console.log(data);
            $("#test1").append(data);
         },
         error : function(error) {
            alert('error');
            console.log(error);
         }
      });// ajax end
   }
</script>
</head>
<body>
   <h1>Ajax Method</h1>
   <div id="test1" ></div>
   <button onClick="start()">"start"</button>
</body>
</html>