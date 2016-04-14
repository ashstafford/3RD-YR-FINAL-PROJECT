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

            <div id="pagecontent3">
                
                 <form action="MemberActionServlet" method="post">
                     
                     <div id="ForgotPasswordTitle">
                         <h1> Forgot your Password </h1>
                         <br>
                         <hr>
                     </div>
                     
                     <div id="ForgotPasswordMain">
                        <div id="ForgotPassword">
                               <table>
                                   <tr>
                                       <label for="forgetPasswordEmail">Enter your Email Address: <span style="color:red;">*</span></label> 
                                  </tr>
                                  <tr>
                                      <td> <input name="userName" class="resizedTextBox" placeholder="MUST have an @" size=25 type="text" required /> </td>
                                  </tr>
                               </table>
                           </div>

                           <div id="ForgotPassword">
                               <table>
                                   <tr>
                                       <label for="forgetPasswordPet">What was the Name of your first pet? <span style="color:red;">*</span></label>
                                   </tr>
                                   <tr>
                                       <td> <input name="password" class="resizedTextBox" size=25 type="password" required /> </td> 
                                   </tr>
                               </table>
                           </div>
               
                <div id="ForgotPasswordButtonNext">
                    <input type="hidden" name="action" value="resetPassword" />
                    <input type="submit" class="resizedButton" value="Next" />
                </div>
                
                <div id ="ForgotPasswordButtonBack">
                    <form action = "Login.jsp" method = "post">
                        <p> 
                           <input type = "submit" class="resizedButton" name = "Login" value = "Return to Login"/>
                        </p>
                    </form>  
                </div>
            </form>
                </div>
           
            </div>
        
      
      
        
        
        
       
    </body>
</html>
