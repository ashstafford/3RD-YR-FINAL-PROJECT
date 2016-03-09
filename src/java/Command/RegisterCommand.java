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
             
             String forwardToJsp;

             MemberDao mDao = new MemberDao();
             
             String regexUsername = "[a-zA-Z0-9]{4,}";
             String regexPass = "[a-zA-Z0-9]{8,}";
             String regexEmail = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
		+ "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";  
          
         
             boolean passValid = false;
             boolean userValid = false;
             boolean emailValid = false;
          
            
             String userName = request.getParameter("userName");
             String password = request.getParameter("password");
             String firstName = request.getParameter("firstName");
             String lastName = request.getParameter("lastName");
             String email = request.getParameter("email");
             String memberImageUrl = request.getParameter("memberImageUrl");
             String securityQuestionAnswer = request.getParameter("securityQuestionAnswer");
             boolean isAdmin = false;
             
             
             if(userName.matches(regexUsername) && password.matches(regexPass) && email.matches(regexEmail))
             {
                 userValid = true;
                 passValid = true;
                 emailValid = true;
             }

             if (userValid != false && passValid != false && firstName != null && lastName != null && emailValid != false && memberImageUrl != null && securityQuestionAnswer !=null
                     && !userName.isEmpty() && !password.isEmpty() && !firstName.isEmpty() && !lastName.isEmpty() && !email.isEmpty() && !memberImageUrl.isEmpty() && securityQuestionAnswer != null)
             {
                 Member m = mDao.addMember(userName, password,firstName, lastName,email,memberImageUrl,securityQuestionAnswer,isAdmin);



                 if (m != null)
                 {
                     session = request.getSession();
                     String clientSessionId = session.getId();
                     session.setAttribute("loggedSessionId", clientSessionId);

                     session.setAttribute("register", m);

                     forwardToJsp = "/RegisterSuccess.html";
                 } 
                 else
                 {
                     forwardToJsp = "/RegisterFailure.jsp";
                 }
             } 
             else
             {
                 forwardToJsp = "/RegisterFailure.jsp";
             }
             
     return forwardToJsp;        
    }
}
