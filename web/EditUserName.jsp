<%-- 
    Document   : EditUserName
    Created on : 14-Dec-2015, 21:52:33
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
            
            <script>
                
          
                
            </script>
    </head>
     
    
    <body>
        
   <div id="container">
            
        

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
      <div id="pagecontent3">
       
        
            <form method="post" action = "MemberActionServlet" name="myForm"  onSubmit="return validateForm()">
            
            <div id="EditslabelPosition">   
            <label for="exampleInputEditFirstname">Enter your new Username: <span style="color:red;">*</span></label>
            </div>
               
            <div id="EditsTextboxandButtonPosition">  
               <input name="editUsername" type="text" class="resizedTextBox" size=15>
                 
           
                 <input type="hidden" name="action" value="Edit Username"/>
                 <input type="submit" class="resizedButton"  name="submit" value="Edit Username"  />
            </div>
                
            </form>
               
       </div>
       
       
</html>


       
  