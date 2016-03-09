/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Command;

import Daos.MemberDao;
import Dtos.Member;
import java.io.File;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 *
 * @author d00153612
 */
public class ImageUploadCommand implements Command
{
    /**
     *
     * @param request
     * @param response
     * @return
     */
        private boolean isMultipart;
        private String filePath;
        private int maxFileSize = 50 * 1024;
        private int maxMemSize = 4 * 1024;
        private File file ;
    
  
    public String execute(HttpServletRequest request, HttpServletResponse response) 
    {
        
           HttpSession session = request.getSession();
           String forwardToJsp = "";
           
       
        
        
        
    }
}   
    
    
    
    





