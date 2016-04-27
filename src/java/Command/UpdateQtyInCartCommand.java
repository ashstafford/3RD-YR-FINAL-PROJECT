/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Command;

import Daos.ProductDao;
import Dtos.Product;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author d00155224
 */
public class UpdateQtyInCartCommand implements Command
{

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)
    {
        String forwardToJsp = "";

        HttpSession session = request.getSession();

        String id = request.getParameter("productId");  //getting the productid of the product the user selected 
        String quantityOrdered = request.getParameter("quantity");

        if (id != null && quantityOrdered != null)
        {

            int productId = Integer.parseInt(id);
            int newQty = Integer.parseInt(quantityOrdered); //newQuantity that they wish to update it to

            ProductDao pDao = new ProductDao();

            ArrayList<Product> cart;
            ArrayList<Product> otherCart;

            System.out.println("qty before " + newQty);
          

            cart = (ArrayList<Product>) session.getAttribute("cart");
            otherCart = (ArrayList<Product>) session.getAttribute("updatedCart");

            Product p = pDao.findProductById(productId);

            if (newQty == 0)
            {
                cart.remove(p);
                otherCart.remove(p);
                System.out.println("i should have removed ");

                for (Product prod : cart)
                {
                    System.out.println("haha " + prod.getProductName());
                }
                
            } 
            else if (newQty > p.getQuantityInStock()) //if entered quantity greater than the qty that is in stock
            {

                forwardToJsp = "/Cart.jsp";
            } else
            {
                for (Product prod : cart)
                {
                    if (prod.getProductId() == productId)
                    {
                        prod.setQuantityInStock(newQty);  //getting the old quantity the user had chosen to add to cart
                    }
                }

                p.setQuantityInStock(newQty);

            }

            session.setAttribute("updatedCart", cart);
            forwardToJsp = "/Cart.jsp";

        }
        else
        {
            System.out.println("failed!!");
        }
    
        return forwardToJsp;

    }
}
