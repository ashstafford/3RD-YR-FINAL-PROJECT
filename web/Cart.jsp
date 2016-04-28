<%-- 
    Document   : Cart.jsp
    Created on : 11-Dec-2015, 14:29:51
    Author     : d00155224
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.ResourceBundle"%>
<%@page import="Dtos.Member"%>
<%@page import="java.util.List"%>
<%@page import="Dtos.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
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
        <title>Cart</title>
 <style>
        table {
    border-collapse: collapse;
    width: 100%;
    
}

th, td {
    padding: 8px;
    text-align: left;
    border-bottom: 1px solid #ddd;
}
        </style>
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

        <div id="container">  
            <nav class = "topmenu">
                <ul class="navigation">


                    <%  Member m = (Member) session.getAttribute("member");

                        if (m == null)
                        {

                    %>

                    <li><a href="/CA3WebApp/Login.jsp"><%=messages.getString("MenuButtonLogin")%></a></li>


                    <li><a href="/CA3WebApp/Login.jsp"><%=messages.getString("MenuButtonRegister")%></a></li>
                </ul>
            </nav>     
            <%

            } else
            {


            %>

            <li><a href="MemberActionServlet?action=logout"><%=messages.getString("MenuButtonLogout")%></a></li>
            <li><a href="MemberActionServlet?action=viewProfile">My Profile</a></li>          
        </ul>
    </nav> 
    <% }%>

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
                    <p><td> <input name="searchName" id ="searchName" size=30 type="text" />  
                        <input type="hidden" name="action" value="searchName" />
                        <input type="submit" value="<%=messages.getString("SearchBarButton")%>"/>
                        </p>
                </form>
            </div>

        </ul>


    </nav>

    <div id="pagecontent2"> 
        <div id ="ShoppingCartTitle">
                        <h1> Shopping Cart </h1>
                    </div>
            <table>
        <%

            List<Product> cart;

            String referer = request.getHeader("Referer");
            System.out.println("referer " + referer);

            if (referer.equals("http://localhost:8080/CA3WebApp/MemberActionServlet?action=ViewAllProducts"))
            {

                cart = (List) (request.getSession().getAttribute("cart"));
            } else if (referer.equals("http://localhost:8080/CA3WebApp/MemberActionServlet"))
            {
                cart = (List) (request.getSession().getAttribute("updatedCart"));
            } else
            {
                cart = (List) (request.getSession().getAttribute("updatedCart"));
            }

            double total = 0;

            DecimalFormat decFor = new DecimalFormat("####0.00");

            if (cart != null) 
        {
%>
        <tr>
    <th>Product</th>
    <th>Product Name</th>
    <th>Quantity</th>
    <th>Price</th>
    <th>       </th>
    <th> Update</th>
  </tr>
<%

           for (Product prod : cart) 
           {
                            
                         
%>
       
        
        
        <form action="MemberActionServlet" method="post"> 

                <div id="all2">
            
            <tr>
                <div id="productImage2">   
                    <td><img src="<%=prod.getProductImageUrl()%>" style="width: 200px; height: 150px;">  </td>
                    

                    <div id ="productDetails2">

                        <div class="ProductName2">
                            <td><p><%=prod.getProductName()%></p></td>
                        </div>

                            <td><p><input name="quantity" size=15 type = "number" min = "0" max = "100" value="<%=prod.getQuantityInStock()%>"</p></td>
                            <td> <p><%=messages.getString("CurrencySymbolLabel")%> <%=decFor.format(prod.getProductPrice())%></p></td>

                    </div>

                         <td><input type="hidden" name="action" value="updateQty"</td>
                         <td><input type="hidden" name="productId" value="<%=prod.getProductId()%>"</td>
                         <td><input type="submit" value="<%=messages.getString("UpdateLabel")%>" </td>

                </div>
           
                </tr>
                </div>
            </form>

        <div id="Total">
<%                     total = total + prod.getProductPrice() * prod.getQuantityInStock();
                     
           }
                    
%>                  
        <h2> <%=messages.getString("TotalLabel")%>: <%=messages.getString("CurrencySymbolLabel")%>  <%out.print(decFor.format(total));
        
        
        }
        else
        {
%>   
<div id="CartIsEmptyTitle">
<h1> <%=messages.getString("EmptyCartMessage")%> </h1> 
</div>
<%
        }        
%>
            </div>              
</table> 
        <div id ="EmptyCartButton">
            <form action="MemberActionServlet" method="post">
                <td><input type="hidden" name="action" value="EmptyCart"</td>
                <td><input type="submit" class="resizedButton" value="<%=messages.getString("EmptyCartLabel")%>"</td>
            </form>
        </div>

        <div id ="PurchaseItemButton">
            <form action="DeliveryAddress.jsp">  
                <td><input type="hidden" name="action" value="BuyItems" /></td>
                <td><input type="submit" class="resizedButton" value="<%=messages.getString("PurchaseItemsLabel")%>
                           " /></td>
            </form>
        </div>

     

        <p id="formbuttons">
            <input type="button" name="prevb" class="resizedButton" id="prevb" value="<%=messages.getString("PreviousButton")%>" onclick="history.back()" />
        </p>

</div>
    </div>





</body>
</html>

