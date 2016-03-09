/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Command;

import Comparator.ProductPriceHighToLowComparator;
import Comparator.ProductPriceLowToHighComparator;
import Daos.ProductDao;
import Dtos.Product;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author D00155224
 */
public class ViewAllProductsCommand implements Command
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
           
                HttpSession session = request.getSession();
			
                ProductDao pDao = new ProductDao();
                
                ProductPriceHighToLowComparator prodHighToLow = new ProductPriceHighToLowComparator();
                ProductPriceLowToHighComparator prodLowToHigh = new ProductPriceLowToHighComparator();
               
                List<Product> products = new ArrayList<>();
                products = pDao.getAllProducts();
 
////                 String referer = request.getHeader("Referer");
                //response.sendRedirect(referer);
//                System.out.println("refeerer" + referer);
//                String selectedOption = request.getParameter("selectOrderPrice");
//           
//
//                System.out.println("hahah" + selectedOption);
//                
//                if(selectedOption.equals("lowToHigh"))
//                {
//                    Collections.sort(products,prodLowToHigh);
//                }
//                
//                if(selectedOption.equals("highToLow"))
//                {
//                     Collections.sort(products,prodHighToLow);
//                }
                    
                //Put the list of products into the session so that JSP(the View) can display them...
                session.setAttribute("AllProducts", products);
                
                
               forwardToJsp = "/ViewAllProducts.jsp";	
              
                
      return forwardToJsp;                
     } 
}

