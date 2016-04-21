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

           String id = request.getParameter("ProductId");
           String productImageUrl = request.getParameter("productImageUrl");
           String productName = request.getParameter("productName");
           String price = request.getParameter("productPrice");
           String quantityInStock = request.getParameter("quantityInStock");
           String category = request.getParameter("category");
           
             System.out.println("id " + id );     
             if(id != null)
             {    
                   ProductDao pDao = new ProductDao();
                   
                   int productId = Integer.parseInt(id);
                           
                   Product p = pDao.findProductById(productId);
                   
                   System.out.println("haha " + p.toString());
                   
                   double newPrice;
                   int newQuantity;
                   
                   if(productName.isEmpty())
                   {
                      productName = p.getProductName();
                   }
                   
                   if(productImageUrl.isEmpty())
                   {
                       productImageUrl = p.getProductImageUrl();
                   } 
                   
                   if(productName.isEmpty())
                   {
                       productName = p.getProductName();
                   }
                   
                   if(price.isEmpty())
                   {
                       newPrice = p.getProductPrice();
                   }
                   else
                   {
                      newPrice = Double.parseDouble(price);
                   } 
                   
                   if(quantityInStock.isEmpty())
                   {
                       newQuantity = p.getQuantityInStock();
                   } 
                   else
                   {
                       newQuantity = Integer.parseInt(quantityInStock);
                   }     
                   
                   if(category.isEmpty())
                   {
                       category = p.getCategory();
                   }
                   
                   System.out.println("new " + p.toString());

                   boolean updated = pDao.editProductDetails(productId,productImageUrl, productName, newPrice, newQuantity, category);
                   
               
                   
                if(updated == true)
                {    

                    String ProductEdit = session.getId();
           
                     p.setProductImageUrl(productImageUrl);
                     p.setProductName(productName);
                     p.setProductPrice(newPrice);
                     p.setQuantityInStock(newQuantity);
                     p.setCategory(category);
                     
                    System.out.println("final " + p.toString());
                    forwardToJsp = "/ProductEditedSuccessfully.jsp";
               }  
 
        }
             
      
       return forwardToJsp;       
    
   }
}    
    

