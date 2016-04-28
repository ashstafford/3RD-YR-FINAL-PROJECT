/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.Member;
import Dtos.SalesReceipt;
import Exceptions.DaoException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.ArrayList;
import Dtos.OrderItem;

/**
 *
 * @author Aisling
 */
public class OrderItemDao extends Dao implements OrderItemDaoInterface
{
    /**
     *
     * @handles the processes of each method
     */

    @Override
    public OrderItem insertIntoOrderItem(int productId,int receiptId,double price,int quantity) 
    {
                  
        
        Connection conn = null;
        PreparedStatement ps = null;
        SalesReceipt sr = null;
        OrderItem oi = null;
     
        
        try
        {

            conn = getConnection();
            String query = "Insert into orderItem(productId,receiptId,price,quantity) values(?,?,?,?)";
            ps = conn.prepareStatement(query);
            
            ps.setInt(1,productId);
            ps.setInt(2,receiptId);
            ps.setDouble(3,price);
            ps.setInt(4,quantity);
          
            ps.executeUpdate();
            
            oi = new OrderItem(productId,receiptId,price,quantity);
        } 
        
        catch (SQLException e)
        {
           
            e.getMessage();

        } 
        
        finally 
        {
            try 
            {
                if (ps != null) 
                {
                    ps.close();
                }
                if (conn != null) 
                {
                    freeConnection(conn);
                }
            } 
            
            catch (SQLException e)
            {
               
                e.getMessage();
            }
        } 
        
        return oi;
    }
    

}
