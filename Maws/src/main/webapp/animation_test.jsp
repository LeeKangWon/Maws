<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="main.css">
<script type="text/javascript" src="http://www.google.com/jsapi"></script>
<script type="text/javascript">google.load("jquery", "1.7.1");</script>
<script type="text/javascript">
$(document).ready(function(){
    // to fade in on page load
    $("body").css("display", "none");
    $("body").fadeIn(400); 
    // to fade out before redirect
    
})
</script>

<script type="text/javascript">
jQuery(function() {
    var rolling_time = 500;
    var effect_time = 2000;
 
    var $rolling_img = $("#rolling_img > img");
    $rolling_img.not(":first").hide();
 
    setInterval(rolling, rolling_time);
 
    function rolling()
    {
        $visible_img = $rolling_img.filter(":visible");
 
        $next_img = $visible_img.next();
        if ($next_img.length === 0) {
            $next_img = $rolling_img.filter(":first");
        }
        $next_img.fadeIn(effect_time);
    }
})

</script>


</head>
<body>
ddddddddddddddd
<div id="rolling_img">       
        <img src="resources\image\member_image\leekangwon.jpg">
        <img src="resources\image\member_image\leekangwon.jpg">
        <img src="resources\image\member_image\leekangwon.jpg">
        <img src="resources\image\member_image\leekangwon.jpg">
        <img src="resources\image\member_image\leekangwon.jpg">
</div>



</body>
</html>