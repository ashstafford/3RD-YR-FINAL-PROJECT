/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.Member;
import Exceptions.DaoException;
import java.util.ArrayList;

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
    public Member findMemberByUserNamePassword(String userName, String passWord)  throws DaoException;

    /**
     *
     * @param username
     * @return
     */
    public Member findMemberByUsername(String username);

    /**
     *
     * @param firstName
     * @param lastName
     * @param userName
     * @param password
     * @param email
     * @param memberImageUrl
     * @param isAdmin
     * @return
     */
    public Member addMember(String firstName, String lastName, String userName, String password,String email,String memberImageUrl,boolean isAdmin); 

    /**
     *
     * @param userName
     * @param newUserName
     * @return
     */
    public boolean editUserName(String userName,String newUserName);

    /**
     *
     * @param password
     * @param newPassword
     * @return
     */
    public boolean editPassword(String password,String newPassword);

    /**
     *
     * @param firstName
     * @param newFirstname
     * @return
     */
    public boolean editFirstName(String firstName,String newFirstname);

    /**
     *
     * @param lastName
     * @param newLastName
     * @return
     */
    public boolean editLastName(String lastName,String newLastName);

    /**
     *
     * @param email
     * @return
     */
    public Member findMemberByEmailAddress(String eMail); 
    
    
}
