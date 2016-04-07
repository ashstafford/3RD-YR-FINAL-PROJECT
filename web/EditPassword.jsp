<%-- 
    Document   : EditPassword
    Created on : 14-Dec-2015, 21:52:47
    Author     : Aisling
--%>


       
   <%@page import="Dtos.Member"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Edit Member Image URL</title>
            <link rel="stylesheet" type="text/css" href="mainCSS.css" >
            <style>

            </style>
    </head>
     
    
    <body>
        
   <div id="container">
            
        <nav class = "topmenu">
            <ul class="navigation">
                    <li><a href="MemberActionServlet?action=viewProfile">My Profile</a></li>
                    
            
       
      
          
         <%  Member m = (Member)session.getAttribute("member"); 
         
        if(m == null)
        {
            
         %>
        
         <li><a href="/CA3WebApp/Login.html">Login</a></li>
            <meta http-equiv="refresh" 
            content="0; url=Login.html">
            
        <li><a href="/CA3WebApp/Login.html">Sign Up</a></li>
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
          <% } %>

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
      <div id="pagecontent2">
           
        <form action = "MemberActionServlet" method = "post">
            
            <div id="EditslabelPosition">   
            <label for="exampleInputEditFirstname">Enter your new Password: <span style="color:red;">*</span></label>
            </div>
               
            <div id="EditsTextboxandButtonPosition">  
               <input name="editPassword" class="resizedTextBox"  placeholder="MUST be at least 8 characters " type="password" size=15 />
                 
               <input type="hidden" name="action" value="Edit Password"/>
               <input type="submit" class="resizedButton" name="submit" value="Edit Password"/>
           
                 
            </div>
               
         </form>
       </div>
       
       
</html>

