/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Command;

import Daos.MemberDao;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author aisling
 */
public class RemoveMemberCommand implements Command
{
    
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)
    {
           String forwardToJsp = "";
            
           HttpSession session = request.getSession();

           MemberDao mDao = new MemberDao();
           
           String id = request.getParameter("removeMember"); 
           
          if(id != null)
          {
             int memberId = Integer.parseInt(id);
             
             boolean removed = mDao.removeMember(memberId);
   
             if(removed == true)
             {    
                 String removeMember = session.getId();
                 forwardToJsp = "/MemberRemovedSuccess.jsp";
             }
               
          } 
     return forwardToJsp;     
    }
  
}
