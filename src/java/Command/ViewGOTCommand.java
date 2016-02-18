/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Command;

import Daos.ProductDao;
import Dtos.Product;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author d00155224
 */
public class ViewGOTCommand implements Command
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
               
                List<Product> products = new ArrayList<>();
                products = pDao.getProductsByCategory("Game Of Thrones");
 
                //Put the list of products into the session so that JSP(the View) can display them...
                session.setAttribute("GOTProducts", products);
                forwardToJsp = "/GOTPage.jsp";	
       
      return forwardToJsp;                
     } 
}
