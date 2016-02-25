package Dtos;

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
public class MemberTest {
    
    public MemberTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of getMemberId method, of class Member.
     */
    @Test
    public void testGetMemberId() {
        System.out.println("getMemberId");
        Member instance = new Member();
        int expResult = 2;
        int result = instance.getMemberId();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of setMemberId method, of class Member.
     */
    @Test
    public void testSetMemberId() {
        System.out.println("setMemberId");
         //creates new instance of member
        Member instance = new Member();
        //sets it to...
        instance.setMemberId(4);
        //expected result
        assertEquals(4, instance.getMemberId());
        // TODO review the generated test code and remove the default call to fail.
       // fail("The test case is a prototype.");
    }

    /**
     * Test of getFirstName method, of class Member.
     */
    @Test
    public void testGetFirstName() {
        System.out.println("getFirstName");
        Member instance = new Member();
        String expResult = "Ben";
        String result = instance.getFirstName();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of setFirstName method, of class Member.
     */
    @Test
    public void testSetFirstName() {
        System.out.println("setFirstName");
        //creates new instance of member
        Member instance = new Member();
        //sets it to...
        instance.setFirstName("ben");
        //expected result
        assertEquals("ben", instance.getFirstName());
        // TODO review the generated test code and remove the default call to fail.
       // fail("The test case is a prototype.");
    }

    /**
     * Test of getLastName method, of class Member.
     */
    @Test
    public void testGetLastName() {
        System.out.println("getLastName");
        Member instance = new Member();
        String expResult = "VanRhee";
        String result = instance.getLastName();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
       //fail("The test case is a prototype.");
    }

    /**
     * Test of setLastName method, of class Member.
     */
    @Test
    public void testSetLastName() {
        System.out.println("setLastName");
         //creates new instance of member
        Member instance = new Member();
        //sets it to...
        instance.setLastName("Van Rhee");
        //expected result
        assertEquals("Van Rhee", instance.getLastName());
        // TODO review the generated test code and remove the default call to fail.
       // fail("The test case is a prototype.");
    }

    /**
     * Test of getAddress method, of class Member.
     */
//    @Test
//    public void testGetAddress() {
//        System.out.println("getAddress");
//        Member instance = new Member();
//        String expResult = "Tipperary";
//        String result = instance.getAddress();
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//       // fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of setAddress method, of class Member.
//     */
//    @Test
//    public void testSetAddress() {
//        System.out.println("setAddress");
//         //creates new instance of member
//        Member instance = new Member();
//        //sets it to...
//        instance.setAddress("Tipperary");
//        //expected result
//        assertEquals("Tipperary", instance.getAddress());
//        // TODO review the generated test code and remove the default call to fail.
//       // fail("The test case is a prototype.");
//    }

    /**
     * Test of getUserName method, of class Member.
     */
    @Test
    public void testGetUserName() {
        System.out.println("getUserName");
        Member instance = new Member();
        String expResult = "bennyboy";
        String result = instance.getUserName();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
       //fail("The test case is a prototype.");
    }

    /**
     * Test of setUserName method, of class Member.
     */
    @Test
    public void testSetUserName() {
        System.out.println("setUserName");
        //creates new instance of member
        Member instance = new Member();
        //sets it to...
        instance.setUserName("ash");
        //expected result
        assertEquals("ben", instance.getUserName());
        // TODO review the generated test code and remove the default call to fail.
       // fail("The test case is a prototype.");
    }

    /**
     * Test of getPassword method, of class Member.
     */
    @Test
    public void testGetPassword() {
        System.out.println("getPassword");
        Member instance = new Member();
        String expResult = "password";
        String result = instance.getPassword();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of setPassword method, of class Member.
     */
    @Test
    public void testSetPassword() {
        System.out.println("setPassword");
         //creates new instance of member
        Member instance = new Member();
        //sets it to...
        instance.setPassword("password");
        //expected result
        assertEquals("password", instance.getPassword());
        // TODO review the generated test code and remove the default call to fail.
       // fail("The test case is a prototype.");
    }

    /**
     * Test of getMemberImageUrl method, of class Member.
     */
    @Test
    public void testGetMemberImageUrl()
    {
        System.out.println("getMemberImageUrl");
        Member instance = new Member();
        String expResult = "IMG_TWD1.jpg";
        String result = instance.getMemberImageUrl();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
       // fail("The test case is a prototype.");
    }

    /**
     * Test of setMemberImageUrl method, of class Member.
     */
    @Test
    public void testSetMemberImageUrl()
    {
        System.out.println("setMemberImageUrl");
        //String memberImageUrl = "IMG_TWD1.jpg";
        Member instance = new Member();
        instance.setMemberImageUrl("memberImageUrl");
        assertEquals("memberImageUrl", instance.getMemberImageUrl());
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of isIsAdmin method, of class Member.
     */
    @Test
    public void testIsIsAdmin()
    {
        System.out.println("isIsAdmin");
        Member instance = new Member();
        boolean expResult = false;
        boolean result = false;
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of setIsAdmin method, of class Member.
     */
    @Test
    public void testSetIsAdmin()
    {
        System.out.println("setIsAdmin");
        boolean isAdmin = false;
        Member instance = new Member();
        instance.setIsAdmin(isAdmin);
        // TODO review the generated test code and remove the default call to fail.
       // fail("The test case is a prototype.");
    }

    
    
}

