<%-- 
    Document   : EditProductName
    Created on : 28-Feb-2016, 23:53:33
    Author     : Aisling
--%>

<%@page import="java.util.Locale"%>
<%@page import="java.util.ResourceBundle"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="Dtos.Member"%>
<%@page import="Daos.ProductDao"%>
<%@page import="java.util.List"%>
<%@page import="Dtos.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="mainCSS.css" >
        <script src="js/jquery_1.js"></script>
        <script src="js/paginate.js"></script>
        <script src="js/custom.js"></script>
        <script type="text/javascript" src="js/modernizr-1.5.min.js"></script>
        <title></title>
        <style>

        </style>      
    </head>
    <body>


        <%

            Locale userSetting = (Locale) session.getAttribute("locale");

            if (userSetting == null)
            {
                userSetting = request.getLocale();
            }

            ResourceBundle messages = ResourceBundle.getBundle("properties.text", userSetting);
        %>     

    <body>

        <div id="container">

            <nav class = "topmenu">
                <ul class="navigation">

                    <%  Member m = (Member) session.getAttribute("member");

                        if (m == null)
                        {

                    %>

                    <li><a href="Login.jsp"><%=messages.getString("MenuButtonLogin")%></a></li>


                    <li><a href="Register.jsp"><%=messages.getString("MenuButtonRegister")%></a></li>
                </ul>
            </nav>  
            <%

            } else
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
    <div id="pagecontent2">
        <div class="list-of-posts">



            <%
                ProductDao pDao = new ProductDao();

                List<Product> products;

                products = (List) (pDao.getAllProducts());
                
                DecimalFormat decFor = new DecimalFormat("####0.00");
                
                if (products != null)
                {
            %>
            <table> 
                <%
                    for (Product prod : products)
                    {

                %>


                <tr>

                    <td><img src="<%=prod.getProductImageUrl()%>" style="width: 300px; height: 250px;"></td>
                    <td><%=prod.getProductName()%></td>
                    <td><% out.println("\t\t");%></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td><%=messages.getString("QtyInStockLabel")%>: <%=prod.getQuantityInStock()%></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td><p><%=messages.getString("PriceLabel")%>:<%=messages.getString("CurrencySymbolLabel")%> <%=decFor.format(prod.getProductPrice())%></p></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <%
                        String action = request.getParameter("action");

                        if (action.equals("Edit Product"))
                        {
                            
                    %>                
                <form action="EditProductDetails.jsp" method="post"> 

                    <td><input type="hidden" name="action" value="edit Product" /></td>
                    <input type="hidden" name="editProduct" value="<%= prod.getProductId()%>"/> 





                    <td><input type="submit" value="<%=messages.getString("EditProductLabel")%>" /></td>
                    </tr>

                </form> 

                <%
                } else
                {

                %>  
                    <form action="MemberActionServlet" method="post"> 
                    <td><input type="hidden" name="action" value="Remove Product" /></td>
                    <input type="hidden" name="removeProduct" value="<%= prod.getProductId()%>"/>



                    <td><input type="submit" value="<%=messages.getString("RemoveProductLabel")%>" /></td>
                    </tr>

                </form> 


                <%      }
                      }
              
                %>


            </table>
            <div class="pagination">
            </div>
        </div>
    </div>


</div>

</body>

</html>
