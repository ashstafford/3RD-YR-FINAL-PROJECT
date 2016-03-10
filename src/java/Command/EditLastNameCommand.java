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
 * @author Benjamin
 */
public class EditLastNameCommand implements Command
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

           String newName = request.getParameter("editLastName");
           
           if(newName != null)
           {
               
             boolean updated =  mDao.editLastName(m.getMemberId(),m.getLastName(),newName);
   
                if(updated == true)
                {    

                     String lNameEdit = session.getId();
           
                     m.setLastName(newName);
           
                    forwardToJsp = "/myProfile.jsp";
               }  
           }   
               
          
           
     return forwardToJsp;       
     }
}
