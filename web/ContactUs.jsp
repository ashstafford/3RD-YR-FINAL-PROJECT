<%-- 
    Document   : ContactUs
    Created on : 18-Feb-2016, 10:48:05
    Author     : D00154410
--%>

<%@page import="Dtos.Member"%>
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
        
        <title>Contact Us</title>
 <% 
   
        Locale userSetting = (Locale) session.getAttribute("locale");
       
        if(userSetting == null)
        {
            userSetting = request.getLocale();
        }
   
    ResourceBundle messages = ResourceBundle.getBundle("properties.text", userSetting);
%>

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
        </ul>
     </nav> 
        <%
        
        }
        else
        {
      
            
        %>
            
           <li><a href="MemberActionServlet?action=logout">Logout</a></li>
                      
   </ul>
     </nav> 
          <% } %>

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
               <td> <input name="searchName" id="searchName" size=30 type="text" />  
                 <input type="hidden" name="action" value="searchName" />
                 <input type="submit" value="Search"/>
               </p>
        </form>
        </div>
        
    </ul>
           
           
</nav>
      <div id="pagecontent3">
           
          <div id ="ContactHeading">
              <h1> Contact Us </h1>
              <hr></hr>
          </div>
          
          <br>
          <br>
          
          <div id="ContactUsInfo">
              <td><p>Thank you for your interest in our store. 
                      If you still have questions, please do not hesitate to Contact Us!</p></td>
          </div>
          <div id="ContactUsInfo2">
              
              <div id="ContactInfoHeadings">
                    <td><p>Email Address<p></td>
              </div>
              
              <div id="ContactInfo">
                  <td><p>inaflashInfo@gmail.com</p></td>
              </div>
              
              <div id="ContactInfoHeadings">
                    <td><p>Telephone Number</p></td>
              </div>
              
              <div id ="ContactInfo">
                    <p>0854676433</p>
              </div>
              
              <div id="ContactInfoHeadings">
                    <td><p>Address</p></td>
              </div>
              
              <div id="ContactInfo">
                  <td><p>Dundalk Institute of Technology,</p></td>
                    <p>Dublin Road,</p>
                    <p>Dundalk,</p>
                    <p>County Louth,</p>
                    <p>Ireland</p>
              </div>
              
             
          </div>
          
           <div id="map_heading">
                  <h3>Where we are located</h3>
           </div>
            <div id="mapDiv"></div>

<!-- Include the google maps javascript api -->
<script src="http://maps.google.com/maps/api/js?sensor=false" type="text/javascript"></script>
  
<script type="text/javascript">
var store1 = '<div id="store1_content"><h1>Dunleer</h1><div id="content"><img src = "dunleer.jpg"><p>Dunleer is my home.</p><p>For more information, see our website<br><a href="http://www.dunleer.ie">www.dkit.ie</a></p></div></div>';

var locations = [[store1, 53.983806, -6.391472, 1]];

var dkit_map = new google.maps.Map(document.getElementById('mapDiv'), 
                                     {zoom : 12,
                                      center : new google.maps.LatLng(53.983806, -6.391472),
                                      mapTypeId : google.maps.MapTypeId.ROADMAP});

var location_marker;
var mapWindow = new google.maps.InfoWindow();

for (var i = 0; i < locations.length; i++) 
{  
   location_marker = new google.maps.Marker({position : new google.maps.LatLng(locations[i][1]), 
                                           map : dkit_map});

   google.maps.event.addListener(location_marker, 'click', (function(location_marker, i) 
                                                     {
                                                        return function() 
														{
                                                           mapWindow.setContent(locations[i][0]);
                                                           mapWindow.open(dkit_map, location_marker);
                                                        }
                                                     })(location_marker, i));
}
</script>

    <div class ="images2">
                <div class="social-popout">
                    <a href="https://www.facebook.com/inaflash8/"><img src="images/facebook.png" />         
                </div>
                
                <div class="social-popout">            
                     <a href="http://www.twitter.com"><img src="images/twitter.png" />            
                </div>
                
                <div class="social-popout">             
                     <a href="http://www.googleplus.com"><img src="images/googleplus.png" />  
                </div>
                
                <div class="social-popout">            
                     <a href="https://www.instagram.com/inaflash8/"><img src="images/instagram.png" />
                </div>
                
                <div class="social-popout">         
                     <a href="http://www.pinterest.com"><img src="images/pinterest.png" />
                </div>
                
                <div class="social-popout">
                     <a href="http://www.tumblr.com"><img src="images/tumblr.png" />
                </div>
            </div>


       </div>
           
          
    </body>
</html>
