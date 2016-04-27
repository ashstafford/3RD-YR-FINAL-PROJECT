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
       
         <%  Member m = (Member)session.getAttribute("member"); 
         
        if(m == null)
        {
            
         %>
        
         <li><a href="/CA3WebApp/Login.jsp"><%=messages.getString("MenuButtonLogin")%></a></li>
            
            
        <li><a href="/CA3WebApp/Login.jsp"><%=messages.getString("MenuButtonRegister")%></a></li>
    </ul>
   </nav>   
        <%
        
        }
        else
        {
      
            
        %>
            
           <li><a href="MemberActionServlet?action=logout"><%=messages.getString("MenuButtonLogout")%></a></li>
           <li><a href="MemberActionServlet?action=viewProfile">My Profile</a></li>           
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
               <p><td> <input name="searchName" id="searchName" size=30 type="text" />  
                 <input type="hidden" name="action" value="searchName" />
                 <input type="submit" value="<%=messages.getString("SearchBarButton")%>"/>
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
        
        String referer = request.getHeader("Referer");
        System.out.println("referer " + referer );
        
        if(referer.equals("http://localhost:8080/CA3WebApp/MemberActionServlet?action=ViewAllProducts"))
        {
          
          cart = (List) (request.getSession().getAttribute("cart"));
        }
        else if(referer.equals("http://localhost:8080/CA3WebApp/MemberActionServlet"))
        {
          cart = (List) (request.getSession().getAttribute("updatedCart"));
        }    
        else
        {    
           cart = (List) (request.getSession().getAttribute("updatedCart"));
        }
        
        double total = 0;
        
        DecimalFormat decFor = new DecimalFormat("####0.00"); 
        
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
                    
                         
                            <p><%=messages.getString("PriceLabel")%>: <%=messages.getString("CurrencySymbolLabel")%><%=messages.getString("CurrencySymbolLabel")%><%=out.print(decFor.format(prod.getProductPrice()))%></p>

                </div>
                        
                        <p><%=messages.getString("QuantityLabel")%>: <input name="quantity" size=15 type = "number" min = "0" max = "100" value="<%=prod.getQuantityInStock()%>"></p>
                        <td><input type="hidden" name="action" value="updateQty"</td>
                        <td><input type="hidden" name="productId" value="<%=prod.getProductId()%>"</td>
                        <td><input type="submit" value="<%=messages.getString("UpdateLabel")%>" </td>
                        
                        
                        
                     

                </div>

            </form>   
            
            <div id ="Total">
            
<%                     total = total + prod.getProductPrice() * prod.getQuantityInStock();
                     
           }
                    
%>                  <h2> <%=messages.getString("TotalLabel")%>: <%=messages.getString("CurrencySymbolLabel")%>  <%out.print(decFor.format(total));
        }
        else
        {
%>
               <h1> <%=messages.getString("EmptyCartMessage")%> </h1> 
<%
        }        
%>
           
            </div>
            
            <div id ="EmptyCartButton">
                <form action="MemberActionServlet" method="post">
                    <td><input type="hidden" name="action" value="EmptyCart"</td>
                    <td><input type="submit" value="<%=messages.getString("EmptyCartLabel")%>"</td>
                </form>
            </div>
            
            <div id ="PurchaseItemButton">
                <form action="PaymentInformation.jsp">  
                    <td><input type="hidden" name="action" value="BuyItems" /></td>
                    <td><input type="submit" value="<%=messages.getString("PurchaseItemsLabel")%>
" /></td
                </form>
            </div>
            
            
            
           
           
        </table>
    
      <p id="formbuttons">
         			<input type="button" name="prevb" id="prevb" value="<%=messages.getString("PreviousButton")%>" onclick="history.back()" />
                        </p>
       
            
            </div>
        

      
            
        
    </body>
</html>

