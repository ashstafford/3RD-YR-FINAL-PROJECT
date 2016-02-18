/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Command;

import Daos.ProductDao;
import Dtos.Product;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Karen
 */
public class EmptyCartCommand implements Command
{

    /**
     *
     * @param request
     * @param response
     * @return
     */
    public String execute(HttpServletRequest request, HttpServletResponse response) 
    {
            String forwardToJsp = "";
            
            HttpSession session = request.getSession();
   

            ArrayList<Product> cart = (ArrayList<Product>) session.getAttribute("cart");
            cart.clear();
                   

            session.setAttribute("Emptycart", cart);
            forwardToJsp = "/Cart.jsp";	
  
     return forwardToJsp;      
    }
}
