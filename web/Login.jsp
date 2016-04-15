<%-- 
    Document   : Login
    Created on : 10-Mar-2016, 08:43:04
    Author     : Karen.Aungier
--%>

<%@page import="java.util.ResourceBundle"%>
<%@page import="java.util.Locale"%>
<%@page import="Dtos.Member"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="mainCSS.css" >
        
<% 
   
        Locale userSetting = (Locale) session.getAttribute("locale");
       
        if(userSetting == null)
        {
            userSetting = request.getLocale();
        }
   
    ResourceBundle messages = ResourceBundle.getBundle("properties.text", userSetting);
%>

 <script>
    function goBack()
    {            
        window.history.back();
    }
</script>
         <style>
             div#login{
                 padding-left:580px;
                 padding-top:50px;
                 max-width: 600px;
                 font-family: Arial, Helvetica, sans-serif;
                 
             }
             div#loginTitle
             {
                padding-left:70px;
                padding-top:10px;
                font-family: Arial, Helvetica, sans-serif;
             }
             div#NewCustomersTitle
             {
                padding-left:70px;
                padding-top:50px;
                max-width: 400px;
                font-family: Arial, Helvetica, sans-serif;
                float:left;
                clear:left;
             }
             
             div#PasswordTable
             {
                 padding-top: 6px;
             }
             
             label { font-weight: bold; }
             
             
             div#ad img{
                 padding-left:50px;
                 padding-top:80px;
                 padding-bottom: 70px;
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
               <p><td> <input name="searchName" size=30 type="text" />  
                 <input type="hidden" name="action" value="searchName" />
                 <input type="submit" value="<%=messages.getString("SearchBarButton")%>"/>
               </p>
        </form>
        </div>
        
    </ul>
           
           
</nav> 
            
            
            <!--<div id="side_bar">
 	
            </div>-->
            
            <div id="pagecontent3">
                
                <div id="loginTitle">
                <h1><%=messages.getString("LoginTitle")%></h1> 
                </div>
                
                <div id ="NewCustomersTitle">
                    <h2><%=messages.getString("NewCustomersTitle")%></h2>
                    <hr>
                    <br>
                    <p>
                        Creating a login profile with our store allows you to shop faster, track the status of your cart and review your previous orders.
                    </p>
                    
                    <br>
                    
                    <form action = "Register.jsp" method = "post">
                        <p> 
                            <input type = "submit" class="resizedButton" name = "Register" value = "<%=messages.getString("RegisterButton")%>" />
                        </p>
                    </form>
                </div>
                
                
                <div id="login">
                    
                    
                    <h2><%=messages.getString("registeredUserTitle")%></h2>
                    <hr>
                    <br>
                    <p>
                        If you have an account with us, please log in below.
                    </p>
                    
                    <br>
                    
                <form action="MemberActionServlet" method="post">
            
                <table>
                    <tr>
                        <div id="UsernameLabel">
                            <label for="exampleInputUsername2"><%=messages.getString("UsernameLabel")%>: <span style="color:red;">*</span></label>
                        </div>
                    </tr>
                    <tr>
                            <td> <input  name="username" class="resizedTextBox"  type="text" required  size="35"  /> </td>
                    </tr>
                </table>
                
                    <div id="PasswordTable">
                <table>
                    <tr>
                        <label for="exampleInputPassword"><%=messages.getString("PasswordLabel")%>: <span style="color:red;">*</span></label> 
                    </tr>
                    <tr>
                        <td><input name="password" class="resizedTextBox" size="35" type="password" required /> </td>
                    </tr>
                </table>
                    </div>
                
                    <br>
                <input type="hidden"  name="action" value="login" />
                <input type="submit" class="resizedButton"  name="Login" value="<%=messages.getString("LoginButton")%>"  />
            
            </form>

                    <br>
                    <br>
         <p> <%=messages.getString("forgotPasswordTitle")%></p>
        
         <form action = "ForgotPassword.jsp" method = "post">
               
      
               <p> 
                  <input type = "submit" class="resizedButton"  name = "forgot Password"  value = "<%=messages.getString("forgotPasswordButton")%>" />
               </p>
            </form>
       </div>
           
                <div id="ad">
                    <a href="MemberActionServlet?action=ViewAllProducts"><IMG BORDER="0" src="harryPotterAd.jpg"></A>	
                </div>
                
                
            </div>
        
    </body>
</html>
