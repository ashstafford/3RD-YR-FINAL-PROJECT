<%-- 
    Document   : ItemNotFound
    Created on : 13-Dec-2015, 18:24:37
    Author     : Aisling
--%>
<%@page import="Dtos.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>item not found</title>
            <style>
                body 
  {
   
        background:  url("IMG_categorySelectionBackground.jpg") no-repeat center center fixed; 
        -webkit-background-size: cover;
        -moz-background-size: cover;
        -o-background-size: cover;
        background-size: cover;
    }            
.topmenu

ul {
    position: relative;
    list-style-type: none;
    margin: 10px;
    padding: 0;
    overflow: hidden;	
    left:10%;
	
	
}


.topmenu li

{
	float :left;
        position: relative;
	padding: 0;
	width: 200px;
	line-height: 250%;
	z-index: 1000;
	
}



a:link, a:visited {
    display: block;
    width: 200px;
    font-weight: bold;
    color: #FFFFFF;
    background-color:#000000;
    text-align: center;
    padding: 4px;
    text-decoration: none;
    text-transform: uppercase;
}

a:hover, a:active {
    background-color:#666666
	
}

div#pagecontent
{
    
  min-height: 1500px;
  padding: 50px;
  left: 20%;
  bottom: 50%;
  font-family: serif;
  font-size: 20px;
 
}

div#container
{
  position     : relative;
  width        : 85%;
  margin-left  : auto;
  margin-right : auto;
}
</style>
    </head>
     <body>
        
   <div id="container">  
          <nav class = "topmenu">
 <ul>
      
	<li><a href="/CA3WebApp/CategorySelection.html">Shop</a>
	<li><a href="/CA3WebApp/Cart.jsp">Cart</a>
	<li><a href="/CA3WebApp/Login.html">Login/Register</a>
        <li><a href="MemberActionServlet?action=viewProfile">My Profile</a>
        <li><a href="MemberActionServlet?action=ViewPreviousOrders">View Orders</a>   
        <li><a href="MemberActionServlet?action=logout">Logout</a></li>
</ul>
  </nav>
       <div id="pagecontent">
           
        <h1> Sorry item not found!!   </h1> 
       </div>
   </div>   
    </body>
</html>
