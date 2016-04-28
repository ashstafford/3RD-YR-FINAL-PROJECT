/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.Address;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Ash
 */
public class AddressDao extends Dao implements AddressDaoInterface
{
    
     /**
     *
     * 
     * @adds a new address by taking in information given by user
     */
  @Override
    public boolean addAddress(int memberId, String line1,String line2, String city, String country) 
    {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet generatedKeys = null;
        int addressId = -1;
     
       
       
    

        
        try 
        {
            
            con = this.getConnection();

           
            String query = "Insert into Address(memberId, addressLine1,addressLine2, city,country) values(?,?,?,?,?)"; 
            
           // Need to get the id back, so have to tell the database to return the id it generates
            ps = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            
            

            ps.setInt(1, memberId);
            ps.setString(2, line1);
            ps.setString(3, line2);
            ps.setString(4, city);
            ps.setString(5, country);
            
            
              int i =  ps.executeUpdate();
            

            
                     // Find out what the id generated for this entry was
            generatedKeys = ps.getGeneratedKeys();
            
            if(generatedKeys.next())
            {
                addressId = generatedKeys.getInt(1);
            }
            
            if(i == 0)
            {
               return false;
            }
            
          
            
             
        } 
        
        catch (SQLException e) 
        {
            System.err.println("\tA problem occurred during the addAddress method:");
            System.err.println("\t"+e.getMessage());
            addressId = -1;
            return false;
        } 
        finally 
        {
            try 
            {
                if (ps != null) 
                {
                    ps.close();
                }
                if (con != null) 
                {
                    freeConnection(con);
                }
            } 
            catch (SQLException e) 
            {
                System.err.println("A problem occurred when closing down the addAddress smethod:\n" + e.getMessage());
                return false;
            }
        }
        return true;
    } 
    
    
    /**
     *
     * @takes in id and returns address details from that member
     */
    
 @Override
 public ArrayList<Address> findAddessesByMemberId(int id)  
 {
            Connection conn = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            
            ArrayList<Address> address = new ArrayList<>();
            
            Address a = null;
            
            try 
            {
                     
                conn = getConnection();
                String query = "select * from address where memberId=?";
                ps = conn.prepareStatement(query);
                
                ps.setInt(1, id);

                rs = ps.executeQuery();
                
             while (rs.next()) 
             {
                 a = new Address(
                 rs.getInt("AddressId"),
                 rs.getInt("memberId"),        
                 rs.getString("addressLine1"),
                 rs.getString("addressLine2"),
                 rs.getString("city"),        
                 rs.getString("country"));
                  
                 address.add(a);
            }
            
          } 
            
            
            catch (SQLException e) 
            {
                 e.printStackTrace();

            } 
            
            finally
            {
                try 
                {
                    if (rs != null) 
                    {
                        rs.close();
                    }
                    
                    if (ps != null) 
                    {
                        ps.close();
                    }
                    
                    if (conn != null)
                    {
                        conn.close();
                    }

                }
                
                catch (SQLException e) 
                {
                    e.printStackTrace();
                }
            }
            
        return address;    
    }
}
