<%-- 
    Document   : AccountNotFound
    Created on : Mar 9, 2016, 5:07:39 PM
    Author     : Ash
--%>

<%@page import="java.util.ResourceBundle"%>
<%@page import="java.util.Locale"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="images/flash3.png" type="image/gif" sizes="20x20">
         <link rel="stylesheet" type="text/css" href="mainCSS.css" >
        <title>Account Not Found</title>
<% 
   
        Locale userSetting = (Locale) session.getAttribute("locale");
       
        if(userSetting == null)
        {
            userSetting = request.getLocale();
        }
   
    ResourceBundle messages = ResourceBundle.getBundle("properties.text", userSetting);
%>        
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
               <p><td> <input name="searchName" size=30 type="text" />  
                 <input type="hidden" name="action" value="searchName" />
                 <input type="submit" value="<%=messages.getString("SearchBarButton")%>"/>
               </p>
        </form>
        </div>
        
    </ul>
           
           
</nav>
            
            
            <div id="pagecontent3">
 
                <div id="NotFoundTitle">
                    <h1><%=messages.getString("AccountNotFoundLabel")%></h1>
                </div>
                
                
                <div id="NotFoundBackButton">
                    <form action = "Login.jsp" method = "post">
                        <p> 
                           <input type = "submit" class="resizedButton" name = "Login" value = "<%=messages.getString("ReturnToLoginButton")%>"/>
                        </p>
                    </form>
                </div>
                
            </div>
    </body>
</html>
