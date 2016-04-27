<%-- 
    Document   : EditMemberImageUrl
    Created on : 25-Feb-2016, 10:20:55
    Author     : d00153612
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
        <li> <a href="/CA3WebApp/HomePage.jsp">Home</a> </li>
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
      <div id="pagecontent2">
           
        <form action = "MemberActionServlet" method = "post">
            
            <div id="EditslabelPosition">   
            <label for="exampleInputPassword">Enter new Member Image URL: <span style="color:red;">*</span></label>
            </div>
               
            <div id="EditsTextboxandButtonPosition">  
               
               <tr>
                    <td><input type="file"  name="editMemberImageUrl"  size="50" required/></td>
                </tr>
                
                <input type = "hidden" name="action" value="Edit MemberImageUrl"/>
               <input type="submit" name="submit" value="Edit Profile Image"/>
            </div>
               
         </form>
       </div>
       
       
</html>


