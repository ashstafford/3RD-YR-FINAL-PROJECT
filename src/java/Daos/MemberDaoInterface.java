/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.Member;
import Exceptions.DaoException;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import javax.servlet.http.Part;

/**
 *
 * @author Aisling
 */
public interface MemberDaoInterface
{

    /**
     *
     * @return
     */
    public ArrayList<Member> getAllMembers();

    /**
     *
     * @param userName
     * @param passWord
     * @return
     * @throws DaoException
     */
    public Member findMemberByUserNamePassword(String userName, String passWord) throws DaoException;

    /**
     *
     * @param username
     * @return
     */
    public Member findMemberByUsername(String username);

     public Member addMember(String userName, String password, String firstName, String lastName, String email, BufferedImage memberImage, String securityQuestionAnswer, boolean isAdmin);

    /**
     *
     * @param userName
     * @param newUserName
     * @return
     */
    public boolean editUserName(int id, String userName, String newUserName);

    /**
     *
     * @param password
     * @param newPassword
     * @return
     */
    public boolean editPassword(int id, String password, String newPassword);

    /**
     *
     * @param firstName
     * @param newFirstname
     * @return
     */
    public boolean editFirstName(int id, String firstName, String newFirstname);

    /**
     *
     * @param lastName
     * @param newLastName
     * @return
     */
    public boolean editLastName(int id, String lastName, String newLastName);

    /**
     *
     * @param email
     * @return
     */
    public String findEmailAddress(String eMail);

    public Member findMemberByEmailAddress(String eMail);

    public BufferedImage editMemberImageUrl(String newMemberImageUrl);

    public boolean editEmail(int id, String email, String newEmail);

    public BufferedImage editMemberImageUrl(int id, String newMemberImageUrl);

    public Member findMemberById(int id);

    public boolean addAdmin(Member m);

    public boolean removeMember(int memberId);
 
    
}
