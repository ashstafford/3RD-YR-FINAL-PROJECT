<%-- 
    Document   : MemberRemovedSuccess
    Created on : 05-Apr-2016, 17:43:40
    Author     : Natalia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="mainCSS.css" >
        <title>Select Member</title>
    </head>
     </head>   
    <body>
        
   <div id="container">  
          <nav class = "topmenu">
            <ul class="navigation">
                    <li><a href="MemberActionServlet?action=viewProfile">My Profile</a></li>
                    
            
       
      
          
         <%  //Member m = (Member)session.getAttribute("member"); 
         
       // if(m == null)
        //{
            
         %>
        
         <li><a href="/Login.html/Login.jsp">Login</a></li>
            
            
        <li><a href="/Login.html/Login.jsp">Sign Up</a></li>
        
        <%
        
       // }
       // else
        //{
      
            
        %>
            
           <li><a href="MemberActionServlet?action=logout">Logout</a></li>
                      
   </ul>
     </nav> 
          <%// } %>

            <div id="banner">
                <img src="tempBanner.jpg"/>
            </div>
  
       <nav class="menu-1">
    <ul class="menu">
        <li> <a href="/Login.html/HomePage.jsp">Home</a> </li>
        <li> <a href="MemberActionServlet?action=ViewAllProducts">Shop</a> </li>
        <li> <a href="/Login.html/About.jsp">About</a> </li>
        
        <li> <a href="MemberActionServlet?action=ViewPreviousOrders">View Orders</a> </li>
        
        <li> <a href="/Login.html/ContactUs.jsp">Contact</a> </li>
        <li> <a href="/Login.html/Cart.jsp">Cart</a> </li>
        
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
          
          <div id="pagecontent">
              <h1> Member deleted Successfully! </h1>
          </div>
   </body>
</html>

