/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


//var card = -1;

function selectedCard() 
{
	var card = -1;
	for (var i = 0; i < document.forms[0].ccard.length; i++) 
	{
		if (document.forms[0].ccard[i].checked) card=i;
	}

	return card;
}

function setCCnum(radioNum)
 {
	var textboxSizeIs = new Array(13, 11, 18, 10, 16);
	/*document.forms[0].cnumber.size = textboxSizeIs[radioNum];*/

	if (document.forms[0].ccard[0].checked) 
	{
		document.forms[0].cnumber.size = 13;
	} 
	else if (document.forms[0].ccard[1].checked)
	{
		document.forms[0].cnumber.size = 11;
	} 
	else if (document.forms[0].ccard[2].checked) 
	{
		document.forms[0].cnumber.size = 18;
	} 
	else if (document.forms[0].ccard[3].checked)
	{
		document.forms[0].cnumber.size = 10;
	} 
	else if (document.forms[0].ccard[4].checked) 
	{
		document.forms[0].cnumber.size = 16;
	}   

}

function selectYear() 
{
	if (document.forms[0].cmonth.selectedIndex == 0) 
	{
		//delete the options in cyear;
	} 
	else
	{
		var today = new Date();
		var optionMonth = parseInt(document.forms[0].cmonth.value);
		var currentMonth = today.getMonth() + 1;
		if (optionMonth >= currentMonth) 
		{
			// allow current year as first option in cyear
		} 
		else 
		{
			// first year must be current year +1
		}
	}
}

function checkBook3() 
{
	var theCard = selectedCard();
	
	if (theCard == -1) 
	{
		alert("You must select a credit card");
		return false;
	} 
	else if (document.forms[0].cname.value.length == 0) 
	{
		alert("You must enter the name on your credit card");
		document.forms[0].cname.focus();
		return false;
	} 
	else if (document.forms[0].cnumber.value.length == 0) 
	{
		alert("You must enter the number on your credit card");
		document.forms[0].cnumber.focus();
		return false;
	}
	else if ( checkNumber() == false) 
	{
		//alert("Your Credit Card Number is not valid");
		document.forms[0].cnumber.select();
		return false;
	} 
	else if (document.forms[0].cmonth.selectedIndex == 0) 
	{
		alert("You must enter the expiry month");
		document.forms[0].cmonth.focus();
		return false;
	} 
	else if (document.forms[0].cyear.selectedIndex == 0) {
		alert("You must enter the expiry year");
		document.forms[0].cyear.focus();
		return false;
	} 
	else if (checkExpiryDate() == false)
	{
		alert("The expiry date must not have already occurred");
		document.forms[0].cmonth.focus();
		return false;		
	} 
	else 
	{
		storeData3(theCard);
		return true;
	}
}

function checkNumber() 
{
	var ccNum = parseInt(document.forms[0].cnumber.value);

	if (isNaN(ccNum)) 
	{
		alert("The Credit Card You Entered was non-Numeric. Try again.");
		return false;
	}
	
	if (selectedCard()==0) //American Express
	{ 
		if ( (ccNum >= 3400000000000) && (ccNum <= 3499999999999) ) 
		{
			return true;
		} 
		else
		{
			alert("The American Express Card Number you entered is invalid.");
			return false;	
		}
	} 
	else if (selectedCard()==3) //MasterCard
	{ 
		if ( (ccNum >= 5100000000) && (ccNum <= 5599999999) ) 
		{
			return true;
		} 
		else 
		{
			alert("The MasterCard Card Number you entered is invalid.");
			return false;	
		}
	} 
	else if (selectedCard()==4) //Visa
	{ 
		if ( (ccNum >= 4000000000000000) && (ccNum <= 4999999999999999) )
		{
			return true;
		} 
		else 
		{
			alert("The Visa Card Number you entered is invalid.");
			return false;	
		}
	}
} 

function checkExpiryDate() 
{
	var today = new Date();
	var expiry = new Date();

	var expiryMonth = parseInt(document.forms[0].cmonth.value) -1;
	expiry.setMonth(expiryMonth);

	var expiryYear = document.forms[0].cyear.value;
	expiry.setFullYear(expiryYear);

	var expiryDate = daysInMonth(expiry);
	expiry.setDate(expiryDate);
	
	var todayMilliseconds = parseInt(today.getTime());
	var expiryMilliseconds = parseInt(expiry.getTime());
	var timeDifference = expiryMilliseconds - todayMilliseconds;
	
	if (timeDifference < 0) 
	{
		return false;
	} 
	else 
	{
		return true;
	}
}

function daysInMonth(calendarDay) 
{
		var thisYear = calendarDay.getFullYear();
		var thisMonth = calendarDay.getMonth();
		var dayCount = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
		
		if ( thisYear % 4 == 0 )
		{
			if ( (thisYear % 100 != 0) || (thisYear % 400 == 0) ) 
			{
				dayCount[1] = 29; // this is a leap year
			}
		}
		
		return dayCount[thisMonth]; //return the number of days in the month
}

function storeData3(whichCard) 
{
	localStorage.cardType = document.forms[0].ccard[whichCard].value;
	localStorage.cardName = document.forms[0].cname.value;
	localStorage.cardNumber = document.forms[0].cnumber.value;	
	localStorage.cardExpiryMonth = document.forms[0].cmonth.value;
	localStorage.cardExpiryYear = document.forms[0].cyear.value;
}
