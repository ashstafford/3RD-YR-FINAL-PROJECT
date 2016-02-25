/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Command;

import Daos.ProductDao;
import Dtos.Product;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Aisling
 */
public class SearchItemCommand implements Command 
{
 
    /**
     *
     * @param request
     * @param response
     * @return
     */
    public String execute(HttpServletRequest request, HttpServletResponse response) 
    {
        String forwardToJsp;
        
        String Sitem = request.getParameter("searchName");
        
        ProductDao pDao = new ProductDao();
        
        if(Sitem != null)
        {
            Product p = pDao.findProductByTitle(Sitem);
            
            if(p != null)
            {
                    HttpSession session = request.getSession();

                    session.setAttribute("searchitem", p);

                    forwardToJsp = "/SearchItemResults.jsp";
            }
            else
            {
                forwardToJsp = "/ItemNotFound.jsp";
            }    
        }
        else
            {
                forwardToJsp = "/ItemNotFound.jsp";
            }  
        
    return forwardToJsp;    
    }   
}
