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
            
            
            <div id="pagecontent3">
 
        <div id="addProductMain"> 
            <div id="addProductTitle">
                <h1> Add Product </h1>
            </div>
        
        <%  // boolean productAdded = (boolean) session.getAttribute("fileredProducts");
        
            //   if(productAdded == true)
            //   {
             //      out.println("Product Successfully Added!!");
            //   }
            //   else
          //     {
        %>
    
        
    <form action="MemberActionServlet" method="post">
        <form>
                    
                    
                    <div id ="AddProduct">
                        <table>
                            <tr>
                                <label for="exampleInputPassword" style="font-size:20px;">Product Name: </label> 
                            </tr>
                            <tr>
                                <td><input name="productName" class="resizedTextBox" style="border:0.5px solid black;" size="35" type="text" /> </td>
                            </tr>
                        </table>
                        <!--<tr>
                            <td> Product Name  : </td><td> <input name="productName" placeholder="MUST be at least 4 characters" size=25 type="text" /> </td> 
                        </tr>-->
                    </div>
                    
                    <div id ="AddProduct">
                        <table>
                            <tr>
                                <label for="exampleInputPassword" style="font-size:20px;">Price: </label> 
                            </tr>
                            <tr>
                                <td><input name="productPrice" class="resizedTextBox" style="border:0.5px solid black;" size="35"/> </td>
                            </tr>
                        </table>
                    </div>
                    
                    <div id ="AddProduct">
                        <table>
                            <tr>
                                <label for="exampleInputPassword" style="font-size:20px;">Quantity in Stock: </label> 
                            </tr>
                            <tr>
                                <td><input name="productQuanityInStock" class="resizedTextBox" style="border:0.5px solid black;" size="35"/> </td>
                            </tr>
                        </table>
                    </div>
                    
                    <div id="AddProduct">
                        <table>
                            <tr>
                                <label for="exampleInputPassword" style="font-size:20px;">Category: </label> 
                            </tr>
                            <tr>
                                <td><input name="productQuanityInStock" class="resizedTextBox" style="border:0.5px solid black;" size="35" type="text"/> </td>
                            </tr>
                        </table>
                    </div>
                    
                    <div id="AddProduct">
                        <table>
                            <tr>
                                <label for="exampleInputPassword" style="font-size:20px;">Product Image Url: </label> 
                            </tr>
                            <tr>
                                <td><input name="productImageUrl" class="resizedTextBox" style="border:0.5px solid black;" size="35" type="url"/> </td>
                            </tr>
                        </table>
                    </div>
                    
               
                <div id="AddProductButton">
                    <input type="hidden" name="action" value="AddProduct"/>
                    <input type="submit" class="resizedButton"  value="Add Product"  />
                </div>
      </form>
        
    </div>
           <%// } 
                 %>
                 
                
            </div>
    </body>
</html>
