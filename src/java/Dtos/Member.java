/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dtos;
//Hi aisling
import java.util.Objects;

/**
 *
 * @author Aisling
 */
public class Member
{
    private int memberId;
    private String userName;
    private String password;
    private String firstName;
    private String lastName;
    private String email;
    private String memberImageUrl;
    private boolean admin;

    /**
     *
     */
    public Member()
    {
        memberId = 2;        
        firstName = "Ben";
        lastName = "VanRhee";
        userName = "bennyboy";
        password = "password";
        email = "ben@gmail.com";
        memberImageUrl = "IMG_TWD1.jpg";
        admin = false;
    }   
    
    /**
     *
     * @param memberId
     * @param firstName
     * @param lastName
     * @param address
     * @param userName
     * @param password
     * 
     */
    public Member(int memberId, String userName, String password,String firstName,String lastName,  String email,String memberImageUrl,boolean admin)
    {
        this.memberId = memberId;
        this.userName = userName;
        this.password = password;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.memberImageUrl = memberImageUrl;
        this.admin = admin;
    }

    /**
     *
     * @return
     */
    public int getMemberId()
    {
        return memberId;
    }

    /**
     *
     * @param memberId
     */
    public void setMemberId(int memberId)
    {
        this.memberId = memberId;
    }

    /**
     *
     * @return
     */
    public String getFirstName()
    {
        return firstName;
    }

    /**
     *
     * @param firstName
     */
    public void setFirstName(String firstName)
    {
        this.firstName = firstName;
    }

    /**
     *
     * @return
     */
    public String getLastName()
    {
        return lastName;
    }

    /**
     *
     * @param lastName
     */
    public void setLastName(String lastName)
    {
        this.lastName = lastName;
    }

    /**
     *
     * @return
     */
    public String getUserName()
    {
        return userName;
    }

    /**
     *
     * @param userName
     */
    public void setUserName(String userName)
    {
        this.userName = userName;
    }

    /**
     *
     * @return
     */
    public String getPassword()
    {
        return password;
    }

    /**
     *
     * @param password
     */
    public void setPassword(String password)
    {
        this.password = password;
    }

    /**
     *
     * @return email
     */
    public String getEmail()
    {
        return email;
    }

    /**
     *
     * @param email
     */
    public void setEmail(String email)
    {
        this.email = email;
    }
    
    /**
     *
     * @return memberImageUrl
     */
    public String getMemberImageUrl()
    {
        return memberImageUrl;
    }

    /**
     *
     * @param memberImageUrl
     */
    public void setMemberImageUrl(String memberImageUrl)
    {
        this.memberImageUrl = memberImageUrl;
    }
    
       /**
     *
     * @return isAdmin
     */
    public boolean isAdmin() 
    {
        return admin;
    }
    
       /**
     *
     * @param isAdmin
     */
    public void setIsAdmin(boolean admin) 
    {
        this.admin = admin;
    }

    @Override
    public String toString() 
    {
        return "Member{" + "memberId=" + memberId + ", userName=" + userName + ", password=" + password + ", firstName=" + firstName + ", lastName=" + lastName + ", email=" + email + ", memberImageUrl=" + memberImageUrl + ", admin=" + admin + '}';
    }

    

    
   
    
    
    
}
