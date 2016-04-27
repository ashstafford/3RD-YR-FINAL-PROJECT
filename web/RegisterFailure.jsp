<%-- 
    Document   : RegisterFailure
    Created on : 08-Dec-2015, 12:23:58
    Author     : Aisling
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
            
        <nav class = "topmenu">
            <ul class="navigation">
                  
          
         <li><a href="/CA3WebApp/Login.jsp"><%=messages.getString("MenuButtonLogin")%></a></li>
            
            
        <li><a href="/CA3WebApp/Login.jsp"><%=messages.getString("MenuButtonRegister")%></a></li>
         
                      
   </ul>
     </nav> 
        
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
            <div id="pagecontent2">
                
                <div id="RegisterFailed">    
                    <h1>Register Failed</h1>

                    <form action = "Register.jsp" method = "post">


                           <p> 
                              <input type = "submit"  name = "Register" class="resizedButton" value = "Return to Register" />
                           </p>
                   </form>
        
                <form action = "Login.jsp" method = "post">


                        <p> 
                           <input type = "submit"  name = "Login" class="resizedButton" value = "Return to Login"/>
                        </p>
                </form>
        
      </div>
           
            </div>
        
        
        
      
    </body>
       </html>
