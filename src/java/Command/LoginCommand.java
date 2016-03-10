/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Command;

import Dtos.Member;
import Service.MemberService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Aisling
 */
public class LoginCommand implements Command 
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
            
            MemberService mService = new MemberService();  
      
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            System.out.println("username" + username);
            System.out.println("pass " + password);
            if (username != null && password != null && !username.isEmpty() && !password.isEmpty())
            {
                Member memberLogin = mService.login(username, password);
                //System.out.println("m " + memberLogin.toString());
                
                if (memberLogin != null)
                {
                    //If login successful, store the session id for this client...
                    HttpSession session = request.getSession();
                    String clientSessionId = session.getId();
                    session.setAttribute("loggedSessionId", clientSessionId);

                    session.setAttribute("member", memberLogin);

                    forwardToJsp = "/myProfile.jsp";
                } 
                else
                {
                    forwardToJsp = "/LoginFailure.jsp";
                }
            } 
            else
            {
                forwardToJsp = "/LoginFailure.jsp";
            }
            
      return forwardToJsp;
    }
}   
    
