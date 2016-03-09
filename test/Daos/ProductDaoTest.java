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

    @BeforeClass
    public static void setUpClass() throws Exception {
    }

    @AfterClass
    public static void tearDownClass() throws Exception {
    }

    @Before
    public void setUp() throws Exception {
    }

    @After
    public void tearDown() throws Exception {
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

    /**
     * Test of addProduct method, of class ProductDao.
     */
//    @Test
//    public void testAddProduct() {
//        System.out.println("addProduct");
//        String productImageUrl = "";
//        String productName = "";
//        double productPrice = 0.0;
//        int quantityInStock = 0;
//        String category = "";
//        ProductDao instance = new ProductDao();
//        boolean expResult = false;
//        boolean result = instance.addProduct(productImageUrl, productName, productPrice, quantityInStock, category);
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }

    /**
     * Test of findProductsByTitle method, of class ProductDao.
     */
    @Test
    public void testFindProductsByTitle() {
        System.out.println("findProductsByTitle");
        String title = "";
        ProductDao instance = new ProductDao();
        ArrayList<Product> expResult = null;
        ArrayList<Product> result = instance.findProductsByTitle(title);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of addProduct method, of class ProductDao.
     */
//    @Test
//    public void testAddProduct() {
//        System.out.println("addProduct");
//        String productImageUrl = "";
//        String productName = "red top";
//        double productPrice = 20.0;
//        int quantityInStock = 10;
//        String category = "The Walking Dead";
//        ProductDao instance = new ProductDao();
//        boolean expResult = true;
//        boolean result = instance.addProduct(productImageUrl, productName, productPrice, quantityInStock, category);
//        assertEquals(expResult, result);
//        System.out.println("Test Passed");
//        ArrayList<Product> p = instance.findProductsByTitle("red top");
//    }
    
}
