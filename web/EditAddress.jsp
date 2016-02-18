<%-- 
    Document   : EditAddress
    Created on : 14-Dec-2015, 21:53:00
    Author     : Aisling
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Address</title>
        
<style>
body 
            {
             background: url("IMG_EditAddressBackground.jpg") no-repeat center center fixed; 
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
    
  color: #ffffff;
                 padding: 150px;
                 margin: 500px;
                 margin-top: 100px;
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
     
  <div id="pagecontent>"
       
        <form action = "MemberActionServlet" method = "post">
               <p>Enter new address:
                 <input name="editAddress" size=15 type="text" />
                 <input type="hidden" name="action" value="Edit Address"/>
                 <input type="submit" name="submit" value="Edit Address"/>
               </p>
         </form>
       
      </div>     
     </div>     
    </body>
</html>
