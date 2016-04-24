<%-- 
    Document   : ConfirmPassword
    Created on : Apr 24, 2016, 12:46:15 PM
    Author     : Ash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirm Password</title>
    </head>
    <body>
        
      <form action = "MemberActionServlet" method = "post"> 
            
        <div id="EditslabelPosition">
          <label for="exampleInputEditFirstname">Enter your current Password: <span style="color:red;">*</span></label>   
        </div>
        <div id="EditsTextboxandButtonPosition">  
          <input name="currentPassword" class="resizedTextBox"  placeholder="MUST be at least 8 characters " type="password" size=15 />
        </div>
        
        
         <input type = "hidden" name="action" value = "Confirm Password"/>
         <input type = "submit" style="width:300px; height: 35px;" value="Next" />
      
      </form> 
    </body>
</html>
