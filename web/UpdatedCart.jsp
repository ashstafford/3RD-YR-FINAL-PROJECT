<%-- 
    Document   : UpdatedCart
    Created on : Mar 22, 2016, 6:05:54 PM
    Author     : Ash
--%>

<%@page import="java.util.List"%>
<%@page import="Dtos.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

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
</style>

    </head>
    
        
     
          <nav class = "topmenu">
 <ul>
      
	<li><a href="/CA3WebApp/CategorySelection.html">Shop</a>
	<li><a href="/CA3WebApp/Cart.jsp">Cart</a>
	<li><a href="/CA3WebApp/Login.html">Login/Register</a>
        <li><a href="MemberActionServlet?action=viewProfile">My Profile</a> 
        <li><a href="MemberActionServlet?action=ViewPreviousOrders">View Orders</a>       
        <li><a href="MemberActionServlet?action=logout">Logout</a></li>
</ul>
  </nav>
        
      
             
      <%
          
                    List<Product> cart;
                    cart = (List) (request.getSession().getAttribute("updatedCart"));
                    
                    double total = 0;
                    
                    if (cart != null) 
                    {

                        for (Product prod : cart) 
                        {
                            
             // out.println("updated cart");               
                %>
             
           <form action="MemberActionServlet" method="post">  
            <tr>
                <td><img src="<%=prod.getProductImageUrl()%>" style="width: 300px; height: 300px;"></td>
                <td><%=prod.getProductName()%></td>
                <td><% out.println("\t\t"); %><td>
                <td><p>Price: €<%=prod.getProductPrice()%></p></td>
                <td><p>Quantity: <%=prod.getQuantityInStock()%></p></td>
            </tr>
            
           
                
                <td><input type="hidden" name="action" value="RemoveProductFromCart"</td>
                <td><input type="hidden" name="removeFromCart" value="<%=prod.getProductId()%>"</td>
                <td><input type="hidden" name="qtyOrdered" value="<%=prod.getQuantityInStock()%>"</td>
                <td><input type="submit" value="Remove Product"</td>
        
           </form>   
                
            
                <%   
                    
            
           
                    total = total + prod.getProductPrice() * prod.getQuantityInStock();
                     
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
    
      
    
    

