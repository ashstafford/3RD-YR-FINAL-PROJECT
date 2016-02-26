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
 * @author Ash
 */
public class AddProductCommand implements Command
{

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) 
    {
             HttpSession session = request.getSession();
             
             String forwardToJsp;

             ProductDao pDao = new ProductDao();
             
//             
             
                String regexPrice = "^[0-9]+(\\.[0-9]{2})";
                String regexQuantityInStock = "^[0-9]+";
//         
//             
               boolean priceValid = false;
               boolean quantityInStockValid = false;
          
            
             String productName = request.getParameter("productName");
             String productPrice = request.getParameter("productPrice");
             double price = Double.parseDouble(productPrice);
             
             String quantityInStock = request.getParameter("quantityInStock");
             int quantity = Integer.parseInt(quantityInStock);
             
             String category = request.getParameter("category");
             String productImageUrl = request.getParameter("productImageUrl"); //Needs Validation
//              
 
             if(productPrice.matches(regexPrice) && quantityInStock.matches(regexQuantityInStock))
             {
                 priceValid = true;
                 quantityInStockValid = true;
             }

             if (productName != null && category != null && productImageUrl != null && priceValid != false && quantityInStockValid != false &&
                     !productName.isEmpty() && !category.isEmpty() && !productImageUrl.isEmpty() && !productPrice.isEmpty() && !quantityInStock.isEmpty() )
             {
  
                  boolean productAdded = pDao.addProduct(productImageUrl,productName, price, quantity, category);
                
                  if(productAdded == true)
                  {
                    session = request.getSession();
                  
                    session.setAttribute("productAdded", true);
                    
                    forwardToJsp = "/CategorySelection.html";
                  } 
                  else
                  {
                      forwardToJsp = "/RegisterFailure.jsp";
                  }    
                    //forwardToJsp = "/AddProduct.jsp";
                    
                
             } 
             else
             {
                 forwardToJsp = "/RegisterFailure.jsp";
             }
             
     return forwardToJsp;        
    }
}
    

