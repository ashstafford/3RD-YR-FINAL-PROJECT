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
 * @author Ash
 */
public class ResetPasswordCommand implements Command
{

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)
    {
       String forwardToJsp = "";
            
            String regexEmail = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
		+ "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";  
            
            boolean emailValid = false;
            
            String email = request.getParameter("email");
            String securityAnswer = request.getParameter("securityQuestionAnswer");

            if(email.matches(regexEmail))
            {
                emailValid = true;
            } 
            
            if (email != null && securityAnswer != null && !email.isEmpty() && !securityAnswer.isEmpty() && emailValid != false)
            {
                
                  MemberDao mDao = new MemberDao();
                  
                  Member m = mDao.findMemberByEmailAddress(email);
                  
                  HashPasswordMD5 hp = new HashPasswordMD5();
                  String hashedSecuriyAnswer = hp.hashPassword(securityAnswer);
                  
                  if(m != null && hashedSecuriyAnswer.equals(m.getSecurtiyQuestionAnswer()))
                  {
                      HttpSession session = request.getSession();
                      String clientSessionId = session.getId();
                      session.setAttribute("loggedSessionId", clientSessionId);
                      
                      session.setAttribute("member", m);
                      
                      forwardToJsp = "/EditPassword.jsp";
                  }              
                  else
                  {
                       forwardToJsp = "/AccountNotFound.jsp";
                  }    
            }
            else
            {
                forwardToJsp = "/AccountNotFound.jsp";
            }    
         
       return forwardToJsp;
      }
}  
