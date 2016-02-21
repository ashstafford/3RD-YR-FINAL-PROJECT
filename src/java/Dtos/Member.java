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
    private String firstName;
    private String lastName;
    private String userName;
    private String password;
    private String email;
    private String memberImageUrl;
    private boolean isAdmin;

    /**
     *
     */
    public Member()
    {
        memberId = 2;        
        firstName = "Ben";
        lastName = "VanRhee";
        address = "Tipperary";
        userName = "bennyboy";
        password = "password";
        email = "ben@gmail.com";
        memberImageUrl = "IMG_TWD1.jpg";
        isAdmin = false;
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
    public Member(int memberId, String firstName, String lastName, String userName, String password,String email,String memberImageUrl,boolean isAdmin)
    {
        this.memberId = memberId;
        this.firstName = firstName;
        this.lastName = lastName;
       
        this.userName = userName;
        this.password = password;
        this.email = email;
        this.memberImageUrl = memberImageUrl;
        this.isAdmin = isAdmin;
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
    public boolean isIsAdmin() 
    {
        return isAdmin;
    }
    
       /**
     *
     * @param isAdmin
     */
    public void setIsAdmin(boolean isAdmin) 
    {
        this.isAdmin = isAdmin;
    }

    @Override
    public int hashCode() 
    {
        int hash = 7;
        hash = 97 * hash + this.memberId;
        hash = 97 * hash + Objects.hashCode(this.firstName);
        hash = 97 * hash + Objects.hashCode(this.lastName);
        hash = 97 * hash + Objects.hashCode(this.userName);
        hash = 97 * hash + Objects.hashCode(this.password);
        hash = 97 * hash + Objects.hashCode(this.email);
        hash = 97 * hash + Objects.hashCode(this.memberImageUrl);
        hash = 97 * hash + (this.isAdmin ? 1 : 0);
        return hash;
    }

    @Override
    public boolean equals(Object obj) 
    {
        if (obj == null) 
        {
            return false;
        }
        if (getClass() != obj.getClass()) 
        {
            return false;
        }
        final Member other = (Member) obj;
        if (this.memberId != other.memberId)
        {
            return false;
        }
        if (!Objects.equals(this.firstName, other.firstName)) 
        {
            return false;
        }
        if (!Objects.equals(this.lastName, other.lastName)) 
        {
            return false;
        }
        if (!Objects.equals(this.userName, other.userName))
        {
            return false;
        }
        if (!Objects.equals(this.password, other.password)) 
        {
            return false;
        }
        if (!Objects.equals(this.email, other.email)) 
        {
            return false;
        }
        if (!Objects.equals(this.memberImageUrl, other.memberImageUrl))
        {
            return false;
        }
        if (this.isAdmin != other.isAdmin)
        {
            return false;
        }
        return true;
    }

    @Override
    public String toString() 
    {
        return "Member{" + "memberId=" + memberId + ", firstName=" + firstName + ", lastName=" + lastName + ", userName=" + userName + ", password=" + password + ", email=" + email + ", memberImageUrl=" + memberImageUrl + ", isAdmin=" + isAdmin + '}';
    }

   
    
    
    
}
