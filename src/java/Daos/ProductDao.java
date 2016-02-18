/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;


import Dtos.Product;
import Exceptions.DaoException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Ben
 */
public class ProductDao extends Dao implements ProductDaoInterface
{

    /**
     *
     * @return
     */
    @Override
    public ArrayList<Product> getAllProducts() 
    {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        ArrayList<Product> products = new ArrayList<>();
        
        try 
        {
            conn = getConnection();
            String query = "Select * from product";

            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                Product prod = new Product(
                        rs.getInt("productId"),
                        rs.getString("productImageUrl"),
                        rs.getString("productName"),
                        rs.getDouble("productPrice"),
                        rs.getInt("quantityInStock"),
                        rs.getString("category"));

                products.add(prod);
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
        return products;

    }
    
    /**
     *
     * @param category
     * @return
     */
    @Override
    public ArrayList<Product> getProductsByCategory(String category) 
    {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        ArrayList<Product> products = new ArrayList<>();
        
        try 
        {
            conn = getConnection();
            String query = "select * from product where category=?";

            ps = conn.prepareStatement(query);
            
            ps.setString(1, category);
            
            rs = ps.executeQuery();

            while (rs.next()) 
            {
                Product prod = new Product(
                        rs.getInt("productId"),
                        rs.getString("productImageUrl"),
                        rs.getString("productName"),
                        rs.getDouble("productPrice"),
                        rs.getInt("quantityInStock"),
                        rs.getString("category"));

                products.add(prod);
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
        return products;

    }
    
    /**
     *
     * @param title
     * @return
     */
    @Override
    public Product findProductByTitle(String title)   //takes in title and returns all details about that product
    {
            Connection conn = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            
           Product prod = null; 
            
            try 
            {
                     
                conn = getConnection();
                String query = "select * from product where productName=?";
                ps = conn.prepareStatement(query);
                
                ps.setString(1, title);

                rs = ps.executeQuery();
                
             while (rs.next()) 
             {
                 prod = new Product(
                 rs.getInt("productId"),
                 rs.getString("productImageUrl"),        
                 rs.getString("productName"),
                 rs.getDouble("productPrice"),
                 rs.getInt("quantityInStock"),
                 rs.getString("category"));
                  
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
            
        return prod;    
    }   

    /**
     *
     * @param id
     * @return
     */
    @Override
 public Product findProductById(int id)  //takes in id and returns all details about that product
 {
            Connection conn = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            
            Product prod = new Product();
            
            prod = null; 
            
            try 
            {
                     
                conn = getConnection();
                String query = "select * from product where productId=?";
                ps = conn.prepareStatement(query);
                
                ps.setInt(1, id);

                rs = ps.executeQuery();
                
             while (rs.next()) 
             {
                 prod = new Product(
                 rs.getInt("productId"),
                 rs.getString("productImageUrl"),        
                 rs.getString("productName"),
                 rs.getDouble("productPrice"),
                 rs.getInt("quantityInStock"),        
                 rs.getString("category"));
                  
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
            
        return prod;    
    }   
}

