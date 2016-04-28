<%-- 
    Document   : Cart.jsp
    Created on : 11-Dec-2015, 14:29:51
    Author     : d00155224
--%>

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
        <link rel="stylesheet" type="text/css" href="mainCSS.css" >
        <script src="js/jquery_1.js"></script>
        <script src="js/paginate.js"></script>
        <script src="js/custom.js"></script>
        <script type="text/javascript" src="js/modernizr-1.5.min.js"></script>
        <title>Cart</title>
    <style>
        table {
    border-collapse: collapse;
    width: 100%;
    margin-bottom:50px;
}

th, td {
    padding: 8px;
    text-align: left;
    border-bottom: 1px solid #ddd;
}
        </style>
        
  
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
                    <li><a href="MemberActionServlet?action=viewProfile">My Profile</a></li>
                    
            
       
      
          
         <%  Member m = (Member)session.getAttribute("member"); 
         
       // if(m == null)
        //{
            
         %>
        
         <li><a href="/CA3WebApp/Login.jsp"><%=messages.getString("MenuButtonLogin")%></a></li>
            
            
        <li><a href="/CA3WebApp/Login.jsp"><%=messages.getString("MenuButtonRegister")%></a></li>
        
        <%
        
       // }
       // else
        //{
      
            
        %>
            
           <li><a href="MemberActionServlet?action=logout"><%=messages.getString("MenuButtonLogout")%></a></li>
                      
   </ul>
     </nav> 
          <%// } %>

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
         <div id ="ShoppingCartTitle">
                        <h1> Shopping Cart </h1>
                    </div>
            <table>
    
<%
          
        List<Product> cart;
        cart = (List) (request.getSession().getAttribute("cart"));
                    
        double total = 0;
        
        DecimalFormat decFor = new DecimalFormat("####0.00"); 
        
        if (cart != null) 
        {
%>
        <tr>
    <th>Product</th>
    <th>Product Name</th>
    <th>Quantity in Stock</th>
    <th>Price</th>
    <th>       </th>
    <th> Remove</th>
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
                    

                
                    
                    <div class="ProductName2">
                        <td><p><%=prod.getProductName()%></p></td>
                    </div>
                    
                        <td><p><%=messages.getString("QuantityLabel")%>: <%=prod.getQuantityInStock()%></p></td>
                        <td> <p><%=messages.getString("PriceLabel")%>: <%=messages.getString("CurrencySymbolLabel")%><%=prod.getProductPrice()%></p></td>

                

                         <td><input type="hidden" name="action" value="RemoveProduct"</td>
                         <td><input type="hidden" name="qtyOrdered" value="<%=prod.getQuantityInStock()%>"</td>
                         <td><input type="hidden" name="productId" value="<%=prod.getProductId()%>"</td>
                         <td><input type="submit"  value="<%=messages.getString("RemoveItemFromCartLabel")%>" </td>

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
            
            
            
            
            
            
            
           
           
        
    
      <p id="formbuttons">
         <input type="button" name="prevb" id="prevb" class="resizedButton" value="<%=messages.getString("PreviousButton")%>" onclick="history.back()" />
      </p>
       
            
            </div>
        

      
        </div>    
        
    </body>
</html>

