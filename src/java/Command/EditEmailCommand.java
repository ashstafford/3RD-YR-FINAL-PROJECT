/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Command;

import Daos.MemberDao;
import Dtos.Member;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author d00153612
 */
public class EditEmailCommand implements Command
{

    /**
     *
     * @param request
     * @param response
     * @return
     */
    public String execute(HttpServletRequest request, HttpServletResponse response) 
    {
           HttpSession session = request.getSession();
           String forwardToJsp = "";
           Member m = (Member) session.getAttribute("member");
           MemberDao mDao = new MemberDao();

           String newEmail = request.getParameter("editEmail");
           
           if(newEmail != null)
           {
               
             boolean updated =  mDao.editUserName(m.getEmail(),newEmail);
   
                if(updated == true)
                {    

                     String EmailEdit = session.getId();
           
                     m.setEmail(newEmail);
           
                    forwardToJsp = "/myProfile.jsp";
               }  
           }   
               
          
           
     return forwardToJsp;       
     }
}

