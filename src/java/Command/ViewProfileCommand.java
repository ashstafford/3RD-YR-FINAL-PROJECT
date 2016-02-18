/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Aisling
 */
public class ViewProfileCommand implements Command
{
    
    /**
     *
     * @param request
     * @param response
     * @return
     */
    public String execute(HttpServletRequest request, HttpServletResponse response) 
    {
            String forwardToJsp;
       
            HttpSession session = request.getSession();

            //User not logged in...            else
//
//            if ( session.getId() != session.getAttribute("loggedSessionId") )   
//            {
//                forwardToJsp = "/Login.html";
//            }
//            else
//            {	
                //User is logged in...
                //We already have the User object stored in the session...
                //Just forward to the view (viewProfile.jsp)...
                forwardToJsp = "/myProfile.jsp";	
//            }
            
     return forwardToJsp;       
    }
}
