<%-- 
    Document   : ViewPreviousOrders
    Created on : 15-Dec-2015, 19:42:31
    Author     : d00155224
--%>

<%@page import="Dtos.Member"%>
<%@page import="Dtos.SalesReceipt"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="mainCSS.css" >
        <title>Sales Orders</title>
        <style>
        </style>
    </head>
     <body>
        
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
        
      //  }
       // else
       // {
      
            
        %>
            
           <li><a href="MemberActionServlet?action=logout">Logout</a></li>
                      
   </ul>
     </nav> 
        <%  
        }
        %>
            <div id="banner">
                <img src="tempBanner.jpg"/>
            </div>
  
       <nav class="menu-1">
    <ul class="menu">
        <li> <a href="/CA3WebApp/HomePage.html">Home</a> </li>
        <li> <a href="MemberActionServlet?action=ViewAllProducts">Shop</a> </li>
        <li> <a href="CA3WebApp/About.jsp">About</a> </li>
        
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
            
            
            <div id="pagecontent2">
                
                <table>

            <tr> <th>Receipt ID</th><th>Date Ordered</th><th>Total Price</th><th>Member ID</th><th>Payment Type</th>

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
                <td><%=sr.getTotalPrice()%></td>
                <td><%=sr.getMemberId()%></td>
                <td><%=sr.getPaymentType()%></td>
                
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
  
            
    </body>
</html>
