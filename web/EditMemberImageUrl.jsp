<%-- 
    Document   : EditMemberImageUrl
    Created on : 25-Feb-2016, 10:20:55
    Author     : d00153612
--%>

<%@page import="java.util.Locale"%>
<%@page import="java.util.ResourceBundle"%>
<%@page import="Dtos.Member"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Member Image</title>
        <link rel="stylesheet" type="text/css" href="mainCSS.css" >
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
        <script type="text/javascript" src="js/autoCompleter.js"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
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
<div id="pagecontent2">

    <form action = "MemberActionServlet" method = "post">

        <div id="EditslabelPosition">   
            <label for="exampleInputPassword"><%=messages.getString("newMemberImage")%>: <span style="color:red;">*</span></label>
        </div>

        <div id="EditsTextboxandButtonPosition">  

            <tr>
                <td><input type="file"  name="editMemberImageUrl"  size="50" required/></td>
            </tr>

            <input type = "hidden" name="action" value="Edit MemberImageUrl"/>
            <input type="submit" class="resizedButton" name="submit" value="<%=messages.getString("EditMemberImageButton")%>"/>
        </div>

    </form>
</div>


</html>


