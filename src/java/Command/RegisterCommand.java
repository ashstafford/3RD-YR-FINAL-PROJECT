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
public class RegisterCommand implements Command
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
             
             String forwardToJsp = null;

             MemberDao mDao = new MemberDao();
             
             String regexUsername = "[a-zA-Z0-9]{4,}";
             String regexPass = "[a-zA-Z0-9]{8,}";
             String regexEmail = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
		+ "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";  
          
         
            
             String userName = request.getParameter("userName");
             String password = request.getParameter("password");
             String firstName = request.getParameter("firstName");
             String lastName = request.getParameter("lastName");
             String email = request.getParameter("email");
             String securityQuestionAnswer = request.getParameter("securityQuestionAnswer");
             boolean isAdmin = false;
             
             
             

            if (userName != null && password != null && firstName != null && lastName != null && email != null && securityQuestionAnswer !=null
                     && !userName.isEmpty() && !password.isEmpty() && !firstName.isEmpty() && !lastName.isEmpty() && !email.isEmpty() && !securityQuestionAnswer.isEmpty())
            {
               if(userName.matches(regexUsername) && password.matches(regexPass) && email.matches(regexEmail))
               {
                    
                 Member m = mDao.findMemberByEmailAddress(email);
             
                if(m == null)
                {
                     m = mDao.addMember(userName,password,firstName,lastName,email,securityQuestionAnswer,isAdmin);


                    if (m != null)
                    {
                        session = request.getSession();
                        String clientSessionId = session.getId();
                        session.setAttribute("loggedSessionId", clientSessionId);

                        session.setAttribute("register", m);

                        forwardToJsp = "/myProfile.jsp";
                    }       
                    else
                    {
                      forwardToJsp = "/Register.jsp";
                    }
                
               }
               else
               {
                  forwardToJsp = "/Register.jsp";
                  System.out.println("email address already exists!");
               }      
           }
           else
           {
              forwardToJsp = "/Registerjsp";
           }
       }
            
        return forwardToJsp;
    }
}
