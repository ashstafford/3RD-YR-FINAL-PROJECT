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
 * @author Ash
 */
public class PriceComparisonCommand implements Command
{
    public String execute(HttpServletRequest request, HttpServletResponse response) 
    {
           ProductPriceHighToLowComparator prodHtl = new ProductPriceHighToLowComparator();
           ProductPriceLowToHighComparator prodLth = new ProductPriceLowToHighComparator();
           
           
           HttpSession session = request.getSession();
           
           String forwardToJsp = "";
           
           ProductDao pDao = new ProductDao();
           
           String selectedChoice = request.getParameter("filterComboBox");
           int choice = Integer.parseInt(selectedChoice);
           
            List<Product> products = new ArrayList<>();
            products = pDao.getAllProducts();
           
            
           if(choice == 2)
           {
                Collections.sort(products,prodLth);
           } 
           else if(choice == 3)
           {
               Collections.sort(products,prodHtl);
           }
           else
           {
               forwardToJsp = "/ViewAllProducts.jsp";
           }    
                
 
                
               
                session.setAttribute("fileredProducts", products);
                forwardToJsp = "/productFilterResults.jsp";	
       
      return forwardToJsp;                
          
    }   
}
