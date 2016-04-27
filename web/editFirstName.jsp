<%-- 
    Document   : editFirstName
    Created on : 08-Dec-2015, 22:09:23
    Author     : Aisling
--%>
   <%@page import="Dtos.Member"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link rel="icon" href="images/flash3.png" type="image/gif" sizes="20x20">
            <title>Edit First Name</title>
            <link rel="stylesheet" type="text/css" href="mainCSS.css" >
   <% 
   
        Locale userSetting = (Locale) session.getAttribute("locale");
       
        if(userSetting == null)
        {
            userSetting = request.getLocale();
        }
   
    ResourceBundle messages = ResourceBundle.getBundle("properties.text", userSetting);
%>

    </head>
     </head>   
    <body>
   
          
    <div id="container">
            
        <nav class = "topmenu">
            <ul class="navigation">
 
         <%  Member m = (Member)session.getAttribute("member"); 
         
        if(m == null)
        {
            
         %>
        
         <li><a href="Login.jsp"><%=messages.getString("MenuButtonLogin")%></a></li>
           
            
        <li><a href="Register.jsp"><%=messages.getString("MenuButtonRegister")%></a></li>
       </ul>
     </nav>  
        <%
        
        }
        else
        {
      
            
        %>
           <li><a href="MemberActionServlet?action=viewProfile">My Profile</a></li> 
           <li><a href="MemberActionServlet?action=logout"><%=messages.getString("MenuButtonLogout")%></a></li>
                      
   </ul>
     </nav> 
        <%  
        }
        %>
            <div id="banner">
                <img src="tempBanner.jpg"/>
            </div>
  
       <nav class="menu-1">
    <ul class="menu">
        <li> <a href="/CA3WebApp/HomePage.jsp"><%=messages.getString("MenuHomeButton")%></a> </li>
        <li> <a href="MemberActionServlet?action=ViewAllProducts"><%=messages.getString("MenuShopButton")%></a> </li>
        <li> <a href="/CA3WebApp/About.jsp"><%=messages.getString("MenuAboutButton")%></a> </li>
        
        <li> <a href="MemberActionServlet?action=ViewPreviousOrders"><%=messages.getString("MenuViewOrdersButton")%></a> </li>
        
        <li> <a href="/CA3WebApp/ContactUs.jsp"><%=messages.getString("MenuContactUsButton")%></a> </li>
        <li> <a href="/CA3WebApp/Cart.jsp"><%=messages.getString("MenuCartButton")%></a> </li>
        <div id="searchbar">
        <form  action = "MemberActionServlet" method = "post" >
               <td> <input name="searchName" size=30 type="text" />  
                 <input type="hidden" name="action" value="searchName" />
                 <input type="submit" value="<%=messages.getString("SearchBarButton")%>"/>
               
        </form>
        </div>
        
    </ul>
           
           
</nav> 
      <div id="pagecontent3">
           
        <form action = "MemberActionServlet" method = "post">
            
            <div id="EditslabelPosition">   
            <label for="exampleInputEditFirstname"><%=messages.getString("NewFNameLabel")%>: <span style="color:red;">*</span></label>
            </div>
               
            <div id="EditsTextboxandButtonPosition">  
               <input name="editFirstName" class="resizedTextBox" size=15 />
               
               <input type="hidden" name="action" value="Edit First Name"/>
                 <input type="submit" class="resizedButton" name="submit" value="<%=messages.getString("EditFirstNameButton")%>"/>
                 
              
           
                 
            </div>
               
         </form>
       </div>
       
       
</html>

       
