/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Exceptions;

import java.sql.SQLException;

/**
 *
 * @author Aisling
 */
public class DaoException extends SQLException 
{

    /**
     *
     */
    public DaoException() 
    {
        
    }

    /**
     *
     * @param aMessage
     */
    public DaoException(String aMessage) 
    {
        super(aMessage);
    }
}

