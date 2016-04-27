<%@page import="java.util.ResourceBundle"%>
<%@page import="java.util.Locale"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="images/flash3.png" type="image/gif" sizes="20x20">
        <link rel="stylesheet" type="text/css" href="mainCSS.css" >
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
        <script type="text/javascript" src="js/autoCompleter.js"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
        
        <title>Register</title>
<% 
   
        Locale userSetting = (Locale) session.getAttribute("locale");
       
        if(userSetting == null)
        {
            userSetting = request.getLocale();
        }
   
    ResourceBundle messages = ResourceBundle.getBundle("properties.text", userSetting);
%>
  
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
                
                <div id="registerTitle">
                <h1><%=messages.getString("registerTitle")%></h1>
                </div>
                
                 <div id="register">  
           
    <form action="MemberActionServlet" method="post" >
                
                    <div id="RegisterPersonalDetailsTitle">
                        <h3><%=messages.getString("personalDetailsHeader")%></h3>
                        <hr>
                     
                         <div id="firstnameTable">
                             <table>
                                <tr>
                                    <label for="exampleInputFirstname"><%=messages.getString("FirstNameLabel")%>: <span style="color:red;">*</span></label> 
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
                                    <label for="exampleInputLastname"><%=messages.getString("LastNameLabel")%>: <span style="color:red;">*</span></label>
                               </tr>
                               <tr>
                                   <td> <input name="lastName" class="resizedTextBox" size=25 type="text" required /> </td> 
                               </tr>
                             </table>
                         </div>
                        <div id="emailTable">
                            <table>
                                <tr>
                                    <label for="exampleInputEmail"><%=messages.getString("EmailAddressLabel")%>: <span style="color:red;">*</span></label>
                               </tr>
                               <tr>
                                   <td> <input name="email" class="resizedTextBox" placeholder="MUST have an '@'" size=25 type="text" required /> </td> 
                               </tr>
                            </table>
                        </div>
                    </div>
                    
                    <div id="RegisterLoginDetailsTitle">
                        <h3><%=messages.getString("LoginDetailsHeading")%></h3>
                        <hr>
                    
                        <div id="RegisterUsernameTable">
                            <table>
                                <tr>
                                    <label for="exampleInputUsername"><%=messages.getString("UsernameLabel")%>: <span style="color:red;">*</span></label> 
                               </tr>
                               <tr>
                                   <td> <input name="userName" class="resizedTextBox" placeholder="MUST be at least 4 characters" size=25 type="text" required /> </td>
                               </tr>
                            </table>
                        </div>
                        
                        <div id="RegisterPasswordTable">
                            <table>
                                <tr>
                                    <label for="exampleInputPassword"><%=messages.getString("PasswordLabel")%>: <span style="color:red;">*</span></label>
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
                                    <label for="exampleInputSecurityQu"><%=messages.getString("SecurityQuestionLabel")%>: <span style="color:red;">*</span></label>
                                </tr>
                                <tr>
                                    <td><%=messages.getString("SecurityQuestion")%></td> 
                                 </tr>
                                <tr>
                                    <td> <input name="securityQuestionAnswer" class="resizedTextBox" size=25 type="text" required /> </td> 
                                </tr>
                            </table>
                        </div>
                        
                        
                
                    
                
                <div id="RegisterSubmitButton">
                    <input type="hidden" name="action" value="register"/>
                    <input type="submit" class="resizedButton" value="<%=messages.getString("CreateAccountButton")%>"  />
                </div>
                
                
      </form>
                     <div id="RegisterBackButton">
                    <form action = "Login.jsp" method = "post">
                        <p> 
                           <input type = "submit" class="resizedButton" name = "Login" value = "<%=messages.getString("ReturnToLoginButton")%>"/>
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
