/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.Member;
import Exceptions.DaoException;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author Karen
 */
public class MemberDao extends Dao implements MemberDaoInterface
{

    /**
     *
     * @return 
     */
    @Override
    public ArrayList<Member> getAllMembers() 
    {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        ArrayList<Member> member = new ArrayList<>();

        try
        {
            conn = getConnection();
            String query = "Select * from member";

            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next())
            {
                int memberId = rs.getInt("memberId");
                String firstName = rs.getString("firstName");
                String lastName = rs.getString("lastName");
                String userName = rs.getString("userName");
                String password = rs.getString("password");
                String email = rs.getString("email");
                String memberImageUrl = rs.getString("memberImageUrl");
                boolean isAdmin = rs.getBoolean("isAdmin");

                Member m = new Member(memberId, firstName, lastName,userName, password,email,memberImageUrl,isAdmin);
                member.add(m);
            }

        } 
        
        catch (SQLException e)
        {

            e.printStackTrace();
            
        } finally
        {
            try
            {
                if (rs != null)
                {
                    rs.close();
                }

                if (ps != null)
                {
                    ps.close();
                }

                if (conn != null)
                {
                    conn.close();
                }

            } catch (SQLException e)
            {
                e.printStackTrace();
            }
        }

        return member;
    }

    /**The method takes in a username parameter and searches the database for 
     * a matching member based on their username.
     * 
     *
     * @param username String variable which stores the username being searched  
     * @return the member object for the corresponding username 
     */
    @Override
    public Member findMemberByUsername(String username) 
    {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Member m = null;

        try
        {
            con = this.getConnection();

            String query = "select * from member where userName =?";
            ps = con.prepareStatement(query);
            ps.setString(1, username);

            rs = ps.executeQuery();
            if (rs.next())
            {
                int memberId = rs.getInt("memberId");
                String firstName = rs.getString("firstName");
                String lastName = rs.getString("lastName");
                String userName = rs.getString("username");
                String password = rs.getString("password");
                String email = rs.getString("email");
                String memberImageUrl = rs.getString("memberImageUrl");
                boolean isAdmin = rs.getBoolean("isAdmin");
                
                m = new Member(memberId, firstName, lastName, username, password,email,memberImageUrl,isAdmin);
            }
        } 
        
        catch (SQLException e)   
        {
          e.printStackTrace();
        } 
        
        finally
        {
            try
            {
                if (rs != null)
                {
                    rs.close();
                }
                if (ps != null)
                {
                    ps.close();
                }
                if (con != null)
                {
                    freeConnection(con);
                }
            }
            catch (SQLException e)
            {
               e.printStackTrace();
             
            }
        }
        return m;    
    }

    /**
     *
     * @param firstName
     * @param lastName
   
     * @param userName
     * @param password
     * @return
     */
    @Override
    public Member addMember(String firstName, String lastName, String userName, String password,String email,String memberImageUrl,boolean isAdmin) 
    {
        Connection con = null;
        PreparedStatement ps = null; 
        ResultSet generatedKeys = null;
        int memberId = -1;
        Member m = null;
        isAdmin = false;
        memberImageUrl = "IMG_StarWars1.jpg";
    

        
        try 
        {
            
            con = this.getConnection();

             HashPasswordMD5 hp = new HashPasswordMD5();
             String hashedPassword = hp.hashPassword(password);
             
            String query = "Insert into member(firstName, lastName,userName, password,email,memberImageUrl,isAdmin) values(?,?,?,?,?,?,?)"; //query to insert member info into fields in the members table
            
           // Need to get the id back, so have to tell the database to return the id it generates
            ps = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            
            System.out.println("hashed password: " + password);
            System.out.println(firstName);

            ps.setString(1, firstName);
            ps.setString(2, lastName);
            ps.setString(3, userName);
            ps.setString(4, password);
            ps.setString(5, email);
            ps.setString(6,memberImageUrl);
            ps.setBoolean(7,isAdmin);
            
            
           ps.executeUpdate();
            

            
                     // Find out what the id generated for this entry was
            generatedKeys = ps.getGeneratedKeys();
            
            if(generatedKeys.next())
            {
                memberId = generatedKeys.getInt(1);
            } 
            
            m = new Member(memberId, firstName, lastName,userName,password,email,memberImageUrl,isAdmin); //stores the member in an object
            
             
        } 
        
        catch (SQLException e) 
        {
            System.err.println("\tA problem occurred during the addMember method:");
            System.err.println("\t"+e.getMessage());
            memberId = -1;
        } catch (Exception ex) {
            Logger.getLogger(MemberDao.class.getName()).log(Level.SEVERE, null, ex);
        } 
       // catch (NoSuchAlgorithmException ex) {
//            Logger.getLogger(MemberDao.class.getName()).log(Level.SEVERE, null, ex);
//        } 
//        
        finally 
        {
            try 
            {
                if (ps != null) 
                {
                    ps.close();
                }
                if (con != null) 
                {
                    freeConnection(con);
                }
            } 
            catch (SQLException e) 
            {
                System.err.println("A problem occurred when closing down the addMember smethod:\n" + e.getMessage());
            }
        }
        return m;
    }
    
    /**
     *
     * @param userName
     * @param passWord
     * @return
     * @throws DaoException
     */
    @Override
    public Member findMemberByUserNamePassword(String userName, String passWord) throws DaoException
    {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Member m = null;

        try
        {
           
            con = this.getConnection();
            
             HashPasswordMD5 hp = new HashPasswordMD5();
             String hashedPassword = hp.hashPassword(passWord);
          
            
            String query = "select * from Member where userName = ? and password = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, userName);
            ps.setString(2, hashedPassword);

            rs = ps.executeQuery();
            if (rs.next())
            {
                int memberId = rs.getInt("memberId"); //changed
                String username = rs.getString("userName");
                String password = rs.getString("password");
                String lastname = rs.getString("lastName");
                String firstname = rs.getString("firstName");
                String email = rs.getString("email");
                String memberImageUrl = rs.getString("memberImageUrl");
                boolean isAdmin = rs.getBoolean("isAdmin");
            
               if(hashedPassword.equals(password))
               {    

                m = new Member(memberId,username, password, lastname, firstname, email,memberImageUrl,isAdmin);
     
               }

            }
            
        } 
         catch (SQLException e)
        {
            e.printStackTrace();
        } 
        finally
        {
            try
            {
                if (rs != null)
                {
                    rs.close();
                }
                if (ps != null)
                {
                    ps.close();
                }
                if (con != null)
                {
                    freeConnection(con);
                }
            } catch (SQLException e)
            {
                e.printStackTrace();
            }
        }
        return m;
    }

    /**
     *
     * @param userName
     * @param newUserName
     * @return
     */
    @Override
    public boolean editUserName(String userName, String newUserName) //have seperate methods for each edit so user can select which field they want to edit and we can call the appropriate method - more efficent for database
    {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try
        {

            conn = getConnection();
            String query = "Update member set userName =? where userName=?";
            ps = conn.prepareStatement(query);
            ps.setString(1, newUserName); //sets newUserName as the new userName
            ps.setString(2, userName);

            ps.executeUpdate();

        } catch (SQLException e)
        {
            e.printStackTrace();
            return false;

        } finally
        {
            try
            {
                if (rs != null)
                {
                    rs.close();
                }

                if (ps != null)
                {
                    ps.close();
                }

                if (conn != null)
                {
                    conn.close();
                }

            } catch (SQLException e)
            {
               e.printStackTrace();
               return false;
            }
        }
    return true;
    }

    /**
     *
     * @param password
     * @param newPassword
     * @return
     */
    @Override
    public boolean editPassword(String password, String newPassword) 
    {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try
        {

            conn = getConnection();
            String query = "Update member set password =? where password=?";
            ps = conn.prepareStatement(query);
            ps.setString(1, newPassword);
            ps.setString(2, password);

            ps.executeUpdate();

        } catch (SQLException e)
        {
            e.printStackTrace();
            return false;
        } 
        finally
        {
            try
            {
                if (rs != null)
                {
                    rs.close();
                }

                if (ps != null)
                {
                    ps.close();
                }

                if (conn != null)
                {
                    conn.close();
                }

            } catch (SQLException e)
            {
               e.printStackTrace();
               return false;
            }
        }
    return true;    
    }

    /**
     *
     * @param firstName
     * @param newFirstName
     * @return
     */
    @Override
    public boolean editFirstName(String firstName, String newFirstName) //throws DaoException
    {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try
        {
                
            conn = getConnection();
            String query = "update member set firstName =? where firstName=?";
            ps = conn.prepareStatement(query);
            
            ps.setString(1,newFirstName); //sets newUserName as the new userName
            ps.setString(2,firstName);

            ps.executeUpdate();
  
        } 
        catch (SQLException e)
        {
             e.printStackTrace();
            return false;
        } 
        finally
        {
            try
            {
                if (rs != null)
                {
                    rs.close();
                }

                if (ps != null)
                {
                    ps.close();
                }

                if (conn != null)
                {
                    conn.close();
                }

            } 
            catch (SQLException e)
            {
                e.printStackTrace();
                return false;
            }
        }
        return true;
    }

    /**
     *
     * @param lastName
     * @param newLastName
     * @return
     */
    @Override
    public boolean editLastName(String lastName, String newLastName) 
    {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try
        {

            conn = getConnection();
            String query = "Update member set lastName =? where lastName=?";
            ps = conn.prepareStatement(query);
            ps.setString(1, newLastName);
            ps.setString(2, lastName);

            ps.executeUpdate();

        } catch (SQLException e)
        {
           e.printStackTrace();
            return false;

        } finally
        {
            try
            {
                if (rs != null)
                {
                    rs.close();
                }

                if (ps != null)
                {
                    ps.close();
                }

                if (conn != null)
                {
                    conn.close();
                }

            } catch (SQLException e)
            {
                e.printStackTrace();
                return false;
                  
            }
        }
     return true;   
    }

}
