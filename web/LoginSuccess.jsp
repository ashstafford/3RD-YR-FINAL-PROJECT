<%-- 
    Document   : LoginSuccess
    Created on : 08-Dec-2015, 09:32:07
    Author     : d00155224
--%>

<%@page import="Dtos.Member"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Success!</title>
        
        <style>
            
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
  background-color: white;
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
 
	<li><a href="/CA3WebApp/CategorySelection.jsp">Shop</a>
	<li><a href="/CA3WebApp/Cart.jsp">Cart</a>
	<li><a href="/CA3WebApp/Login.html">Login/Register</a>
        <li><a href="#">Logout</a></li>
</ul>
  </nav>
        
      <div id="pagecontent">
          
          
         <p><%  Member m = (Member)session.getAttribute("member"); %>
         <h1> Welcome <%= m.getFirstName() %> </h1></p>
         <h2> What would you like to do? </h2>
        <form action = "MemberActionServlet" method = "post">
               <p> View Profile
                   <input type="hidden" name="action" value ="viewProfile">
                  <input type="image" src="DC1.jpg" alt="Submit" width="50px" height="50px"/>
               </p>
         </form>
         
         
        <p>View Profile </p>
        
         <form action = "MemberActionServlet" method = "post">
               <p> 
                  <input type = "submit" name="action" value = "viewProfile" />
               </p>
         </form>
        
         <p>View Items</p>
        
         <form action = "CategorySelection.html" method = "post">
               <p> 
                  <input type = "submit" value = "view Items" />
               </p>
         </form>
         
          <p>Search for an Item</p>
        
         <form action = "MemberActionServlet" method = "post">
               <p>product name: <td> <input name="searchName" size=15 type="text" /> </td> 
                 <input type="hidden" name="action" value="searchName" />
                 <input type="submit" value="search"/>
               </p>
         </form>
        
       </div>    
     </div> 
    </body>
</html>
