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
        <link rel="stylesheet" type="text/css" href="mainCSS.css" >
        <title>JSP Page</title>
  
        <style>   
            
 .navigation {
  margin: 0;
  padding: 0;
  list-style: none;
  background:#FFFFFF;
  display: flex;
  justify-content: flex-end;
  color: black;
}

.navigation a {
  display: block;
  padding: 1em;
  color:#ffffff;
  text-decoration: none;
  color: black;
  font-family: Arial, Helvetica, sans-serif;
}

.navigation a:hover {
  background:#e6e6e6;
  border-bottom-right-radius   : 10px;
  border-bottom-left-radius: 10px;
  border-top-left-radius: 10px;
  border-top-right-radius: 10px;
}

@media all and (max-width: 800px) {
  .navigation {
    justify-content: space-around;
  }
}

@media all and (max-width: 600px) {
  .navigation {
    padding: 0;
    flex-direction: column;
  }
  
  .navigation a {
    padding: 1em;
    text-align: center;
    border-top: 1px solid rgba(255, 255, 255, 0.2); 
    border-bottom: 1px solid rgba(0, 0, 0, 0.2); 
  }
    
  .navigation li:last-of-type a {
    border-bottom: none;
  }
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
   margin-right: 150px;
   margin-top: 40px;
   overflow: hidden;
   padding: 5px 10px;
   text-overflow: ellipsis;
   white-space: nowrap;
   width: 300px;
   float:right;
   clear:right;
   
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

div#filterButton
{
    float:right;
    clear: right;
}




/*#wrap{
	width: 100%;
	max-width: 1100px;
	margin-left: 130px;
	margin-top: 20px;
}

.columns_4 figure{
   width:35%;
   length: 100%;
   margin-right:1%;
}
.columns_4 figure:nth-child(4){
	margin-right: 0;
}

#columns figure:hover{
	-webkit-transform: scale(1.1);
	-moz-transform:scale(1.1);
	transform: scale(1.1);

}
#columns:hover figure:not(:hover) {
	opacity: 0.4;
}
div#columns figure {
	
	display: inline-block;
	background: #FEFEFE;
	border: 2px solid #FAFAFA;
	box-shadow: 0 1px 2px rgba(34, 25, 25, 0.4);
	margin: 24 24px 24px;
	-webkit-column-break-inside: avoid;
	-moz-column-break-inside: avoid;
	column-break-inside: avoid;
	padding: 15px;
	padding-bottom: 5px;
	background: -webkit-linear-gradient(45deg, #FFF, #F9F9F9);
	opacity: 1;
	-webkit-transition: all .3s ease;
	-moz-transition: all .3s ease;
	-o-transition: all .3s ease;
	transition: all .3s ease;
	
}

div#columns figure img {
	width: 100%;
	height:60%;
	border-bottom: 1px solid #ccc;
	padding-bottom: 15px;
	margin-bottom: 5px;
}

div#columns figure figcaption {
  font-size: .9rem;
  color: #444;
  line-height: 1.5;
  height:20px;
  font-weight:600;
  text-overflow:ellipsis;
}

a.button{
  padding:10px;
  background:#FF0066;
  margin:10px;
  display:block;
  text-align:center;
  color:#fff;
  transition:all 1s linear;
  text-decoration:none;
  text-shadow:1px 1px 3px rgba(0,0,0,0.3);
  border-radius:3px;
  border-bottom:3px solid rgba(32, 24, 27, 0.6);
  box-shadow:1px 1px 3px rgba(0,0,0,0.3);
}
a.button:hover{
  background:balck;
  border-bottom:3px solid salmon;
  color:black;
  border-bottom:3px solid rgba(32, 24, 27, 0.6);
}
@media screen and (max-width: 960px) { 
  #columns figure { width: 24%; }
}
@media screen and (max-width: 767px) {
  #columns figure { width:32%;}
}
@media screen and (max-width: 600px) {
  #columns figure { width: 49%;}
}
@media screen and (max-width: 500px) {
  #columns figure { width: 100%;}
}
*/

div#productImage img{
    border-style: solid;
    clear:right;
}
div#productImage
{
    float:left;
    clear:right;
    padding-left: 50px;
    margin-right: 50px;
}
div#productDetails
{
    padding-left: 50px;
    padding-top: 20px;
    
}

div#overall
{
    padding-top:100px;
}

        </style>
    </head>   
    <body>
        
   <div id="container">  
          <ul class="navigation">
                    <li><a href="MemberActionServlet?action=viewProfile">My Profile</a></li>
                    <li><a href="/CA3WebApp/Login.html">Login</a></li>
                    <li><a href="/CA3WebApp/Login.html">Sign Up</a></li>
                </ul>
      
                  </nav>

            <div id="banner">
                <img src="tempBanner.jpg"/>
            </div>
  
       <nav class="menu-1">
    <ul class="menu">
        <li> <a href="/CA3WebApp/HomePage.html">Home</a> </li>
        <li> <a href="/CA3WebApp/CategorySelection.html">Shop</a> </li>
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
        
    </div>
        
      <div id="pagecontent">
        
        <table>
         <form action="MemberActionServlet" method="post">  
             <select name="filterComboBox" id="soflow">
  <!-- This method is nice because it doesn't require extra div tags, but it also doesn't retain the style across all browsers. -->
               <option value="1">Select an Option</option>
               <option value="2">Price - Lowest To Highest</option> 
               <option value="3">Price - Highest To Lowest</option>
             </select>
             
             <div id="filterButton">
                <td><input type="hidden" name="action" style="width: 350px; height: 300px;" value="filterProducts" /></td>
                <td><input type="submit" value="Filter" /></td>
             </div>
             
             
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
            <div id="overall">
                      </div>

        <tr>
                
        <div id="productImage">   
       <img src="<%=prod.getProductImageUrl()%>" style="width: 300px; height: 250px;">     
        </div>   
            
        <div id ="productDetails">
            <p><%=prod.getProductName()%></p>
                <p>Quantity in stock: <%=prod.getQuantityInStock()%></p>
                <p>Price: €<%=prod.getProductPrice()%></p>
                
                
                <p>Quantity: <input name="quantity" size=15 type="text" /></p>
                <p><input type="hidden" name="action" value="Add To Cart" /></p>
                <input type="hidden" name="addToCart" value="<%= prod.getProductId()%>" />
                <p><input type="submit" value="Add To Cart" /></p>
        </div>
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
