<%-- 
    Document   : ViewPreviousOrders
    Created on : 15-Dec-2015, 19:42:31
    Author     : d00155224
--%>

<%@page import="java.util.Locale"%>
<%@page import="java.util.ResourceBundle"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="Dtos.Member"%>
<%@page import="Dtos.SalesReceipt"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="images/flash3.png" type="image/gif" sizes="20x20">
        <link rel="stylesheet" type="text/css" href="mainCSS.css" >
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
        <script type="text/javascript" src="js/autoCompleter.js"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">

        <title>Sales Orders</title>

        <%

            Locale userSetting = (Locale) session.getAttribute("locale");

            if (userSetting == null)
            {
                userSetting = request.getLocale();
            }

            ResourceBundle messages = ResourceBundle.getBundle("properties.text", userSetting);
        %> 

        <style>
            table, td, th {    
                border: 1px solid #ddd;
                text-align: left;
            }

            table {
                border-collapse: collapse;
                width: 90%;
                padding-top: 30px;
            }

            th, td {
                padding: 15px;
            }
        </style>
    </head>
    <body>

        <div id="container">

            <nav class = "topmenu">
                <ul class="navigation">

                    <%  Member m = (Member) session.getAttribute("member");

                        if (m == null)
                        {

                    %>

                    <li><a href="Login.jsp"><%=messages.getString("MenuButtonLogin")%></a></li>


                    <li><a href="Register.jsp"><%=messages.getString("MenuButtonRegister")%></a></li>
                </ul>
            </nav>  
            <%

            } else
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
                    <td> <input name="searchName" id="searchName" size=30 type="text" />  
                        <input type="hidden" name="action" value="searchName" />
                        <input type="submit" value="<%=messages.getString("SearchBarButton")%>"/>

                </form>
            </div>

        </ul>


    </nav> 


    <div id="pagecontent2">







        <%
            List<SalesReceipt> orders;
            orders = (List) (request.getSession().getAttribute("previousOrders"));

            DecimalFormat decFor = new DecimalFormat("####0.00");

            if (orders != null)
            {
        %>
        <table>
            <tr>
                <th><%=messages.getString("ReceiptIdLabel")%></th>
                <th><%=messages.getString("DateOrderedLabel")%></th>
                <th><%=messages.getString("TotalPriceLabel")%></th>
                <th><%=messages.getString("MemberIdLabel")%></th>
                <th><%=messages.getString("PaymentTypeLabel")%></th>
            </tr>


            <% for (SalesReceipt sr : orders)
                {
            %>
            <tr>
                <td><%=sr.getReceiptId()%></td>
                <td><%=sr.getDateOrdered()%></td>
                <td><%=messages.getString("CurrencySymbolLabel")%><%=decFor.format(sr.getTotalPrice())%></td>
                <td><%=sr.getMemberId()%></td>
                <td><%=sr.getPaymentType()%></td>
            </tr>




            <%
                }
            } else
            {
            %><h1><%=messages.getString("NoPreviousOrdersHeading")%></h1> <%
                               }
            %>

        </table>

    </div>


</body>
</html>
