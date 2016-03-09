/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Command;

import Daos.MemberDao;
import Daos.OrderItemDao;
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
                    
           SalesReceiptDao srDao = new SalesReceiptDao();     
           OrderItemDao oItemDao = new OrderItemDao();
           
           Member m = (Member) session.getAttribute("member");
           
           List<Product> cart;
           cart = (List) (request.getSession().getAttribute("cart"));
           
           //String quantity = request.getParameter("quantity");
           
            //System.out.println("dsdsdsdsdsw" + quantity);
           
             int qtyOrdered = 10;
           
          // if(quantity != null)
          // {    
              //  int qtyOrdered = Integer.parseInt(quantity);
                
                String productName;
                double totalPrice = 0;

                java.util.Date utilDate = new java.util.Date();   
                java.sql.Date dateOrdered = new java.sql.Date(utilDate.getTime());

                int memberId = m.getMemberId();

                String paymentType = "card";

                for (Product prod : cart) 
                {
                   totalPrice = totalPrice + prod.getProductPrice() * prod.getQuantityInStock();
                }
                
                SalesReceipt sr1 =  srDao.insertIntoSalesReceipt(dateOrdered,totalPrice,memberId,paymentType);
 
                for (Product prod : cart) 
                {
                   oItemDao.insertIntoOrderItem(memberId, sr1.getReceiptId(), prod.getProductPrice(),qtyOrdered);
                   int qty = prod.getQuantityInStock() - qtyOrdered;
                   prod.setQuantityInStock(qty);
                } 
                
                cart.clear();

                forwardToJsp = "/PurchaseConfirmation.jsp";
         //  }
         //  else
         //  {
         //    forwardToJsp = "/LoginFailure.jsp";    
         //  }   
           
             return forwardToJsp;    
    }   
}
