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
public class EditMemberImageUrlCommand implements Command
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

           String newMemberImageUrl = request.getParameter("editMemberImageUrl");
           
           if(newMemberImageUrl != null)
           {
               
             boolean updated =  mDao.editMemberImageUrl(m.getMemberImageUrl(),newMemberImageUrl);
   
                if(updated == true)
                {    

                     String MemberImageUrlEdit = session.getId();
           
                     m.setMemberImageUrl(newMemberImageUrl);
           
                    forwardToJsp = "/myProfile.jsp";
               }  
           }   
               
          
           
     return forwardToJsp;       
     }
}


