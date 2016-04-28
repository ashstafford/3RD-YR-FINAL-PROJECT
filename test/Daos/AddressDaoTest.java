/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.Address;
import java.util.ArrayList;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Benjamin
 */
public class AddressDaoTest
{
    
    public AddressDaoTest()
    {
    }
    
   
    @Test
    public void testAddAddress()
    {
        System.out.println("addAddress");
        int memberId = 3;
        String line1 = "35 Main Street";
        String line2 = "Dublin rd";
        String city = "Dublin";
        String country = "Ireland";
        AddressDao instance = new AddressDao();
        boolean expResult = true;
        boolean result = instance.addAddress(memberId, line1, line2, city, country);
        assertEquals(expResult, result);
        System.out.println("addMember Test Passed");
        instance.addAddress(memberId,country,city,line2, line1);
    }

    
    @Test
    public void testFindAddessesByMemberId()
    {
        System.out.println("findAddessesByMemberId");
        int id = 3;
        AddressDao instance = new AddressDao();
        ArrayList<Address> expResult = instance.findAddessesByMemberId(id);
        ArrayList<Address> result = instance.findAddessesByMemberId(id);
        assertEquals(expResult, result);
        
    }
    
}
