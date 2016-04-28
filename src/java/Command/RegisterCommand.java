/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Command;

import Daos.MemberDao;
import Dtos.Member;
import java.awt.image.BufferedImage;
import java.io.InputStream;
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
        Member m = new Member();

        String regexUsername = "[a-zA-Z0-9]{4,}";
        String regexPass = "[a-zA-Z0-9]{8,}";
        String regexEmail = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
                + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";

        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
//        String memberImage = request.getParameter("memberImage");
        
        String securityQuestionAnswer = request.getParameter("securityQuestionAnswer");
        boolean isAdmin = false;

        String newMemberImageUrl = request.getParameter("MemberProfileImage");
        
        newMemberImageUrl = "C:/temp/" + newMemberImageUrl;
        
        BufferedImage updated =  mDao.editMemberImageUrl(newMemberImageUrl);
        System.out.println("RegisterCommand:    Member Image = " + updated);

        if (userName != null && password != null && firstName != null && lastName != null && email != null && securityQuestionAnswer != null && newMemberImageUrl != null 
                && !userName.isEmpty() && !password.isEmpty() && !firstName.isEmpty() && !lastName.isEmpty() && !email.isEmpty() && !securityQuestionAnswer.isEmpty())
        {
            if (userName.matches(regexUsername) && password.matches(regexPass) && email.matches(regexEmail))
            {

                String returnedEmail = mDao.findEmailAddress(email);
                
                System.out.println("Check for duplicate Email 'Returned Email' = " + returnedEmail);
                
                if (returnedEmail == "null")
                {
                    System.out.println("RegisterCommand:    member:   Username = " + userName + " password= " + password + " firstname= " + firstName + " Lastname= " + lastName + " email= " + email + " img= " + updated + " Security Question Answer= " + securityQuestionAnswer + " Is admin= " + isAdmin);
                    m.setMemberImage(updated);
                    m = mDao.addMember(userName, password, firstName, lastName, email, updated, securityQuestionAnswer, isAdmin);

                    System.out.println("RegisterCommand:    Member " + m);
                    
                    if (m != null)
                    {
                        session = request.getSession();
                        String clientSessionId = session.getId();
                        session.setAttribute("loggedSessionId", clientSessionId);

                        session.setAttribute("register", m);
                        
                        
               
//                        BufferedImage newImage = updated;
//                        
//                        m.setMemberImage(newImage);

                        forwardToJsp = "/myProfile.jsp";
                    } else
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
