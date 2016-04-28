/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Command;

import Daos.AddressDao;
import Dtos.Address;
import Dtos.Member;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ash
 */
public class FindAddressCommand implements Command
{

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)
    {
        String forwardToJsp = "";

        HttpSession session = request.getSession();

        Member m = (Member) session.getAttribute("member");

        int memberId = m.getMemberId();

        AddressDao aDao = new AddressDao();

        ArrayList<Address> addresses = (ArrayList<Address>) aDao.findAddessesByMemberId(memberId);

        for(Address a: addresses)
        {
            System.out.println("address " + a.toString());
        }    
        if (addresses != null)
        {
             
            session.setAttribute("addresses", addresses);
            forwardToJsp = "/SelectDeliveryAddress.jsp";

        } else
        {

            forwardToJsp = "/AddressNotFound.jsp";
        }

        return forwardToJsp;

    }

}
