<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jQuery :: Part 2</title>
<!-- jQuery Animate() 
	$(selector).animate({params}, speed, callback);
	params : properties 
-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script> 
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
</head>
<body>
	<button>Animation using jQuery</button>
	<div id="animate1"></div>
</body>
</html>