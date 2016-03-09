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

/**
 *
 * @author Aisling
 */
public class SalesReceiptDao extends Dao implements SalesReceiptDaoInterface
{

    @Override
    public SalesReceipt insertIntoSalesReceipt(Date dateOrdered,double totalPrice,int memberId,String paymentType) 
    {
                  
        
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet generatedKeys = null;
        int receiptId = -1;
        SalesReceipt sr = null;
     
        
        try
        {

            conn = getConnection();
            String query = "Insert into salesReceipt(receiptId,dateOrdered,totalPrice,memberId,paymentType) values(?,?,?,?,?)";
            ps = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            
            ps.setNull (1,Types.INTEGER);
            ps.setDate(2,dateOrdered);
            ps.setDouble(3,totalPrice);
            ps.setInt(4,memberId);
            ps.setString(5,paymentType);
            
           
            
            ps.executeUpdate();
            
            
            generatedKeys = ps.getGeneratedKeys();
            
            if(generatedKeys.next())
            {
                receiptId = generatedKeys.getInt(1);
            } 
 
            sr = new SalesReceipt(receiptId,dateOrdered,totalPrice,memberId,paymentType);
            
            
            
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
        
        return sr;
    }
    
    /**
     *
     * @param id
     * @return
     */
    @Override
     public ArrayList<SalesReceipt> viewPreviousOrders(int id)
     {
               
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;  
        SalesReceipt s = null;
        
         ArrayList<SalesReceipt> receipts = new ArrayList<>();
         
        try
        {
            conn = getConnection();
            String query = "Select * from salesReceipt where memberId=?";

            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            
            rs = ps.executeQuery();
            
            while (rs.next())
            {
                int receiptId = rs.getInt("receiptId");
                Date dateOrdered = rs.getDate("dateOrdered");
                double totalPrice = rs.getDouble("totalPrice");
                int memberId = rs.getInt("memberId");
                String paymentType = rs.getString("paymentType");

                s = new SalesReceipt(receiptId,dateOrdered,totalPrice,memberId,paymentType);
                receipts.add(s);
   
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
     return receipts;
    } 
}    
    
     
   