/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Command;


import Daos.AdminLogDao;
import Dtos.AdminLog;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author d00155224
 */
public class ViewAdminChangesCommand implements Command
{

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)
    {
        String forwardToJsp;
           
                HttpSession session = request.getSession();
			
                AdminLogDao alDao = new AdminLogDao();
               
                List<AdminLog> logs = new ArrayList<>();
                logs = alDao.getAllLogs();
 
           
                session.setAttribute("adminLogs", logs);
                forwardToJsp = "/ViewAdminLogs.jsp";	
       
      return forwardToJsp;  
    }
    
}
