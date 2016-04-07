<%-- 
    Document   : Cart.jsp
    Created on : 11-Dec-2015, 14:29:51
    Author     : d00155224
--%>

<%@page import="java.util.List"%>
<%@page import="Dtos.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
        
<script>
    function goBack()
    {             


        window.history.back();
    }
</script>

<style>
body 
  {
   
        background:  url("IMG_cartBackground.jpg") no-repeat center center fixed; 
        -webkit-background-size: cover;
        -moz-background-size: cover;
        -o-background-size: cover;
        background-size: cover;
    }      
    
    ul {
    position: relative;
    list-style-type: none;
    margin: 10px;
    padding: 0;
    overflow: hidden;	
    left:10%;
	
	
}


.topmenu li

{
	float :left;
        position: relative;
	padding: 0;
	width: 200px;
	line-height: 250%;
	z-index: 1000;
	
}



a:link, a:visited {
    display: block;
    width: 200px;
    font-weight: bold;
    color: #FFFFFF;
    background-color:#000000;
    text-align: center;
    padding: 4px;
    text-decoration: none;
    text-transform: uppercase;
}

a:hover, a:active {
    background-color:#666666
	
}

div#pagecontent
{
    
  min-height: 1500px;
  padding: 50px;
  left: 20%;
  bottom: 50%;
  font-family: serif;
 
}

div#container
{
  position     : relative;
  width        : 85%;
  margin-left  : auto;
  margin-right : auto;
}
    </style>

    </head>
    <body>
        
     
          <nav class = "topmenu">
 <ul>
      
	<li><a href="MemberActionServlet?action=ViewAllProducts">Shop</a>
	<li><a href="/CA3WebApp/Cart.jsp">Cart</a>
	<li><a href="/CA3WebApp/Login.jsp">Login/Register</a>
        <li><a href="MemberActionServlet?action=viewProfile">My Profile</a> 
        <li><a href="MemberActionServlet?action=ViewPreviousOrders">View Orders</a>       
        <li><a href="MemberActionServlet?action=logout">Logout</a></li>
</ul>
  </nav>
        
      
             
      <%
          
                    List<Product> cart;
                    cart = (List) (request.getSession().getAttribute("cart"));
                    
                    double total = 0;
                    
                    if (cart != null) 
                    {

                        for (Product prod : cart) 
                        {
                            
                         
                %>
             
           <form action="MemberActionServlet" method="post">  
            <tr>
                <td><img src="<%=prod.getProductImageUrl()%>" style="width: 300px; height: 300px;"></td>
                <td><%=prod.getProductName()%></td>
                <td><% out.println("\t\t"); %><td>
                <td><p>Price: €<%=prod.getProductPrice()%></p></td>
                <td><p>Quantity: <%= prod.getQuantityInStock()%></p></td>
            </tr>
            
           
                
                <td><input type="hidden" name="action" value="RemoveProductFromCart"</td>
                <input type="hidden" name="removeFromCart" value="<%= prod.getProductId()%>"/>
                <td><input type="submit" value="Remove Product"</td>
        
           </form>   
                
            
            <%         total = total + prod.getProductPrice() * prod.getQuantityInStock();
                     
                    }
                    
                        %> <h2> Total: <%  out.print(total);
                }
                else
                {
                    %><h1> There are currently no items in the cart!</h1> <%
                }        
            %>
           
            <form action="MemberActionServlet" method="post">
                <td><input type="hidden" name="action" value="EmptyCart"</td>
                <td><input type="submit" value="Empty Cart"</td>
            </form>
            
            <form action="PaymentInformation.jsp">
                
              <td><input type="hidden" name="action" value="BuyItems" /></td>
               
              <td><input type="submit" value="Purchase Items" /></td
           
            </form>
            
            
            
           <button onclick="goBack()">Go Back</button>
           
        </table>
    
      
    
    </body>
</html>
