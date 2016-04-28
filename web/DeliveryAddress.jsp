<%-- 
    Document   : DeliveryAddress
    Created on : Apr 28, 2016, 12:06:52 AM
    Author     : Ash
--%>

<%@page import="java.util.ResourceBundle"%>
<%@page import="java.util.Locale"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delivery Address</title>
        
 <%

            Locale userSetting = (Locale) session.getAttribute("locale");

            if (userSetting == null)
            {
                userSetting = request.getLocale();
            }

            ResourceBundle messages = ResourceBundle.getBundle("properties.text", userSetting);
%>     
    </head>
    <body>
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
    </body>
</html>
