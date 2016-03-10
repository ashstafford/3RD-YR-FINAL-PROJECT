<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        
        <style>  
         body 
            {
            background-image: url("IMG_loginBackground.jpg");
     
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
      
    <div id="register">  
        <h1> Register </h1>   
    <form action="MemberActionServlet" method="post">
                <table>
                    <tr>
                        <td> Username  : </td><td> <input name="userName" placeholder="MUST be at least 4 characters" size=25 type="text" /> </td> 
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td> Password  : </td><td> <input name="password" placeholder="MUST be at least 8 characters " size=25 type="password" /> </td> 
                    </tr>
                     <tr>
                        <td> First name  : </td><td> <input name="firstName" size=25 type="text" /> </td> 
                    </tr>
                     <tr>
                        <td> Last name  : </td><td> <input name="lastName" size=25 type="text" /> </td> 
                    </tr>
                     <tr>
                        <td> E-Mail  : </td><td> <input name="email" placeholder="must have an '@'" size=25 type="text" /> </td> 
                    </tr>
                     <tr>
                        <td> Profile Image url  : </td><td> <input name="memberImageUrl" size=25 type="text" /> </td> 
                    </tr>
                     <tr>
                        <td></td> 
                        <td> What was the name of your first pet? </td> 
                     </tr>
                     <tr>
                        <td> Security Question Answer  : </td><td> <input name="securityQuestionAnswer" size=25 type="text" /> </td> 
                    </tr>
                    
                </table>
                
                <input type="hidden" name="action" value="register"/>
                <input type="submit" value="Register"  />
      </form>
    </div>     
  </body>     
</html>
