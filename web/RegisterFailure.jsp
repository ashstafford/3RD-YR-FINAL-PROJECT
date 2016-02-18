<%-- 
    Document   : RegisterFailure
    Created on : 08-Dec-2015, 12:23:58
    Author     : Aisling
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <style>  
         body 
            {
            background-image: url("IMG_registerBackground.jpg");
            }
            
             div
            {
                 color: #ffffff;
                 padding: 150px;
                 margin: 150px;
                 float:top;
                 margin-top: 100px;
                 font-size: 20px;
   
            }
        </style>
        
    </head>
    <body>
      <div id="registerFailed">    
        <h1>Register Failed</h1>

        <form action = "Register.jsp" method = "post">
               
      
               <p> 
                  <input type = "submit" name = "Register" value = "Return to Register" />
               </p>
       </form>
        
       <form action = "Login.html" method = "post">
               
      
               <p> 
                  <input type = "submit" name = "Login" value = "Return to Login"/>
               </p>
       </form>
        
      </div>
    </body>
       </html>
