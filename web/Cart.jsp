<%-- 
    Document   : Cart.jsp
    Created on : 11-Dec-2015, 14:29:51
    Author     : d00155224
--%>

<%@page import="Dtos.Member"%>
<%@page import="java.util.List"%>
<%@page import="Dtos.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="mainCSS.css" >
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
    <body>
        
     
         <div id="container">
            
        <nav class = "topmenu">
            <ul class="navigation">
                    <li><a href="MemberActionServlet?action=viewProfile">My Profile</a></li>
                    
            
       
      
          
         <%  Member m = (Member)session.getAttribute("member"); 
         
        if(m == null)
        {
            
         %>
        
         <li><a href="/CA3WebApp/Login.jsp">Login</a></li>
           
        <li><a href="/CA3WebApp/Login.jsp">Sign Up</a></li>
        
        <%
        
        }
        else
        {
      
            
        %>
            
           <li><a href="MemberActionServlet?action=logout">Logout</a></li>
                      
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
        <li> <a href="/CA3WebApp/HomePage.jsp">Home</a> </li>
        <li> <a href="MemberActionServlet?action=ViewAllProducts">Shop</a> </li>
        <li> <a href="/CA3WebApp/About.jsp">About</a> </li>
        
        <li> <a href="MemberActionServlet?action=ViewPreviousOrders">View Orders</a> </li>
        
        <li> <a href="/CA3WebApp/ContactUs.jsp">Contact</a> </li>
        <li> <a href="/CA3WebApp/Cart.jsp">Cart</a> </li>
        
        <div id="searchbar">
        <form  action = "MemberActionServlet" method = "post" >
               <p><td> <input name="searchName" size=30 type="text" />  
                 <input type="hidden" name="action" value="searchName" />
                 <input type="submit" value="Search"/>
               </p>
        </form>
        </div>
        
    </ul>
           
           
</nav> 
            
            <div id="pagecontent2">
 
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
                   
                    <img src="<%=prod.getProductImageUrl()%>" style="width: 300px; height: 250px;">     
                
                
                <div id ="productDetails">
                <td><%=prod.getProductName()%></td>
                <td><% out.println("\t\t"); %><td>
                <td><p>Price: €<%=prod.getProductPrice()%></p></td>
                <td><p>Quantity: <%= prod.getQuantityInStock()%></p></td>
                </div>
            </tr>
            
            
        
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
    
      </div>
    
    </body>
</html>
