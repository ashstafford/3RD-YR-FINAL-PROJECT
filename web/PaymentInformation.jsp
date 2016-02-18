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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment Page</title>
        
 <script type="text/javascript" src="payment.js"></script>
    </head>
    <body>
      		
   			

   			<div id="main">
      			
      				<br><br><br><br><br><br>
      			
      			<h1>
      				Payment Form

      			</h1>

      			<fieldset>
         			<legend>Enter your Credit Card Information</legend>

         			<table>
            			<tr>
               				<td class="labelcell">
               					Card<span style="color: red">*</span>
               				</td>

               				<td class="inputcell2">
                  				<input type="radio" name="ccard" id="amex" value ="American Express" onclick="setCCnum()"/>
                  				<label for="amex">American Express</label><br />

                  				<input type="radio" name="ccard" id="mc" value ="MasterCard" onclick="setCCnum()"/>
                  				<label for="mc">MasterCard</label><br />

                  				<input type="radio" name="ccard" id="visa" value = "Visa" onclick="setCCnum()"/>
                  				<label for="visa">Visa</label>
               				</td>
            			</tr>

            			<tr>
               				<td class="labelcell">
               					Name<span style="color: red">*</span>
               				</td>

               				<td class="inputcell2">
                  				<input class="text" name="cname" id="cname" size="35" />
               				</td>
            			</tr>

            			<tr>
               				<td class="labelcell">
               					Number<span style="color: red">*</span>
               				</td>

               				<td class="inputcell2">
                  				<input class="text" name="cnumber" id="cnumber" size="35" />

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

                  				<select name="cyear" id="cyear">
									<option>Year</option>
                  					<option>2014</option>
                  					<option>2015</option>
                  					<option>2016</option>
                  					<option>2017</option>
                  					<option>2018</option>
                  					<option>2019</option>
                  				</select>
               				</td>
            			</tr>

            			<tr>
               				<td colspan="2">
               					<span style="color: red">*</span> Required Field
               				</td>
            			</tr>
         			</table>
      			</fieldset>

      			<p id="formbuttons">
         			<input type="button" name="prevb" id="prevb" value="Previous" onclick="history.back()" />
                        </p>
         			
      			
                        
                        <form action="MemberActionServlet" method="post" >
                
                       <td><input type="hidden" name="action" value="orderDetails" /></td>
               
                       <td><input type="submit" value="Purchase Items" /></td
                      
                        </form>
	</div>
     </form>
    </body>
</html>
