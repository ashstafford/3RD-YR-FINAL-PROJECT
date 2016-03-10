<%-- 
    Document   : myProfile.jsp
    Created on : 08-Dec-2015, 20:45:55
    Author     : Aisling
--%>

<%@page import="Dtos.Member"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Profile</title>
        <link rel="stylesheet" type="text/css" href="mainCSS.css" >
        
        
            <style>
    
div#otherButtons
{
     left: 69%;
     font-family: serif;
     color:#FFFFFF;
     padding-bottom: 300px;
}                
div#editButtons
{
     padding-left: 100px;
     padding-top: 30px;
}
div#profilePicture
{
    padding-left: 70px;
    padding-top:50px;
    float :left;
    clear: left;
}

div#profileDetails
{
    padding-left: 500px;
    
}

.imageBorder
{
    border-width: 1px;
    border-color: Black;
}

div#profilePicButton
{
    padding-left: 500px;
    padding-top: 22px;
    
}

h1
{
    padding-top: 30px;
    padding-left: 500px;
}

h2
{
    padding-left: 100px;
}
h3
{
    padding-left: 500px;
}
 .navigation 
 {
  margin: 0;
  padding: 0;
  list-style: none;
  background:#FFFFFF;
  display: flex;
  justify-content: flex-end;
  color: black;
}

.navigation a 
{
  display: block;
  padding: 1em;
  color:#ffffff;
  text-decoration: none;
  color: black;
  font-family: Arial, Helvetica, sans-serif;
}

.navigation a:hover 
{
  background:#e6e6e6;
  border-bottom-right-radius   : 10px;
  border-bottom-left-radius: 10px;
  border-top-left-radius: 10px;
  border-top-right-radius: 10px;
}

/* spreads navigation to "full-width", fills space around child items
@media all and (max-width: 800px) 
{
  .navigation 
  {
    justify-content: space-around;
  }
}

/* collapses navigation into a multi-row navigation on mobile screens
@media all and (max-width: 600px) 
{
  .navigation 
  {
    padding: 0;
    flex-direction: column;
  }
  
  .navigation a 
  {
    padding: 1em;
    text-align: center;
    border-top: 1px solid rgba(255, 255, 255, 0.2); 
    border-bottom: 1px solid rgba(0, 0, 0, 0.2); 
  }
    
  .navigation li:last-of-type a 
  {
    border-bottom: none;
  }
}




</style>

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
        
        <div id="banner">
                <img src="bannerTemp.gif"/>
            </div>
  
       <nav class="menu-1">
    <ul class="menu">
        <li> <a href="/CA3WebApp/HomePage.html">Home</a> </li>
        <li> <a href="/CA3WebApp/ViewAllProducts.jsp">Shop</a> </li>
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
  
        <div id="profilePicture">
        <img src="<%=m.getMemberImageUrl()%>" class="imageBorder" style="width: 350px; height: 300px;">
        </div>
        
        
        
        <h1> WELCOME <%= m.getFirstName().toUpperCase() %>! </h1>
        
        
        <h3> Personal Details </h3>
        <div id="profileDetails">
        <p> First Name : <%= "   " +m.getFirstName() %></p>
        <p> Last Name  : <%= "   " +m.getLastName() %>
        <p> Username   : <%= "   " +m.getUserName() %></p>
        <p> Email      : <%= "   " +m.getEmail() %></p>
        </div>
        
        <div id="profilePicButton">
        <form action = "EditMemberImageUrl.jsp" method = "post"> <p><input type = "submit"  value = "Change Profile Picture" /></p></form>
        </div>
        
        <br>
        <br>
        <hr>
        <br>
        <br>
        
        <h2>CHANGE YOUR PERSONAL DETAILS </h2>
        
        <div id="editButtons">
        <td><form action = "editFirstName.jsp" method = "post"> <p><input type = "submit" style="width:300px; height: 35px;" value = "Change First Name" /></p></form></td>
        
        <form action = "EditLastName.jsp" method = "post"> <p><input type = "submit" style="width:300px; height: 35px;" value = "Change Last Name" /></p></form>
        
        <form action = "EditUserName.jsp" method = "post"> <p><input type = "submit" style="width:300px; height: 35px;"  value = "Change Username" /></p></form>
        
        <form action = "EditPassword.jsp" method = "post"> <p><input type = "submit" style="width:300px; height: 35px;" value = "Change Password" /></p></form>
        
        <form action = "EditEmail.jsp" method = "post"> <p><input type = "submit" style="width:300px; height: 35px;"  value = "Change Email Address" /></p></form>
        </div>
        
        <br>
        <br>
        
        
        <div id ="otherButtons"> 
              
               
            <% 
               
            if(m.isAdmin())
            {
                %><td><form action = "AddProduct.jsp" method = "post"> <p><input type = "submit" name="action" value = "Add Product" /></p></form></td
                  <td><form action = "SelectProductToEdit.jsp" method = "post"> <p><input type = "submit" name="action" value = "Remove Product" /></p></form></td>
                  <td><form action = "SelectProductToEdit.jsp" method = "post"> <p><input type = "submit" name="action" value = "Edit Product" /></p></form></td>
                
                <%
            }
            
            %>               
        </div>
       
      <%  }
        %>
      </div> 
    </div>
     

    </body>
</html>
