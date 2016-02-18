/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Command;

import Daos.MemberDao;
import Daos.SalesReceiptDao;
import Dtos.Member;
import Dtos.Product;
import Dtos.SalesReceipt;
import java.sql.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author d00155224
 */
public class OrderDetailsCommand implements Command
{
   
        //inserts the book the user wishes to borrow into the booksOnLoan table
                 
    /**
     *
     * @param request
     * @param response
     * @return
     */
                     
    public String execute(HttpServletRequest request, HttpServletResponse response) 
    {
    
           HttpSession session = request.getSession();
           
           String forwardToJsp = "";
           
           Member m = (Member) session.getAttribute("member");
           
           List<Product> cart;
           cart = (List) (request.getSession().getAttribute("cart"));
           
           String productName;
           int price;
           int quantity;
           
              
            for (Product prod : cart) 
            {
               SalesReceiptDao srDao = new SalesReceiptDao();
                
               int memberId = m.getMemberId();
     
               java.util.Date utilDate = new java.util.Date();
                 
               java.sql.Date dateOrdered = new java.sql.Date(utilDate.getTime());
                
               productName = prod.getProductName();
               price = (int) prod.getProductPrice();
               quantity = prod.getQuantityInStock();
               
               SalesReceipt sr1 =  srDao.insertIntoSalesReceipt(dateOrdered, productName, price, quantity, memberId);
               
            }

            
            forwardToJsp = "/PurchaseConfirmation.jsp";
          
        return forwardToJsp;    
    }   
}
