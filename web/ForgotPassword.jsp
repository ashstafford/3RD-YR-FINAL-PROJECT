<%-- 
    Document   : ForgotPassword
    Created on : Mar 9, 2016, 4:55:11 PM
    Author     : Ash
--%>

<%@page import="java.util.ResourceBundle"%>
<%@page import="java.util.Locale"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="mainCSS.css" >
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
        <script type="text/javascript" src="js/autoCompleter.js"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">

        <title>Forgot Password</title>
    </head>
    <%

        Locale userSetting = (Locale) session.getAttribute("locale");

        if (userSetting == null)
        {
            userSetting = request.getLocale();
        }

        ResourceBundle messages = ResourceBundle.getBundle("properties.text", userSetting);
    %>

</head>
</head>   
<body>

    <div id="container">  

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

        <div id="pagecontent3">

            <form action="MemberActionServlet" method="post">

                <div id="ForgotPasswordTitle">
                    <h1><%=messages.getString("ForgotPasswordTitle")%></h1>
                    <br>
                    <hr>
                </div>

                <div id="ForgotPasswordMain">
                    <div id="ForgotPassword">
                        <table>
                            <tr>
                            <label for="forgetPasswordEmail"><%=messages.getString("NewEmailLabel")%>: <span style="color:red;">*</span></label> 
                            </tr>
                            <tr>
                                <td> <input name="email" class="resizedTextBox" placeholder="MUST have an @" size=25 type="text" required /> </td>
                            </tr>
                        </table>
                    </div>

                    <div id="ForgotPassword">
                        <table>
                            <tr>
                            <label for="forgetPasswordPet"><%=messages.getString("SecurityQuestion")%> <span style="color:red;">*</span></label>
                            </tr>
                            <tr>
                                <td> <input name="securityQuestionAnswer" class="resizedTextBox" size=25 type="password" required /> </td> 
                            </tr>
                        </table>
                    </div>

                    <div id="ForgotPasswordButtonNext">
                        <input type="hidden" name="action" value="resetPassword" />
                        <input type="submit" class="resizedButton" value="Next" />
                    </div>


            </form>

            <div id ="ForgotPasswordButtonBack">
                <form action = "Login.jsp" method = "post">
                    <p> 
                        <input type = "submit" class="resizedButton" name = "Login" value = "Return to Login"/>
                    </p>
                </form>  
            </div>
        </div>

    </div>

</div>





</body>
</html>
