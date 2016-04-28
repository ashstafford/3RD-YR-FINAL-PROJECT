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
import java.sql.Types;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Ben
 */
public class ProductDao extends Dao implements ProductDaoInterface
{

   
    /**
     *
     * @returns an arraylist of products
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
     * @pulls products name from database that match the string thats been typed in
     * 
     */
    
    @Override
    public ArrayList<String> getAutoCompleteData(String searchEntry) 
    {
                Connection conn = null;
		ArrayList<String> list = new ArrayList<String>();
		PreparedStatement ps = null;
                ResultSet rs = null;
                
		String data;
		
                try 
                {    
                    conn = getConnection();
                     
                    String query = "select productName from product where productName like ?";
                    
                    ps = conn.prepareStatement(query);
                    System.out.println("ps " + ps);
                    ps.setString(1, searchEntry + "%");

                    rs = ps.executeQuery();

                    while (rs.next())
                    {
                            data = rs.getString("productName");
                            list.add(data);
                    }                       
		}
                
                catch (Exception e) 
                {
			System.out.println(e.getMessage());
		}
                
		return list;
	}
    
    
    
       /**
     *
     * @creates a product with the information given by user thats an admin
     * 
     */
    
    @Override
    public boolean addProduct(String productImageUrl,String productName,double productPrice,int quantityInStock,String category)  
    {
            Connection conn = null;
            PreparedStatement ps = null;
            ResultSet generatedKeys = null;
            int productId = -1;
            ResultSet rs = null;
           
            
            try 
            {

                conn = getConnection();
                
                String query = "Insert into product (productId,productImageUrl,productName, productPrice,quantityInStock,category) values(?,?,?,?,?,?)"; 
                ps = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
                
                ps.setNull (1,Types.INTEGER);   // for auto increment
                ps.setString(2, productImageUrl);
                ps.setString(3, productName);
                ps.setDouble(4, productPrice);
                ps.setInt(5, quantityInStock);
                ps.setString(6,category);
                
                int i = ps.executeUpdate();  //updates the table
               
                generatedKeys = ps.getGeneratedKeys();
            
                if(generatedKeys.next())
                {
                   productId = generatedKeys.getInt(1);
                }
                if(i == 0)
                {
                    return false;
                }
       
              
            } 
              
            catch (SQLException e) 
            {
                System.out.println("Exception happened in addProduct method");
                System.out.println("adProduct: exception message = "+e.getMessage());
                
                return false;
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
                    System.out.println("Exception happened in 'finally' part of the addProduct method");
                    e.getMessage();
                }
            }
         return true;   
    }
    
    
     /**
     *
     * @removes product from database by finding the id of the product 
     * 
     */
    
        @Override
        public boolean removeProduct(int productId) 
        {
         
            Connection conn = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            
            
            try
            {

                conn = getConnection();
                String query = "delete from product where productId= ?"; 
                ps = conn.prepareStatement(query);
                ps.setInt(1, productId);

                ps.executeUpdate();

                

            }
            
            catch (SQLException e) 
            {
                System.out.println("Exception happened in delete title method");
                e.getMessage();
                return false;
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
                    System.out.println("Exception happened in 'finally' part of the delteTitle method");
                    e.getMessage();
                    return false;
                }
            }
          return true;  
        }
    
    /**
     *
     * @param category
     * @returns certain products by the chosen category
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
     * @returns products from database that match the string thats been typed in
     */
    @Override
    public ArrayList<Product> findProductsByTitle(String title)   //takes in title and returns all details about that product
    {
            Connection conn = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            
           Product prod = null; 
           System.out.println("Prod dao: " + title);
           ArrayList<Product> products = new ArrayList<>();
            try 
            {
                     
                conn = getConnection();
                String query = "select * from product where productName like ?";
                ps = conn.prepareStatement(query);
                
                
                ps.setString(1, "%" + title + "%" );

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
                 products.add(prod);
                 
            }
             
            
                //System.out.println("haha" + prod);
            
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
     * @param id
     * @returns product by taking in id and returns all details about that product
     */
    @Override
 public Product findProductById(int id)  
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
 
    /**
     *
     * @checks how many of a particular product is left by id
     */
 
       @Override
        public int checkQuantityInStock(int id)  
        {
            
            Connection conn = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            Product prod = null;
            int qtyInStock = 0;

        // ArrayList<Product> products = new ArrayList<>();

        try 
        {
            conn = getConnection();
            String query = "Select * from product where productId=?"; 
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            
            rs = ps.executeQuery();

          
            while (rs.next()) 
            {
                 //prod = new Product(
                 //rs.getInt("productId"),
                 //rs.getString("productImageUrl"),        
                 //rs.getString("productName"),
                 //rs.getDouble("productPrice"),
                 //rs.getInt("quantityInStock"),        
                 //rs.getString("category"));
                
                //products.add(prod);
                qtyInStock = rs.getInt("quantityInStock");

            }
            System.out.println("fdefef " + qtyInStock);
            //qtyInStock = prod.getQuantityInStock();

        } 
        
        catch (SQLException e) 
        {
            System.out.println("Exception happened in checkQuantityInStock method");
            e.getMessage();

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
                System.out.println("Exception happened in 'finally' part of the checkQuantityInStock method");
                e.getMessage();
            }
        }
//
//        Product prod1 = new Product();
//        
//        for (Product prod : products)
//        {
//            if (prod.getProductId() == id)  //if the id of the product we are checking is equal to an productId in the table
//            {
//                prod1 = prod;         
//            }
//        }
        
       // System.out.println(bk1.getNoofcopies() + " copies is left ");

        return qtyInStock;
    }
        
        
    /**
     *
     * @updates a particular product's quantity using its id and current quantity
     */
        
    @Override
    public boolean updateQuantityInStock(int newQuantityInStock,int productId) //throws DaoException
    {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try
        {
                
            conn = getConnection();
            String query = "update product set quantityInStock =? where productId=?";
            ps = conn.prepareStatement(query);
            
            ps.setInt(1,newQuantityInStock); 
            ps.setInt(2,productId);

            int i = ps.executeUpdate();
            System.out.println("i " + i);
            
            if(i == 0)
            {
                return false;
            }    
        } 
        catch (SQLException e)
        {
             e.printStackTrace();
            return false;
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
                return false;
            }
        }
        return true;
    }
    
    /**
     *
     * @updates a particular product's details using its id and updating its information
     */
    
    @Override
    public boolean editProductDetails(int id,String productImageUrl,String productName, double productPrice,int quantityInStock,String category) //throws DaoException
    {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try
        {
              System.out.println("id " + id);
              System.out.println("image " + productImageUrl);
              System.out.println("name " + productName);
              System.out.println("price " + productPrice);
              System.out.println("qty " + quantityInStock);
              System.out.println("category " + category);
         
        
            conn = getConnection();
            String query = "update product set productImageUrl =?, productName =?, productPrice=?, quantityInStock =?, category =? where productId=?";
            ps = conn.prepareStatement(query);
            
          
            ps.setString(1,productImageUrl);
            ps.setString(2,productName); 
            ps.setDouble(3,productPrice);
            ps.setInt(4,quantityInStock);
            ps.setString(5,category);
            ps.setInt(6,id);

            int rowsAffected = ps.executeUpdate();
            
            if(rowsAffected == 0)
            {
                return false;
            }    
            
        } 
        catch (SQLException e)
        {
             e.printStackTrace();
            return false;
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
                return false;
            }
        }
        return true;
    }
    

}

