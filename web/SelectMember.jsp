<%-- 
    Document   : SelectMember
    Created on : Mar 22, 2016, 9:19:56 PM
    Author     : Ash
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Dtos.Member"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="mainCSS.css" >
        <title>Select Member</title>
    </head>
     </head>   
    <body>
        
   <div id="container">  
          <nav class = "topmenu">
            <ul class="navigation">
                    <li><a href="MemberActionServlet?action=viewProfile">My Profile</a></li>
                    
            
       
      
          
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
               <p><td> <input name="searchName" size=30 type="text" />  
                 <input type="hidden" name="action" value="searchName" />
                 <input type="submit" value="Search"/>
               </p>
        </form>
        </div>
        
    </ul>
           
           
</nav>
                  
        
      <div id="pagecontent2">
        
          <div id="overall2"></div>
          
        <table>
   
  
                <%
                  
                    List<Member> AllMembers = (List) (request.getSession().getAttribute("AllMembers"));
                   
                    List<Member> Members = new ArrayList<Member>();
                    
                    for (Member m : AllMembers) 
                    {
                        if(m.isAdmin() == false)
                        {
                            Members.add(m);
                        }    
                    }
                    
                    if (Members != null) 
                    {    
                        for (Member m : Members) 
                        {
                           
                %>
            <form action="MemberActionServlet" method="post">
              
           
           <tr>
               <div id="overallMain">
           <div id="profileImage">   
                <img src="<%=m.getMemberImageUrl()%>" style="width: 300px; height: 250px;">     
           </div>

           <div id ="profileInfo">
               <p>Username: <%=m.getUserName()%></p>
                   <p>First Name: <%=m.getFirstName()%></p>
                   <p>Last Name: <%=m.getLastName()%></p>
           </div>
                   <%  
                  String action = request.getParameter("action");

                  if(action.equals("Add Admin"))
                  {
                   
                   %>
                   
                   <div id="MemberButton">
                           <p><input type="hidden" name="action" value="AddAdmin" /></p>
                           <input type="hidden" name="AddAdmin" value="<%= m.getMemberId()%>" />
                           
                           <form action="MemberActionServlet" method="post"> 
                           
                                <p><input type="submit" value="Make Admin" /></p>
                           
                           </form> 
                 
            <%
                 } 
                 else
                 {
        
           %>
                    <td><input type="hidden" name="action" value="Remove Member" /></td>
                    <input type="hidden" name="removeMember" value="<%= m.getMemberId()%>"/>
                    <form action="MemberActionServlet" method="post"> 
                        <td><input type="submit" value="Remove Member" /></td>
                    </form>     </div>     

                
             
           </div>
               </div>
                    </tr>
                    </table>
            </form>
    
        <%       } 
               
              }
           }
          else
          {
            out.println("sorry not found!!");
          }        
            %>


        
          
        
        
      
</div>
        
    </body>
</html>
