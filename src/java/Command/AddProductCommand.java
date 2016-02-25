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
             
//             String regexUsername = "[a-zA-Z0-9]{4,}";
//             String regexPrice = "[0-9]{1,}";
//             String regexEmail = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
//		+ "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
//         
//             boolean passValid = false;
//             boolean userValid = false;
//             boolean emailValid = false;
          
            
             String productName = request.getParameter("productName");
             String productPrice = request.getParameter("productPrice");
             double price = Double.parseDouble(productPrice);
             
             String quantityInStock = request.getParameter("quantityInStock");
             int quantity = Integer.parseInt(quantityInStock);
             
             String category = request.getParameter("category");
             String productImageUrl = request.getParameter("productImageUrl");
            
             boolean productAdded = false;
             
//             if(userName.matches(regexUsername) && password.matches(regexPass) && email.matches(regexEmail))
//             {
//                 userValid = true;
//                 passValid = true;
//                 emailValid = true;
//             }

             if (productName != null && category != null && productImageUrl != null && !productName.isEmpty() 
                 && !category.isEmpty() && !productImageUrl.isEmpty())
             {
                 
                  pDao.addProduct(productImageUrl,productName, price, quantity, category);
                
                 
                  session = request.getSession();
                  
                  session.setAttribute("productAdded", true);
                  

//                  forwardToJsp = "/AddProduct.jsp";
                    forwardToJsp = "/CategorySelection.html";
                
             } 
             else
             {
                 forwardToJsp = "/RegisterFailure.jsp";
             }
             
     return forwardToJsp;        
    }
}
    

