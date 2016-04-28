/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Command;

import Daos.SalesReceiptDao;
import Dtos.Member;
import Dtos.SalesReceipt;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author d00155224
 */
public class ViewPreviousOrdersCommand implements Command
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
             
          
           
             Member m = (Member) session.getAttribute("member");                //getting the details of the member currently logged on

             SalesReceiptDao srDao = new SalesReceiptDao();

             List<SalesReceipt> order;
             
             order = srDao.viewPreviousOrders(m.getMemberId());        
             
             for(SalesReceipt sr: order)
             {
                 System.out.println("order " + sr.toString());
             }    
             session.setAttribute("previousOrders",order);
             
             forwardToJsp = "/ViewPreviousOrders.jsp";
            
            
        return forwardToJsp;    
    }   
}
