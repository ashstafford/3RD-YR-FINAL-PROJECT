/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Comparator;

import Dtos.Product;
import java.util.Comparator;

/**
 *
 * @author D00155224
 */
public class ProductPriceLowToHighComparator implements Comparator<Product>
{
  @Override
  public int compare(Product p1, Product p2) 
  {
	if (p1.getProductPrice() < p2.getProductPrice())
        {    
		return -1;
        }
        
	if (p1.getProductPrice() > p2.getProductPrice())
        {    
		return 1;
        }        
		return 0;
 }

}
