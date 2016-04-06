<%-- 
    Document   : HomePage
    Created on : 10-Mar-2016, 01:20:42
    Author     : Karen.Aungier
--%>

<%@page import="Dtos.Member"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <link rel="stylesheet" type="text/css" href="mainCSS.css" >
        <script type="text/javascript" src="HomepageImageSliderScript.js"></script>
        <style>
            

/* *** homepage SlideShow *** */

*
{ margin: 0; 
  padding: 0; 
}

a
{ 
    text-decoration: none; outline: none; 
}
a img							
{ 
    border: none; 
}

h2								
{ 
    font-family: Georgia, Serif; 
    font-size: 36px; 
    text-align: center;                                                               
    font-weight: normal; 
}

#page-wrap						
{ 
    background: white; width: 960px; margin: 0 auto;                                                            
    padding: 50px 0; 
}

#slider							
{ 
    background: white url(../images/slider-bg.jpg); 
    height: 227px; 
    overflow: hidden;                                                               
    position: relative; 
    margin: 50px 0; 
}

  /* DEFAULT is for three panels in width, adjust as needed
  This only matters if JS is OFF, otherwise JS sets this. */								  
#mover							
{ 
    width: 100%; 
    height: 100%;
    position: relative; 
}

.slide							
{ 
    padding: 40px 30px; 
  width: 1500px; 
  float: left; 
  position: relative; 
}
.slide h1						
{
    font-family: Helvetica, Sans-Serif; 
    font-size: 30px; 
    letter-spacing: -1px;
    color: black; 
}
.slide .slideshowInfo						
{
    color: #666666; 
    font-size: 18px; 
    line-height: 22px; 
    width: 300px; 
    font-family: Arial, Helvetica, sans-serif;
    font-weight:500;
    padding-top:8px;
}
.slide img						
{
    position: absolute; 
    top: 20px; 
    left: 400px; 
}
#slider-stopper					
{ position: absolute; 
  top: 1px; 
  right: 20px; 
  background: #777; 
  color: white;
  padding: 3px 8px; 
  font-size: 12px; 
  text-transform: 
  uppercase; z-index: 1000;
  font-family: Arial, Helvetica, sans-serif;
}

        </style>
        <script>
        </script>
        
        
    </head>
    <body>
        
        <div id="container">
            
        <nav class = "topmenu">
            <ul class="navigation">
                    <li><a href="MemberActionServlet?action=viewProfile">My Profile</a></li>
                    
            
       
      
          
         <%  Member m = (Member)session.getAttribute("member"); 
         
       // if(m == null)
       // {
            
         %>
        
         <li><a href="Login.jsp">Login</a></li>
           
            
        <li><a href="Login.jsp">Sign Up</a></li>
        
        <%
        
        //}
       // else
       // {
      
            
        %>
            
           <li><a href="MemberActionServlet?action=logout">Logout</a></li>
                      
   </ul>
     </nav> 
        <%  
       // }
        %>
            <div id="banner">
                <img src="tempBanner.jpg"/>
            </div>
  
       <nav class="menu-1">
    <ul class="menu">
        <li> <a href="/Login.html/Login.html/HomePage.jsp">Home</a> </li>
        <li> <a href="MemberActionServlet?action=ViewAllProducts">Shop</a> </li>
        <li> <a href="/Login.html/About.jsp">About</a> </li>
        
        <li> <a href="MemberActionServlet?action=ViewPreviousOrders">View Orders</a> </li>
        
        <li> <a href="/Login.html/ContactUs.jsp">Contact</a> </li>
        <li> <a href="/Login.html/Cart.jsp">Cart</a> </li>
        
        <div id="searchbar">
        <form  action = "MemberActionServlet" method = "post" >
               <td> <input name="searchName" size=30 type="text" />  
                 <input type="hidden" name="action" value="searchName" />
                 <input type="submit" value="Search"/>
               
        </form>
        </div>
        
    </ul>
           
           
</nav>
            
            
            <div id="pagecontent2">
                
                <!--
                
               <ul class="slides">
                <input type="radio" name="radio-btn" id="img-1" checked />
                <li class="slide-container">
		<div class="slide">
			<img src="walkingdeadBanner.jpg" />
                </div>
		<div class="nav">
			<label for="img-6" class="prev">&#x2039;</label>
			<label for="img-2" class="next">&#x203a;</label>
		</div>
    </li>

    <input type="radio" name="radio-btn" id="img-2" />
    <li class="slide-container">
        <div class="slide">
          <img src="images/starwarsBanner.jpg" />
        </div>
		<div class="nav">
			<label for="img-1" class="prev">&#x2039;</label>
			<label for="img-3" class="next">&#x203a;</label>
		</div>
    </li>

    <input type="radio" name="radio-btn" id="img-3" />
    <li class="slide-container">
        <div class="slide">
          <img src="doctorwhoBanner.jpg" />
        </div>
		<div class="nav">
			<label for="img-2" class="prev">&#x2039;</label>
			<label for="img-4" class="next">&#x203a;</label>
		</div>
    </li>

    <input type="radio" name="radio-btn" id="img-4" />
    <li class="slide-container">
        <div class="slide">
          <img src="disneyBanner.png" />
        </div>
		<div class="nav">
			<label for="img-3" class="prev">&#x2039;</label>
			<label for="img-5" class="next">&#x203a;</label>
		</div>
    </li>

    

    <li class="nav-dots">
      <label for="img-1" class="nav-dot" id="img-dot-1"></label>
      <label for="img-2" class="nav-dot" id="img-dot-2"></label>
      <label for="img-3" class="nav-dot" id="img-dot-3"></label>
      <label for="img-4" class="nav-dot" id="img-dot-4"></label>
      
    </li>
</ul>-->
               
               
               <div id="slider">

			<div id="mover">
		
				<div id="slide-1" class="slide">
				
					<h1>The Walking Dead</h1>
					
					<p class = "slideshowInfo">The Walking Dead is one of the most popular television shows at the moment. We have blahh blahh blahhh</p>
					
					<a href="TwdPage.jsp"><img src="slide-1-.png" alt="learn more" /></a>
					
				</div>
				
				<div class="slide">
				
					<h1>Marvel Merchandise</h1>
					
					<p class = "slideshowInfo">Here at In a Flash we stock all the latest Merchandise from all the latest Movies. We currently have 10% off all Deadpool Merchandise. Enjoy</p>
					
					<a href="MavelPage.jsp"><img src="slide-2.png" alt="learn more" /></a>
					
				</div>
				
				<div class="slide">
				
					<h1>Disney Merchandise</h1>
					
					<p class = "slideshowInfo">In our store we stock great products at great prices. Our Disney Merchandise is perfect for both kids and adults. Buy Now</p>
					
					<a href="DisneyPage.jsp"><img src="slide-3.png" alt="learn more" /></a>
					
				</div>
			
			</div>
		
		</div>
                
                
                
       
</div>
            
    </body>
</html>
</html>
