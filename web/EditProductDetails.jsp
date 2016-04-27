<%-- 
    Document   : editProductName
    Created on : 03-Mar-2016, 10:00:18
    Author     : d00155224
--%>

<%@page import="java.util.ResourceBundle"%>
<%@page import="java.util.Locale"%>
<%@page import="Dtos.Member"%>
<%@page import="Dtos.Product"%>
<%@page import="Daos.ProductDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Product Details</title>
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
          <% 
   
        Locale userSetting = (Locale) session.getAttribute("locale");
       
        if(userSetting == null)
        {
            userSetting = request.getLocale();
        }
   
    ResourceBundle messages = ResourceBundle.getBundle("properties.text", userSetting);
%>

    </head>
     </head>   
    <body>

      
          
    <div id="container">
            
        <nav class = "topmenu">
            <ul class="navigation">
 
         <%  Member m = (Member)session.getAttribute("member"); 
         
        if(m == null)
        {
            
         %>
        
         <li><a href="Login.jsp"><%=messages.getString("MenuButtonLogin")%></a></li>
           
            
        <li><a href="Register.jsp"><%=messages.getString("MenuButtonRegister")%></a></li>
       </ul>
     </nav>  
        <%
        
        }
        else
        {
      
            
        %>
           <li><a href="MemberActionServlet?action=viewProfile">My Profile</a></li> 
           <li><a href="MemberActionServlet?action=logout"><%=messages.getString("MenuButtonLogout")%></a></li>
                      
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
        <li> <a href="/CA3WebApp/HomePage.jsp"><%=messages.getString("MenuHomeButton")%></a> </li>
        <li> <a href="MemberActionServlet?action=ViewAllProducts"><%=messages.getString("MenuShopButton")%></a> </li>
        <li> <a href="/CA3WebApp/About.jsp"><%=messages.getString("MenuAboutButton")%></a> </li>
        
        <li> <a href="MemberActionServlet?action=ViewPreviousOrders"><%=messages.getString("MenuViewOrdersButton")%></a> </li>
        
        <li> <a href="/CA3WebApp/ContactUs.jsp"><%=messages.getString("MenuContactUsButton")%></a> </li>
        <li> <a href="/CA3WebApp/Cart.jsp"><%=messages.getString("MenuCartButton")%></a> </li>
        <div id="searchbar">
        <form  action = "MemberActionServlet" method = "post" >
               <td> <input name="searchName" size=30 type="text" />  
                 <input type="hidden" name="action" value="searchName" />
                 <input type="submit" value="<%=messages.getString("SearchBarButton")%>"/>
               
        </form>
        </div>
        
    </ul>
           
           
</nav>
       <div id="pagecontent">
           
<%
                ProductDao pDao = new ProductDao();
                
                String prod = request.getParameter("editProduct");
    
                Product p = pDao.findProductById(Integer.parseInt(prod));
              
          
%>
              <form action="MemberActionServlet" method="post">
                <table>
                    <tr>
                        <td><%=messages.getString("ProductNameTitle")%> : </td><td> <input name="productName" size=25 type="text" value="<%=p.getProductName()%>" /> </td> 
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td><%=messages.getString("PriceLabel")%>: </td><td> <input name="productPrice" placeholder="0.00" size=25 type="text" value="<%=p.getProductPrice()%>"/> </td> 
                    </tr>
                     <tr>
                        <td><%=messages.getString("QtyInStockLabel")%>: </td><td> <input name="quantityInStock" size=25 type="text" value="<%=p.getQuantityInStock()%>"/> </td> 
                    </tr>
                     <tr>
                        <td><%=messages.getString("CategoryLabel")%>: </td><td> <input name="category" size=25 type="text" value="<%=p.getCategory()%>"/> </td> 
                    </tr>
                     <tr>
                        <td><%=messages.getString("ProductImageLabel")%>: </td><td> <input name="productImageUrl" placeholder="" size=25 type="text" value="<%=p.getProductImageUrl()%>" /> </td> 
                    </tr>
                    
                </table>
                
                <input type="hidden" name="action" value="editProductDetails"/>
                <input type="hidden" name="ProductId" value="<%=p.getProductId()%>"/>
                <input type="submit" value="<%=messages.getString("EditProductButton")%>"  />
      </form>
       
       </div>
   </div>  
    </body>
</html>
