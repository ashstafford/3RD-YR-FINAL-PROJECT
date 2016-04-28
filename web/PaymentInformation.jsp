<%-- 
    Document   : PaymentInformation
    Created on : 15-Dec-2015, 17:58:47
    Author     : d00155224
--%>

<%@page import="java.util.List"%>
<%@page import="Dtos.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="images/flash3.png" type="image/gif" sizes="20x20">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment Page</title>
        <link rel="stylesheet" type="text/css" href="mainCSS.css" >
 <script type="text/javascript" src="payment.js"></script>
    </head>
    <body>
      		
   			
        <div id = container2>
            <div id="banner">
                <img src="tempBanner.jpg"/>
            </div>
   			<div id="main">
      			
      				<br><br><br><br><br><br>
      			<div id ="payform">
      			<h1><center>
      				Payment Form

      			</h1></center>
                        </div>
                              <font color="blue">   
      			<fieldset>
                            
         			<legend>Choose Payment Method</legend> 
                    
         			<table>
                                    <div id = card>    
            			<tr>
               				<td class="labelcell">
               					Card<span style="color: red">*</span>
               				</td>
                                   <form action="MemberActionServlet" method="post" >
               				<td class="inputcell2">
                  				<input type="radio" name="ccard" id="amex" value ="American Express" onclick="setCCnum()"/>                                                
                  				<img src="images/americaExp.png" alt="American Exp" height="45" width="70"><br />
                                                
                                                <br>
                  				<input type="radio" name="ccard" id="mc" value ="MasterCard" onclick="setCCnum()"/>
                                                <img src="images/Mastercard_Logo_03.png" alt="MasterCard"height="45" width="70"><br />
                                                <br>
                  				<input type="radio" name="ccard" id="visa" value = "Visa" onclick="setCCnum()"/>
                  				<img src="images/visa.png" alt="Visa" height="38" width="70">
               				</td>
            			</tr> 
                                    </div>
                                    
                                    <br>
                                    <div id ="name">
                                        
            			<tr>
                                    
                                    <td class="labelcell"><br><br>
               					Name on Card<span style="color: red">*</span>
               				</td>
                                            
               				<td class="inputcell2"><br><br>
                  				<input class="text" name="cname" class="resizedTextBox" id="cname" size="35" />
               				</td>
            			</tr>
                                    </div>
                                    
                                    
                                    <div id =" cardNumber">
            			<tr>
               				<td class="labelcell"><br>
               					Card Number<span style="color: red">*</span>
               				</td>

               				<td class="inputcell2"><br>
                  				<input class="text" name="cnumber" class="resizedTextBox" id="cnumber" size="35" />

                  				<span class="fieldlabel">
                  					Expiration<span style="color: red">*</span>
                  				</span>

                  				<select name="cmonth" id="cmonth">
									<option>Month</option>
                  					<option>01</option>
                  					<option>02</option>
                  					<option>03</option>
                  					<option>04</option>
                  					<option>05</option>
                  					<option>06</option>
                  					<option>07</option>
                  					<option>08</option>
                  					<option>09</option>
                  					<option>10</option>
                  					<option>11</option>
                  					<option>12</option>
                  				</select>

                  				/

                  				<select name="cyear" id="cyear"">
									<option>Year</option>
                  					<option>2016</option>
                  					<option>2017</option>
                  					<option>2018</option>
                  					<option>2019</option>
                  					<option>2020</option>
                  					<option>2021</option>
                  				</select>
               				</td>
            			</tr>
                                    </div>

            			<tr>
               				<td colspan="2"><br>
               					<span style="color: red">*</span> Required Field
               				</td>
            			</tr>
         			</table>
      			</fieldset>

      			<p id="formbuttons">
         			<input type="button" name="prevb" class="resizedButton" id="prevb" value="Previous" onclick="history.back()" />
                        </p>
         	
                
                       <td><input type="hidden" name="action" value="orderDetails" /></td>
                       <td><input type="hidden" name="ccard" value="ccard" /></td>
               
                      <td><input type="submit" class="resizedButton" value="Purchase Items" /></td>
                      
                    </form>
	</div>
        </div>
     
    
    </body>
</html>
