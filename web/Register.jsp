<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="mainCSS.css" >
        <title>Register</title>
        
        <style>  
        
       </style> 
      
    </head>
    
    
  <body>
      
      <div id="container">
            
        <nav class = "topmenu">
            <ul class="navigation">
                    <li><a href="MemberActionServlet?action=viewProfile">My Profile</a></li>
          
         <li><a href="/CA3WebApp/Login.html">Login</a></li>
            
            
        <li><a href="/CA3WebApp/Login.html">Sign Up</a></li>
         
                      
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
                
                 <div id="register">  
        <h1> Register </h1>   
    <form action="MemberActionServlet" method="post">
                <table>
                    <tr>
                        <td> Username  : </td><td> <input name="userName" placeholder="MUST be at least 4 characters" size=25 type="text" /> </td> 
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td> Password  : </td><td> <input name="password" placeholder="MUST be at least 8 characters " size=25 type="password" /> </td> 
                    </tr>
                     <tr>
                        <td> First name  : </td><td> <input name="firstName" size=25 type="text" /> </td> 
                    </tr>
                     <tr>
                        <td> Last name  : </td><td> <input name="lastName" size=25 type="text" /> </td> 
                    </tr>
                     <tr>
                        <td> E-Mail  : </td><td> <input name="email" placeholder="must have an '@'" size=25 type="text" /> </td> 
                    </tr>
                     <tr>
                        <td></td> 
                        <td> What was the name of your first pet? </td> 
                     </tr>
                     <tr>
                        <td> Security Question Answer  : </td><td> <input name="securityQuestionAnswer" size=25 type="text" /> </td> 
                    </tr>
                    
                </table>
                
                <input type="hidden" name="action" value="register"/>
                <input type="submit" value="Register"  />
      </form>
    </div>
           
            </div>
        
      
      
      
        
  </body>     
</html>
