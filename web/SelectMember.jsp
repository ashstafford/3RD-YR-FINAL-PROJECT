<%-- 
    Document   : SelectMember
    Created on : Mar 22, 2016, 9:19:56 PM
    Author     : Ash
--%>

<%@page import="java.util.Locale"%>
<%@page import="java.util.ResourceBundle"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Dtos.Member"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="mainCSS.css" >
        <title>Select Member</title>
    </head>



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

    <div id="overall2"></div>

    <table>


 <%
            List<Member> AllMembers = (List) (request.getSession().getAttribute("AllMembers"));

            List<Member> Members = new ArrayList<Member>();

            for (Member mem : AllMembers)
            {
                if (m.isAdmin() == false)
                {
                    Members.add(m);
                }
            }

            if (Members != null)
            {
                for (Member mem : Members)
                {

 %>



        <tr>
        <div id="overallMain">
            <div id="profileImage">   
                <img src="<%=mem.getMemberImageUrl()%>" style="width: 300px; height: 250px;">     
            </div>

            <div id ="profileInfo">
                <p><%=messages.getString("UsernameLabel")%> <%=mem.getUserName()%></p>
                <p><%=messages.getString("FirstNameLabel")%>: <%=mem.getFirstName()%></p>
                <p><%=messages.getString("LastNameLabel")%>: <%=mem.getLastName()%></p>
            </div>
            <%
                String action = request.getParameter("choice");
                String message = messages.getString("AddAdminButton");

                if (action.equals(message))
                {

            %>

            <div id="MemberButton">
                <form action="MemberActionServlet" method="post"> 
                    <p><input type="hidden" name="action" value="AddAdmin" /></p>
                    <input type="hidden" name="AddAdmin" value="<%= m.getMemberId()%>" />



                    <p><input type="submit" value="<%=messages.getString("MakeAdminButton")%>" /></p>

                </form> 

                <%
                } else
                {

                %>
                <form action="MemberActionServlet" method="post"> 
                    <td><input type="hidden" name="action" value="Remove Member" /></td>
                    <input type="hidden" name="removeMember" value="<%= m.getMemberId()%>"/>

                    <td><input type="submit" value="<%=messages.getString("RemoveMemberButton")%>" /></td>
                </form>    
            </div>     



        </div>
</div>
</tr>
</table>


<%       }

        }
%>







</div>

</body>
</html>
