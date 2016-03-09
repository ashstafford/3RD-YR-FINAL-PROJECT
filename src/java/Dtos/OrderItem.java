/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dtos;

/**
 *
 * @author Aisling
 */
public class OrderItem
{
    private int receiptId;
    private int productId;
    private double price;
    private int quantity;

    public OrderItem(int receiptId, int productId, double price, int quantity)
    {
        this.receiptId = receiptId;
        this.productId = productId;
        this.price = price;
        this.quantity = quantity;
    }

    public int getReceiptId()
    {
        return receiptId;
    }

    public void setReceiptId(int receiptId)
    {
        this.receiptId = receiptId;
    }
    
    public int getProductId()
    {
        return productId;
    }

    public void setProductId(int productId)
    {
        this.productId = productId;
    }

    public double getPrice()
    {
        return price;
    }

    public void setPrice(double price)
    {
        this.price = price;
    }

    public int getQuantity()
    {
        return quantity;
    }

    public void setQuantity(int quantity)
    {
        this.quantity = quantity;
    }

    @Override
    public int hashCode()
    {
        int hash = 7;
        hash = 97 * hash + this.receiptId;
        hash = 97 * hash + this.productId;
        hash = 97 * hash + (int) (Double.doubleToLongBits(this.price) ^ (Double.doubleToLongBits(this.price) >>> 32));
        hash = 97 * hash + this.quantity;
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
        final OrderItem other = (OrderItem) obj;
        if (this.receiptId != other.receiptId)
        {
            return false;
        }
        if (this.productId != other.productId)
        {
            return false;
        }
        if (Double.doubleToLongBits(this.price) != Double.doubleToLongBits(other.price))
        {
            return false;
        }
        if (this.quantity != other.quantity)
        {
            return false;
        }
        return true;
    }

   
    
}
