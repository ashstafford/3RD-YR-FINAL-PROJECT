<%-- 
    Document   : About
    Created on : 18-Feb-2016, 10:47:07
    Author     : D00154410
--%>

<%@page import="Dtos.Member"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="images/flash3.png" type="image/gif" sizes="20x20">
        <link rel="stylesheet" type="text/css" href="mainCSS.css" >
         <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
        <script type="text/javascript" src="js/autoCompleter.js"></script>
        <link rel="stylesheet" 
              href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
        <title>About Page</title>
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
        
            
        <li><a href="/CA3WebApp/Login.html">Sign Up</a></li>
        </ul>
     </nav> 
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
        <li> <a href="/CA3WebApp/HomePage.jsp">Home</a> </li>
        <li> <a href="MemberActionServlet?action=ViewAllProducts">Shop</a> </li>
        <li> <a href="/CA3WebApp/About.jsp">About</a> </li>
        
        <li> <a href="MemberActionServlet?action=ViewPreviousOrders">View Orders</a> </li>
        
        <li> <a href="/CA3WebApp/ContactUs.jsp">Contact</a> </li>
        <li> <a href="/CA3WebApp/Cart.jsp">Cart</a> </li>
        
        <div id="searchbar">
        <form  action = "MemberActionServlet" method = "post" >
               <p><td> <input name="searchName" id="searchName" size=30 type="text" />  
                 <input type="hidden" name="action" value="searchName" />
                 <input type="submit" value="Search"/>
               </p>
        </form>
        </div>
        
    </ul>
           
           
</nav> 
      <div id="pagecontent3">
           
          <div id ="AboutHeading">
              <h1> About Us </h1>
              <h3> Our deals are fantastic FOUR you </h3>
          </div>
          
          <br>
         
          
          <div id="AboutUsInfo">
              <td><p>We are a Irish based company who strive to offer you the biggest and best range of merch possible while always striving for top class, great quality products and 5 Star customer service.</p></td>
              <br>
              <td><p>We work closely with the leading merchandise distributors to ensure that we can offer you the largest range of must-have items and to guarantee you 100% official tv show and movie merch at all times.</p></td>
              <br>
              <td><p>Our store is perfectly secure so you can shop in the knowledge that your personal details are very safe and none of your personal information will ever be passed on to any 3rd parties.</p></td>
              <br>
              <td><p>Please be sure to check back regularly because our range is growing by the minute with many new categories being added.</p></td>
          </div>
          
          <div class ="images2">
                <div class="social-popout">
                    <a href="http://www.facebook.com"><img src="images/facebook.png" />         
                </div>
                
                <div class="social-popout">            
                     <a href="http://www.twitter.com"><img src="images/twitter.png" />            
                </div>
                
                <div class="social-popout">             
                     <a href="http://www.googleplus.com"><img src="images/googleplus.png" />  
                </div>
                
                <div class="social-popout">            
                     <a href="http://www.instagram.com"><img src="images/instagram.png" />
                </div>
                
                <div class="social-popout">         
                     <a href="http://www.pinterest.com"><img src="images/pinterest.png" />
                </div>
                
                <div class="social-popout">
                     <a href="http://www.tumblr.com"><img src="images/tumblr.png" />
                </div>
            </div>
          
          
          
       </div>
           
    </body>
</html>
