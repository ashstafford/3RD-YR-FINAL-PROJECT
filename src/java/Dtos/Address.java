/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dtos;

import java.util.Objects;

/**
 *
 * @author Ash
 */
public class Address
{
    private int addressId;
    private int memberId;
    private String addressLine1;
    private String addressLine2;
    private String city;
    private String country;

    public Address(int addressId, int memberId, String addressLine1, String addressLine2, String city, String country)
    {
        this.addressId = addressId;
        this.memberId = memberId;
        this.addressLine1 = addressLine1;
        this.addressLine2 = addressLine2;
        this.city = city;
        this.country = country;
    }

    public int getAddressId()
    {
        return addressId;
    }

    public void setAddressId(int addressId)
    {
        this.addressId = addressId;
    }

    public int getMemberId()
    {
        return memberId;
    }

    public void setMemberId(int memberId)
    {
        this.memberId = memberId;
    }

    public String getAddressLine1()
    {
        return addressLine1;
    }

    public void setAddressLine1(String addressLine1)
    {
        this.addressLine1 = addressLine1;
    }

    public String getAddressLine2()
    {
        return addressLine2;
    }

    public void setAddressLine2(String addressLine2)
    {
        this.addressLine2 = addressLine2;
    }

    public String getCity()
    {
        return city;
    }

    public void setCity(String city)
    {
        this.city = city;
    }

    public String getCountry()
    {
        return country;
    }

    public void setCountry(String country)
    {
        this.country = country;
    }

    @Override
    public int hashCode()
    {
        int hash = 5;
        hash = 11 * hash + this.addressId;
        hash = 11 * hash + this.memberId;
        hash = 11 * hash + Objects.hashCode(this.addressLine1);
        hash = 11 * hash + Objects.hashCode(this.addressLine2);
        hash = 11 * hash + Objects.hashCode(this.city);
        hash = 11 * hash + Objects.hashCode(this.country);
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
        final Address other = (Address) obj;
        if (this.addressId != other.addressId)
        {
            return false;
        }
        if (this.memberId != other.memberId)
        {
            return false;
        }
        if (!Objects.equals(this.addressLine1, other.addressLine1))
        {
            return false;
        }
        if (!Objects.equals(this.addressLine2, other.addressLine2))
        {
            return false;
        }
        if (!Objects.equals(this.city, other.city))
        {
            return false;
        }
        if (!Objects.equals(this.country, other.country))
        {
            return false;
        }
        return true;
    }

    @Override
    public String toString()
    {
        return "Address{" + "addressId=" + addressId + ", memberId=" + memberId + ", addressLine1=" + addressLine1 + ", addressLine2=" + addressLine2 + ", city=" + city + ", country=" + country + '}';
    }
    
    
}
