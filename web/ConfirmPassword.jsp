<%-- 
    Document   : ConfirmPassword
    Created on : Apr 24, 2016, 12:46:15 PM
    Author     : Ash
--%>

<%@page import="java.util.Locale"%>
<%@page import="java.util.ResourceBundle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link rel="stylesheet" type="text/css" href="mainCSS.css" >
        <title>Confirm Password</title>
                  
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

        
      <form action = "MemberActionServlet" method = "post"> 
            
        <div id="EditslabelPosition">
          <label for="exampleInputEditFirstname"><%=messages.getString("EnterPasswordLabel")%>: <span style="color:red;">*</span></label>   
        </div>
        <div id="EditsTextboxandButtonPosition">  
          <input name="currentPassword" class="resizedTextBox"  placeholder="MUST be at least 8 characters " type="password" size=15 />
        </div>
        
        
         <input type = "hidden" name="action" value = "Confirm Password"/>
         <input type = "submit" style="width:300px; height: 35px;" value="<%=messages.getString("NextButtonLabel")%>" />
      
      </form> 
    </body>
</html>
