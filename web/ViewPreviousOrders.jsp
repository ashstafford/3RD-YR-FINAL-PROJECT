<%-- 
    Document   : ViewPreviousOrders
    Created on : 15-Dec-2015, 19:42:31
    Author     : d00155224
--%>

<%@page import="Dtos.SalesReceipt"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sales Orders</title>
        <style>
            
            body 
  {
   
        background:  url("IMG_viewOrdersBackground.jpg") no-repeat center center fixed; 
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

            <tr> <th>Receipt ID</th><th>Date Ordered</th><th>Product Name</th><th>Product Price</th><th>Quantity</th><th>Member ID</th>

         <%
                    List<SalesReceipt> orders;
                    orders = (List)(request.getSession().getAttribute("previousOrders"));

                    if (orders != null) 
                    {

                        for (SalesReceipt sr : orders) 
                        {
                %>
                
             <tr>
                <td><%=sr.getReceiptId()%></td>
                <td><%=sr.getDateOrdered()%></td>
                <td><%=sr.getProductName()%></td>
                <td><%=sr.getProductPrice()%></td>
                <td><%=sr.getQuantity()%></td>
                <td><%=sr.getMemberId()%></td>
            </tr>
                
                
                
                
                
                   <%
                    }
                }
                else
                {
                     %><h1> You have no previous orders!</h1> <%     
                }        
            %>
         </table>
       </div>
         </div>    
    </body>
</html>
