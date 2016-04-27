<%-- 
    Document   : AddProduct
    Created on : Feb 24, 2016, 11:08:16 PM
    Author     : Ash
--%>

<%@page import="java.util.ResourceBundle"%>
<%@page import="java.util.Locale"%>
<%@page import="Dtos.Member"%>
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
 
        <div id="addProductMain"> 
            <div id="addProductTitle">
                <h1><%=messages.getString("AddProductTitle")%></h1>
            </div>
     
    <form action="MemberActionServlet" method="post">
        
                    
                    
                    <div id ="AddProduct">
                        <table>
                            <tr>
                                <label for="exampleInputPassword" style="font-size:20px;"><%=messages.getString("ProductNameTitle")%>: </label> 
                            </tr>
                            <tr>
                                <td><input name="productName" class="resizedTextBox" style="border:0.5px solid black;" size="35" type="text" /> </td>
                            </tr>
                        </table>
                      
                    </div>
                    
                    <div id ="AddProduct">
                        <table>
                            <tr>
                                <label for="exampleInputPassword" style="font-size:20px;"><%=messages.getString("PriceLabel")%>: </label> 
                            </tr>
                            <tr>
                                <td><input name="productPrice" class="resizedTextBox" style="border:0.5px solid black;" size="35"/> </td>
                            </tr>
                        </table>
                    </div>
                    
                    <div id ="AddProduct">
                        <table>
                            <tr>
                                <label for="exampleInputPassword" style="font-size:20px;"><%=messages.getString("QtyInStockLabel")%>: </label> 
                            </tr>
                            <tr>
                                <td><input name="productQuantityInStock" class="resizedTextBox" style="border:0.5px solid black;" size="35"/> </td>
                            </tr>
                        </table>
                    </div>
                    
                    <div id="AddProduct">
                        <table>
                            <tr>
                                <label for="exampleInputPassword" style="font-size:20px;"><%=messages.getString("CategoryLabel")%>: </label> 
                            </tr>
                            <tr>
                                <td><input name="category" class="resizedTextBox" style="border:0.5px solid black;" size="35" type="text"/> </td>
                            </tr>
                        </table>
                    </div>
                    
                    <div id="AddProduct">
                        <table>
                            <tr>
                                <label for="exampleInputPassword" style="font-size:20px;"><%=messages.getString("ProductImageLabel")%>: </label> 
                            </tr>
                            <tr>
                                <td><input name="productImageUrl" class="resizedTextBox" style="border:0.5px solid black;" size="35" type="url"/> </td>
                            </tr>
                        </table>
                    </div>
                    
               
                <div id="AddProductButton">
                    <input type="hidden" name="action" value="AddProduct"/>
                    <input type="submit" class="resizedButton"  value="<%=messages.getString("AddProductLabel")%>"  />
                </div>
      </form>
        
    </div>
           <%// } 
                 %>
                 
                
            </div>
    </body>
</html>
