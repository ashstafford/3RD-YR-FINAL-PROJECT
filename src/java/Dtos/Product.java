/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dtos;
import java.io.Serializable;
import java.util.Objects;
import java.util.logging.Logger;

/**
 *
 * @author Aisling
 */
public class Product implements Serializable
{

    private int productId;
    private String productImageUrl;
    private String productName;
    private double productPrice;
    private int quantityInStock;
    private String category;

    /**
     *
     */
    public Product()
    {

    }

    /**
     *
     * @param productId
     * @param productImageUrl
     * @param productName
     * @param productPrice
     * @param quantityInStock
     * @param category
     */
    public Product(int productId, String productImageUrl, String productName, double productPrice, int quantityInStock, String category)
    {
        this.productId = productId;
        this.productImageUrl = productImageUrl;
        this.productName = productName;
        this.productPrice = productPrice;
        this.quantityInStock = quantityInStock;
        this.category = category;
    }

    /**
     *
     * @return
     */
    public int getQuantityInStock()
    {
        return quantityInStock;
    }

    /**
     *
     * @param quantityInStock
     */
    public void setQuantityInStock(int quantityInStock)
    {
        this.quantityInStock = quantityInStock;
    }

    /**
     *
     * @return
     */
    public int getProductId()
    {
        return productId;
    }

    /**
     *
     * @param productId
     */
    public void setProductId(int productId)
    {
        this.productId = productId;
    }

    /**
     *
     * @return
     */
    public String getProductImageUrl()
    {
        return productImageUrl;
    }

    /**
     *
     * @param productImageUrl
     */
    public void setProductImageUrl(String productImageUrl)
    {
        this.productImageUrl = productImageUrl;
    }

    /**
     *
     * @return
     */
    public String getProductName()
    {
        return productName;
    }

    /**
     *
     * @param productName
     */
    public void setProductName(String productName)
    {
        this.productName = productName;
    }

    /**
     *
     * @return
     */
    public double getProductPrice()
    {
        return productPrice;
    }

    /**
     *
     * @param price
     */
    public void setProductPrice(double productPrice)
    {
        this.productPrice = productPrice;
    }
    
    /**
     *
     * @return
     */
    public String getCategory()
    {
        return category;
    }

    /**
     *
     * @param category
     */
    public void setCategory(String category)
    {
        this.category = category;
    }

    @Override
    public int hashCode()
    {
        int hash = 5;
        hash = 71 * hash + this.productId;
        hash = 71 * hash + Objects.hashCode(this.productImageUrl);
        hash = 71 * hash + Objects.hashCode(this.productName);
        hash = 71 * hash + (int) (Double.doubleToLongBits(this.productPrice) ^ (Double.doubleToLongBits(this.productPrice) >>> 32));
        hash = 71 * hash + this.quantityInStock;
        hash = 71 * hash + Objects.hashCode(this.category);
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
        final Product other = (Product) obj;
        if (this.productId != other.productId) 
        {
            return false;
        }
        if (!Objects.equals(this.productImageUrl, other.productImageUrl))
        {
            return false;
        }
        if (!Objects.equals(this.productName, other.productName)) 
        {
            return false;
        }
        if (Double.doubleToLongBits(this.productPrice) != Double.doubleToLongBits(other.productPrice))
        {
            return false;
        }
        if (this.quantityInStock != other.quantityInStock)
        {
            return false;
        }
        if (!Objects.equals(this.category, other.category))
        {
            return false;
        }
        return true;
    }

    @Override
    public String toString() 
    {
        return "Product{" + "productId=" + productId + ", productImageUrl=" + productImageUrl + ", productName=" + productName + ", productPrice=" + productPrice + ", quantityInStock=" + quantityInStock + ", category=" + category + '}';
    }
    
    
    
   
  
    

    

}
