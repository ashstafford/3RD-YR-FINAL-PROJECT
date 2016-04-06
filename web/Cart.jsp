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
        <script src="js/jquery_1.js"></script>
        <script src="js/paginate.js"></script>
        <script src="js/custom.js"></script>
        <script type="text/javascript" src="js/modernizr-1.5.min.js"></script>
        <title>JSP Page</title>
  
        <style>   
           
        </style>
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
        
         <li><a href="/Login.html/Login.jsp">Login</a></li>
            
            
        <li><a href="/Login.html/Login.jsp">Sign Up</a></li>
        
        <%
        
       // }
       // else
        //{
      
            
        %>
            
           <li><a href="MemberActionServlet?action=logout">Logout</a></li>
                      
   </ul>
     </nav> 
          <%// } %>

            <div id="banner">
                <img src="tempBanner.jpg"/>
            </div>
  
       <nav class="menu-1">
    <ul class="menu">
        <li> <a href="/Login.html/HomePage.jsp">Home</a> </li>
        <li> <a href="MemberActionServlet?action=ViewAllProducts">Shop</a> </li>
        <li> <a href="/Login.html/About.jsp">About</a> </li>
        
        <li> <a href="MemberActionServlet?action=ViewPreviousOrders">View Orders</a> </li>
        
        <li> <a href="/Login.html/ContactUs.jsp">Contact</a> </li>
        <li> <a href="/Login.html/Cart.jsp">Cart</a> </li>
        
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
                  
    <div id="side_bar">
        <form action = "MemberActionServlet" method = "post">
            
            <p>
                 <input type="hidden" name="action" value ="ViewAllProducts">
                 <input type="image" src="IMG_viewAllProductsLogo.jpg" alt="Submit" width="200px" height="70px"/>
                
            </p>
        </form>
        
        <form action = "MemberActionServlet" method = "post">
            
            <p>
                 <input type="hidden" name="action" value ="StarWars">
                 <input type="image" src="swLogo.png" alt="Submit" width="200px" height="70px"/>
                
            </p>
        </form>
        
         <form action = "MemberActionServlet" method = "post">
               <p> 
                   
                 <input type="hidden" name="action" value ="Marvel">
                 <input type="image" src="IMG_mLogo.jpeg" alt="Submit" width="200px" height="70px"/>
                 
               </p>
         </form>
        
         <form action = "MemberActionServlet" method = "post">
               <p> 
                 <input type="hidden" name="action" value ="DC">
                 <input type="image" src="IMG_dcLogo.jpg" alt="Submit" width="200px" height="70px"/>
              
               </p>
         </form>
        
         <form action = "MemberActionServlet" method = "post">
               <p> 
                   
                 <input type="hidden" name="action" value ="Disney">
                 <input type="image" src="IMG_dLogo.jpg" alt="Submit" width="200px" height="70px"/>
               
               </p>
         </form>
        
        <form action = "MemberActionServlet" method = "post">
               <p> 
                   
                 <input type="hidden" name="action" value ="The Walking Dead">
                 <input type="image" src="IMG_twdLogo.jpg" alt="Submit" width="200px" height="70px"/>
                  
               </p>
         </form>
        
        <form action = "MemberActionServlet" method = "post">
               <p> 
                 <input type="hidden" name="action" value ="Doctor Who">
                 <input type="image" src="IMG_dwLogo.jpg" alt="Submit" width="200px" height="70px"/>
                  
               </p>
         </form>
        
        <form action = "MemberActionServlet" method = "post">
               <p> 
                  <input type="hidden" name="action" value ="Game Of Thrones">
                  <input type="image" src="IMG_gotLogo.jpg" alt="Submit" width="200px" height="70px"/> 
             
               </p>
         </form>
        
        <form action = "MemberActionServlet" method = "post">
               <p> 
                  <input type="hidden" name="action" value ="Harry Potter">
                  <input type="image" src="images/HarryPotterlogo.jpg" alt="Submit" width="200px" height="70px"/> 
             
               </p>
         </form>
        
        <form action = "MemberActionServlet" method = "post">
               <p> 
                  <input type="hidden" name="action" value ="Hunger Games">
                  <input type="image" src="images/HungerGameslogo.jpg" alt="Submit" width="200px" height="70px"/> 
             
               </p>
         </form>
        
    </div>
        
      
        
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
               
               <div id="all2">
             <div id="overall2">
             </div>
        <div id="productImage2">   
       <img src="<%=prod.getProductImageUrl()%>" style="width: 280px; height: 230px;">     
        </div>   
            
        <div id ="productDetails2">
            <div class="ProductName2">
            <p><%=prod.getProductName()%></p>
            </div>
                <p>Quantity in stock: <%=prod.getQuantityInStock()%></p>
                <p>Price: €<%=prod.getProductPrice()%></p>
                
        </div>
                
          
            <!--<tr>
                <td><img src="<%=prod.getProductImageUrl()%>" style="width: 300px; height: 300px;"></td>
                <td><%=prod.getProductName()%></td>
                <td><% out.println("\t\t"); %><td>
                <td><p>Price: €<%=prod.getProductPrice()%></p></td>
                <td><p>Quantity: <%= prod.getQuantityInStock()%></p></td>
            </tr>-->
            
           
                
                <td><input type="hidden" name="action" value="RemoveProduct"</td>
                <td><input type="submit" value="Remove" </td>
                
         </div>
        
           </form>   
            
            <div id ="Total">
            
            <%         total = total + prod.getProductPrice() * prod.getQuantityInStock();
                     
                    }
                    
                        %> <h2> Total: <%  out.print(total);
                }
                else
                {
                    %><h1> There are Currently No items in the cart!</h1> <%
                }        
            %>
           
            </div>
            
            <div id ="EmptyCartButton">
                <form action="MemberActionServlet" method="post">
                    <td><input type="hidden" name="action" value="EmptyCart"</td>
                    <td><input type="submit" value="Empty Cart"</td>
                </form>
            </div>
            
            <div id ="PurchaseItemButton">
                <form action="PaymentInformation.jsp">  
                    <td><input type="hidden" name="action" value="BuyItems" /></td>
                    <td><input type="submit" value="Purchase Items" /></td
                </form>
            </div>
            
            
            
           
           
        </table>
    
      <p id="formbuttons">
         			<input type="button" name="prevb" id="prevb" value="Previous" onclick="history.back()" />
                        </p>
       
            
            </div>
        

      
            
        
    </body>
</html>

