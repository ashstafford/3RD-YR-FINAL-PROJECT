/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Command;

import Daos.MemberDao;
import Dtos.Member;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ash
 */
public class ViewAllMembersCommand implements Command
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
			
                MemberDao mDao = new MemberDao();
               
                List<Member> Members = new ArrayList<>();
                Members = mDao.getAllMembers();
                   
//                for(Member m : Members)
//                {
//                    if(m.isAdmin() == true)
//                    {
//                        Members.remove(m);
//                    }    
//                }  
//                
                session.setAttribute("AllMembers", Members);
                
                
               forwardToJsp = "/SelectMember.jsp";	
              
                
      return forwardToJsp;                
     } 
}
