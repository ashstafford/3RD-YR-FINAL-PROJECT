<%-- 
    Document   : myProfile.jsp
    Created on : 08-Dec-2015, 20:45:55
    Author     : Aisling
--%>

<%@page import="Dtos.Member"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Profile</title>
        
        
                <style>

                    body 
            {
           
       

background: url("IMG_myProfileBackground.jpg") no-repeat center center fixed; 

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

a:hover, a:active 
{
    background-color:#666666
	
}

div#pagecontent
{
    
  min-height: 1500px;
  padding: 50px;
  left: 20%;
  bottom: 50%;
  font-family: serif;
  color:#FFFFFF;
}

div#container
{
  position     : relative;
  width        : 85%;
  margin-left  : auto;
  margin-right : auto;
}
div#otherButtons
{
      left: 69%;
     font-family: serif;
     color:#FFFFFF;
}
</style>

    </head>
    <body>
        
   <div id="container">  
          <nav class = "topmenu">
 <ul>
      
	<li><a href="/CA3WebApp/CategorySelection.html">Shop</a>
	<li><a href="/CA3WebApp/Cart.jsp">Cart</a>
	
        <li><a href="MemberActionServlet?action=viewProfile">My Profile</a>
        <li><a href="MemberActionServlet?action=ViewPreviousOrders">View Orders</a>   

       
      
          
         <%  Member m = (Member)session.getAttribute("member"); 
         
        if(m == null)
        {
            
         %>
        
            <li><a href="/CA3WebApp/Login.html">Login/Register</a>
            <meta http-equiv="refresh" 
            content="0; url=Login.html">
        <%
        
        }
        else
        {
      
            
        %>
            
           <li><a href="MemberActionServlet?action=logout">Logout</a></li>
                      
   </ul>
     </nav> 
           <div id ="otherButtons"> 
              
               
            <% 
              // boolean admin = m.isIsAdmin();
               // if(admin == 1)
            {
                %><td><form action = "AddProduct.jsp" method = "post"> <p><input type = "submit" value = "Add Product" /></p></form></td><%
            }

              out.println("hahaha " + m.isIsAdmin());
            %>               
           </div>
             
    
            <div id="pagecontent">
     
   
            
        <h1> Welcome <%= m.getFirstName() %>! </h1>
    
        <h2> What would you like to do? </h2>

        <h3> Personal Details </h3>
        <td><p> First Name: <%= m.getFirstName() %></p></td>
        <td><form action = "editFirstName.jsp" method = "post"> <p><input type = "submit" value = "Edit First Name" /></p></form></td>
        <p> Last Name: <%= m.getLastName() %>
        <form action = "EditLastName.jsp" method = "post"> <p><input type = "submit" value = "Edit Last Name" /></p></form>
        <p> Username: <%= m.getUserName() %></p>
        <form action = "EditUserName.jsp" method = "post"> <p><input type = "submit" value = "Edit username" /></p></form>
        <p> Password</p>
        <form action = "EditPassword.jsp" method = "post"> <p><input type = "submit" value = "Edit password" /></p></form>
       
      <%  }
        %>
      </div> 
    </div>
     

    </body>
</html>
