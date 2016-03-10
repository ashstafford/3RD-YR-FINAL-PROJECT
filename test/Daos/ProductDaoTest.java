/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.Product;
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
public class ProductDaoTest 
{
    
    /**
     *
     */
    public ProductDaoTest() 
    {
        
    }

   

  
    


    /**
     * Test of getAllProducts method, of class ProductDao.
     */
    @Test
    public void testGetAllProducts() {
        System.out.println("getAllProducts");
        ProductDao instance = new ProductDao();
        ArrayList<Product> expResult = instance.getAllProducts();;
        ArrayList<Product> result = instance.getAllProducts();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
       
    }

    /**
     * Test of getProductsByCategory method, of class ProductDao.
     */
    @Test
    public void testGetProductsByCategory() {
        System.out.println("getProductsByCategory");
        String category = "The Walking Dead";
        ProductDao instance = new ProductDao();
        ArrayList<Product> expResult = instance.getProductsByCategory(category);
        ArrayList<Product> result = instance.getProductsByCategory(category);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        
    }

    /**
     * Test of findProductByTitle method, of class ProductDao.
     */
    @Test
    public void testFindProductByTitle() {
        System.out.println("findProductByTitle");        
        String title = "DOCTOR WHO TARDIS HOODY";
        ProductDao instance = new ProductDao();
        ArrayList<Product> expResult = instance.findProductsByTitle(title);
        ArrayList<Product> result = instance.findProductsByTitle(title);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
   
    }

    /**
     * Test of findProductById method, of class ProductDao.
     */
    @Test
    public void testFindProductById() 
    {
        System.out.println("findProductById");
        int id = 0;
        ProductDao instance = new ProductDao();
        Product expResult = null;
        Product result = instance.findProductById(id);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        
    }

  

    /**
     * Test of findProductsByTitle method, of class ProductDao.
     */
    @Test
    public void testFindProductsByTitle() {
        System.out.println("findProductsByTitle");
        String title = "GAME OF THRONES 4-PIECE HOLIDAY ORNAMENT SET";
        ProductDao instance = new ProductDao();
        ArrayList<Product> expResult = instance.findProductsByTitle(title);
        ArrayList<Product> result = instance.findProductsByTitle(title);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of addProduct method, of class ProductDao.
     */
   
    

    /**
     * Test of checkQuantityInStock method, of class ProductDao.
     */
    @Test
    public void testCheckQuantityInStock()
    {
        System.out.println("checkQuantityInStock");
        int id = 2;
        ProductDao instance = new ProductDao();
        int expResult = 2;
        int result = instance.checkQuantityInStock(id);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of editProductDetails method, of class ProductDao.
     */
//    @Test
//    public void testEditProductDetails()
//    {
//        System.out.println("editProductDetails");
//        int id = 2;
//        String productImageUrl = "images/IMG_starwars2.jpg";
//        String productName = "STAR WARS COMIC COVER T-SHIRT";
//        double productPrice = 25.0;
//        int quantityInStock = 10;
//        String category = "Star Wars";
//        ProductDao instance = new ProductDao();
//        boolean expResult = instance.editProductDetails(id, productImageUrl, productName, productPrice, quantityInStock, category);    
//        boolean result = instance.editProductDetails(id, productImageUrl, productName, productPrice, quantityInStock, category);
//        assertEquals(expResult, result);
//        System.out.println("Test Passed");
//        boolean p= instance.editProductDetails(2,"images/IMG_starwars2.jpg","STAR WARS COMIC COVER T-SHIRT",25.0,10,"Star Wars");
//        instance.editProductDetails(id, productImageUrl, productName, productPrice, quantityInStock, category);
//        // TODO review the generated test code and remove the default call to fail.
//        //fail("The test case is a prototype.");
//    }

   
    

    
    /**
     * Test of removeProduct method, of class ProductDao.
     */
    @Test
    public void testRemoveProduct()
    {
        System.out.println("removeProduct");
        int productId = 1;
        ProductDao instance = new ProductDao();
        boolean expResult = true;
        boolean result = instance.removeProduct(productId);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of addProduct method, of class ProductDao.
     */
    @Test
    public void testAddProduct() {
        System.out.println("addProduct");
        String productImageUrl = "images/IMG_GOT1.jpg";
        String productName = "red top";
        double productPrice = 20.0;
        int quantityInStock = 10;
        String category = "The Walking Dead";
        ProductDao instance = new ProductDao();
        boolean expResult = instance.addProduct(productImageUrl, productName, productPrice, quantityInStock, category);
        boolean result = instance.addProduct(productImageUrl, productName, productPrice, quantityInStock, category);
        assertEquals(expResult, result);
        System.out.println("Test Passed");
        ArrayList<Product> p = instance.findProductsByTitle("red top");
    }
    
}
