<%-- 
    Document   : HomePage
    Created on : 10-Mar-2016, 01:20:42
    Author     : Karen.Aungier
--%>

<%@page import="java.util.ResourceBundle"%>
<%@page import="java.util.Locale"%>
<%@page import="Dtos.Member"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <link rel="stylesheet" type="text/css" href="mainCSS.css" >
        <link rel="stylesheet" type="text/css" href="HomepageSlider.css" >
        <script type="text/javascript" src="HomepageImageSliderScript.js"></script>
       
    
        <% 
    // Get the request parameter
    Locale userSetting = null;
    
    String language = request.getParameter("lang");
    
    
    if(language != null)
    {
        userSetting = new Locale(language);
        session.setAttribute("locale", userSetting);
    }
    else
    {
        userSetting = (Locale) session.getAttribute("locale");
        if(userSetting == null)
        {
            userSetting = request.getLocale();
        }
    }
   
    ResourceBundle messages = ResourceBundle.getBundle("properties.text", userSetting);
%>
     
<style>
            
            




        </style>
        <script>
        </script>
        
        
    </head>
    <body>
        
        <div id="container">
            
        <nav class = "topmenu">
            <ul class="navigation">
 
         <%  Member m = (Member)session.getAttribute("member"); 
         
        if(m == null)
        {
            
         %>
        
         <li><a href="Login.jsp"><%=messages.getString("MenuButtonLogin")%></a></li>
           
            
        <li><a href="Register.jsp"><%=messages.getString("MenuButtonRegister")%></a></li>
       </ul>
     </nav>  
        <%
        
        }
        else
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
        <form action="HomePage.jsp">
        <li><select name ="lang" onchange="submit()">
            <option name="Default">Language...</option>
            <option value="en">English</option>
            <option value ="ru">Russian</option>
            <option value="fr">French</option>
            
        </select>
        </form></li>
        
        <div id="searchbar">
        <form  action = "MemberActionServlet" method = "post" >
               <td> <input name="searchName" size=30 type="text" />  
                 <input type="hidden" name="action" value="searchName" />
                 <input type="submit" value="<%=messages.getString("SearchBarButton")%>"/>
               </td>
        </form>
        </div>
        
    </ul>
           
           
</nav>
            
            
            <div id="pagecontent2">
                     
               <div id="slider">

			<div id="mover">
		
				<div id="slide-1" class="slide">
				
					<h1>The Walking Dead</h1>
					
					<p class = "slideshowInfo">The Walking Dead is one of the most popular television shows at the moment. We have the latest merchandise at a great price!</p>
					
					<a href="MemberActionServlet?action=The Walking Dead"><img src="slide-1-.png" alt="learn more" /></a>
					
				</div>
				
				<div class="slide">
				
					<h1>Marvel Merchandise</h1>
					
					<p class = "slideshowInfo">Here at In a Flash we stock all the latest Merchandise from all the latest Movies. We currently have 10% off all Deadpool Merchandise. Only while stock lasts!</p>
					
					<a href="MemberActionServlet?action=Marvel"><img src="slide-2.png" alt="learn more" /></a>
					
				</div>
				
				<div class="slide">
				
					<h1>Disney Merchandise</h1>
					
					<p class = "slideshowInfo">In our store we stock great products at great prices. Our Disney Merchandise is perfect for both kids and adults. Buy Now</p>
					
					<a href="MemberActionServlet?action=Disney"><img src="slide-3.png" alt="learn more" /></a>
					
				</div>
			
			</div>
		
		</div>
                
                
                <div id="DisneyAdvert">
                    <a href="MemberActionServlet?action=Disney"><img src="images/DisneyAd.jpg" style="width: 29%; height: 30%;"></a>
                </div>
                
                <div id="HarryPotterAdvert">
                    <a href="MemberActionServlet?action=Harry Potter"><img src="images/HarryPotterAd.jpg" style="width: 29%; height: 30%;"></a>
                </div>
                
                <div id="GOTAdvert">
                    <a href="MemberActionServlet?action=Game Of Thrones"><img src="images/gameofthronesAd.jpg"></a>
                </div>
                
                <div id="deadpoolAdvert">
                    <a href="MemberActionServlet?action=Marvel"><img src="images/DeadpoolAdvertisment.jpg" style="width: 60%; height: 30%;"></a>
                </div>
                
                
       
</div>
            
    </body>
</html>
</html>
