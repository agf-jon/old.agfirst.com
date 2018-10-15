#!/usr/local/bin/perl



require "setup.pl";



$formtag='<FORM name="checkoutform" method="post" action="orders.cgi">';

$mystylesheet = '<LINK REL=stylesheet HREF="' . $miscfiles . 'style.css" TYPE="text/css">';

$purchasegif='"' . $miscfiles . 'purchase.gif"';



print "Content-type:text/html\n\n";



read(STDIN, $postdata, $ENV{'CONTENT_LENGTH'});

@pairs = split(/&/, $postdata);

foreach $pair (@pairs) {

    ($name, $value) = split(/=/, $pair);

    $value =~ tr/+/ /;

    $value =~ s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;

    $FORM{$name} = $value;

}





print <<"HTMLCODE1";



<HTML>

<HEAD>

$mystylesheet

<TITLE>Check Out</TITLE>

<script language="javascript">

function checkdata(){

   var coform = document.checkoutform;



   if(coform.a01FirstName.value.length<=0){

      alert("Please enter a first name.");

      coform.a01FirstName.focus();

      return;

   }



   if(coform.a03LastName.value.length<=0){

      alert("Please enter a last name.");

      coform.a03LastName.focus();

      return;

   }



   if(coform.a04Address1.value.length<=0){

      alert("Please enter a street address.");

      coform.a04Address1.focus();

      return;

   }



   if(coform.a06City.value.length<=0){

      alert("Please enter a city.");

      coform.a06City.focus();

      return;

   }



   if(coform.a07State.value.length<=0){

      alert("Please enter a state/province.");

      coform.a07State.focus();

      return;

   }



   if(coform.a08PostalCode.value.length<=0){

      alert("Please enter a postal code.");

      coform.a08PostalCode.focus();

      return;

   }



   if(coform.a09Country.value.length<=0){

      alert("Please enter a country.");

      coform.a09Country.focus();

      return;

   }



   if(coform.a10Email.value.length>0){

      if(validemail(coform.a10Email.value)==false){

         alert("The email address you have entered is invalid.");

         coform.a10Email.focus();

         return;

      }

   }



   if(coform.a10Email.value.length<=0 && coform.a11Phone.value.length<=0){

      alert("You must enter an email address or a phone number.");

      coform.a10Email.focus();

      return;

   }



   var cardtype=coform.c01CCType.options[coform.c01CCType.selectedIndex].text;

   if(GoodMatch(cardtype,coform.c02CCNumber.value)==false){

      alert("Your credit card number is not a valid "+cardtype+" number.");

      coform.c02CCNumber.focus();

      coform.c02CCNumber.select();

      return;

   }



   coform.submit();

}



function validemail(emailin){

   emailin+="";

   if(emailin.length==0){return false;}



   var position=emailin.indexOf("@");

   if(position<1){return false;}



   position=emailin.indexOf(".",position+1);

   if(position<3){return false;}



   if(position==emailin.length-1){return false;}



   return true;

}



//Move data to shipping fields

function movetoshipping(){

   var form=document.checkoutform;

   form.b01FirstName.value=form.a01FirstName.value;

   form.b02MI.value=form.a02MI.value;

   form.b03LastName.value=form.a03LastName.value;

   form.b04Address1.value=form.a04Address1.value;

   form.b05Address2.value=form.a05Address2.value;

   form.b06City.value=form.a06City.value;

   form.b07State.value=form.a07State.value;

   form.b08PostalCode.value=form.a08PostalCode.value;

   form.b09Country.value=form.a09Country.value;

}



function GoodCCNo(ccno){

  var sum = 0;

  var mult = 1;

  var cclength = ccno.length;



  for (i = 0; i < cclength; i++) {

    var digit = ccno.substring(cclength-i-1,cclength-i);

    var mresult = parseInt(digit ,10) * mult;



    if(mresult >= 10){sum += (mresult % 10) + 1;}

    else{sum += mresult;}



    if(mult == 1){mult++;}

    else{mult--;}

  }



  if ((sum % 10) == 0){return (true);}

  else{return (false);}

}



function isVisa(cc){

  if (((cc.length == 16) || (cc.length == 13)) && (cc.substring(0,1) == 4)){

    return GoodCCNo(cc);}

  return false;

}



function isMasterCard(cc){

  var firstdigit = cc.substring(0,1);

  var seconddigit = cc.substring(1,2);

  if ((cc.length == 16) && (firstdigit == 5) && ((seconddigit >= 1) && (seconddigit <= 5))){

    return GoodCCNo(cc);}

  return false;

}



function isAmericanExpress(cc){

  var firstdigit = cc.substring(0,1);

  var seconddigit = cc.substring(1,2);

  if ((cc.length == 15) && (firstdigit == 3) && ((seconddigit == 4) || (seconddigit == 7))){

    return GoodCCNo(cc);}

  return false;

}



function isDiscover(cc){

  first4digs = cc.substring(0,4);

  if ((cc.length == 16) && (first4digs == "6011")){

    return GoodCCNo(cc);}

  return false;

}



function GoodMatch (cardType, cardNumber){



   if(cardNumber=="0000000000000000"){return true;}



   if ((cardType == "MasterCard") && (isMasterCard(cardNumber))){

      return true;}

   if ((cardType == "Visa") && (isVisa(cardNumber))){

      return true;}

   if ((cardType == "Discover") && (isDiscover(cardNumber))){

      return true;}

   if ((cardType == "American Express") && (isAmericanExpress(cardNumber))){

      return true;}



   return false;

}

</script>

</HEAD>



<body>

<div align="center">

$mypagetitle

<h2>Check Out</h2>

<table border=0 cellpadding=3>

<tr>

<td>Please enter your billing, shipping, and credit card information below.</td>

</tr>

</table></div>

<hr>

<div align="center">

<b>Order Information</b>

HTMLCODE1



print $formtag;

print '<TABLE border=1 cellpadding=2 cellspacing=0>';

print '<tr><th>Product Id</th><th>Product Name</th><th>Options</th><th>Price</th><th align="center">Quantity</th><th align="center">Item Total</th></tr>';



$prevkey = '';

$sline = '';

foreach $key (sort(keys(%FORM))) {



   my $linekey = substr($key,0,1);



   if($linekey eq 'o'){

      print '<tr valign="top">';

      my $rowdata = $FORM{$key};

      $rowdata =~ s/²/<\/td><td>/g;

      $rowdata =~ s/<td>r;/<td align="right">/g;

      $rowdata =~ s/<td>c;/<td align="center">/g;

      $rowdata =~ s/³/<br>/g;

      print '<td>' . $rowdata . '</td>';

      print '</tr>';

   }

   else{

      if($prevkey eq 'o'){

         print '</table>';

         print '<br><table border=0 cellpadding=2 cellspacing=1>';

      }

      if($linekey eq 's'){

         print '<tr valign="top">';

         my $rowdata2 = $FORM{$key};

         $rowdata2 =~ s/²/<\/td><td>/g;

         $rowdata2 =~ s/<td>r;/<td align="right">/g;

         print '<td>' . $rowdata2 . '</td>';

         print '</tr>';

      }

   }



   print '<input type="hidden" name="'.$key.'" value="'.$FORM{$key}.'">';



   $prevkey = $linekey;

}



print '</table>';



print <<"HTMLCODE2";



<hr>

<TABLE border=0 cellpadding=1 cellspacing=0>

	<tr><td colspan="2" align="center"><b>Billing Information</b></td></tr>

    <TR>

      <TD>First Name<sup>*</sup>&nbsp;&nbsp;</TD>

      <TD>

	<INPUT TYPE="text" NAME="a01FirstName" size="20" maxlength="20"></TD>

    </TR>

    <TR>

      <TD>Middle Initial&nbsp;&nbsp;</TD>

      <TD>

	<INPUT TYPE="text" NAME="a02MI" SIZE="2" MAXLENGTH="1"></TD>

    </TR>

    <TR>

      <TD>Last Name<sup>*</sup>&nbsp;&nbsp;</TD>

      <TD>

	<INPUT TYPE="text" NAME="a03LastName" size="25" maxlength="25"></TD>

    </TR>

    <TR>

      <TD>Address1<sup>*</sup></TD>

      <TD>

	<INPUT TYPE="text" NAME="a04Address1" SIZE="30" maxlength="30"></TD>

    </TR>

    <TR>

      <TD>Address2</TD>

      <TD>

	<INPUT TYPE="text" NAME="a05Address2" SIZE="30" maxlength="30"></TD>

    </TR>

    <TR>

      <TD>City<sup>*</sup></TD>

      <TD>

	<INPUT TYPE="text" NAME="a06City" size="25" maxlength="25"></TD>

    </TR>

    <TR>

      <TD>State/Province<sup>*</sup></TD>

      <TD>

	<INPUT TYPE="text" NAME="a07State" SIZE="15" MAXLENGTH="20"></TD>

    </TR>

    <TR>

      <TD>Zip/Postal Code<sup>*</sup></TD>

      <TD>

	<INPUT TYPE="text" NAME="a08PostalCode" SIZE="12" maxlength="15"></TD>

    </TR>

    <TR>

      <TD>Country<sup>*</sup></TD>

      <TD>

	<INPUT TYPE="text" NAME="a09Country" SIZE="15" maxlength="25"></TD>

    </TR>

    <TR>

      <TD>Email Address<sup>*</sup>&nbsp;&nbsp;</TD>

      <TD>

	<INPUT TYPE="text" NAME="a10Email" SIZE="30" maxlength="35"></TD>

    </TR>

    <TR>

      <TD>Phone Number<sup>*</sup>&nbsp;&nbsp;</TD>

      <TD>

	<INPUT TYPE="text" NAME="a11Phone" SIZE="19" maxlength="16"></TD>

    </TR>

    <TR>

      <TD>&nbsp;</TD>

      <TD class=small>*Required fields. Only one of either the Email Address<br>&nbsp;or the Phone Number is required.</TD>

    </TR>

  </TABLE>

<hr>

<TABLE border="0" cellpadding="1" cellspacing="0">

	<tr><td colspan="2" align="center"><b>Shipping Information</b></td></tr>

    <TR>

      <TD>&nbsp;</TD>

      <TD>

	<INPUT TYPE="checkbox" onClick="if(this.checked){movetoshipping()}">Same as Above</TD>

    </TR>

    <TR>

      <TD>First Name&nbsp;&nbsp;</TD>

      <TD>

	<INPUT TYPE="text" NAME="b01FirstName" size="20" maxlength="20"></TD>

    </TR>

    <TR>

      <TD>Middle Initial&nbsp;&nbsp;</TD>

      <TD>

	<INPUT TYPE="text" NAME="b02MI" SIZE="2" MAXLENGTH="1"></TD>

    </TR>

    <TR>

      <TD>Last Name&nbsp;&nbsp;</TD>

      <TD>

	<INPUT TYPE="text" NAME="b03LastName" size="25" maxlength="25"></TD>

    </TR>

    <TR>

    <TR>

      <TD>Address1</TD>

      <TD>

	<INPUT TYPE="text" NAME="b04Address1" SIZE="30" maxlength="30"></TD>

    </TR>

    <TR>

      <TD>Address2</TD>

      <TD>

	<INPUT TYPE="text" NAME="b05Address2" SIZE="30" maxlength="30"></TD>

    </TR>

    <TR>

      <TD>City</TD>

      <TD>

	<INPUT TYPE="text" NAME="b06City" size="25" maxlength="25"></TD>

    </TR>

    <TR>

      <TD>State/Province</TD>

      <TD>

	<INPUT TYPE="text" NAME="b07State" SIZE="15" MAXLENGTH="20"></TD>

    </TR>

    <TR>

      <TD>Zip/Postal Code</TD>

      <TD>

	<INPUT TYPE="text" NAME="b08PostalCode" SIZE="12" maxlength="15"></TD>

    </TR>

    <TR>

      <TD>Country</TD>

      <TD>

	<INPUT TYPE="text" NAME="b09Country" SIZE="15" maxlength="25"></TD>

    </TR>

  </TABLE>

<hr>

<table>

<tr><td colspan="2" align="center"><b>Credit Card Information</b></td></tr>

<tr><td colspan="2" align="center" class=small>Use 0000000000000000 as the credit card number.</b></td></tr>

<tr><td>Type</td>

<td><select name="c01CCType"><option>MasterCard<option>Visa<option>Discover<option>American Express</select></td></tr>

<tr><td>Number</td><td><input type="text" name="c02CCNumber" size="17" maxlength="16"></td></tr>

<tr><td>Exp. Month/Year&nbsp;&nbsp;</td><td><select name="c03CCMonth"><option>01<option>02<option>03<option>04<option>05<option>06<option>07<option>08<option>09<option>10<option>11<option>12</select>

<select name="c04CCYear"><option>2000<option>2001<option>2002<option>2003<option>2004<option>2005<option>2006<option>2007<option>2008<option>2009<option>2010</select></td></tr>

</table>

</form>

<hr>

<a href="javascript:checkdata();"><img src=$purchasegif border=0></a>

</div>

<p>

<div>To complete your purchase, click the "Purchase" button.</div>



</body>

</html>



HTMLCODE2

