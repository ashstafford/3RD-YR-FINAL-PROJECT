<%-- 
    Document   : HungerGamesPage
    Created on : 10-Apr-2016, 21:09:36
    Author     : Benjamin
--%>

<%@page import="Dtos.Member"%>
<%@page import="Dtos.Product"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="mainCSS.css" >
        <title>Hunger Games Page</title>
    </head>
    <style>   
    </style>
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
        
         <form action = "MemberActionServlet" method = "post">
               <p> 
                  <input type="hidden" name="action" value ="Pokemon">
                  <input type="image" src="images/pokemonLogo.jpg" alt="Submit" width="200px" height="70px"/> 
             
               </p>
         </form>
        
        
          <form action = "MemberActionServlet" method = "post">
               <p> 
                  <input type="hidden" name="action" value ="SuperNatural">
                  <input type="image" src="images/supernaturalLogo.jpg" alt="Submit" width="200px" height="70px"/> 
             
               </p>
         </form>
        
    </div>
        
      <div id="pagecontent">
        
        
         <table>

                <%
                    List<Product> products;
                    products = (List) (request.getSession().getAttribute("hgProducts"));

                    if (products != null) 
                    {

                        for (Product prod : products) 
                        {
                %>
             
            
  
                
         <form action="MemberActionServlet" method="post">
            <div id="overall">
                      </div>

        <tr>
                
        <div id="productImage">   
       <img src="<%=prod.getProductImageUrl()%>" style="width: 300px; height: 250px;">     
        </div>   
            
        <div id ="productDetails">
            <div class="ProductName">
            <p><%=prod.getProductName()%></p>
            </div>
                <p>Quantity in stock: <%=prod.getQuantityInStock()%></p>
                <p>Price: €<%=prod.getProductPrice()%></p>
                
                
                <p>Quantity: <input name="quantity" size=15 type="text" /></p>
                <p><input type="hidden" name="action" value="Add To Cart" /></p>
                <input type="hidden" name="addToCart" value="<%= prod.getProductId()%>" />
                <p><input type="submit" value="Add To Cart" /></p>
        </div>
           </tr>
           
           
           <%
                    }
                }
            %>
      </form>
            


        </table>

        

      </div>
</div>  
        
    </body>
</html>
