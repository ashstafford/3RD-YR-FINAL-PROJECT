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
 * @author Aisling
 */
public class EditFirstNameCommand implements Command
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

           String newName = request.getParameter("editFirstName");
           
           if(newName != null)
           {
               
             boolean updated =  mDao.editFirstName(m.getMemberId(),m.getFirstName(),newName);
   
                if(updated == true)
                {    
          
                     String fNameEdit = session.getId();
           
                     m.setFirstName(newName);
          
                    forwardToJsp = "/myProfile.jsp";
                    
                
               }  
           }   
               
          
           
     return forwardToJsp;       
     }
  }
