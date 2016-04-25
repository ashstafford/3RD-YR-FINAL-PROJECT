<%-- 
    Document   : myProfile.jsp
    Created on : 08-Dec-2015, 20:45:55
    Author     : Aisling
--%>

<%@page import="java.util.ResourceBundle"%>
<%@page import="java.util.Locale"%>
<%@page import="Dtos.Member"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Profile</title>
        <link rel="stylesheet" type="text/css" href="mainCSS.css" >
        
<% 
   
        Locale userSetting = (Locale) session.getAttribute("locale");
       
        if(userSetting == null)
        {
            userSetting = request.getLocale();
        }
   
    ResourceBundle messages = ResourceBundle.getBundle("properties.text", userSetting);
%>     
            <style>
    
div#adminChanges 
{
    padding-left: 50px;
    color: black;
    font-family: Arial, Helvetica, sans-serif;
}
                
    
div#otherButtons
{
     left: 69%;
     color:#FFFFFF;
     padding-top: 10px;
     padding-left:800px;
     font-family: Arial, Helvetica, sans-serif;
     font-weight: bold;
}                
div#editButtons
{
     padding-left: 100px;
     padding-top: 30px;
     float:left;
     clear:left;
     font-family: Arial, Helvetica, sans-serif;
     font-weight: bold;
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
    font-family: Arial, Helvetica, sans-serif;
    
}

.imageBorder
{
    border-width: 1px;
    border-color: Black;
}

div#profilePicButton
{
    padding-left: 500px;
    padding-top: 18px;
    font-family: Arial, Helvetica, sans-serif;
    font-weight: bold;
    
}

div#welcomeTitle h1
{
    padding-top: 30px;
    padding-left: 500px;
    font-family: Arial, Helvetica, sans-serif;
}

div#changePersonal h2
{
    padding-left: 70px;
    padding-top:50px;
    float :left;
    clear: left;
    font-family: Arial, Helvetica, sans-serif;
}
div#personalDetailsTitle h3
{
    padding-left: 500px;
    font-family: Arial, Helvetica, sans-serif;
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
                    <li><a href="MemberActionServlet?action=viewProfile"><%=messages.getString("MenuButtonMyProfile")%></a></li>
                    
            
       
      
          
         <%  Member m = (Member)session.getAttribute("member"); 
         
        if(m == null)
        {
            
         %>
        
         <li><a href="/CA3WebApp/Login.jsp"><%=messages.getString("MenuButtonLogin")%></a></li>

            
        <li><a href="/CA3WebApp/Login.jsp"><%=messages.getString("MenuButtonRegister")%></a></li>
        <meta http-equiv="refresh" 
        content="0; url=Login.jsp">
        <%
        
        }
        else
        {
      
            
        %>
            
           <li><a href="MemberActionServlet?action=logout"><%=messages.getString("MenuButtonLogout")%></a></li>
                      
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
               <p><td> <input name="searchName" size=30 type="text" />  
                 <input type="hidden" name="action" value="searchName" />
                 <input type="submit" value="<%=messages.getString("SearchBarButton")%>"/>
               </p>
        </form>
        </div>
        
    </ul>
           
           
</nav>
        
 
            <div id="pagecontent2">              
                
        <div id="profilePicture">
        <img src="<%=m.getMemberImageUrl()%>" class="imageBorder" style="width: 350px; height: 300px;">
<!--        <img src="http://example.com/getImage?imageId=1234">-->
        </div>
        
        
        <div id="welcomeTitle">
        <h1> <%=messages.getString("WelcomeTitle")%> <%= m.getFirstName().toUpperCase() %>! </h1>
        </div>
        
        <div id="personalDetailsTitle">
        <h3> <%=messages.getString("PersonalDetailsTitle")%> </h3>
        </div>
        
        <div id="profileDetails">
        <p> <%=messages.getString("FirstNameLabel")%> : <%= "   " +m.getFirstName() %></p>
        <p> <%=messages.getString("LastNameLabel")%>  : <%= "   " +m.getLastName() %>
        <p> <%=messages.getString("UsernameLabel")%>   : <%= "   " +m.getUserName() %></p>
        <p> <%=messages.getString("EmailAddressLabel")%>      : <%= "   " +m.getEmail() %></p>
        </div>
        
        <div id="profilePicButton">
        <form action = "EditMemberImageUrl.jsp" method = "post"> <p><input type = "submit" style="width:300px; height: 35px;"  value = "<%=messages.getString("ChangeProfilePictureButton")%>" /></p></form>
        </div>
        
        <br>
        <br>
        <hr>
        <br>
        <br>
        
        
        <div id="changePersonal">
        <h2><%=messages.getString("PersonalDetailsHeading")%></h2>
        </div>
        
        <div id="editButtons">
        <td><form action = "editFirstName.jsp" method = "post"> <p><input type = "submit" style="width:300px; height: 35px;" value = "<%=messages.getString("EditFirstNameButton")%>" /></p></form></td>
        
        <form action = "EditLastName.jsp" method = "post"> <p><input type = "submit" style="width:300px; height: 35px;" value = "<%=messages.getString("EditLastNameButton")%>" /></p></form>
        
        <form action = "EditUserName.jsp" method = "post"> <p><input type = "submit" style="width:300px; height: 35px;"  value = "<%=messages.getString("EditUsernameButton")%>" /></p></form>
        
        <form action = "ConfirmPassword.jsp" method = "post"><p><input type = "submit" style="width:300px; height: 35px;" value = "<%=messages.getString("EditPasswordButton")%>" /></p></form>

        <form action = "EditEmail.jsp" method = "post"> <p><input type = "submit" style="width:300px; height: 35px;"  value = "<%=messages.getString("EditEmailAddressButton")%>" /></p></form>
        </div>
        
        <br>
        <br>
        
        
        
        <div id ="otherButtons"> 
            
              <div id="adminChanges">
                        <h2>ADMIN CHANGES</h2>
                    </div> 
            <% 
               
            if(m.isAdmin())
            {
                %>
                 
                     
                
                  <td><form action = "AddProduct.jsp" method = "post"> <p><input type = "submit" style="width:300px; height: 35px;" name="action" value = "<%=messages.getString("AddProductButton")%>" /></p></form></td
                  <td><form action = "SelectProductToEdit.jsp" method = "post"> <p><input type = "submit" style="width:300px; height: 35px;" name="action" value = "<%=messages.getString("RemoveProductButton")%>" /></p></form></td>
                  <td><form action = "SelectProductToEdit.jsp" method = "post"> <p><input type = "submit" style="width:300px; height: 35px;" name="action" value = "<%=messages.getString("EditProductButton")%>" /></p></form></td>
                  <td><form action = "MemberActionServlet" method = "post"> <p><input type = "hidden" name="action" value = "ViewAllMembers"/><input type = "submit" style="width:300px; height: 35px;" value="<%=messages.getString("AddAdminButton")%>"/></p></form></td>
                  <td><form action = "MemberActionServlet" method = "post"> <p><input type = "hidden" name="action" value = "ViewAllMembers"/><input type = "submit" style="width:300px; height: 35px;" value="<%=messages.getString("RemoveMemberButton")%>"/></p></form></td>
                   <td><form action = "MemberActionServlet" method = "post"> <p><input type = "hidden" name="action" value = "ViewAdminChanges"/><input type = "submit" style="width:300px; height: 35px;" value="<%=messages.getString("ViewAdminLogButton")%>"/></p></form></td>
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
