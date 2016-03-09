<%-- 
    Document   : ForgotPassword
    Created on : Mar 9, 2016, 4:55:11 PM
    Author     : Ash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <form action="MemberActionServlet" method="post">
                <table>
                    <tr>
                        <td>enter your email: </td><td> <input name="email" size=15 type="text" /> </td> 
                    </tr>
                    <tr>
                        <td>What was the name of your first pet? </td><td><input name="securityQuestionAnswer" size=15 type="text" /> </td> 
                    </tr>
                </table>
                
                <input type="hidden" name="action" value="resetPassword" />
                <input type="submit" value="Next" />
            </form>
    </body>
</html>
