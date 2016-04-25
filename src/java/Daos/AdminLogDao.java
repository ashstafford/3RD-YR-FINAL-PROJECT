/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.AdminLog;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author d00155224
 */
public class AdminLogDao extends Dao implements AdminLogDaoInterface
{
    @Override
    public ArrayList<AdminLog> getAllLogs() 
    {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        

        ArrayList<AdminLog> logs = new ArrayList<>();

        try
        {
            conn = getConnection();
            String query = "Select * from AdminLog";

            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next())
            {
                int messageId = rs.getInt("messageId");
                String message = rs.getString("message");
                Date messageTime = rs.getDate("messageTime");
                String details = rs.getString("details");
                

                AdminLog aLog = new AdminLog(messageId,message, messageTime, details);
                
                logs.add(aLog);
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

            } catch (SQLException e)
            {
                e.printStackTrace();
            }
        }

        return logs;
    }
}
