<%-- 
    Document   : editProductName
    Created on : 03-Mar-2016, 10:00:18
    Author     : d00155224
--%>

<%@page import="Dtos.Product"%>
<%@page import="Daos.ProductDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
      body 
  {
   
        background:  url("IMG_categorySelectionBackground.jpg") no-repeat center center fixed; 
        -webkit-background-size: cover;
        -moz-background-size: cover;
        -o-background-size: cover;
        background-size: cover;
    }            
.topmenu

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
  font-size: 20px;
 
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
        
   <div id="container">  
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
       <div id="pagecontent">
           
<%
                ProductDao pDao = new ProductDao();
                
                String prod = request.getParameter("editProduct");
                
                System.out.println("id" + prod);
                
                Product p = pDao.findProductById(Integer.parseInt(prod));
              
                if(p == null )
               {
                   System.out.println("error!");
               }    
%>
 
              <form action="MemberActionServlet" method="post">
                <table>
                    <tr>
                        <td> Product Name  : </td><td> <input name="productName" size=25 type="text" value="<%=p.getProductName()%>" /> </td> 
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td> Price  : </td><td> <input name="productPrice" placeholder="0.00" size=25 type="text" value="<%=p.getProductPrice()%>"/> </td> 
                    </tr>
                     <tr>
                        <td> Quantity in Stock  : </td><td> <input name="quantityInStock" size=25 type="text" value="<%=p.getQuantityInStock()%>"/> </td> 
                    </tr>
                     <tr>
                        <td> Category  : </td><td> <input name="category" size=25 type="text" value="<%=p.getCategory()%>"/> </td> 
                    </tr>
                     <tr>
                        <td> Product image url  : </td><td> <input name="productImageUrl" placeholder="" size=25 type="text" value="<%=p.getProductImageUrl()%>" /> </td> 
                    </tr>
                    
                </table>
                
                <input type="hidden" name="action" value="editProductDetails"/>
                <input type="hidden" name="ProductId" value="<%=p.getProductId()%>"/>
                <input type="submit" value="Edit Product"  />
      </form>
       
       </div>
   </div>  
    </body>
</html>
