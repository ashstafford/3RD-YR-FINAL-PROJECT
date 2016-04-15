<%-- 
    Document   : ProductOutOfStock
    Created on : Mar 7, 2016, 6:40:52 PM
    Author     : Ash
--%>

<%@page import="Dtos.Member"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Product Out of Stock</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="mainCSS.css" >
        
             <style>
            </style>

    </head>
    
   <div id="container">  
          <nav class = "topmenu">
            <ul class="navigation">
                    <li><a href="MemberActionServlet?action=viewProfile">My Profile</a></li>
          
         <%  Member m = (Member)session.getAttribute("member"); 
         
      //  if(m == null)
        //{
            
         %>
        
         <li><a href="/CA3WebApp/Login.jsp">Login</a></li>
           
            
        <li><a href="/CA3WebApp/Login.jsp">Sign Up</a></li>
        
        <%
        
       // }
       // else
       // {
      
            
        %>
            
           <li><a href="MemberActionServlet?action=logout">Logout</a></li>
                      
   </ul>
     </nav> 
        <%  
      //  }
        %>
            <div id="banner">
                <img src="tempBanner.jpg"/>
            </div>
  
       <nav class="menu-1">
    <ul class="menu">
        <li> <a href="/CA3WebApp/HomePage.html">Home</a> </li>
        <li> <a href="MemberActionServlet?action=ViewAllProducts">Shop</a> </li>
        <li> <a href="/CA3WebApp/About.jsp">About</a> </li>
        
        <li> <a href="MemberActionServlet?action=ViewPreviousOrders">View Orders</a> </li>
        
        <li> <a href="/CA3WebApp/ContactUs.jsp">Contact</a> </li>
        <li> <a href="/CA3WebApp/Cart.jsp">Cart</a> </li>
        
        <div id="searchbar">
        <form  action = "MemberActionServlet" method = "post" >
               <p><td> <input name="searchName" size=30 type="text" />  
                 <input type="hidden" name="action" value="searchName" />
                 <input type="submit" value="Search"/>
               </p>
        </form>
        </div>
        
    </ul>
           
           
</nav>
            
            
            <div id="pagecontent3">

                <div id ="NotFoundTitle">
                    <h1>Sorry this Product is out of Stock</h1>
                </div>
        
                <div id="NotFoundBackButton">
                    <form action="MemberActionServlet?action=ViewAllProducts" method = "post">
                    <p> 
                       <input type = "submit" class="resizedButton" name = "profile" value = "Back to Products"/>
                    </p>
                    </form>
                </div>
            </div>
   
   </div>
        
    </body>
</html>


        
        

