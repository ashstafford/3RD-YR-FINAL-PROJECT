<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="mainCSS.css" >
        <title>Register</title>
        
        <style>  
            div#register{
                 padding-left:70px;
                 padding-top:20px;
                 font-family: Arial, Helvetica, sans-serif;
                 
             }
             div#registerTitle
             {
                padding-left:70px;
                padding-top:18px;
                font-family: Arial, Helvetica, sans-serif;
             }
             div#RegisterPersonalDetailsTitle
             {
                 max-width: 1090px;
                font-family: Arial, Helvetica, sans-serif;
             }
             
             label { font-weight: bold; }
             
             div#RegisterPersonalDetailsTitle table
             {
                 font-family: Arial, Helvetica, sans-serif;
             }
             div#RegisterLoginDetailsTitle
             {
                 padding-top:50px;
                 max-width: 1090px;
                font-family: Arial, Helvetica, sans-serif;
             }
             div#firstnameTable
             {
                 padding-top:10px;
             }
             div#lastnameTable
             {
                 padding-top:8px;
             }
             div#emailTable
             {
                 padding-top:8px;
             }
             div#RegisterUsernameTable
             {
                 padding-top:10px;
             }
             div#RegisterPasswordTable
             {
                 padding-top:8px;
             }
             div#RegisterSecurityQutable
             {
                 padding-top:8px;
             }
             div#RegisterSubmitButton
             {
                 padding-top: 85px;
                 float:right;
                 clear: left;
             }
             div#RegisterBackButton
             {
                 padding-top: 70px;
                 padding-right: 10px;
                 float:right;
                 clear: left;
             }
             div#ad img{
                 padding-left:0px;
                 padding-top:80px;
                 padding-bottom:70px;
                 width:92%
             }
             
             
       </style> 
      
    </head>
    
    
  <body>
      
      <div id="container">
            
        
        
            <div id="banner">
                <img src="tempBanner.jpg"/>
            </div>
  
       <nav class="menu-1">
    <ul class="menu">
        <li> <a href="/CA3WebApp/HomePage.jsp">Home</a> </li>
        <li> <a href="MemberActionServlet?action=ViewAllProducts">Shop</a> </li>
        <li> <a href="/CA3WebApp/About.jsp">About</a> </li>
        
        <li> <a href="MemberActionServlet?action=ViewPreviousOrders">View Orders</a> </li>
        
        <li> <a href="/CA3WebApp/ContactUs.jsp">Contact</a> </li>
        <li> <a href="/CA3WebApp/Cart.jsp">Cart</a> </li>
        
        <div id="searchbar">
        <form  action = "MemberActionServlet" method = "post" >
               <p><td> <input name="searchName" size=30 type="text" />  
                 <input type="hidden" name="action" value="searchName" />
                 <input type="submit" value="Search"/>
               </p>
        </form>
        </div>
        
    </ul>
           
           
</nav> 

            <div id="pagecontent3">
                
                <div id="registerTitle">
                <h1> Create an Account </h1>
                </div>
                
                 <div id="register">  
           
    <form action="MemberActionServlet" method="post" >
                
                    <div id="RegisterPersonalDetailsTitle">
                        <h3> PERSONAL DETAILS </h3>
                        <hr>
                     
                         <div id="firstnameTable">
                             <table>
                                <tr>
                                    <label for="exampleInputFirstname">First Name: <span style="color:red;">*</span></label> 
                               </tr>
                               <tr>
                                   <td> <input name="firstName" class="resizedTextBox" size=25 type="text" required /> </td>
                               </tr>
                             </table>
                         </div>
                        
                         <div id="lastnameTable">
                             <table>
                                <tr>
                                    <!--<td><span> Last Name: </span></td>-->
                                    <label for="exampleInputLastname">Last Name: <span style="color:red;">*</span></label>
                               </tr>
                               <tr>
                                   <td> <input name="lastName" class="resizedTextBox" size=25 type="text" required /> </td> 
                               </tr>
                             </table>
                         </div>
                        <div id="emailTable">
                            <table>
                                <tr>
                                    <label for="exampleInputEmail">Email Address: <span style="color:red;">*</span></label>
                               </tr>
                               <tr>
                                   <td> <input name="email" class="resizedTextBox" placeholder="MUST have an '@'" size=25 type="text" required /> </td> 
                               </tr>
                            </table>
                        </div>
                    </div>
                    
                    <div id="RegisterLoginDetailsTitle">
                        <h3> LOGIN DETAILS </h3>
                        <hr>
                    
                        <div id="RegisterUsernameTable">
                            <table>
                                <tr>
                                    <label for="exampleInputUsername">Username: <span style="color:red;">*</span></label> 
                               </tr>
                               <tr>
                                   <td> <input name="userName" class="resizedTextBox" placeholder="MUST be at least 4 characters" size=25 type="text" required /> </td>
                               </tr>
                            </table>
                        </div>
                        
                        <div id="RegisterPasswordTable">
                            <table>
                                <tr>
                                    <label for="exampleInputPassword">Password: <span style="color:red;">*</span></label>
                                </tr>
                                <tr>
                                    <td> <input name="password" class="resizedTextBox" placeholder="MUST be at least 8 characters " size=25 type="password" required /> </td> 
                                </tr>
                            </table>
                        </div>
                        
                        <br>
                        <br>
                        
                        <div id="RegisterSecurityQutable">
                            <table>
                                <tr>
                                    <label for="exampleInputSecurityQu">Security Question: <span style="color:red;">*</span></label>
                                </tr>
                                <tr>
                                    <td> What was the name of your first pet? </td> 
                                 </tr>
                                <tr>
                                    <td> <input name="securityQuestionAnswer" class="resizedTextBox" size=25 type="text" required /> </td> 
                                </tr>
                            </table>
                        </div>
                        
                        
                
                    
                
                <div id="RegisterSubmitButton">
                    <input type="hidden" name="action" value="register"/>
                    <input type="submit" class="resizedButton" value="Create Account"  />
                </div>
                
                
      </form>
                     <div id="RegisterBackButton">
                    <form action = "Login.jsp" method = "post">
                        <p> 
                           <input type = "submit" class="resizedButton" name = "Login" value = "Return to Login"/>
                        </p>
                    </form>  
                </div>
        </div>
          
        <div id="ad">
           <a href="MemberActionServlet?action=ViewAllProducts"><IMG BORDER="0" src="harryPotterAd.jpg"></A>	
        </div>
                
    </div>
        
      
      
      
        
  </body>     
</html>
