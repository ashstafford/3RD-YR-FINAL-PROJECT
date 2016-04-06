/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Command;

import Daos.MemberDao;
import Dtos.Member;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ash
 */
public class AddAdminCommand implements Command
{
    
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)
    {
      
            String forwardToJsp = "";
            
            HttpSession session = request.getSession();

           
               
                String id = request.getParameter("AddAdmin");  //getting the memberid of the member the admin selected 
               

                if(id != null)
                {   
                    
                   int MemberId = Integer.parseInt(id);
                   
                   MemberDao mDao = new MemberDao();
                   Member m = new Member();

               
                   m = mDao.findMemberById(MemberId);
                    
                   mDao.addAdmin(m);
                   
                   
                   m.setIsAdmin(true);
                   session.setAttribute("newAdmin", m);
                    System.out.println("admin "+ m.isAdmin());
                   forwardToJsp = "/AddAdminSuccess.jsp";
                       
                 } 
                 else
                 {
                        //p.setQuantityInStock(qty);  //sets the quantity to the value the user entered
                                    
                        forwardToJsp = "/ProductOutOfStock.jsp";   
                 }        
           
     return forwardToJsp;    

    }
}
