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
public class OrderItemDao extends Dao
{
    
//     public void AddToCart(int orderNo,String productName,double price,int productId,String category,int memberId) //borrow a book from the libary
//     {
//      
//            int noOfCopiesCount = checkNoOfCopies(isbn); //checks how many copies are left
//            
//            int newNoOfCopies = noOfCopiesCount - 1; //takes 1 away from the number of copies available
//            
//            Connection conn = null;
//            PreparedStatement ps = null;
//            ResultSet rs = null;
//
//            try 
//            {   
//                 java.util.Date utilDate = new java.util.Date();
//                 
//                 java.sql.Date d1 = new java.sql.Date(utilDate.getTime()); //gets current date
//              
//                 
//            
//               
//                
//                //SalesReceiptDao.insertIntobooksBorrowed(borrowId,d1,d2,title,author,isbn,userName); //method to insert the book into the booksOnLoan table
//
//                    
//
//                conn = getConnection();
//                String query = "Update books set noOfCopies =? where isbn=?";  //updates the number of copies of a book left when it is borrowed
//                ps = conn.prepareStatement(query);
//                ps.setInt(1, newNoOfCopies);
//                ps.setInt(2, isbn);
//                
//                ps.executeUpdate();
//                
//              
//               
//
//               
//            } 
//            
//            catch (SQLException e) 
//            {
//                System.out.println("Exception happened in borrowBook method");
//                e.getMessage();
//                e.printStackTrace();
//
//            }
//            
//            finally 
//            {
//                try
//                {
//                    if (rs != null) 
//                    {
//                        rs.close();
//                    }
//                    
//                    if (ps != null) 
//                    {
//                        ps.close();
//                    }
//                    
//                    if (conn != null) 
//                    {
//                        conn.close();
//                    }
//
//                } 
//                
//                catch (SQLException e) 
//                {
//                    System.out.println("Exception happened in 'finally' part of the borrowBook method");
//                    e.getMessage();
//                }
//            }
//        }

     //@Override
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
