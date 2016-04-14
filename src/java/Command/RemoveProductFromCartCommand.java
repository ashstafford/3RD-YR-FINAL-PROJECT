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
 * @author Ash
 */
public class RemoveProductFromCartCommand implements Command
{

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)
    {
             String forwardToJsp = "";
            
             HttpSession session = request.getSession();
            
              
                String id = request.getParameter("removeFromCart");  //getting the productid of the product the user selected 
          
                if(id != null) 
              
                {   
                    
                   int productId = Integer.parseInt(id);
                

                   ProductDao pDao = new ProductDao();
                   Product p = new Product();

                   ArrayList<Product> cart = (ArrayList<Product>) session.getAttribute("cart");
                   
                   int qtyOrdered = 0; 
                   
                   for(Product prod : cart)
                   {
                      if(prod.getProductId() == productId) 
                      {
                          qtyOrdered = prod.getQuantityInStock();  //getting the quantity the user had chosen to add to cart
                      }       
                   }    
                   
                   p = pDao.findProductById(productId);
                   
                   
                   if(p != null)
                   { 
                       
                       p.setQuantityInStock(qtyOrdered);
                       System.out.println("qty bef " + p.getQuantityInStock());
                  
                      if(cart.size() == 1)   //check if there is one type of product in cart
                      {   
                          if(p.getQuantityInStock() > 1)  //checking if there is more than 1 of a particular item 
                          {
                                p.setQuantityInStock(p.getQuantityInStock() - 1);
                               System.out.println("qty aft1 " + p.getQuantityInStock());
                          }
                          else
                          {
                                cart.remove(p);
                                cart = new ArrayList<>();
                          }    

                        }
                       else
                       {

                           if(p.getQuantityInStock() > 1)
                           {
                               p.setQuantityInStock(p.getQuantityInStock() - 1);
                               System.out.println("qty aft2 " + p.getQuantityInStock());
                           }
                           else
                           {
                              cart.remove(p);
                           }  
                        }    
                       
                       session.setAttribute("updatedCart", cart);
                       forwardToJsp = "/UpdatedCart.jsp";
                       
                  
                   } 
                   else
                   {
                       System.out.println("failed!!");
                   }          
                }
                 return forwardToJsp;  
     	  
           }      
}
      
             
   
    

