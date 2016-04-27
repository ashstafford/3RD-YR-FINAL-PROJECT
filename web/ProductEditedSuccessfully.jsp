<%-- 
    Document   : ProductEditedSuccessfully
    Created on : 21-Apr-2016, 10:43:39
    Author     : Natalia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       <link rel="stylesheet" type="text/css" href="mainCSS.css" >
       <link rel="icon" href="images/flash3.png" type="image/gif" sizes="20x20">
        <meta http-equiv="refresh" content="5;url=MemberActionServlet?action=ViewAllProducts" />
        <title>JSP Page</title>
    </head>
    <body>
       <div id="container">
            
        
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
 
                <div id="NotFoundTitle">
                    <h1>The Product was Edited Successfully</h1>
                </div>
                
                
                <div id="NotFoundBackButton">
                    <form action = "Login.jsp" method = "post">
                        <p> 
                           <input type = "submit" class="resizedButton" name = "Login" value = "Return to Login"/>
                        </p>
                    </form>
                </div>
                
            </div>
       
    </body>
</html>
