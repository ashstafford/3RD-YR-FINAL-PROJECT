/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Command;

import Daos.AddressDao;
import Dtos.Member;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ash
 */
public class AddAddressCommand implements Command
{

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)
    {

        HttpSession session = request.getSession();

        String forwardToJsp;
        Member m = (Member) session.getAttribute("member");

        int memberId = m.getMemberId();

        AddressDao aDao = new AddressDao();

        String line1 = request.getParameter("Line1");
        String line2 = request.getParameter("Line2");
        String city = request.getParameter("City");
        String country = request.getParameter("Country");

        if (line1 != null && city != null && country != null && !line1.isEmpty() && !city.isEmpty()
                && !country.isEmpty())
        {

            boolean addressAdded = aDao.addAddress(memberId, line1, line2, city, country);
            System.out.println("address added " + addressAdded);

            if (addressAdded == true)
            {
                session = request.getSession();

                session.setAttribute("addressAdded", true);

                forwardToJsp = "/PaymentInformation.jsp";
            } else
            {
                forwardToJsp = "/DeliveryAddress.jsp";
            }

        } else
        {
            forwardToJsp = "/DeliveryAddress.jsp";
        }

        return forwardToJsp;
    }
}
