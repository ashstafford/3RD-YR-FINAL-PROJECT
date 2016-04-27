<%-- 
    Document   : editProductName
    Created on : 03-Mar-2016, 10:00:18
    Author     : d00155224
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="Dtos.Member"%>
<%@page import="Dtos.Product"%>
<%@page import="Daos.ProductDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="mainCSS.css" >
        <title>JSP Page</title>
        <style>

</style>      
    </head>
    <body>
        
   <div id="container">  
          <nav class = "topmenu">
             <ul class="navigation">
                    <li><a href="MemberActionServlet?action=viewProfile">My Profile</a></li>
                    
            
       
      
          
         <%  Member m = (Member)session.getAttribute("member"); 
         
       if(m == null)
        {
            
         %>
        
         <li><a href="/CA3WebApp/Login.jsp">Login</a></li>
            
            
        <li><a href="/CA3WebApp/Login.jsp">Sign Up</a></li>
        </ul>
     </nav>
        <%
        
       }
        else
        {
      
            
        %>
            
           <li><a href="MemberActionServlet?action=logout">Logout</a></li>
                      
   </ul>
     </nav> 
          <%} %>
          

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
       <div id="pagecontent3">
           
<%
                ProductDao pDao = new ProductDao();
                
                String prod = request.getParameter("editProduct");
                
                System.out.println("id" + prod);
                
                Product p = pDao.findProductById(Integer.parseInt(prod));
              DecimalFormat decFor = new DecimalFormat("####0.00");
                if(p == null )
               {
                   System.out.println("error!");
               }    
%>
 
              <form action="MemberActionServlet" method="post">
                <div id="addProductMain"> 
                    <div id="editProductHeading">
                        <h1>Edit Product</h1>
                        <hr>
                    </div>
                    
                    <div id ="editProductText">
                        <table>
                            <tr>
                                <label for="exampleInputPassword" style="font-size:20px;">Product Name  : </label> 
                            </tr>
                            <tr>
                                <td><input name="productName" type="text" class="resizedTextBox" value="<%=p.getProductName()%>" style="border:0.5px solid black;" size="35"/> </td>
                            </tr>
                        </table>
                    </div>
                            
                    <div id ="editProductText">
                        <table>
                            <tr>
                                <label for="exampleInputPassword" style="font-size:20px;">Price  : </label> 
                            </tr>
                            <tr>
                                <td><input name="productPrice" placeholder="0.00" type="text" class="resizedTextBox"  value="<%=decFor.format(p.getProductPrice())%>" style="border:0.5px solid black;" size="35"/> </td>
                            </tr>
                        </table>
                    </div>
                    
                    <div id ="editProductText">
                        <table>
                            <tr>
                                <label for="exampleInputPassword" style="font-size:20px;">Quantity in Stock  : </label> 
                            </tr>
                            <tr>
                                <td><input name="quantityInStock"  type="text" class="resizedTextBox"  value="<%=p.getQuantityInStock()%>" style="border:0.5px solid black;" size="35"/> </td>
                            </tr>
                        </table>
                    </div>
                        
                   <div id ="editProductText">
                        <table>
                            <tr>
                                <label for="exampleInputPassword" style="font-size:20px;">Category  : </label> 
                            </tr>
                            <tr>
                                <td><input name="category"  type="text" class="resizedTextBox" value="<%=p.getCategory()%>" style="border:0.5px solid black;" size="35"/> </td>
                            </tr>
                        </table>
                    </div>
                    
                    <div id ="editProductText">
                        <table>
                            <tr>
                                <label for="exampleInputPassword" style="font-size:20px;">Product image url  : </label> 
                            </tr>
                            <tr>
                                <td><input name="productImageUrl"  type="text" class="resizedTextBox" value="<%=p.getProductImageUrl()%>" style="border:0.5px solid black;" size="35"/> </td>
                            </tr>
                        </table>
                    </div>
                    
                    
                    
                
                
                <div id ="editProductButton"> 
                    <input type="hidden" name="action" value="editProductDetails"/>
                    <input type="hidden" name="ProductId" value="<%=p.getProductId()%>"/>
                    <input type="submit" class="resizedButton" value="Edit Product"  />
                </div>
      </form>
           
</div>
                
       
       </div>
   </div>  
    </body>
</html>
