/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.SalesReceipt;
import Exceptions.DaoException;
import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author Aisling
 */
public interface SalesReceiptDaoInterface
{

    /**
     *
     * @param id
     * @return
     */
    public ArrayList<SalesReceipt> viewPreviousOrders(int id);

    /**
     *
     * @param dateOrdered
     * @param productName
     * @param price
     * @param quantity
     * @param memberId
     * @return
     */
    public SalesReceipt insertIntoSalesReceipt(Date dateOrdered,double totalPrice,int memberId,String paymentType);
    
}
