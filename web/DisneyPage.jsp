<%-- 
    Document   : DisneyPage
    Created on : 12-Dec-2015, 19:50:44
    Author     : Aisling
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="Dtos.Member"%>
<%@page import="java.util.List"%>
<%@page import="Dtos.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="mainCSS.css" >
        <script src="js/paginate.js"></script>
        <script src="js/custom.js"></script>
        <script type="text/javascript" src="js/modernizr-1.5.min.js"></script>
        <title>Disney</title>
        
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
        
         <li><a href="/CA3WebApp/Login.jsp">Login</a></li>
            
            
        <li><a href="/CA3WebApp/Login.jsp">Sign Up</a></li>
        
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
                  
    <div id="side_bar">
        <form action = "MemberActionServlet" method = "post">
            
            <p>
                 <input type="hidden" name="action" value ="ViewAllProducts">
                 <input type="image" src="images/IMG_viewAllProductsLogo.jpg" alt="Submit" width="200px" height="70px"/>
                
            </p>
        </form>
        
        <form action = "MemberActionServlet" method = "post">
            
            <p>
                 <input type="hidden" name="action" value ="StarWars">
                 <input type="image" src="images/swLogo.png" alt="Submit" width="200px" height="70px"/>
                
            </p>
        </form>
        
         <form action = "MemberActionServlet" method = "post">
               <p> 
                   
                 <input type="hidden" name="action" value ="Marvel">
                 <input type="image" src="images/IMG_mLogo.jpeg" alt="Submit" width="200px" height="70px"/>
                 
               </p>
         </form>
        
         <form action = "MemberActionServlet" method = "post">
               <p> 
                 <input type="hidden" name="action" value ="DC">
                 <input type="image" src="images/IMG_dcLogo.jpg" alt="Submit" width="200px" height="70px"/>
              
               </p>
         </form>
        
         <form action = "MemberActionServlet" method = "post">
               <p> 
                   
                 <input type="hidden" name="action" value ="Disney">
                 <input type="image" src="images/IMG_dLogo.jpg" alt="Submit" width="200px" height="70px"/>
               
               </p>
         </form>
        
        <form action = "MemberActionServlet" method = "post">
               <p> 
                   
                 <input type="hidden" name="action" value ="The Walking Dead">
                 <input type="image" src="images/IMG_twdLogo.jpg" alt="Submit" width="200px" height="70px"/>
                  
               </p>
         </form>
        
        <form action = "MemberActionServlet" method = "post">
               <p> 
                 <input type="hidden" name="action" value ="Doctor Who">
                 <input type="image" src="images/IMG_dwLogo.jpg" alt="Submit" width="200px" height="70px"/>
                  
               </p>
         </form>
        
        <form action = "MemberActionServlet" method = "post">
               <p> 
                  <input type="hidden" name="action" value ="Game Of Thrones">
                  <input type="image" src="images/IMG_gotLogo.jpg" alt="Submit" width="200px" height="70px"/> 
             
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
        
        <form action = "MemberActionServlet" method = "post">
               <p> 
                  <input type="hidden" name="action" value ="Pokemon">
                  <input type="image" src="images/pokemonLogo.png" alt="Submit" width="200px" height="70px"/> 
             
               </p>
         </form>
        
        <form action = "MemberActionServlet" method = "post">
               <p> 
                  <input type="hidden" name="action" value ="Supernatural">
                  <input type="image" src="images/supernaturalLogo.jpg" alt="Submit" width="200px" height="70px"/> 
             
               </p>
         </form>
        
    </div>
        
      <div id="pagecontent">
        
        <form action="MemberActionServlet" method="post">
             <select name="filterComboBox" id="soflow" >
                <div id="filterCombo"></div>


                  <option value="1">Select an Option</option>
                  <option value="2">Price - Lowest To Highest</option> 
                  <option value="3">Price - Highest To Lowest</option>

                

                  <div class="sortButton"> </div>
                   <td><input type="hidden" name="action" style="width: 350px; height: 300px;" value="filterProducts" /></td>
                   <td><input type="submit" class="sortButtonSize" value="Sort" /></td>
                
             </select>
         </form>
          
         <div class="list-of-posts">
                 
                    
                <%
                    List<Product> products;
                    products = (List) (request.getSession().getAttribute("DProducts"));
                    DecimalFormat decFor = new DecimalFormat("####0.00");
                    
                    if (products != null) 
                    { 
                %>        
                
                <table>    
                    <%
                    for (Product prod : products) 
                        {
                            
                    %>
                
         <form action="MemberActionServlet" method="post">
            

        
         <div id="all">
             <div id="overall">
                      </div>
        <div id="productImage">   
       <img src="<%=prod.getProductImageUrl()%>" style="width: 280px; height: 230px;">     
        </div>   
            
        <div id ="productDetails">
            <div class="ProductName">
            <p><%=prod.getProductName()%></p>
            </div>
                <p>Quantity in stock: <%=prod.getQuantityInStock()%></p>
                <p>Price: €<%=decFor.format(prod.getProductPrice())%></p>
                
                
                <p>Quantity: <input name="quantity" size=15 type = "number" min = "1" max = "<%=prod.getQuantityInStock()%>"></p>
                <p><input type="hidden" name="action" value="Add To Cart" /></p>
                <input type="hidden" name="addToCart" value="<%=prod.getProductId()%>" />
                <p><input type="submit" value="Add To Cart" /></p>
        </div>
                
         </div> 
                
  </form>
               
            <%
                    }
                }
                       
            %>
             
            </table>
           <div class="pagination">
            </div>
           </div>

        

      </div>
</div>  
          
       
  
    </body>
</html>
