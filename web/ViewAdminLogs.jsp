<%-- 
    Document   : ViewAdminLogs
    Created on : 25-Apr-2016, 15:54:35
    Author     : d00155224
--%>

<%@page import="Dtos.AdminLog"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Log</title>
    </head>
    <body>
       <%
                    List<AdminLog> logs;
                    logs = (List) (request.getSession().getAttribute("adminLogs"));
                    
                
                    
                    if (logs != null) 
                    { 
                %>        
 
<%
                    for (AdminLog adLog : logs) 
                    {
%>
                
                   Changes Made To : <%=adLog.getDetails()%>

                   Change Made : <%=adLog.getMessage()%>
                   Time : <%=adLog.getMessageTime()%>
                   
                   

        
               
            <%
                    }
                }
                       
%>
    </body>
</html>
