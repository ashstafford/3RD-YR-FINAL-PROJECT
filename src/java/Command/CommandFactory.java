/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Aisling
 */
public class CommandFactory 
{
    
    /**
     *
     * @param commandStr
     * @return
     */
    public Command createCommand(String commandStr) 
    {
    	Command command = null;
    	
	
    	if (commandStr.equals("login")) 
        {
    		command = new LoginCommand();
    	}
    	if (commandStr.equals("register")) 
        {
    		command = new RegisterCommand();
    	}
        if (commandStr.equals("resetPassword")) 
        {
    		command = new ResetPasswordCommand();
    	}
        if (commandStr.equals("filterProducts")) 
        {
    		command = new PriceComparisonCommand();
    	}
        if (commandStr.equals("viewProfile")) 
        {
    		command = new ViewProfileCommand();
    	}
        if (commandStr.equals("AddProduct")) 
        {
    		command = new AddProductCommand();
    	}
        if (commandStr.equals("Remove Product")) 
        {
    		command = new RemoveProductCommand();
    	}
        if (commandStr.equals("Remove Member")) 
        {
    		command = new RemoveMemberCommand();
    	}
        if (commandStr.equals("RemoveProductFromCart")) 
        {
    		command = new RemoveProductFromCartCommand();
    	}
        if (commandStr.equals("AddAdmin")) 
        {
    		command = new AddAdminCommand();
    	}
        if (commandStr.equals("ViewAllProducts")) 
        {
    		command = new ViewAllProductsCommand();
    	}
        if (commandStr.equals("ViewAllMembers")) 
        {
    		command = new ViewAllMembersCommand();
    	}
        if (commandStr.equals("StarWars")) 
        {
    		command = new ViewStarWarsCommand();
    	}
        if (commandStr.equals("Disney")) 
        {
    		command = new ViewDisneyCommand();
    	}
        if (commandStr.equals("Marvel")) 
        {
    		command = new ViewMarvelCommand();
    	}
        if (commandStr.equals("The Walking Dead")) 
        {
    		command = new ViewTheWalkingDeadCommand();
    	}
        if (commandStr.equals("Doctor Who")) 
        {
    		command = new ViewDoctorWhoCommand();
    	}
        if (commandStr.equals("DC")) 
        {
    		command = new ViewDCCommand();
    	}
        if (commandStr.equals("Game Of Thrones")) 
        {
    		command = new ViewGOTCommand();
    	}
        if (commandStr.equals("Add To Cart")) 
        {
    		command = new AddToCartCommand();
    	}
        if (commandStr.equals("EmptyCart")) 
        {
    		command = new EmptyCartCommand();
    	}
        if (commandStr.equals("Edit First Name")) 
        {
    		command = new EditFirstNameCommand();
    	}
         if (commandStr.equals("Edit Last Name")) 
        {
    		command = new EditLastNameCommand();
    	}
        if (commandStr.equals("Edit Username")) 
        {
    		command = new EditUserNameCommand();
    	}
        if (commandStr.equals("Edit Password")) 
        {
    		command = new EditPasswordCommand();
    	}
        if (commandStr.equals("Edit Email")) 
        {
    		command = new EditEmailCommand();
    	}
        if (commandStr.equals("Edit MemberImageUrl")) 
        {
    		command = new EditMemberImageUrlCommand();
    	}
        if (commandStr.equals("editProductDetails")) 
        {
    		command = new EditProductDetailsCommand();
    	}
        if (commandStr.equalsIgnoreCase("searchName")) 
        {
    		command = new SearchItemCommand();
    	}  
        if (commandStr.equals("orderDetails")) 
        {
    		command = new OrderDetailsCommand();
    	}
        if (commandStr.equals("ViewPreviousOrders")) 
        {
    		command = new ViewPreviousOrdersCommand();
    	}
        if (commandStr.equals("logout")) 
        {
    		command = new LogoutCommand();
    	}
         
       
    	
    	return command;
    }    
}
