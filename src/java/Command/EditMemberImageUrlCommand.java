/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Command;

import Daos.MemberDao;
import Dtos.Member;
import java.io.IOException;
import java.io.InputStream;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;


@MultipartConfig(maxFileSize = 16177215)
/**
 *
 * @author d00153612
 */
public class EditMemberImageUrlCommand implements Command
{
    
    /**
     *
     * @param request
     * @param response
     * @return
     */
    public String execute(HttpServletRequest request, HttpServletResponse response) 
    {
           HttpSession session = request.getSession();
           String forwardToJsp = "";
           Member m = (Member) session.getAttribute("member");
           MemberDao mDao = new MemberDao();

           String newMemberImageUrl = request.getParameter("editMemberImageUrl");
           
           if(newMemberImageUrl != null)
           {
               
             boolean updated =  mDao.editMemberImageUrl(m.getMemberId(),m.getMemberImageUrl(),newMemberImageUrl);
             
   
                if(updated == true)
                {    

                    String MemberImageUrlEdit = session.getId();
                     
                 
                    //Part filePart = request.getPart("newMemberImageUrl");
                 
                     
                     
                    m.setMemberImageUrl(newMemberImageUrl);
           
                    forwardToJsp = "/myProfile.jsp";
               }  
           }   
          
               
          
           
     return forwardToJsp;       
     }
}


//InputStream inputStream = null; // input stream of the upload file
//         
//        // obtains the upload file part in this multipart request
//        Part filePart = request.getPart("photo");
//        if (filePart != null) {
//            // prints out some information for debugging
//            System.out.println(filePart.getName());
//            System.out.println(filePart.getSize());
//            System.out.println(filePart.getContentType());
//             
//            // obtains input stream of the upload file
//            inputStream = filePart.getInputStream();
//        }
//         
//        Connection conn = null; // connection to the database
//        String message = null;  // message will be sent back to client
//         
//        try {
//            // connects to the database
//            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
//            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
// 
//            // constructs SQL statement
//            String sql = "INSERT INTO contacts (first_name, last_name, photo) values (?, ?, ?)";
//            PreparedStatement statement = conn.prepareStatement(sql);
//            statement.setString(1, firstName);
//            statement.setString(2, lastName);
//             
//            if (inputStream != null) {
//                // fetches input stream of the upload file for the blob column
//                statement.setBlob(3, inputStream);
//            }
 