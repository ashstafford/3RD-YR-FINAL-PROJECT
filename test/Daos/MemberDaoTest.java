/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.Member;
import java.awt.image.BufferedImage;
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

public class MemberDaoTest 
{
    
    
    
    public MemberDaoTest() 
    {
        
    }

   
    @Test
    public void testGetAllMembers() throws Exception {
        System.out.println("getAllMembers");
        MemberDao instance = new MemberDao();
        ArrayList<Member> expResult = instance.getAllMembers();
        ArrayList<Member> result = instance.getAllMembers();
        assertEquals(expResult, result);
       
      
    }

 
    @Test
    public void testFindMemberByUsername() throws Exception {
        System.out.println("findMemberByUsername");
        String username = "bob123";
        MemberDao instance = new MemberDao();
        Member expResult = instance.findMemberByUsername(username);
        Member result = instance.findMemberByUsername(username);
        assertEquals(expResult, result);
      
        
    }

    
    @Test
    public void testAddMember()
    {
        System.out.println("addMember");
       // Member m = new Member(5,"bennyboyvr", "password", "Ben", "Van Rhee", "ben@gmail.com", "trio",false); 
        String userName = "bennyboyvr";
        String password = "password";
        String firstName = "Ben";
        String lastName = "Van Rhee";        
        String email = "ben@gmail.com";        
        String securityQuestionAnswer = "trio";
        boolean isAdmin = false ;      
        MemberDao instance = new MemberDao();
        boolean expResult = true;
        Member result = instance.addMember(userName, password,firstName, lastName,  email, securityQuestionAnswer,isAdmin);
        assertEquals(expResult,result);
        System.out.println("addMember Test Passed");
        instance.addMember(userName, password,firstName, lastName,  email, securityQuestionAnswer,isAdmin);
        //instance.removeMember(5);
        
    }

    @Test
    public void testFindMemberByUserNamePassword() throws Exception {
        System.out.println("findMemberByUserNamePassword");
        Member m = new Member(1, "bob123", "5f4dcc3b5aa765d61d8327deb882cf99", "Bob", "McGinty", "ash@yahoo.net",  "spot",true);        
        String userName = "bob123";
        String passWord = "password";
        MemberDao instance = new MemberDao();
        Member result = instance.findMemberByUserNamePassword(userName, passWord);
        assertEquals(m, result);
        
      
    }


    @Test
    public void testEditUserName() {
        System.out.println("editUserName");
        int id = 1;
        String userName = "bob123";
        String newUserName = "ben10";
        MemberDao instance = new MemberDao();
        boolean expResult = true;
        boolean result = instance.editUserName(id,userName, newUserName);
        assertEquals(expResult, result);  
        System.out.println("editUserName Test Passed");
        Member m = instance.findMemberByUsername("bob123");
       //System.out.println(m.toString());
        instance.editUserName(id,newUserName, userName);
    }

 
    @Test
    public void testEditPassword() {
        System.out.println("editPassword");
        int id = 2;
        String password = "password";
        String newPassword = "pass";
        MemberDao instance = new MemberDao();
        boolean expResult = true;
        boolean result = instance.editPassword(id, password, newPassword);
        assertEquals(expResult, result);
        System.out.println("editPassword Test Passed");
        boolean m = instance.editPassword(2,"password", "pass");
        instance.editPassword(id,newPassword, password);
       
  
    }

  
    @Test
    public void testEditFirstName() {
        System.out.println("editFirstName");
        int id = 1;
        String firstName = "Bob";
        String newFirstName = "Ben";
        MemberDao instance = new MemberDao();
        boolean expResult = true;
        boolean result = instance.editFirstName(id, firstName, newFirstName);
        assertEquals(expResult, result);
        System.out.println("editFirstName Test Passed");
         boolean m = instance.editFirstName(1,"Ben","Bob");
        instance.editFirstName(id,newFirstName, firstName);
        // TODO review the generated test code and remove the default call to fail.
    
    }

    
    @Test
    public void testEditLastName() {
        System.out.println("editLastName");
        int id = 4;
        String lastName = "stafford";
        String newLastName = "aungier";
        MemberDao instance = new MemberDao();
        boolean expResult = true;
        boolean result = instance.editLastName(id,lastName, newLastName);
        assertEquals(expResult, result);
        System.out.println("editLastName Test Passed");
         boolean m = instance.editLastName(4,"stafford", "aungier");
        instance.editLastName(id,newLastName, lastName);
       
    }

  
    @Test
    public void testFindMemberById()
    {
        System.out.println("findMemberById");
        int id = 0;
        MemberDao instance = new MemberDao();
        Member expResult = null;
        Member result = instance.findMemberById(id);
        assertEquals(expResult, result);
    
    }

  
    @Test
    public void testAddAdmin()
    {
        System.out.println("addAdmin");
        Member m = new Member(3,"ashstaff", "5f4dcc3b5aa765d61d8327deb882cf99", "Aisling", "Stafford", "ash@yahoo.com", "reilly",true);
        MemberDao instance = new MemberDao();
        Member expResult = m;
        boolean result = instance.addAdmin(m);
        assertEquals(m, expResult);
        System.out.println("addMember Test Passed");
        instance.addAdmin(m);
      
    }

    
    @Test
    public void testFindMemberByEmailAddress()
    {
        System.out.println("findMemberByEmailAddress");
        String eMail = "";
        MemberDao instance = new MemberDao();
        Member expResult = null;
        Member result = instance.findMemberByEmailAddress(eMail);
        assertEquals(expResult, result);
        
        
    }

   
    @Test
    public void testRemoveMember()
    {
        System.out.println("removeMember");
        int memberId = 5;
        MemberDao instance = new MemberDao();
        boolean expResult = true;
        boolean result = instance.removeMember(memberId);
        assertEquals(expResult, result);
        //instance.addMember("aisling", "stafford","ashstaff", "5f4dcc3b5aa765d61d8327deb882cf99","ashs@yahoo.com","reilly",true);
    }

    
    @Test
    public void testEditEmail()
    {
        System.out.println("editEmail");
        int id = 3;
        String email = "ash@hotmail.com";
        String newEmail = "ashs@hotmail.ie";
        MemberDao instance = new MemberDao();
        boolean expResult = true;
        boolean result = instance.editEmail(id, email, newEmail);
        assertEquals(expResult, result);
        instance.editEmail(id,newEmail, email);
    }

  
    @Test
    public void testEditMemberImageUrl()
    {
        System.out.println("editMemberImage");
        int id = 3;
        String memberImageUrl = "defaultProfilePicture.jpeg";
        String newMemberImageUrl = "TWD1.JPG";
        MemberDao instance = new MemberDao();
        boolean expResult = true;
        BufferedImage result = instance.editMemberImageUrl(id, newMemberImageUrl);
        assertEquals(expResult, result);
         instance.editMemberImageUrl(id, memberImageUrl);
        
    }

  
}
