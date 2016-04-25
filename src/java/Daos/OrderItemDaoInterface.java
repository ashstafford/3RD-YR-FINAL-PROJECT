/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.OrderItem;

/**
 *
 * @author d00155224
 */
public interface OrderItemDaoInterface
{
    public OrderItem insertIntoOrderItem(int productId,int receiptId,double price,int quantity);
}
