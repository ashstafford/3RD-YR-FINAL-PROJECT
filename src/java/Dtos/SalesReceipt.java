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
    private double totalPrice;
    private int memberId;
    private String paymentType;

    public SalesReceipt(int receiptId, Date dateOrdered, double totalPrice, int memberId, String paymentType)
    {
        this.receiptId = receiptId;
        this.dateOrdered = dateOrdered;
        this.totalPrice = totalPrice;
        this.memberId = memberId;
        this.paymentType = paymentType;
    }

    public double getTotalPrice()
    {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice)
    {
        this.totalPrice = totalPrice;
    }

    public String getPaymentType() 
    {
        return paymentType;
    }

    public void setPaymentType(String paymentType)
    {
        this.paymentType = paymentType;
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
        hash = 79 * hash + this.receiptId;
        hash = 79 * hash + Objects.hashCode(this.dateOrdered);
        hash = 79 * hash + (int) (Double.doubleToLongBits(this.totalPrice) ^ (Double.doubleToLongBits(this.totalPrice) >>> 32));
        hash = 79 * hash + this.memberId;
        hash = 79 * hash + Objects.hashCode(this.paymentType);
        return hash;
    }

    @Override
    public boolean equals(Object obj) 
    {
        if (this == obj) 
        {
            return true;
        }
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
        if (Double.doubleToLongBits(this.totalPrice) != Double.doubleToLongBits(other.totalPrice)) 
        {
            return false;
        }
        if (this.memberId != other.memberId) 
        {
            return false;
        }
        if (!Objects.equals(this.paymentType, other.paymentType))
        {
            return false;
        }
        if (!Objects.equals(this.dateOrdered, other.dateOrdered)) 
        {
            return false;
        }
        return true;
    }

    @Override
    public String toString() 
    {
        return "SalesReceipt{" + "receiptId=" + receiptId + ", dateOrdered=" + dateOrdered + ", totalPrice=" + totalPrice + ", memberId=" + memberId + ", paymentType=" + paymentType + '}';
    } 
    
}