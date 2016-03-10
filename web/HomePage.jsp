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
        <style>
            
            div#welcomeBanner img{
    width: 80%;
    height: 300px;
    padding-top: 100px;
    padding-left: 125px;
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
         
        if(m == null)
        {
            
         %>
        
         <li><a href="/CA3WebApp/Login.html">Login</a></li>
            
            
        <li><a href="/CA3WebApp/Login.html">Sign Up</a></li>
       
        <%
        
        }
        else
        {
      
            
        %>
            
           <li><a href="MemberActionServlet?action=logout">Logout</a></li>
                      
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
            
            
            <!--<div id="side_bar">
 	
            </div>-->
            
            <div id="pagecontent2">
                
                <div id="welcomeBanner">
			<img src="welBanner.jpg" />
                </div>
                
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
</ul>
                
     <!--<div class="view view-first">  
     <img src="starwars_homepage.jpg" />  
     <div class="mask">  
     <h2>Starwars Merchandise</h2>  
     <p>Get all your unique Starwars merchandise at a great price!</p>  
         <a href="/CA3WebApp/CategorySelection.html" class="info">Shop Now</a>  
     </div> 
	  </div>
	 
	 <div class="view2 view-first">  
     <img src="deadpool_homepage.jpg" />  
     <div class="mask">  
     <h2>Marvel</h2>  
     <p>This is the most popular movie at the minute, so get your Merch now at a great price</p>  
         <a href="/CA3WebApp/CategorySelection.html" class="info">Shop Now</a>  
     </div>
	 </div>
                
            
        <div class="view3 view-first">  
     <img src="dc_homepage.jpg" />  
     <div class="mask">  
     <h2>DC Comics</h2>  
     <p>In our store we have a huge range of products at a great price! Shop now!</p>  
         <a href="/CA3WebApp/CategorySelection.html" class="info">Shop Now</a>  
     </div> 
	</div>
	
	<div class="view4 view-first">  
     <img src="disney_homepage.jpg" />  
     <div class="mask">  
     <h2>Disney</h2>  
     <p>This is a very popular theme within our store, we have great quality products so have a look here! Click here</p>  
         <a href="/CA3WebApp/CategorySelection.html" class="info">Shop Now</a>  
     </div> 
	</div>-->
           
</div>
        

        
        
    </body>
</html>