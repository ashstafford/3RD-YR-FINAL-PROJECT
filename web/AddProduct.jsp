<%-- 
    Document   : AddProduct
    Created on : Feb 24, 2016, 11:08:16 PM
    Author     : Ash
--%>

<%@page import="Dtos.Member"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="mainCSS.css" >
                 <style>

</style>
    </head>
    <body>
        
        <div id="container">
            
        
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
        <li> <a href="/Login.htmlCart.jsp">Cart</a> </li>
        
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
 
        <div id="addProduct">  
        <h1> Add Product </h1>   
        
        <%  // boolean productAdded = (boolean) session.getAttribute("fileredProducts");
        
            //   if(productAdded == true)
            //   {
             //      out.println("Product Successfully Added!!");
            //   }
            //   else
          //     {
        %>
    <form action="MemberActionServlet" method="post">
                <table>
                    <tr>
                        <td> Product Name  : </td><td> <input name="productName" placeholder="MUST be at least 4 characters" size=25 type="text" /> </td> 
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td> Price  : </td><td> <input name="productPrice" placeholder="0.00" size=25 type="text" /> </td> 
                    </tr>
                     <tr>
                        <td> Quantity in Stock  : </td><td> <input name="quantityInStock" size=25 type="text" /> </td> 
                    </tr>
                     <tr>
                        <td> Category  : </td><td> <input name="category" size=25 type="text" /> </td> 
                    </tr>
                     <tr>
                        <td> Product image url  : </td><td> <input name="productImageUrl" placeholder="" size=25 type="text" /> </td> 
                    </tr>
                    
                </table>
                
                <input type="hidden" name="action" value="AddProduct"/>
                <input type="submit" value="Add Product"  />
      </form>
    </div>
           <%// } 
                 %>
            </div>
    </body>
</html>
