<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ResourceBundle"%>
<%@page import="java.util.Locale"%>
<%@page import="Dtos.Member"%>
<%@page import="java.util.List"%>
<%@page import="Dtos.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="images/flash3.png" type="image/gif" sizes="20x20">
        <link rel="stylesheet" type="text/css" href="mainCSS.css" >#<script src="js/jquery_1.js"></script>
        <script src="js/paginate.js"></script>
        <script src="js/custom.js"></script>
        <script type="text/javascript" src="js/modernizr-1.5.min.js"></script>
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
        <script type="text/javascript" src="js/autoCompleter.js"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
        <title>Products</title>

        <%

            Locale userSetting = (Locale) session.getAttribute("locale");

            if (userSetting == null)
            {
                userSetting = request.getLocale();
            }

            ResourceBundle messages = ResourceBundle.getBundle("properties.text", userSetting);
        %>
    </head>   

    <body>

        <div id="container">  

            <nav class = "topmenu">
                <ul class="navigation">
                    <li><a href="MemberActionServlet?action=viewProfile"><%=messages.getString("MenuButtonMyProfile")%></a></li>





                    <%  Member m = (Member) session.getAttribute("member");

                        if (m == null)
                        {

                    %>

                    <li><a href="Login.jsp"><%=messages.getString("MenuButtonLogin")%></a></li>


                    <li><a href="Login.jsp"><%=messages.getString("MenuButtonRegister")%></a></li>
                </ul>
            </nav>  
            <%

            } else
            {


            %>

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
                    <td> <input name="searchName" id="searchName" size=30 type="text" />  
                        <input type="hidden" name="action" value="searchName" />
                        <input type="submit" value="<%=messages.getString("SearchBarButton")%>"/>

                </form>
            </div>

        </ul>


    </nav>

    <div id="side_bar">
        <form action = "MemberActionServlet" method = "post">

            <p>
                <input type="hidden" name="action" value ="ViewAllProducts">
                <input type="image" src="images/IMG_viewAllProductsLogo.jpg" alt="Submit" width="200px" height="70px"/>

            </p>
        </form>

        <form action = "MemberActionServlet" method = "post">

            <p>
                <input type="hidden" name="action" value ="StarWars">
                <input type="image" src="images/swLogo.png" alt="Submit" width="200px" height="70px"/>

            </p>
        </form>

        <form action = "MemberActionServlet" method = "post">
            <p> 

                <input type="hidden" name="action" value ="Marvel">
                <input type="image" src="images/IMG_mLogo.jpeg" alt="Submit" width="200px" height="70px"/>

            </p>
        </form>

        <form action = "MemberActionServlet" method = "post">
            <p> 
                <input type="hidden" name="action" value ="DC">
                <input type="image" src="images/IMG_dcLogo.jpg" alt="Submit" width="200px" height="70px"/>

            </p>
        </form>

        <form action = "MemberActionServlet" method = "post">
            <p> 

                <input type="hidden" name="action" value ="Disney">
                <input type="image" src="images/IMG_dLogo.jpg" alt="Submit" width="200px" height="70px"/>

            </p>
        </form>

        <form action = "MemberActionServlet" method = "post">
            <p> 

                <input type="hidden" name="action" value ="The Walking Dead">
                <input type="image" src="images/IMG_twdLogo.jpg" alt="Submit" width="200px" height="70px"/>

            </p>
        </form>

        <form action = "MemberActionServlet" method = "post">
            <p> 
                <input type="hidden" name="action" value ="Doctor Who">
                <input type="image" src="images/IMG_dwLogo.jpg" alt="Submit" width="200px" height="70px"/>

            </p>
        </form>

        <form action = "MemberActionServlet" method = "post">
            <p> 
                <input type="hidden" name="action" value ="Game Of Thrones">
                <input type="image" src="images/IMG_gotLogo.jpg" alt="Submit" width="200px" height="70px"/> 

            </p>
        </form>

        <form action = "MemberActionServlet" method = "post">
            <p> 
                <input type="hidden" name="action" value ="Harry Potter">
                <input type="image" src="images/HarryPotterlogo.jpg" alt="Submit" width="200px" height="70px"/> 

            </p>
        </form>

        <form action = "MemberActionServlet" method = "post">
            <p> 
                <input type="hidden" name="action" value ="Hunger Games">
                <input type="image" src="images/HungerGameslogo.jpg" alt="Submit" width="200px" height="70px"/> 

            </p>
        </form>

        <form action = "MemberActionServlet" method = "post">
            <p> 
                <input type="hidden" name="action" value ="Pokemon">
                <input type="image" src="images/pokemonLogo.png" alt="Submit" width="200px" height="70px"/> 

            </p>
        </form>

        <form action = "MemberActionServlet" method = "post">
            <p> 
                <input type="hidden" name="action" value ="Supernatural">
                <input type="image" src="images/supernatural-logo.jpg" alt="Submit" width="200px" height="70px"/> 

            </p>
        </form>


    </div>



    <div id="pagecontent">

        <table>
            <form action="MemberActionServlet" method="post">
                <select name="filterComboBox" id="soflow" onchange="submit()">
                    <div id="filterCombo"></div>


                    <option value="1"><%=messages.getString("ComboBoxOption1")%></option>
                    <option value="2"><%=messages.getString("ComboBoxOption2")%></option> 
                    <option value="3"><%=messages.getString("ComboBoxOption3")%></option>

                    <input type="hidden" name="action" style="width: 350px; height: 300px;" value="sortPrice" />

                </select>
            </form>
            </form>  

            <form action="MemberActionServlet" method="post"> 


                <table>
                    <%
                        List<Product> products;
                        products = (List) (request.getSession().getAttribute("fileredProducts"));
                        DecimalFormat decFor = new DecimalFormat("####0.00");
                        if (products != null)
                        {

                            for (Product prod : products)
                            {
                    %>




                    <form action="MemberActionServlet" method="post">
                        <div id="all">
                            <div id="overall">
                            </div>
                            <div id="productImage">   
                                <img src="<%=prod.getProductImageUrl()%>" style="width: 280px; height: 230px;">     
                            </div>   

                            <div id ="productDetails">
                                <div class="ProductName">
                                    <p><%=prod.getProductName()%></p>
                                </div>
                                <p> <%=messages.getString("QtyInStockLabel")%>: <%=prod.getQuantityInStock()%></p>
                                <p><%=messages.getString("PriceLabel")%>: <%=messages.getString("CurrencySymbolLabel")%> <%=decFor.format(prod.getProductPrice())%></p>


                                <p><%=messages.getString("QuantityLabel")%>: <input name="quantity" size=15 type = "number" min = "1" max = "<%=prod.getQuantityInStock()%>"></p>
                                <p><input type="hidden" name="action" value="Add To Cart" /></p>
                                <input type="hidden" name="addToCart" value="<%= prod.getProductId()%>" />
                                <p><input type="submit" value="<%=messages.getString("AddToCartButton")%>" /></p>
                            </div>

                        </div> 



                        <%
                                }
                            }

                        %>
                </table>

                <div class="pagination">
                </div>

            </form>



        </table>

    </div>

</div>




</body>
</html>
