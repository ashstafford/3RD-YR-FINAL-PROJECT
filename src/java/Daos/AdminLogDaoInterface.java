/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.AdminLog;
import java.util.ArrayList;

/**
 *
 * @author d00155224
 */
public interface AdminLogDaoInterface
{
    public ArrayList<AdminLog> getAllLogs(); 
}
