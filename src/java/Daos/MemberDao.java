/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.Member;
import Exceptions.DaoException;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.ServerSocket;
import java.net.Socket;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;
import javax.servlet.http.Part;
import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JLabel;

/**
 *
 * @author Karen
 */
public class MemberDao extends Dao implements MemberDaoInterface
{
    File file = null;

    /**
     *
     * @returns an arraylist of members
     */
    @Override
    public ArrayList<Member> getAllMembers()
    {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        BufferedImage memberimage = null;
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
                memberimage = ImageIO.read(rs.getBlob("memberImage").getBinaryStream());
                String securityQuestionAnswer = rs.getString("securityQuestionAnswer");
                boolean isAdmin = rs.getBoolean("isAdmin");

                Member m = new Member(memberId, userName, password, firstName, lastName, email, memberimage, securityQuestionAnswer, isAdmin);
                member.add(m);
            }

        } catch (SQLException e)
        {

            e.printStackTrace();

        } catch (IOException ex)
        {
            Logger.getLogger(MemberDao.class.getName()).log(Level.SEVERE, null, ex);
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
    
    
    /**
     *
     * @takes in id and returns all details about that member
     */
    @Override
 public Member findMemberById(int id)  
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
                        ImageIO.read(rs.getBlob("memberImage").getBinaryStream()),
                        rs.getString("securityQuestionAnswer"),
                        rs.getBoolean("isAdmin"));

            }

        } catch (SQLException e)
        {
            e.printStackTrace();

        } catch (IOException ex)
        {
            Logger.getLogger(MemberDao.class.getName()).log(Level.SEVERE, null, ex);
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

        return m;
    }
 
 
  /**
     *
     * @checks if the user adding the admin is an admin and if so allows to add another admin
     */
 
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

            String query = "update member set isAdmin = ? where memberId = ?";
            ps = con.prepareStatement(query);
            ps.setBoolean(1, admin);
            ps.setInt(2, m.getMemberId());

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
                if (con != null)
                {
                    freeConnection(con);
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
     * The method takes in a username parameter and searches the database for a
     * matching member based on their username.
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
            BufferedImage memberimage = null;
            rs = ps.executeQuery();
            if (rs.next())
            {
                int memberId = rs.getInt("memberId");
                String userName = rs.getString("userName");
                String password = rs.getString("password");
                String firstName = rs.getString("firstName");
                String lastName = rs.getString("lastName");
                String email = rs.getString("email");
                memberimage = ImageIO.read(rs.getBlob("memberImage").getBinaryStream());
                String securityQuestionAnswer = rs.getString("securityQuestionAnswer");
                boolean isAdmin = rs.getBoolean("isAdmin");

                m = new Member(memberId, firstName, lastName, username, password, email, memberimage, securityQuestionAnswer, isAdmin);
            }
        } catch (SQLException e)
        {
            e.printStackTrace();
        } catch (IOException ex)
        {
            Logger.getLogger(MemberDao.class.getName()).log(Level.SEVERE, null, ex);
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
     * The method takes in a email parameter and searches the database for a
     * matching member based on their email address.
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
        BufferedImage memberimage = null;
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
                memberimage = ImageIO.read(rs.getBlob("memberImage").getBinaryStream());
                String securityQuestionAnswer = rs.getString("securityQuestionAnswer");
                boolean isAdmin = rs.getBoolean("isAdmin");

                m = new Member(memberId, userName, password, firstName, lastName, email, memberimage, securityQuestionAnswer, isAdmin);
            }
        } catch (SQLException e)
        {
            e.printStackTrace();
        } catch (IOException ex)
        {
            Logger.getLogger(MemberDao.class.getName()).log(Level.SEVERE, null, ex);
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

    @Override
    public String findEmailAddress(String eMail)
    {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        String email = "";

        try
        {
            con = this.getConnection();

            String query = "select email from member where email =?";
            ps = con.prepareStatement(query);
            ps.setString(1, eMail);

            rs = ps.executeQuery();
            if (rs.next())
            {
//                int memberId = rs.getInt("memberId");
//                String firstName = rs.getString("firstName");
//                String lastName = rs.getString("lastName");
//                String userName = rs.getString("username");
//                String password = rs.getString("password");
                email = rs.getString("email");
//                memberimage = ImageIO.read(rs.getBlob("memberImage").getBinaryStream());
//                String securityQuestionAnswer = rs.getString("securityQuestionAnswer");
//                boolean isAdmin = rs.getBoolean("isAdmin");

//                m = new Member(memberId,userName, password,firstName, lastName, email,memberimage,securityQuestionAnswer,isAdmin);
                return email;
            } 
        } catch (SQLException e)
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
                if (con != null)
                {
                    freeConnection(con);
                }
            } catch (SQLException e)
            {
                e.printStackTrace();

            }
        }
        email = "null";
        return email;
    }

    /**
     *
     * @param firstName
     * @param lastName
     *
     * @param userName
     * @param password
     * @adds a new member by taking in information given by user
     */
    @Override
    public Member addMember(String userName, String password, String firstName, String lastName, String email, BufferedImage memberImage, String securityQuestionAnswer, boolean isAdmin)
    {
        Connection con = null;
        PreparedStatement ps = null;
        
        ResultSet generatedKeys = null;
        int memberId = -1;
        Member m = null;
        isAdmin = false;
        BufferedImage img = null;

        try{
            System.out.println("Is in Add Member Try");
            con = getConnection();
            HashPasswordMD5 hp = new HashPasswordMD5();
            String hashedPassword = hp.hashPassword(password);
            String hashedSecurityAnswer = hp.hashPassword(securityQuestionAnswer);
            
            String query = "Insert into member(userName, password,firstName, lastName,email,memberImage,securityQuestionAnswer,isAdmin) values(?,?,?,?,?,?,?,?)"; //query to insert member info into fields in the members table

            // Need to get the id back, so have to tell the database to return the id it generates
            ps = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);

            ps.setString(1, userName);
            
            ps.setString(2, hashedPassword);
            ps.setString(3, firstName);
            ps.setString(4, lastName);
            ps.setString(5, email);
//            ps.setBlob(6, memberImage);
            
//              ps.setAutoCommitString(1, newMemberImageUrl);
                //            ps.setString(2, memberImageUrl);                   
//            ps.setBinaryStream(6, memberImage, (int) file.length()); 
            ps.setString(7, hashedSecurityAnswer);
            ps.setBoolean(8, isAdmin);
            System.out.println("MemberDao addMember:    member:   Username = " + userName + " password= " + password + " firstname= " + firstName + " Lastname= " + lastName + " email= " + email + " img= " + memberImage + " Security Question Answer= " + securityQuestionAnswer + " Is admin= " + isAdmin);
            ps.executeUpdate();

            // Find out what the id generated for this entry was
            generatedKeys = ps.getGeneratedKeys();

            if (generatedKeys.next())
            {
                memberId = generatedKeys.getInt(1);
            }
            
            img = getImageFromDatabase(con,memberId);
            
            m = new Member(memberId, userName, password, firstName, lastName, email, img, securityQuestionAnswer, isAdmin); //stores the member in an object

        } catch (SQLException e)
        {
            System.err.println("\tA problem occurred during the addMember method:");
            System.err.println("\t" + e.getMessage());
            memberId = -1;
        } catch (Exception ex)
        {
            Logger.getLogger(MemberDao.class.getName()).log(Level.SEVERE, null, ex);
        } // catch (NoSuchAlgorithmException ex) {
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
            } catch (SQLException e)
            {
                System.err.println("A problem occurred when closing down the addMember smethod:\n" + e.getMessage());
            }
        }
        return m;
    }
    
    
     /**
     *
     * @removes member by finding id and then delete it
     */
      @Override
        public boolean removeMember(int memberId) 
        {
        
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;  
        try
        {
            conn = getConnection();
            String query = "delete from member where memberId= ?";
            ps = conn.prepareStatement(query);
            ps.setInt(1, memberId);

            ps.executeUpdate();

        } catch (SQLException e)
        {
            System.out.println("Exception happened in delete member method");
            e.getMessage();
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
                System.out.println("Exception happened in 'finally' part of the delete member method");
                e.getMessage();
                return false;
            }
        }
        return true;
    }

    /**
     *
     * @param userName
     * @param passWord
     * @return
     * @throws DaoException
     */
        
         /**
     *
     * @finds member by using username and password
     */
    @Override
    public Member findMemberByUserNamePassword(String userName, String passWord) throws DaoException
    {
        Connection con = null;
        CallableStatement cs = null;
       // PreparedStatement ps = null;
        ResultSet rs = null;
        Member m = null;
        BufferedImage memberimage = null;

        try
        {
            con = this.getConnection();
            
             HashPasswordMD5 hp = new HashPasswordMD5();
             String hashedPassword = hp.hashPassword(passWord);
          
            
          //  String query = "select * from Member where userName = ? and password = ?";
          //  ps = con.prepareStatement(query);
            
            String query = "{ call login(?,?) }";
            
            cs = con.prepareCall(query);
            
            
            cs.setString(1, userName);
            cs.setString(2, hashedPassword);
 
         
            rs = cs.executeQuery();
     
            if (rs.next())
            {

                int memberId = rs.getInt("memberId"); //changed
                String username = rs.getString("userName");
                String password = rs.getString("password");
                String firstname = rs.getString("firstName");
                String lastname = rs.getString("lastName");
                String email = rs.getString("email");
               //memberimage = (BufferedImage) rs.getBlob("memberImage");
                memberimage = ImageIO.read(rs.getBlob("memberImage").getBinaryStream());

                String securityQuestionAnswer = rs.getString("securityQuestionAnswer");
                boolean isAdmin = rs.getBoolean("isAdmin");

                if (hashedPassword.equals(password))
                {

                    m = new Member(memberId, username, password, firstname, lastname, email, memberimage, securityQuestionAnswer, isAdmin);

                }

            }

        } catch (SQLException e)
        {
            e.printStackTrace();
        } 
        catch (IOException ex)
        {
            Logger.getLogger(MemberDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally
        {
            try
            {
                if (rs != null)
                {
                    rs.close();
                }
                if (cs != null)
                {
                    cs.close();
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
     /**
     *
     * @takes in user id and username and then creates variable called newusername when  the new username is made
     */
    @Override
    public boolean editUserName(int id, String userName, String newUserName) //have seperate methods for each edit so user can select which field they want to edit and we can call the appropriate method - more efficent for database
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
            ps.setInt(3, id);

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
      /**
     *
     * @takes in user id and password and then creates variable called newpassword when  the new password is made
     */
    @Override
    public boolean editPassword(int id, String password, String newPassword)
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
     * @param firstName
     * @param newFirstName
     * @return
     */
      /**
     *
     * @takes in user id and first name and then creates variable called newFirstName when  the new firstname is made
     */
    @Override
    public boolean editFirstName(int id, String firstName, String newFirstName) //throws DaoException
    {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try
        {

            conn = getConnection();
            String query = "update member set firstName =? where firstName=? and memberId=?";
            ps = conn.prepareStatement(query);

            ps.setString(1, newFirstName); //sets newFirstName as the new firstName
            ps.setString(2, firstName);
            ps.setInt(3, id);

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
     * @param lastName
     * @param newLastName
     * @return
     */
      /**
     *
     * @takes in user id and last name and then creates variable called newLastName when the new last name is made
     */
    @Override
    public boolean editLastName(int id, String lastName, String newLastName)
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
            ps.setInt(3, id);

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
     * @takes in user id and email and then creates variable called newEmail when  the new email is made
     */
    @Override
    public boolean editEmail(int id, String email, String newEmail)
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
            ps.setInt(3, id);

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
      /**
     *
     * @takes in user id and current imageurl and then creates variable called newMemberImageUrl when the new imageurl is made
     */
    @Override
    public BufferedImage editMemberImageUrl(int id, String newMemberImageUrl)  //Part filePart
    // public boolean editMemberImageUrl(int memberId, String newMemberImageUrl) 
    {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        BufferedImage img = null;

        try
        {

            conn = getConnection();
//            String query = "Update member set memberImageUrl =? where memberImageUrl=? and memberId=?";
            String query = "Update member set memberImage =? where memberId=?";
//            ps = conn.prepareStatement(query);

            FileInputStream fis = null;
            
            try
            {
                conn.setAutoCommit(false);
                file = new File(newMemberImageUrl);
                System.out.println("file = " + file);

                fis = new FileInputStream(file);
                System.out.println("fis");

                ps = conn.prepareStatement(query);
                System.out.println("Hello");

//              ps.setAutoCommitString(1, newMemberImageUrl);
                //            ps.setString(2, memberImageUrl);                   
                ps.setBinaryStream(1, fis, (int) file.length());
                System.out.println("BinaryStream");
                ps.setInt(2, id);
                System.out.println("Set int");
                ps.executeUpdate();
                System.out.println("Updated");
                conn.commit();
            } finally
            {
                ps.close();
                fis.close();
            }

            //Set image from database
            img = getImageFromDatabase(conn, id);

//            InputStream inputStream = null;
////            Part filePart = request.getPart("newMemberImageUrl");
////           
//            if (filePart != null) 
//            {
//               // obtains input stream of the upload file
//               inputStream = filePart.getInputStream();
//               return false;
//            }
//            
//            if (inputStream != null) 
//            {
//                // fetches input stream of the upload file for the blob column
//                ps.setBlob(1, inputStream);
//            }
            System.out.println("reached memberdao");

        } catch (SQLException e)
        {
            e.printStackTrace();
            return img;

        } catch (IOException ex)
        {
            Logger.getLogger(MemberDao.class.getName()).log(Level.SEVERE, null, ex);
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
                return img;

            }
        }
        return img;
    }

     /**
     *
     * @takes in the current members image and replaces it with a new one
     */
    
    @Override
    public BufferedImage editMemberImageUrl(String newMemberImageUrl)  //Part filePart
    // public boolean editMemberImageUrl(int memberId, String newMemberImageUrl) 
    {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        BufferedImage img = null;

        try
        {

            conn = getConnection();
//            String query = "Update member set memberImageUrl =? where memberImageUrl=? and memberId=?";
            String query = "insert into member(memberImage) values(?)";
//            ps = conn.prepareStatement(query);

            FileInputStream fis = null;
            
            try
            {
                conn.setAutoCommit(false);
                file = new File(newMemberImageUrl);
                System.out.println("file = " + file);

                fis = new FileInputStream(file);
                System.out.println(" Gets FileInputStreamfis");

                ps = conn.prepareStatement(query);
                System.out.println("Makes the Prepared Statement");

//              ps.setAutoCommitString(1, newMemberImageUrl);
                //            ps.setString(2, memberImageUrl);                   
                ps.setBinaryStream(1, fis, (int) file.length());
                System.out.println("Sets the Image");
                ps.executeUpdate();
                System.out.println("Updated");
                conn.commit();
            } finally
            {
                ps.close();
                fis.close();
            }
            img = getImageFromDatabase(conn);
            System.out.println("reached memberdao");

        } catch (SQLException e)
        {
            e.printStackTrace();
            return img;

        } catch (IOException ex)
        {
            Logger.getLogger(MemberDao.class.getName()).log(Level.SEVERE, null, ex);
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
                return img;

            }
        }
            System.out.println("reached memberdao");
        return img;
    }
      /**
     *
     * @takes in user id and then gets the image that the user chooses and uploads it to database.
     */
    public BufferedImage getImageFromDatabase(Connection conn, int memberId)//Connection conn
    {
        String query = "select memberImage from member where memberId = ?";
        BufferedImage buffimg = null;
        try
        {
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setInt(1, memberId);
            ResultSet result = stmt.executeQuery();
            result.next();
            InputStream img = result.getBinaryStream(1); // reading image as InputStream
            System.out.println("image pulling from database " + img);
            buffimg = ImageIO.read(img); // decoding the inputstream as BufferedImage
            System.out.println("buffimg = " + buffimg);
        } catch (Exception ex)
        {
            System.out.println(ex.getMessage());
        }
        return buffimg;
//        Connection conn = null;
//        ResultSet rs = null;
//        String query = "select memberImageUrl from member where memberId = ?";
//        
//        try
//        {
//            PreparedStatement pstmt = conn.prepareStatement(query);
//            pstmt.setInt(1, memberId);
//            rs = pstmt.executeQuery();
//            
//            File file = new File("C:\temp\testimage.jpg");
//            FileOutputStream output = new FileOutputStream(file);
// 
//            System.out.println("Writing to file " + file.getAbsolutePath());
//            while (rs.next()) {
//                InputStream img = rs.getBinaryStream(1);
//                byte[] buffer = new byte[1024];
//                while (img.read(buffer) > 0) 
//                {
//                    output.write(buffer);
//                }
//            }
//            
//        }
//        catch (SQLException | IOException e) {
//            System.out.println(e.getMessage());
//        } finally {
//            try {
//                if (rs != null) {
//                    rs.close();
//                }
//            } catch (SQLException e) {
//                System.out.println(e.getMessage());
//            }
//        }
// 
        //return null;
    }
    public BufferedImage getImageFromDatabase(Connection conn)//Connection conn
    {
        String query = "select memberImage from member ";
        BufferedImage buffimg = null;
        try
        {
            PreparedStatement stmt = conn.prepareStatement(query);
            ResultSet result = stmt.executeQuery();
            result.next();
            InputStream img = result.getBinaryStream(1); // reading image as InputStream
            System.out.println("image pulling from database " + img);
            buffimg = ImageIO.read(img); // decoding the inputstream as BufferedImage
            System.out.println("buffimg = " + buffimg);
        } catch (Exception ex)
        {
            System.out.println(ex.getMessage());
        }
        return buffimg;

    }

}
