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
import java.util.ArrayList;

/**
 *
 * @author Aisling
 */
public class SalesReceiptDao extends Dao implements SalesReceiptDaoInterface
{

    /**
     *
     * @param dateOrdered
     * @param productName
     * @param price
     * @param quantity
     * @param memberId
     * @return
     */
    @Override
    public SalesReceipt insertIntoSalesReceipt(Date dateOrdered,String productName,double price,int quantity,int memberId)
    {
                  
        
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet generatedKeys = null;
        int receiptId = -1;
        SalesReceipt sr = null;
     
        
        try
        {

            conn = getConnection();
            String query = "Insert into salesReceipt(dateOrdered,productName,productPrice,quantity,memberId) values(?,?,?,?,?)";
            ps = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            
            ps.setDate(1,dateOrdered);
            ps.setString(2,productName);
            ps.setDouble(3,price);
            ps.setInt(4,quantity);
            ps.setInt(5,memberId);
           
            
            ps.executeUpdate();
            
            
            generatedKeys = ps.getGeneratedKeys();
            
            if(generatedKeys.next())
            {
                receiptId = generatedKeys.getInt(1);
            } 
 
            sr = new SalesReceipt(receiptId,dateOrdered,productName,(int) price,quantity,memberId);
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
            
            int receiptId;
            Date dateOrdered;
            String productName;
            int price;
            int quantity;
            int memberId;
            
            while (rs.next())
            {
                receiptId = rs.getInt("receiptId");
                dateOrdered = rs.getDate("dateOrdered");
                productName = rs.getString("productName");
                price = rs.getInt("productPrice");
                quantity = rs.getInt("quantity");
                memberId = rs.getInt("memberId");

                s = new SalesReceipt(receiptId,dateOrdered,productName, price,quantity,memberId);
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
    
     
   