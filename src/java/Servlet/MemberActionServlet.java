/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Command.Command;
import Command.CommandFactory;
import Daos.MemberDao;
import Daos.ProductDao;
import Dtos.Member;
import Dtos.Product;
import Exceptions.DaoException;
import Service.MemberService;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 *
 * @author Aisling
 */
@MultipartConfig(maxFileSize = 16177215)
@WebServlet(name = "MemberActionServlet", urlPatterns =
{
    "/MemberActionServlet"
})
public class MemberActionServlet extends HttpServlet
{
    private static final long serialVersionUID = 1L;

    /**
     *
     */
    public MemberActionServlet()
    {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        processRequest(request, response);
    }

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        
        processRequest(request, response);     
       
    }
    
    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        // Set the end destination as a backup, in case something goes wrong
        String forwardToJsp = "";

        //Check the 'action' parameter to see what the user wants...
        if ( request.getParameter("action") != null)
        {
            // Create an appropriate Command and execute it
            CommandFactory factory = new CommandFactory();
            Command command = factory.createCommand(request.getParameter("action"));
            // execute generated Command
            forwardToJsp = command.execute(request, response);
        }
        
        //Get the request dispatcher object and forward the request to the appropriate JSP page...
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(forwardToJsp);
        dispatcher.forward(request, response);
    
    }
}
