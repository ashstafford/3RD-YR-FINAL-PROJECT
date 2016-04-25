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
 * @author d00155224
 */
public class AdminLog
{
   private int messageId;
   private String message;
   private Date messageTime;
   private String details;

    public AdminLog(int messageId, String message, Date messageTime, String details)
    {
        this.messageId = messageId;
        this.message = message;
        this.messageTime = messageTime;
        this.details = details;
    }

    public int getMessageId()
    {
        return messageId;
    }

    public void setMessageId(int messageId)
    {
        this.messageId = messageId;
    }

    public String getMessage()
    {
        return message;
    }

    public void setMessage(String message)
    {
        this.message = message;
    }

    public Date getMessageTime()
    {
        return messageTime;
    }

    public void setMessageTime(Date messageTime)
    {
        this.messageTime = messageTime;
    }

    public String getDetails()
    {
        return details;
    }

    public void setDetails(String details)
    {
        this.details = details;
    }

    @Override
    public int hashCode()
    {
        int hash = 3;
        hash = 79 * hash + this.messageId;
        hash = 79 * hash + Objects.hashCode(this.message);
        hash = 79 * hash + Objects.hashCode(this.messageTime);
        hash = 79 * hash + Objects.hashCode(this.details);
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
        final AdminLog other = (AdminLog) obj;
        if (this.messageId != other.messageId)
        {
            return false;
        }
        if (!Objects.equals(this.message, other.message))
        {
            return false;
        }
        if (!Objects.equals(this.messageTime, other.messageTime))
        {
            return false;
        }
        if (!Objects.equals(this.details, other.details))
        {
            return false;
        }
        return true;
    }
   
   
}
