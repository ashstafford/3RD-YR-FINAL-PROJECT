<%-- 
    Document   : AddProduct
    Created on : Feb 24, 2016, 11:08:16 PM
    Author     : Ash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
    </body>
</html>
