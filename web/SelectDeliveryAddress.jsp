<%-- 
    Document   : selectDeliveryAddress
    Created on : Apr 28, 2016, 1:37:15 AM
    Author     : Ash
--%>

<%@page import="java.util.ResourceBundle"%>
<%@page import="java.util.Locale"%>
<%@page import="Dtos.Address"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Select Delivery Address</title>
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
        <%
                    List<Address> addresses;
                    addresses = (List) (request.getSession().getAttribute("addresses"));
                   
                    
                    if (addresses != null) 
                    { 
%>        
                
                <table>    
<%
                    for (Address add : addresses) 
                    {
%>
                
                    <form action="PaymentInformation.jsp" method="post">

        
         <div id="all">
             <div id="overall">
                      </div>
       
            
        <div id ="productDetails">
            <div class="ProductName">
            <p><%=add.getAddressLine1()%></p>
            </div>
                <p> <%=messages.getString("AddressLine1Label")%>: <%=add.getAddressLine1()%></p>
                <p><%=messages.getString("AddressLine2Label")%>: <%=add.getAddressLine2()%>
                <p> <%=messages.getString("CityLabel")%>: <%=add.getCity()%></p>
                <p> <%=messages.getString("CountryLabel")%>: <%=add.getCountry()%></p>
                
                
                
                <input type="hidden" name="addressId" value="<%=add.getAddressId()%>" />
                <p><input type="submit" value="<%=messages.getString("SelectAddressLabel")%>" /></p>
        </div>
                
         </div> 
                
  </form>
               
<%
                    }
                }
                       
%>
    </body>
</html>
