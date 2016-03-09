/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Command;

import Daos.ProductDao;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ash
 */
public class RemoveProductCommand implements Command
{

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)
    {
           String forwardToJsp = "";
            
           HttpSession session = request.getSession();

           ProductDao pDao = new ProductDao();
           
           String id = request.getParameter("removeProduct"); 
           
          if(id != null)
          {
             int productId = Integer.parseInt(id);
             
             boolean removed = pDao.removeProduct(productId);
   
             if(removed == true)
             {    
                 String removeProduct = session.getId();
                 forwardToJsp = "/ProductRemovedSuccess.jsp";
             }
               
          } 
     return forwardToJsp;     
    }
    
}
