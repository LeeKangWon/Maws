<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<html>

<head>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<title>Home</title>

<script src = "http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src = "http://malsup.github.com/jquery.cycle2.js"></script>

<style>
#hz {
  width: 100%
} 
#hz * {
  margin:0; padding:0
}     

#hz ul{
  width: 100%;
} 

#hz li{ 
      float:left;
      width:25%;
      height:100px;
      border:1px solid silver;
      box-sizing:border-box;
} 

@media screen and (max-width: 480px) { 
 #hz li{ 
        float:left;
        width: 20%; 
        height:100px;
        border:1px solid silver;
        box-sizing:border-box;
      } 
} 
</style>

<body>



<div id="hz">   
         <ul> 
            <li>
               <a href="http://www.homzzang.com"> 홈짱닷컴</a>
            </li> 
           <li>
               <a href="http://www.homzzang.com"> 홈짱닷컴</a>
            </li>  
            <li>
               <a href="http://www.homzzang.com"> 홈짱닷컴</a>
            </li>
            <li>
               <a href="http://www.homzzang.com"> 홈짱닷컴</a>
            </li> 
        </ul> 
  <div class="boxmaker"></div>
</div>
</head>
</body>
</html>