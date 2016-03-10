<%-- 
    Document   : Login
    Created on : 10-Mar-2016, 08:43:04
    Author     : Karen.Aungier
--%>

<%@page import="Dtos.Member"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="mainCSS.css" >
        <script>
    function goBack()
    {            
        window.history.back();
    }
</script>
         <style>
             div#login{
                 padding-left:500px;
                 padding-top:50px;
                 font-family: Arial, Helvetica, sans-serif;
                 
             }
             div#loginTitle
             {
                padding-left:540px;
                padding-top:10px;
             }
             div#ad img{
                 padding-left:50px;
                 padding-top:50px;
                 width:92%
             }

        </style>
        
    </head>
    <body>
 
        <div id="container">
            
        

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
            
            
            <!--<div id="side_bar">
 	
            </div>-->
            
            <div id="pagecontent2">
                
                <div id="loginTitle">
                <h1> Login </h1> 
                </div>
                
                <div id="login">
        <form action="MemberActionServlet" method="post">
                <table>
                    <tr>
                        <td>Username: </td><td> <input name="username" size=15 type="text" /> </td> 
                    </tr>
                    <tr>
                        <td>Password: </td><td><input name="password" size=15 type="password" /> </td> 
                    </tr>
                </table>
                
                <input type="hidden" name="action" value="login" />
                <input type="submit" value="login" />
            </form>

        <p> Not a member? Register! </p>
        
         <form action = "Register.jsp" method = "post">
             
               <p> 
                  <input type = "submit" name = "Register" value = "Register" />
               </p>
            </form>
         
         <p> Forgot password?</p>
        
         <form action = "ForgotPassword.jsp" method = "post">
               
      
               <p> 
                  <input type = "submit" name = "forgot Password" value = "forgot Password" />
               </p>
            </form>
       </div>
           
                <div id="ad">
			<img src="harryPotterAd.jpg" />
                </div>
                
                
            </div>
        
       
       <!--<section class="container">
        <div class="login">
        <h1>Login</h1>
        
        <form method="post" action="MemberActionServlet">
            <p><input type="text" name="username" value="" placeholder="Username"></p>
            <p><input type="password" name="password" value="" placeholder="Password"></p>
            
            <p class="remember_me">
                <label>
                    <input type="checkbox" name="remember_me" id="remember_me">
                    Remember me on this computer
                </label>
            </p>
            
            <p class="submit"><input type="submit" name="commit" value="Login"></p>
      </form>
    </div>

    <!--<div class="login-help">
      <p>Forgot your password? <a href="index.html">Click here to reset it</a>.</p>
    </div>
  </section>
    
   <!-- <div class="login">
  <div class="login-triangle"></div>
  
  <h2 class="login-header">Log in</h2>

  <form class="login-container">
    <p><input type="email" placeholder="Email"></p>
    <p><input type="password" placeholder="Password"></p>
    <p><input type="submit" value="Log in"></p>
  </form>
</div> -->
        
       <button onclick="goBack()">Go Back</button>
        
    </body>
</html>