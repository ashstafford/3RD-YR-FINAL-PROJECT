<%-- 
    Document   : ViewAdminLogs
    Created on : 25-Apr-2016, 15:54:35
    Author     : d00155224
--%>

<%@page import="Dtos.Member"%>
<%@page import="java.util.ResourceBundle"%>
<%@page import="java.util.Locale"%>
<%@page import="Dtos.AdminLog"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="images/flash3.png" type="image/gif" sizes="20x20">
        <link rel="stylesheet" type="text/css" href="mainCSS.css" >
        <title>Admin Log</title>
        <% 
    // Get the request parameter
    Locale userSetting = null;
    
    String language = request.getParameter("lang");
    
    
    if(language != null)
    {
        userSetting = new Locale(language);
        session.setAttribute("locale", userSetting);
    }
    else
    {
        userSetting = (Locale) session.getAttribute("locale");
        if(userSetting == null)
        {
            userSetting = request.getLocale();
        }
    }
   
    ResourceBundle messages = ResourceBundle.getBundle("properties.text", userSetting);
%>
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
        <form action="HomePage.jsp">
        <li><select name ="lang" onchange="submit()">
            <option name="Default">Language...</option>
            <option value="en">English</option>
            <option value ="ru">Russian</option>
            <option value="fr">French</option>
            
        </select>
        </form></li>
        
        <div id="searchbar">
        <form  action = "MemberActionServlet" method = "post" >
               <td> <input name="searchName" size=30 type="text" />  
                 <input type="hidden" name="action" value="searchName" />
                 <input type="submit" value="<%=messages.getString("SearchBarButton")%>"/>
               </td>
        </form>
        </div>
        
    </ul>
           
           
</nav>
            
            
            <div id="pagecontent2">
       <%
                    List<AdminLog> logs;
                    logs = (List) (request.getSession().getAttribute("adminLogs"));
                    
                
                    
                    if (logs != null) 
                    { 
                %>        
 <div id="AdminLigTitle">
                        <h1>Admin Log</h1>
                    </div>
<%
                    for (AdminLog adLog : logs) 
                    {
%>
                
                    

                   <div id ="AdminLogTitles">
                       <label for="change"> Changes Made To :</label> <%=adLog.getDetails()%>
                   </div>
                   
                   <div id ="AdminLogTitles">
                   <label for="changeMade">Change Made :</label> <%=adLog.getMessage()%>
                   </div>
                  
                   
                   <div id ="AdminLogTitles">
                   <label for="change">Time :</label> <%=adLog.getMessageTime()%>
                   </div>
                   
                   

        
               
            <%
                    }
                }
                       
%>
            </div>
    </body>
</html>
