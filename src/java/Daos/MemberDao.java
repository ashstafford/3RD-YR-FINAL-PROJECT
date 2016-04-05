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
                String userName = rs.getString("userName");
                String password = rs.getString("password");
                String firstName = rs.getString("firstName");
                String lastName = rs.getString("lastName");
                String email = rs.getString("email");
                String securityQuestionAnswer = rs.getString("securityQuestionAnswer");
                boolean isAdmin = rs.getBoolean("isAdmin");

                Member m = new Member(memberId,userName, password, firstName, lastName,email,securityQuestionAnswer,isAdmin);
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
    
    @Override
 public Member findMemberById(int id)  //takes in id and returns all details about that member
 {
            Connection conn = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            
            Member m = new Member();
            
            m = null; 
            
            try 
            {
                     
                conn = getConnection();
                String query = "select * from member where memberId=?";
                ps = conn.prepareStatement(query);
                
                ps.setInt(1, id);

                rs = ps.executeQuery();
                
             while (rs.next()) 
             {
                 m = new Member(
                 rs.getInt("MemberId"),
                 rs.getString("userName"),        
                 rs.getString("password"),
                 rs.getString("firstName"),
                 rs.getString("lastName"),        
                 rs.getString("email"),
                 rs.getString("securityQuestionAnswer"),
                 rs.getBoolean("isAdmin"));
                  
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
                    
                    if (conn != null)
                    {
                        conn.close();
                    }

                }
                
                catch (SQLException e) 
                {
                    e.printStackTrace();
                }
            }
            
        return m;    
    }
 
    @Override
    public boolean addAdmin(Member m) 
    {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean admin = true;

        try
        {
            con = this.getConnection();
 System.out.println("admin " + admin);
            String query = "update member set isAdmin = ? where memberId = ?";
            ps = con.prepareStatement(query);
            ps.setBoolean(1, admin);
            ps.setInt(2,m.getMemberId());
           

            ps.executeUpdate();

           System.out.println("admin now " + admin);

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
                if (con != null)
                {
                    freeConnection(con);
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
                String userName = rs.getString("userName");
                String password = rs.getString("password");
                String firstName = rs.getString("firstName");
                String lastName = rs.getString("lastName");
                String email = rs.getString("email");
                String securityQuestionAnswer = rs.getString("securityQuestionAnswer");
                boolean isAdmin = rs.getBoolean("isAdmin");
                
                m = new Member(memberId, firstName, lastName, username, password,email,securityQuestionAnswer,isAdmin);
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
    
    /**The method takes in a email parameter and searches the database for 
     * a matching member based on their email address.
     * 
     *
     * @param email String variable which stores the email being searched  
     * @return the member object for the corresponding email address 
     */
    
    @Override
    public Member findMemberByEmailAddress(String eMail) 
    {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Member m = null;

        try
        {
            con = this.getConnection();

            String query = "select * from member where email =?";
            ps = con.prepareStatement(query);
            ps.setString(1, eMail);

            rs = ps.executeQuery();
            if (rs.next())
            {
                int memberId = rs.getInt("memberId");
                String firstName = rs.getString("firstName");
                String lastName = rs.getString("lastName");
                String userName = rs.getString("username");
                String password = rs.getString("password");
                String email = rs.getString("email");
                String securityQuestionAnswer = rs.getString("securityQuestionAnswer");
                boolean isAdmin = rs.getBoolean("isAdmin");
                
                m = new Member(memberId,userName, password,firstName, lastName, email,securityQuestionAnswer,isAdmin);
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
    public Member addMember(String userName, String password,String firstName, String lastName, String email,String securityQuestionAnswer,boolean isAdmin) 
    {
        Connection con = null;
        PreparedStatement ps = null; 
        ResultSet generatedKeys = null;
        int memberId = -1;
        Member m = null;
        isAdmin = false;
       
    

        
        try 
        {
            
            con = this.getConnection();

             HashPasswordMD5 hp = new HashPasswordMD5();
             String hashedPassword = hp.hashPassword(password);
             String hashedSecurityAnswer = hp.hashPassword(securityQuestionAnswer);
             
            String query = "Insert into member(userName, password,firstName, lastName,email,securityQuestionAnswer,isAdmin) values(?,?,?,?,?,?,?)"; //query to insert member info into fields in the members table
            
           // Need to get the id back, so have to tell the database to return the id it generates
            ps = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            
            

            ps.setString(1, userName);
            ps.setString(2, hashedPassword);
            ps.setString(3, firstName);
            ps.setString(4, lastName);
            ps.setString(5, email);
            ps.setString(6,hashedSecurityAnswer);
            ps.setBoolean(7,isAdmin);
            
            
           ps.executeUpdate();
            

            
                     // Find out what the id generated for this entry was
            generatedKeys = ps.getGeneratedKeys();
            
            if(generatedKeys.next())
            {
                memberId = generatedKeys.getInt(1);
            } 
            
            m = new Member(memberId,userName,password,firstName, lastName,email,securityQuestionAnswer,isAdmin); //stores the member in an object
            
             
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
                String firstname = rs.getString("firstName");
                String lastname = rs.getString("lastName");
                String email = rs.getString("email");
                String securityQuestionAnswer = rs.getString("securityQuestionAnswer");
                boolean isAdmin = rs.getBoolean("isAdmin");
            
                
               if(hashedPassword.equals(password))
               {    

                  m = new Member(memberId,username, password, firstname, lastname, email,securityQuestionAnswer,isAdmin);
                  
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
    public boolean editUserName(int id,String userName, String newUserName) //have seperate methods for each edit so user can select which field they want to edit and we can call the appropriate method - more efficent for database
    {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try
        {

            conn = getConnection();
            String query = "Update member set userName =? where userName=? and memberId=?";
            ps = conn.prepareStatement(query);
            ps.setString(1, newUserName); //sets newUserName as the new userName
            ps.setString(2, userName);
            ps.setInt(3,id);

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
     * @param id
     * @param password
     * @param newPassword
     * @return
     */
    @Override
    public boolean editPassword(int id,String password, String newPassword) 
    {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try
        {
            HashPasswordMD5 hp = new HashPasswordMD5();
            String hashedPassword = hp.hashPassword(newPassword);

            conn = getConnection();
            String query = "Update member set password =? where password=? and memberId=?";
            ps = conn.prepareStatement(query);
            ps.setString(1, hashedPassword);
            ps.setString(2, password);
            ps.setInt(3, id);

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
    public boolean editFirstName(int id,String firstName, String newFirstName) //throws DaoException
    {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try
        {
                
            conn = getConnection();
            String query = "update member set firstName =? where firstName=? and memberId=?";
            ps = conn.prepareStatement(query);
            
            ps.setString(1,newFirstName); //sets newUserName as the new userName
            ps.setString(2,firstName);
            ps.setInt(3,id);

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
    public boolean editLastName(int id,String lastName, String newLastName) 
    {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try
        {

            conn = getConnection();
            String query = "Update member set lastName =? where lastName=? and memberId=?";
            ps = conn.prepareStatement(query);
            ps.setString(1, newLastName);
            ps.setString(2, lastName);
            ps.setInt(3,id);

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

    @Override
    public boolean editEmail(int id,String email, String newEmail) 
    {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try
        {

            conn = getConnection();
            String query = "Update member set email =? where email=? and memberId=?";
            ps = conn.prepareStatement(query);
            ps.setString(1, newEmail);
            ps.setString(2, email);
            ps.setInt(3,id);

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
    //userid
    @Override
    public boolean editMemberImageUrl(int id,String memberImageUrl, String newMemberImageUrl) 
   // public boolean editMemberImageUrl(int memberId, String newMemberImageUrl) 
    {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try
        {

            conn = getConnection();
            String query = "Update member set memberImageUrl =? where memberImageUrl=? and memberId=?";
            //String query = "Update member set memberImageUrl =? where memberId=?";
            ps = conn.prepareStatement(query);
            ps.setString(1, newMemberImageUrl);
            ps.setString(2, memberImageUrl);
            ps.setInt(3,id);

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
