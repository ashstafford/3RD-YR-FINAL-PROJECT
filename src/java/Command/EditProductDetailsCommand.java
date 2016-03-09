/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Command;

import Daos.MemberDao;
import Daos.ProductDao;
import Dtos.Member;
import Dtos.Product;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Aisling
 */
public class EditProductDetailsCommand implements Command
{

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) 
    {
           HttpSession session = request.getSession();
           String forwardToJsp = "";
           Member m = (Member) session.getAttribute("member");
           MemberDao mDao = new MemberDao();

           String id = request.getParameter("editProduct");
           String productImageUrl = request.getParameter("productImageUrl");
           String productName = request.getParameter("productName");
           String price = request.getParameter("productPrice");
           String quantityInStock = request.getParameter("quantityInStock");
           String category = request.getParameter("category");
           
           
//           if(productName.isEmpty())
//           {
//               productName = 
//           }   
//                    
                   int productId = Integer.parseInt(id);
                   double newPrice = Double.parseDouble(price);
                   int newQuantity = Integer.parseInt(quantityInStock);

                   ProductDao pDao = new ProductDao();
                   Product p = new Product();
   
                   boolean updated = pDao.editProductDetails(productId,productImageUrl, productName, newPrice, newQuantity, category);
                   
                
   
                if(updated == true)
                {    

                    String ProductEdit = session.getId();
           
                     p.setProductImageUrl(productImageUrl);
                     p.setProductName(productName);
                     p.setProductPrice(newPrice);
                     p.setQuantityInStock(newQuantity);
                     p.setCategory(category);
           
                    forwardToJsp = "/ViewAllProducts.jsp";
               }  

           
             
          
           
     return forwardToJsp;       
    }
}
    

