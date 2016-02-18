/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.Member;
import java.util.ArrayList;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Karen
 */
public class MemberDaoTest {
    
    /**
     *
     */
    public MemberDaoTest() {
    }
    
    /**
     *
     */
    @BeforeClass
    public static void setUpClass() {
    }
    
    /**
     *
     */
    @AfterClass
    public static void tearDownClass() {
    }
    
    /**
     *
     */
    @Before
    public void setUp() {
    }
    
    /**
     *
     */
    @After
    public void tearDown() {
    }

    /**
     * Test of getAllMembers method, of class MemberDao.
     * @throws java.lang.Exception
     */
    @Test
    public void testGetAllMembers() throws Exception {
        System.out.println("getAllMembers");
        MemberDao instance = new MemberDao();
        ArrayList<Member> expResult = instance.getAllMembers();
        ArrayList<Member> result = instance.getAllMembers();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
      
    }

    /**
     * Test of findMemberByUsername method, of class MemberDao.
     * @throws java.lang.Exception
     */
    @Test
    public void testFindMemberByUsername() throws Exception {
        System.out.println("findMemberByUsername");
        String username = "bob123";
        MemberDao instance = new MemberDao();
        Member expResult = null;
        Member result = instance.findMemberByUsername(username);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        
    }

    /**
     * Test of addMember method, of class MemberDao.
     */
    @Test
    public void testAddMember() {
        System.out.println("addMember");
        String firstName = "";
        String lastName = "";
        String address = "";
        String userName = "";
        String password = "";
        String email = "";
        String memberImageUrl = "";
        boolean isAdmin = false ;
        MemberDao instance = new MemberDao();
        Member expResult = instance.addMember(firstName, lastName, address, userName, password, email, memberImageUrl, isAdmin);
        Member result = instance.addMember(firstName, lastName, address, userName, password, email, memberImageUrl, isAdmin);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
     
    }

    /**
     * Test of findMemberByUserNamePassword method, of class MemberDao.
     * @throws java.lang.Exception
     */
    @Test
    public void testFindMemberByUserNamePassword() throws Exception {
        System.out.println("findMemberByUserNamePassword");
        Member m = new Member(5, "bob", "ger", "fger", "b", "password", "bob@gmail.com", "IMG_TWD1.jpg", true);
        
        String userName = "b";
        String passWord = "password";
        MemberDao instance = new MemberDao();

        Member result = instance.findMemberByUserNamePassword(userName, passWord);
        assertEquals(m, result);
        // TODO review the generated test code and remove the default call to fail.
      
    }


    /**
     * Test of editUserName method, of class MemberDao.
     */
    @Test
    public void testEditUserName() {
        System.out.println("editUserName");
        String userName = "bob";
        String newUserName = "ash";
        MemberDao instance = new MemberDao();
        boolean expResult = true;
        boolean result = instance.editUserName(userName, newUserName);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
       
    }

    /**
     * Test of editPassword method, of class MemberDao.
     */
    @Test
    public void testEditPassword() {
        System.out.println("editPassword");
        String password = "password";
        String newPassword = "p";
        MemberDao instance = new MemberDao();
        boolean expResult = true;
        boolean result = instance.editPassword(password, newPassword);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
  
    }

    /**
     * Test of editFirstName method, of class MemberDao.
     */
    @Test
    public void testEditFirstName() {
        System.out.println("editFirstName");
        String firstName = "anna";
        String newFirstName = "ann";
        MemberDao instance = new MemberDao();
        boolean expResult = true;
        boolean result = instance.editFirstName(firstName, newFirstName);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    
    }

    /**
     * Test of editLastName method, of class MemberDao.
     */
    @Test
    public void testEditLastName() {
        System.out.println("editLastName");
        String lastName = "stafford";
        String newLastName = "aungier";
        MemberDao instance = new MemberDao();
        boolean expResult = true;
        boolean result = instance.editLastName(lastName, newLastName);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    
    }

    /**
     * Test of editAddress method, of class MemberDao.
     * @throws java.lang.Exception
     */
    @Test
    public void testEditAddress() throws Exception {
        System.out.println("editAddress");
        String address = "1 main st";
        String newAddress = "19 dublin rd";
        MemberDao instance = new MemberDao();
        boolean expResult = true;
        boolean result = instance.editAddress(address, newAddress);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
       
    }
    
}
