<%-- 
    Document   : DoctorWhoPage
    Created on : 15-Dec-2015, 01:07:39
    Author     : Aisling
--%>

<%@page import="Dtos.Product"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Doctor Who Page</title>
    </head>
    <style>   
    body 
            {
       
           background: url("IMG_DWBackground.jpg") no-repeat center center fixed; 
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
  color: #FFFFFF;
 
}

div#container
{
  position     : relative;
  width        : 85%;
  margin-left  : auto;
  margin-right : auto;
}
</style>
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

                <%
                    List<Product> products;
                    products = (List) (request.getSession().getAttribute("dwProducts"));

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

            <%
                    }
                }
            %>
    </form>

        </table>
        </div>
    </body>
</html>
