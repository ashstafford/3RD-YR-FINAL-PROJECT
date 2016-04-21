/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Command;

import Daos.HashPasswordMD5;
import Daos.MemberDao;
import Dtos.Member;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Aisling
 */
public class EditPasswordCommand implements Command
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
           
           String regexPass = "[a-zA-Z0-9]{8,}";
           boolean passValid = false;
           
           String currentPassword = request.getParameter("currentPassword");
           
           if(m.getPassword().equals(currentPassword))  //if password matchs one in members account
           {
         
                    String password = request.getParameter("editPassword");

                    if(password.matches(regexPass))
                    {
                        passValid = true;
                    } 

                    if(password != null && passValid != false)
                    {

                        boolean updated =  mDao.editPassword(m.getMemberId(),m.getPassword(),password);

                         if(updated == true)
                         {    

                             HashPasswordMD5 hp = new HashPasswordMD5();
                             String hashedPassword = hp.hashPassword(password);

                             String passwordEdit = session.getId();

                             m.setPassword(hashedPassword);

                             forwardToJsp = "/myProfile.jsp";
                        }  
                    }   
           }
           else
           {
               forwardToJsp = "/editPassword.jsp";
           }    


              return forwardToJsp;       
     }
}
