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
 * @author Natalia
 */
public class ProductDaoTest 
{
    
    /**
     *
     */
    public ProductDaoTest() 
    {
        
    }
    
//    /**
//     *
//     */
//    @BeforeClass
//    public static void setUpClass()
//    {
//        
//    }
//    
//    /**
//     *
//     */
//    @AfterClass
//    public static void tearDownClass() 
//    {
//        
//    }
//    
//    /**
//     *
//     */
//    @Before
//    public void setUp()
//    {
//        
//    }
//    
//    /**
//     *
//     */
//    @After
//    public void tearDown() 
//    {
//        
//    }

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
    
}
