/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.Address;
import java.util.ArrayList;

/**
 *
 * @author Ash
 */
public interface AddressDaoInterface
{
    public ArrayList<Address> findAddessesByMemberId(int id);
    
    public boolean addAddress(int memberId, String line1,String line2, String city, String country);
}
