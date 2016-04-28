<%-- 
    Document   : DeliveryAddress
    Created on : Apr 28, 2016, 12:06:52 AM
    Author     : Ash
--%>

<%@page import="Dtos.Member"%>
<%@page import="java.util.ResourceBundle"%>
<%@page import="java.util.Locale"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="icon" href="images/flash3.png" type="image/gif" sizes="20x20">
         <link rel="stylesheet" type="text/css" href="mainCSS.css" >
         <script src="js/jquery_1.js"></script>
        <script src="js/paginate.js"></script>
        <script src="js/custom.js"></script>
        <script type="text/javascript" src="js/modernizr-1.5.min.js"></script>
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
        <script type="text/javascript" src="js/autoCompleter.js"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
        
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
               <td> <input name="searchName" size=30 id="searchName" type="text" />  
                 <input type="hidden" name="action" value="searchName" />
                 <input type="submit" value="<%=messages.getString("SearchBarButton")%>"/>
               
        </form>
        </div>
        
    </ul>
           
           
</nav>
                 <div id ="pagecontent2">
                     <div id="addProductMain">
            <div id="addProductTitle">
                <h1>Enter Delivery Address</h1>
            </div>
                     
        <form action="MemberActionServlet" method="post">
        
                    
                    
                    <div id ="AddProduct">
                        <table>
                            <tr>
                                <label for="exampleInputPassword" style="font-size:20px;"><%=messages.getString("AddressLine1Label")%>: </label> 
                            </tr>
                            <tr>
                                <td><input name="Line1" class="resizedTextBox" style="border:0.5px solid black;" size="35" type="text" /> </td>
                            </tr>
                        </table>
                      
                    </div>
                    
                    <div id ="AddProduct">
                        <table>
                            <tr>
                                <label for="exampleInputPassword" style="font-size:20px;"><%=messages.getString("AddressLine2Label")%>: </label> 
                            </tr>
                            <tr>
                                <td><input name="Line2" class="resizedTextBox" style="border:0.5px solid black;" size="35"/> </td>
                            </tr>
                        </table>
                    </div>
                    
                    <div id ="AddProduct">
                        <table>
                            <tr>
                                <label for="exampleInputPassword" style="font-size:20px;"><%=messages.getString("CityLabel")%>: </label> 
                            </tr>
                            <tr>
                                <td><input name="City" class="resizedTextBox" style="border:0.5px solid black;" size="35"/> </td>
                            </tr>
                        </table>
                    </div>
                    
                    <div id="AddProduct">
                        <table>
                            <tr>
                                <label for="exampleInputPassword" style="font-size:20px;"><%=messages.getString("CountryLabel")%>: </label> 
                            </tr>
                            <tr>
                                <td><input name="Country" class="resizedTextBox" style="border:0.5px solid black;" size="35" type="text"/> </td>
                            </tr>
                        </table>
                    </div>
                    
                    
               
                <div id="AddProductButton">
                    <input type="hidden" name="action" value="AddAddress"/>
                    <input type="submit" class="resizedButton"  value="<%=messages.getString("AddAddressLabel")%>"  />
                </div>
        </form>
                
        <form action="MemberActionServlet" method="post">
        
                <div id="AddProductButton">
                    <p><%=messages.getString("FindAddressHeading")%> 
                    <input type="hidden" name="action" value="FindAddress"/>
                    <input type="submit" class="resizedButton"  value="<%=messages.getString("FindAddressLabel")%>"  />
                </div>
        </form>
        </div>
        </div>
    </body>
</html>
