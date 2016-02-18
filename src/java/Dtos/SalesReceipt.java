/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dtos;

import java.sql.Date;
import java.util.Objects;

/**
 *
 * @author Aisling
 */

public class SalesReceipt
{
    private int receiptId;
    private Date dateOrdered;
    private String ProductName;
    private int productPrice;
    private int quantity;
    private int memberId;

    /**
     *
     * @param receiptId
     * @param dateOrdered
     * @param ProductName
     * @param productPrice
     * @param quantity
     * @param memberId
     */
    public SalesReceipt(int receiptId, Date dateOrdered, String ProductName, int productPrice, int quantity, int memberId)
    {
        this.receiptId = receiptId;
        this.dateOrdered = dateOrdered;
        this.ProductName = ProductName;
        this.productPrice = productPrice;
        this.quantity = quantity;
        this.memberId = memberId;
    }

    /**
     *
     * @return
     */
    public int getReceiptId()
    {
        return receiptId;
    }

    /**
     *
     * @param receiptId
     */
    public void setReceiptId(int receiptId)
    {
        this.receiptId = receiptId;
    }

    /**
     *
     * @return
     */
    public Date getDateOrdered()
    {
        return dateOrdered;
    }

    /**
     *
     * @param dateOrdered
     */
    public void setDateOrdered(Date dateOrdered)
    {
        this.dateOrdered = dateOrdered;
    }

    /**
     *
     * @return
     */
    public String getProductName()
    {
        return ProductName;
    }

    /**
     *
     * @param ProductName
     */
    public void setProductName(String ProductName)
    {
        this.ProductName = ProductName;
    }

    /**
     *
     * @return
     */
    public int getProductPrice()
    {
        return productPrice;
    }

    /**
     *
     * @param productPrice
     */
    public void setProductPrice(int productPrice)
    {
        this.productPrice = productPrice;
    }

    /**
     *
     * @return
     */
    public int getQuantity()
    {
        return quantity;
    }

    /**
     *
     * @param quantity
     */
    public void setQuantity(int quantity)
    {
        this.quantity = quantity;
    }

    /**
     *
     * @return
     */
    public int getMemberId()
    {
        return memberId;
    }

    /**
     *
     * @param memberId
     */
    public void setMemberId(int memberId)
    {
        this.memberId = memberId;
    }

    @Override
    public int hashCode()
    {
        int hash = 7;
        hash = 29 * hash + this.receiptId;
        hash = 29 * hash + Objects.hashCode(this.dateOrdered);
        hash = 29 * hash + Objects.hashCode(this.ProductName);
        hash = 29 * hash + this.productPrice;
        hash = 29 * hash + this.quantity;
        hash = 29 * hash + this.memberId;
        return hash;
    }

    @Override
    public boolean equals(Object obj)
    {
        if (obj == null)
        {
            return false;
        }
        if (getClass() != obj.getClass())
        {
            return false;
        }
        final SalesReceipt other = (SalesReceipt) obj;
        if (this.receiptId != other.receiptId)
        {
            return false;
        }
        if (!Objects.equals(this.dateOrdered, other.dateOrdered))
        {
            return false;
        }
        if (!Objects.equals(this.ProductName, other.ProductName))
        {
            return false;
        }
        if (this.productPrice != other.productPrice)
        {
            return false;
        }
        if (this.quantity != other.quantity)
        {
            return false;
        }
        if (this.memberId != other.memberId)
        {
            return false;
        }
        return true;
    }

    @Override
    public String toString()
    {
        return "SalesReceipt{" + "receiptId=" + receiptId + ", dateOrdered=" + dateOrdered + ", ProductName=" + ProductName + ", productPrice=" + productPrice + ", quantity=" + quantity + ", memberId=" + memberId + '}';
    }

    
    
}