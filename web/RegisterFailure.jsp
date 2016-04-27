<%-- 
    Document   : RegisterFailure
    Created on : 08-Dec-2015, 12:23:58
    Author     : Aisling
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="mainCSS.css" >
        <style>  
        </style>
        
    </head>
    <body>
        <div id="container">
            
        <nav class = "topmenu">
            <ul class="navigation">
                    <li><a href="MemberActionServlet?action=viewProfile">My Profile</a></li>
          
         <li><a href="/CA3WebApp/Login.jsp">Login</a></li>
            
            
        <li><a href="/CA3WebApp/Login.jsp">Sign Up</a></li>
         
                      
   </ul>
     </nav> 
        
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
                
                <div id="RegisterFailed">    
                    <h1>Register Failed</h1>

                    <form action = "Register.jsp" method = "post">


                           <p> 
                              <input type = "submit"  name = "Register" class="resizedButton" value = "Return to Register" />
                           </p>
                   </form>
        
                <form action = "Login.jsp" method = "post">


                        <p> 
                           <input type = "submit"  name = "Login" class="resizedButton" value = "Return to Login"/>
                        </p>
                </form>
        
      </div>
           
            </div>
        
        
        
      
    </body>
       </html>
