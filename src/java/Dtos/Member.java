/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dtos;
import java.awt.image.BufferedImage;
import java.sql.Blob;
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
    private BufferedImage memberImage;
    private String securtiyQuestionAnswer;
    private boolean admin;

    /**
     *
     */
    public Member()
    {
        memberId = 2;
        userName = "bennyboy";
        password = "password";        
        firstName = "Ben";
        lastName = "VanRhee";
        email = "ben@gmail.com";
        securtiyQuestionAnswer = "spot";
        admin = false;
    }   

    public Member(int memberId, String userName, String password, String firstName, String lastName, String email,String securtiyQuestionAnswer, boolean admin)
    {
        this.memberId = memberId;
        this.userName = userName;
        this.password = password;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.securtiyQuestionAnswer = securtiyQuestionAnswer;
        this.admin = admin;
    }

    public Member(int memberId, String userName, String password, String firstName, String lastName, String email, BufferedImage memberImageUrl, String securtiyQuestionAnswer, boolean admin)
    {
        this.memberId = memberId;
        this.userName = userName;
        this.password = password;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.memberImage = memberImageUrl;
        this.securtiyQuestionAnswer = securtiyQuestionAnswer;
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
    public BufferedImage getMemberImageUrl()
    {
        return memberImage;
    }

    /**
     *
     * @param memberImage
     */
    public void setMemberImage(BufferedImage memberImage)
    {
        this.memberImage = memberImage;
    }

    public String getSecurtiyQuestionAnswer()
    {
        return securtiyQuestionAnswer;
    }

    public void setSecurtiyQuestionAnswer(String securtiyQuestionAnswer)
    {
        this.securtiyQuestionAnswer = securtiyQuestionAnswer;
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
    public int hashCode()
    {
        int hash = 3;
        hash = 89 * hash + this.memberId;
        hash = 89 * hash + Objects.hashCode(this.userName);
        hash = 89 * hash + Objects.hashCode(this.password);
        hash = 89 * hash + Objects.hashCode(this.firstName);
        hash = 89 * hash + Objects.hashCode(this.lastName);
        hash = 89 * hash + Objects.hashCode(this.email);
        hash = 89 * hash + Objects.hashCode(this.memberImage);
        hash = 89 * hash + Objects.hashCode(this.securtiyQuestionAnswer);
        hash = 89 * hash + (this.admin ? 1 : 0);
        return hash;
    }

    @Override
    public boolean equals(Object obj)
    {
        if (this == obj)
        {
            return true;
        }
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
        if (this.admin != other.admin)
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
        if (!Objects.equals(this.firstName, other.firstName))
        {
            return false;
        }
        if (!Objects.equals(this.lastName, other.lastName))
        {
            return false;
        }
        if (!Objects.equals(this.email, other.email))
        {
            return false;
        }
        if (!Objects.equals(this.memberImage, other.memberImage))
        {
            return false;
        }
        if (!Objects.equals(this.securtiyQuestionAnswer, other.securtiyQuestionAnswer))
        {
            return false;
        }
        return true;
    }

    @Override
    public String toString()
    {
        return "Member{" + "memberId=" + memberId + ", userName=" + userName + ", password=" + password + ", firstName=" + firstName + ", lastName=" + lastName + ", email=" + email + ", memberImage=" + memberImage + ", securtiyQuestionAnswer=" + securtiyQuestionAnswer + ", admin=" + admin + '}';
    }
    
}
