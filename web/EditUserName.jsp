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
                
               function validateForm() {
               var x = document.forms["myForm"]["editUsername"].value;
                if (x === null || x === "") {
                    alert("User Name must be filled out");
                    return false;
                }
                
                //function validateForm()
                //{
                  //if (document.myForm.editUsername.value==="")
                  //{
                   // alert("You haven't entered your Username !");
                   // return false;
                  //}

              //    document.myForm.submit();
              //    return true;
              
              //var Username=document.myForm.editUsername.value;
              
              //if (Username===null || Username==="")
              //{  
               //// alert("Username can't be blank");  
               // return false;  
              //}
              
              
                }
}
                
            </script>
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


       
  