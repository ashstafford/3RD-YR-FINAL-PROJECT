/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.Product;
import Exceptions.DaoException;
import java.util.ArrayList;

/**
 *
 * @author Aisling
 */
public interface ProductDaoInterface
{

    /**
     *
     * @return
     */
    public ArrayList<Product> getAllProducts();

    /**
     *
     * @param title
     * @return
     */
    public ArrayList<Product> findProductsByTitle(String title);

    /**
     *
     * @param id
     * @return
     */
    public Product findProductById(int id);

    /**
     *
     * @param category
     * @return
     */
    public ArrayList<Product> getProductsByCategory(String category);
    
    public boolean addProduct(String productImageUrl,String productName,double productPrice,int quantityInStock,String category);
    
    public boolean editProductDetails(int id,String productImageUrl,String productName, double productPrice,int quantityInStock,String category);
    
    public int checkQuantityInStock(int id);
    
    public boolean removeProduct(int productId);
}
