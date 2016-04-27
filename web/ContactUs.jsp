<%-- 
    Document   : ContactUs
    Created on : 18-Feb-2016, 10:48:05
    Author     : D00154410
--%>

<%@page import="java.util.ResourceBundle"%>
<%@page import="java.util.Locale"%>
<%@page import="Dtos.Member"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
           
          <div id ="ContactHeading">
              <h1><%=messages.getString("ContactUsLabel")%></h1>
              <hr></hr>
          </div>
          
          <br>
          <br>
          
          <div id="ContactUsInfo">
              <td><p><%=messages.getString("ContactUsInfoText")%></p></td>
          </div>
          <div id="ContactUsInfo2">
              
              <div id="ContactInfoHeadings">
                    <td><p><%=messages.getString("EmailAddressLabel")%><p></td>
              </div>
              
              <div id="ContactInfo">
                  <td><p>inaflashInfo@gmail.com</p></td>
              </div>
              
              <div id="ContactInfoHeadings">
                    <td><p><%=messages.getString("PhoneNoLabel")%></p></td>
              </div>
              
              <div id ="ContactInfo">
                    <p>0854676433</p>
              </div>
              
              <div id="ContactInfoHeadings">
                    <td><p><%=messages.getString("AddressLabel")%></p></td>
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
                  <h3><%=messages.getString("MapHeadingLabel")%></h3>
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
       </div>
    </body>
</html>
