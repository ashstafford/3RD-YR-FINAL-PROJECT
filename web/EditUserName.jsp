<%-- 
    Document   : EditUserName
    Created on : 14-Dec-2015, 21:52:33
    Author     : Aisling
--%>

<%@page import="java.util.ResourceBundle"%>
<%@page import="java.util.Locale"%>
<%@page import="Dtos.Member"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Username</title>
        <link rel="stylesheet" type="text/css" href="mainCSS.css" >
         <link rel="icon" href="images/flash3.png" type="image/gif" sizes="20x20">
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
        <script type="text/javascript" src="js/autoCompleter.js"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">

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
                <td> <input name="searchName" id="searchName" size=30 type="text" />  
                    <input type="hidden" name="action" value="searchName" />
                    <input type="submit" value="<%=messages.getString("SearchBarButton")%>"/>

            </form>
        </div>

    </ul>


</nav> 
<div id="pagecontent3">


    <form method="post" action = "MemberActionServlet" name="myForm"  onSubmit="return validateForm()">

        <div id="EditslabelPosition">   
            <label for="exampleInputEditFirstname"><%=messages.getString("EditUserNameLabel")%>: <span style="color:red;">*</span></label>
        </div>

        <div id="EditsTextboxandButtonPosition">  
            <input name="editUsername" type="text" class="resizedTextBox" size=15>


            <input type="hidden" name="action" value="Edit Username"/>
            <input type="submit" class="resizedButton"  name="submit" value="<%=messages.getString("EditUserNameButton")%>"  />
        </div>

    </form>

</div>


</html>




