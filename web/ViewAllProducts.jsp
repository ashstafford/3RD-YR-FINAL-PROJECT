<%-- 
    Document   : ViewAllProducts
    Created on : 18-Feb-2016, 10:55:27
    Author     : D00155224
--%>

<%@page import="java.util.List"%>
<%@page import="Dtos.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
  
        <style>   
  body 
  {

      
           background: url("IMG_backroundStarWars.jpg") no-repeat center center fixed; 
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
  color: #FFFFFF;
 
}

div#container
{
  position     : relative;
  width        : 85%;
  margin-left  : auto;
  margin-right : auto;
}
          
select#soflow, select#soflow-color {
   -webkit-appearance: button;
   -webkit-border-radius: 2px;
   -webkit-box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.1);
   -webkit-padding-end: 20px;
   -webkit-padding-start: 2px;
   -webkit-user-select: none;
   background-image: url(http://i62.tinypic.com/15xvbd5.png), -webkit-linear-gradient(#FAFAFA, #F4F4F4 40%, #E5E5E5);
   background-position: 97% center;
   background-repeat: no-repeat;
   border: 1px solid #AAA;
   color: #555;
   font-size: inherit;
   margin: 20px;
   overflow: hidden;
   padding: 5px 10px;
   text-overflow: ellipsis;
   white-space: nowrap;
   width: 300px;
}

select#soflow-color {
   color: #fff;
   background-image: url(http://i62.tinypic.com/15xvbd5.png), -webkit-linear-gradient(#779126, #779126 40%, #779126);
   background-color: #779126;
   -webkit-border-radius: 20px;
   -moz-border-radius: 20px;
   border-radius: 20px;
   padding-left: 15px;
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
        
        <table>
         <form action="MemberActionServlet" method="post">  
             <select name="filterComboBox" id="soflow">
  <!-- This method is nice because it doesn't require extra div tags, but it also doesn't retain the style across all browsers. -->
               <option value="1">Select an Option</option>
               <option value="2">Price - Lowest To Highest</option> 
               <option value="3">Price - Highest To Lowest</option>
             </select>
                <td><input type="hidden" name="action" value="filterProducts" /></td>
                <td><input type="submit" value="Filter" /></td>
         </form>  
  
                <%
                    List<Product> products;
                    products = (List) (request.getSession().getAttribute("AllProducts"));

                    if (products != null) 
                    { 
                        
                        for (Product prod : products) 
                        {
                %>
           <form action="MemberActionServlet" method="post">
                 
            <tr>
                
                <td><img src="<%=prod.getProductImageUrl()%>" style="width: 300px; height: 250px;"></td>
                <td><%=prod.getProductName()%></td>
                <td><% out.println("\t\t"); %></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td>Quantity in stock: <%=prod.getQuantityInStock()%></td>
                <td></td>
                <td></td>
                <td></td>
                <td><p>Price: €<%=prod.getProductPrice()%></p></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            
           
                <td>Quantity: <input name="quantity" size=15 type="text" /></td>
                <td><input type="hidden" name="action" value="Add To Cart" /></td>
                <input type="hidden" name="addToCart" value="<%= prod.getProductId()%>" />
                <td><input type="submit" value="Add To Cart" /></td>
             </tr>

      </form>
            <%
                    }
                }
                else
                    {
                        out.println("sorry not found!!");
                    }        
            %>


        </table>

        

      </div>
</div>
        
    </body>
</html>
