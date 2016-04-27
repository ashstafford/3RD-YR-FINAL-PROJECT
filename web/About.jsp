<%-- 
    Document   : About
    Created on : 18-Feb-2016, 10:47:07
    Author     : D00154410
--%>

<%@page import="java.util.Locale"%>
<%@page import="java.util.ResourceBundle"%>
<%@page import="Dtos.Member"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="mainCSS.css" >
        <title>About Page</title>
        
          
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

         <%  Member m = (Member)session.getAttribute("member"); 
         
        if(m == null)
        {
            
         %>
        
         <li><a href="/CA3WebApp/Login.jsp"><%=messages.getString("MenuButtonLogin")%></a></li>
            
            
        <li><a href="/CA3WebApp/Login.jsp"><%=messages.getString("MenuButtonRegister")%></a></li>
        </ul>
     </nav>
        <%
        
        }
        else
        {
      
            
        %>
            
           <li><a href="MemberActionServlet?action=viewProfile"><%=messages.getString("MenuButtonMyProfile")%></a></li>
           <li><a href="MemberActionServlet?action=logout"><%=messages.getString("MenuButtonLogout")%></a></li>
                      
   </ul>
     </nav> 
          <% } %>

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
           
          <div id ="AboutHeading">
              <h1> <%=messages.getString("AboutUsLabel")%> </h1>
              <h3><%=messages.getString("AboutUsLabel")%> </h3>
          </div>
          
          <br>
         
          
          <div id="AboutUsInfo">
              <td><p><%=messages.getString("AboutUsInfo1")%> </p></td>
              <br>
              <td><p><%=messages.getString("AboutUsInfo2")%> </p></td>
              <br>
              <td><p><%=messages.getString("AboutUsInfo3")%> </p></td>
              <br>
              <td><p><%=messages.getString("AboutUsInfo4")%> </p></td>
          </div>
       </div>
    </body>
</html>
