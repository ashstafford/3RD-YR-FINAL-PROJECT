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
 * @author Aisling
 */
public class AddToCartCommand implements Command
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

            if ( session.getId() != session.getAttribute("loggedSessionId") )
            {
                forwardToJsp = "/LoginFailure.jsp";
            }
            else
            {

                String id = request.getParameter("addToCart");  //getting the productid of the product the user selected 
                String quantity = request.getParameter("quantity");

                if(id != null && !quantity.isEmpty())
                {    
                   int productId = Integer.parseInt(id);
                   int qty = Integer.parseInt(quantity);

                   ProductDao pDao = new ProductDao();
                   Product p = new Product();

                   ArrayList<Product> cart = (ArrayList<Product>) session.getAttribute("cart");
                  
                   if(cart == null)
                   {
                       cart = new ArrayList<>();
                   } 
                   
                   p = pDao.findProductById(productId);
                   p.setQuantityInStock(qty);  //sets the quantity to the value the user entered
                  
                   cart.add(p);

                   session.setAttribute("cart", cart);
                   forwardToJsp = "/Cart.jsp";	
                }
                  
           }
             
     return forwardToJsp;      
    }
}
