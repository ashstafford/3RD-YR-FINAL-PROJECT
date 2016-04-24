/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Command;

import Daos.HashPasswordMD5;
import Dtos.Member;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ash
 */
public class ConfirmPasswordCommand implements Command
{

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)
    {
        HttpSession session = request.getSession();
        String forwardToJsp = "";
           
         Member m = (Member) session.getAttribute("member");
      
         String currentPassword = request.getParameter("currentPassword");
           
         if(currentPassword != null)  
         {    
             HashPasswordMD5 hashPass = new HashPasswordMD5();
             String newPassword = hashPass.hashPassword(currentPassword);
             
           if(m.getPassword().equals(newPassword))  //if password matchs one in members account
           {
               forwardToJsp = "/EditPassword.jsp";
           }
           else
           {
               forwardToJsp = "/PasswordNotFound.jsp";
           }    
         
         }
         
      return forwardToJsp;
    }
}    
