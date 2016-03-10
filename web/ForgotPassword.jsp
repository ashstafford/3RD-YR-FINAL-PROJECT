<%-- 
    Document   : ForgotPassword
    Created on : Mar 9, 2016, 4:55:11 PM
    Author     : Ash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="mainCSS.css" >
        <title>JSP Page</title>
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
                
                 <form action="MemberActionServlet" method="post">
                <table>
                    <tr>
                        <td>Enter your Email Address: </td><td> <input name="email" size=15 type="text" /> </td> 
                    </tr>
                    <tr>
                        <td>What was the Name of your first pet? </td><td><input name="securityQuestionAnswer" size=15 type="text" /> </td> 
                    </tr>
                </table>
                
                <input type="hidden" name="action" value="resetPassword" />
                <input type="submit" value="Next" />
            </form>
           
            </div>
        
      
      
        
        
        
       
    </body>
</html>
