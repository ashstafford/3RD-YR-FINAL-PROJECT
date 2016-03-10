/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Service;

import Daos.MemberDao;
import Dtos.Member;
import Exceptions.DaoException;
import java.util.List;

/**
 *
 * @author Aisling
 */
public class MemberService
{

    /**
     *
     */
    public MemberService()
    {
        
    }
    
    /**
     *
     * @param username
     * @param password
     * @return
     */
    public Member login(String username, String password)
    {
        System.out.println("Got to here");
        Member m = null;
        try 
        {
            MemberDao mDao = new MemberDao();
            m = mDao.findMemberByUserNamePassword(username, password);
             
            
        } 
        catch (DaoException e) 
        {
            e.printStackTrace();
        }
        
        return m;
    }
	
    /**
     *
     * @return
     */
    public List<Member> getAllMembers() 
    {
        List<Member> members = null;
//        try 
//        {
            MemberDao mDao = new MemberDao();
            members = mDao.getAllMembers();
       // } 
//        catch (DaoException e)                                 CAUGHT BUT NEVER THROWN
//        {
//            e.printStackTrace();
//        }
        return members;	
    }	
}
